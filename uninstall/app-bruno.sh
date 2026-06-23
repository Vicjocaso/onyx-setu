#!/bin/bash

sudo apt remove --purge -y bruno
sudo rm -f /etc/apt/sources.list.d/bruno.list
sudo rm -f /etc/apt/keyrings/bruno.gpg
