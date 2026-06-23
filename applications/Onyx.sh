#!/bin/bash

cat <<EOF >~/.local/share/applications/Onyx.desktop
[Desktop Entry]
Version=1.0
Name=Onyx
Comment=Onyx Controls
Exec=bash -c "export ONYX_PATH=\$HOME/.local/share/onyx && export PATH=\$ONYX_PATH/bin:\$PATH && bash \$ONYX_PATH/bin/onyx"
Terminal=true
Type=Application
Icon=/home/$USER/.local/share/onyx/applications/icons/Onyx.png
Categories=GTK;System;
StartupNotify=false
EOF
