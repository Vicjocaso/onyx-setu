#!/bin/bash

# Only ask for default desktop app choices when running Gnome
if [[ "$XDG_CURRENT_DESKTOP" == *"GNOME"* ]]; then
  OPTIONAL_APPS=("Spotify" "Discord" "Steam" "Bitwarden" "TablePlus" "Postman" "Bruno" "Warp" "OpenRGB" "Cursor" "Zed" "Antigravity")
  DEFAULT_OPTIONAL_APPS='Spotify'
  export ONYX_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 14 --header "Select optional apps" | tr ' ' '-')
fi

AVAILABLE_LANGUAGES=("Node.js" "Go" "Python")
SELECTED_LANGUAGES="Node.js"
export ONYX_FIRST_RUN_LANGUAGES=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --selected "$SELECTED_LANGUAGES" --height 5 --header "Select programming languages")

AVAILABLE_DBS=("PostgreSQL")
SELECTED_DBS="PostgreSQL"
export ONYX_FIRST_RUN_DBS=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --selected "$SELECTED_DBS" --height 3 --header "Select databases (runs in Docker)")
