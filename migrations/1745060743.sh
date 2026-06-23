#!/bin/bash

cp ~/.local/share/onyx/configs/alacritty/shared.toml ~/.config/alacritty/shared.toml
cp ~/.local/share/onyx/configs/alacritty/pane.toml ~/.config/alacritty/pane.toml
cp ~/.local/share/onyx/configs/alacritty/btop.toml ~/.config/alacritty/btop.toml
cp ~/.local/share/onyx/configs/alacritty.toml ~/.config/alacritty/alacritty.toml

source $ONYX_PATH/applications/About.sh
source $ONYX_PATH/applications/Activity.sh
source $ONYX_PATH/applications/Neovim.sh
source $ONYX_PATH/applications/Docker.sh
source $ONYX_PATH/applications/Onyx.sh

alacritty migrate 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/pane.toml 2>/dev/null || true
alacritty migrate -c ~/.config/alacritty/btop.toml 2>/dev/null || true
