#!/bin/bash

if command -v code &>/dev/null; then
  NODE_NO_WARNINGS=1 code --install-extension $VSC_EXTENSION >/dev/null
  sed -i "s/\"workbench.colorTheme\": \".*\"/\"workbench.colorTheme\": \"$VSC_THEME\"/g" ~/.config/Code/User/settings.json
fi
