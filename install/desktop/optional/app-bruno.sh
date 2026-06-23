#!/bin/bash

# Open-source API client — https://www.usebruno.com
if [ ! -f /etc/apt/sources.list.d/bruno.list ]; then
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x9FA6017ECABE0266" | gpg --dearmor | sudo tee /etc/apt/keyrings/bruno.gpg > /dev/null
  sudo chmod 644 /etc/apt/keyrings/bruno.gpg
  echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/bruno.gpg] http://debian.usebruno.com/ bruno stable" | sudo tee /etc/apt/sources.list.d/bruno.list
fi

sudo apt update
sudo apt install -y bruno
