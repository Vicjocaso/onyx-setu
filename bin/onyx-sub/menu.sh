#!/bin/bash

if [ $# -eq 0 ]; then
	SUB=$(gum choose \
		"  Theme         Change look and feel" \
		"  Font          Set terminal font" \
		"  Update        Update apps and system" \
		"  Install       Add new applications" \
		"  Uninstall     Remove applications" \
		"  Manual        Open documentation" \
		"  Quit          Exit Onyx" \
		--height 10 \
		--header "" \
		--cursor "▸ " \
		--cursor.foreground 213 \
		--selected.foreground 177 \
		--item.foreground 255 \
		| awk '{print $1}' | tr '[:upper:]' '[:lower:]')
else
	SUB=$1
fi

[ -n "$SUB" ] && [ "$SUB" != "quit" ] && source $ONYX_PATH/bin/onyx-sub/$SUB.sh
