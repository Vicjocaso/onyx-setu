#!/bin/bash

cat <<EOF >~/.local/share/applications/Docker.desktop
[Desktop Entry]
Version=1.0
Name=Docker
Comment=Manage Docker containers with LazyDocker
Exec=lazydocker
Terminal=true
Type=Application
Icon=/home/$USER/.local/share/onyx/applications/icons/Docker.png
Categories=GTK;
StartupNotify=false
EOF
