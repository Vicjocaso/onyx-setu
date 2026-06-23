#!/bin/bash

sudo apt remove --purge -y antigravity
sudo rm -f /etc/apt/sources.list.d/google_antigravity.list
sudo rm -f /usr/share/keyrings/google-antigravity.gpg
