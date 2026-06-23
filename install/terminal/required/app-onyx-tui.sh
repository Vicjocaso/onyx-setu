#!/bin/bash

# Build the Onyx control-panel TUI from source using the Go installed by mise.
# This runs after select-dev-language.sh so Go is already available.

DEST="$HOME/.local/share/onyx/bin/onyx-tui"
SRC="$HOME/.local/share/onyx/tui"

mkdir -p "$(dirname "$DEST")"

echo "Building Onyx TUI..."
if mise exec go -- go build -C "$SRC" -o "$DEST" . 2>/dev/null; then
	echo "Onyx TUI built successfully."
else
	echo "Onyx TUI: build failed — the 'onyx' command will use the bash menu fallback."
fi
