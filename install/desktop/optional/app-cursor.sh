#!/bin/bash

# AI-powered code editor. See https://cursor.com/
if [ ! -f /etc/apt/sources.list.d/cursor.list ]; then
	curl -fsSL https://downloads.cursor.com/keys/anysphere.asc | gpg --dearmor | sudo tee /etc/apt/keyrings/cursor.gpg > /dev/null
	echo "deb [arch=amd64,arm64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main" | sudo tee /etc/apt/sources.list.d/cursor.list > /dev/null
fi

sudo apt update
sudo apt install -y cursor
