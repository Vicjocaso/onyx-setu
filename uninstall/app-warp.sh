#!/bin/bash

sudo apt remove --purge -y warp-terminal
sudo rm -f /etc/apt/sources.list.d/warpdotdev.list
sudo rm -f /etc/apt/keyrings/warpdotdev.gpg
