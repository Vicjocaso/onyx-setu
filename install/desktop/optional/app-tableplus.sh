#!/bin/bash

# Database management tool — https://tableplus.com
wget -qO - https://deb.tableplus.com/apt.tableplus.com.gpg.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/tableplus-archive.gpg > /dev/null
sudo sh -c 'echo "deb [arch=amd64] https://deb.tableplus.com/debian/24 tableplus main" > /etc/apt/sources.list.d/tableplus.list'
sudo apt update
sudo apt install -y tableplus
