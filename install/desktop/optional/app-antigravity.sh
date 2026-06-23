#!/bin/bash

# AI-powered IDE by Google — https://antigravity.google
if [ ! -f /etc/apt/sources.list.d/google_antigravity.list ]; then
  curl -fsSL https://us-central1-apt.pkg.dev/doc/repo-signing-key.gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/google-antigravity.gpg
  echo "deb [signed-by=/usr/share/keyrings/google-antigravity.gpg] https://us-central1-apt.pkg.dev/projects/antigravity-auto-updater-dev/ antigravity-debian main" | sudo tee /etc/apt/sources.list.d/google_antigravity.list
fi

sudo apt update
sudo apt install -y antigravity
