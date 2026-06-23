#!/bin/bash

sudo apt remove --purge -y tableplus
sudo rm -f /etc/apt/sources.list.d/tableplus.list
sudo rm -f /etc/apt/trusted.gpg.d/tableplus-archive.gpg
