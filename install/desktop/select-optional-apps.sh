#!/bin/bash

if [[ -v ONYX_FIRST_RUN_OPTIONAL_APPS ]]; then
	apps=$ONYX_FIRST_RUN_OPTIONAL_APPS

	if [[ -n "$apps" ]]; then
		for app in $apps; do
			source "$ONYX_PATH/install/desktop/optional/app-${app,,}.sh"
		done
	fi
fi
