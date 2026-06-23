#!/bin/bash

# Install default databases
if [[ -v ONYX_FIRST_RUN_DBS ]]; then
	dbs=$ONYX_FIRST_RUN_DBS
else
	AVAILABLE_DBS=("PostgreSQL" "<< Back")
	dbs=$(gum choose "${AVAILABLE_DBS[@]}" --no-limit --height 4 --header "Select databases (runs in Docker)")
fi

if [[ -n "$dbs" ]]; then
	for db in $dbs; do
		case $db in
		PostgreSQL)
			if ! sudo docker ps -a --format '{{.Names}}' | grep -q '^postgres16$'; then
				sudo docker run -d --restart unless-stopped -p "127.0.0.1:5432:5432" --name=postgres16 -e POSTGRES_HOST_AUTH_METHOD=trust postgres:16
			fi
			;;
		esac
	done
fi
