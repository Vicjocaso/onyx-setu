#!/bin/bash

CHOICES=(
  "Zen Browser       Privacy-focused browser built on Firefox"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 4 --header "Install browser")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')
  INSTALLER_FILE="$ONYX_PATH/install/desktop/optional/app-$INSTALLER.sh"

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $ONYX_PATH/bin/onyx-sub/header.sh
source $ONYX_PATH/bin/onyx-sub/install.sh
