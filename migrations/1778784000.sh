#!/bin/bash

# Migrate Cursor from AppImage to apt package for apt-based updates
if [ -f /opt/cursor.appimage ]; then
	echo "Migrating Cursor from AppImage to apt package..."

	sudo rm -f /opt/cursor.appimage
	sudo rm -f /usr/share/applications/cursor.desktop

	if [ ! -f /etc/apt/sources.list.d/cursor.list ]; then
		curl -fsSL https://downloads.cursor.com/keys/anysphere.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/cursor.gpg > /dev/null
		echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main" | sudo tee /etc/apt/sources.list.d/cursor.list > /dev/null
	fi

	sudo apt update
	sudo apt install -y cursor
fi
