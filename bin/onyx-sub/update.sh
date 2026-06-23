#!/bin/bash

CHOICES=(
	"Onyx        Update Onyx itself and run any migrations"
	"LazyDocker    TUI for Docker"
	"<< Back       "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 5 --header "Update manually-managed applications")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
	# Don't update anything
	echo ""
else
	INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

	case "$INSTALLER" in
	"onyx") INSTALLER_FILE="$ONYX_PATH/bin/onyx-sub/migrate.sh" ;;
	*) INSTALLER_FILE="$ONYX_PATH/install/terminal/app-$INSTALLER.sh" ;;
	esac

	source $INSTALLER_FILE && gum spin --spinner globe --title "Update completed!" -- sleep 3
fi

clear
source $ONYX_PATH/bin/onyx
