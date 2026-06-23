package app

import (
	"os"
	"path/filepath"
	"sort"
	"strings"

	tea "github.com/charmbracelet/bubbletea"
	"golang.org/x/text/cases"
	"golang.org/x/text/language"

	"github.com/Vicjocaso/onyx-setu/tui/internal/runner"
	"github.com/Vicjocaso/onyx-setu/tui/internal/ui"
)

// fallbackThemeSlugs is used when the themes directory can't be scanned (e.g.
// ONYX_PATH unset). Mirrors the historical bin/onyx-sub/theme.sh list.
var fallbackThemeSlugs = []string{
	"tokyo-night", "catppuccin", "nord", "everforest", "ristretto",
	"matte-black", "lunar-peaks", "neon-circuit", "forest-haven",
}

// slug converts a display name to its theme directory name (lower-cased,
// spaces -> dashes).
func slug(name string) string {
	return strings.ReplaceAll(strings.ToLower(name), " ", "-")
}

// prettify turns a theme directory slug into a display name ("tokyo-night" ->
// "Tokyo Night").
func prettify(s string) string {
	return cases.Title(language.English).String(strings.ReplaceAll(s, "-", " "))
}

// themeSlugs returns the available theme directory names by scanning
// $ONYX_PATH/themes for subdirectories that contain a gnome.sh. Falls back to
// the historical list if the directory can't be read.
func themeSlugs() []string {
	entries, err := os.ReadDir(filepath.Join(onyxPath(), "themes"))
	if err != nil {
		return fallbackThemeSlugs
	}

	var slugs []string
	for _, e := range entries {
		if !e.IsDir() {
			continue
		}
		if _, err := os.Stat(filepath.Join(onyxPath(), "themes", e.Name(), "gnome.sh")); err != nil {
			continue
		}
		slugs = append(slugs, e.Name())
	}
	if len(slugs) == 0 {
		return fallbackThemeSlugs
	}
	sort.Strings(slugs)
	return slugs
}

// themeApplyCmd reproduces theme.sh: apply gnome, optionally tophat (guarded by
// the same schema check), then vscode. All non-sudo, so it streams in-app.
func themeApplyCmd(themeSlug string) string {
	base := `"$ONYX_PATH/themes/` + themeSlug + `/`
	return strings.Join([]string{
		`source ` + base + `gnome.sh"`,
		`if gsettings list-schemas 2>/dev/null | grep -q "org.gnome.shell.extensions.tophat"; then source ` + base + `tophat.sh"; fi`,
		`if [ -f ` + base + `vscode.sh" ]; then source ` + base + `vscode.sh"; fi`,
	}, "\n")
}

// themeDescriptions maps theme slugs to short descriptions shown in the detail panel.
var themeDescriptions = map[string]string{
	"autumn-walk":  "Warm amber and russet tones inspired by fallen leaves. A cozy palette for long coding sessions.",
	"azure-canyon": "Crisp sky blues and sandy neutrals evoking wide-open canyon skies. High-contrast and easy on the eyes.",
	"castle-dusk":  "Deep purples and twilight grays reminiscent of stone towers at sunset. Mysterious and refined.",
	"catppuccin":   "Pastel-forward with soft pinks, mauves, and lavenders. One of the most beloved modern palettes.",
	"chalk-board":  "Muted greens on dark gray, like chalk on a blackboard. Clean, minimal, and distraction-free.",
	"everforest":   "Earthy greens and warm browns drawn from ancient woodland. Gentle on the eyes, gentle on the soul.",
	"forest-haven": "Rich mossy greens and deep bark browns. A tranquil escape into the heart of the forest.",
	"lost-temple":  "Stone grays and golden accents evoking forgotten ruins. Dramatic contrast with an adventurous spirit.",
	"lunar-peaks":  "Cool silver-blues and icy whites inspired by moonlit mountain ridges. Crisp and ethereal.",
	"matte-black":  "Pure dark grays and near-blacks with sharp accent colors. The definitive no-nonsense dark theme.",
	"neon-circuit": "Electric purples, cyan, and hot pink on deep black. A synthwave aesthetic for night-owl coders.",
	"nord":         "Arctic blue-grays with soft polar accents. Clean Scandinavian design, loved worldwide.",
	"ristretto":    "Rich espresso browns and creamy highlights. Warm, caffeinated, and deeply satisfying.",
	"tokyo-night":  "Deep navy blues and vivid neons inspired by the Tokyo skyline after dark. Iconic and immersive.",
}

// newThemeMenu builds the theme picker from the themes directory.
func newThemeMenu() Screen {
	slugs := themeSlugs()
	items := make([]ui.Item, 0, len(slugs)+1)
	for _, s := range slugs {
		items = append(items, ui.Item{Label: prettify(s), Desc: themeDescriptions[s]})
	}
	items = append(items, ui.Item{Label: "<< Back"})

	return newMenu("Choose your theme", items, true, func(idx int, item ui.Item) tea.Cmd {
		if item.Label == "<< Back" {
			return pop()
		}
		return run(runner.Job{
			Title: "Applying " + item.Label,
			Cmd:   themeApplyCmd(slug(item.Label)),
		})
	})
}
