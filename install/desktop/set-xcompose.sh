#!/bin/bash

envsubst < ~/.local/share/onyx/configs/xcompose > ~/.XCompose
ibus restart
gsettings set org.gnome.desktop.input-sources xkb-options "['compose:caps']"
