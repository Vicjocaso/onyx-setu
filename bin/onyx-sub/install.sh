#!/bin/bash

CHOICES=(
  "Browser           Install an alternative web browser"
  "Dev Database      Install development database in Docker"
  "Dev Editor        Install alternative programming editors"
  "Dev Language      Install programming language environment"
  "Web Apps          Install web apps with their own icon and shell"
  "Antigravity       AI-powered IDE by Google with Gemini 3 Pro"
  "ASDControl        Set brightness on Apple Studio and XDR displays"
  "Bitwarden         Open-source password manager"
  "Bruno             Open-source API client for testing and exploring APIs"
  "Discord           Communication platform for voice, video, and text messaging"
  "Geekbench         CPU benchmaking tool"
  "OpenRGB           Control RGB lighting on your hardware"
  "Postman           API development and testing platform"
  "Spotify           Stream music from the world's most popular service"
  "Steam             Play games from Valve's store"
  "TablePlus         Modern database management tool"
  "Warp              Modern AI-powered terminal"
  "> All             Re-run any of the default installers"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 22 --header "Install application")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
elif [[ "$CHOICE" == "> All"* ]]; then
  INSTALLER_FILE=$(gum file $ONYX_PATH/install)

  [[ -n "$INSTALLER_FILE" ]] &&
    gum confirm "Run installer?" &&
    source $INSTALLER_FILE &&
    gum spin --spinner globe --title "Install completed!" -- sleep 3
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$INSTALLER" in
  "dev-editor") INSTALLER_FILE="$ONYX_PATH/bin/onyx-sub/install-dev-editor.sh" ;;
  "browser") INSTALLER_FILE="$ONYX_PATH/bin/onyx-sub/install-browser.sh" ;;
  "web-apps") INSTALLER_FILE="$ONYX_PATH/install/desktop/optional/select-web-apps.sh" ;;
  "dev-language") INSTALLER_FILE="$ONYX_PATH/install/terminal/select-dev-language.sh" ;;
  "dev-database") INSTALLER_FILE="$ONYX_PATH/install/terminal/select-dev-storage.sh" ;;
  "geekbench") INSTALLER_FILE="$ONYX_PATH/install/terminal/optional/app-geekbench.sh" ;;
  *) INSTALLER_FILE="$ONYX_PATH/install/desktop/optional/app-$INSTALLER.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $ONYX_PATH/bin/onyx
