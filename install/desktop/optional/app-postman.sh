#!/bin/bash

# API development platform — https://www.postman.com
cd /tmp
wget -O postman.tar.gz https://dl.pstmn.io/download/latest/linux64
sudo tar -xvf postman.tar.gz -C /opt/
sudo ln -sf /opt/Postman/Postman /usr/local/bin/postman
rm postman.tar.gz

cat <<EOF > ~/.local/share/applications/Postman.desktop
[Desktop Entry]
Version=1.0
Name=Postman
Comment=API Development Environment
Exec=/opt/Postman/Postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;
EOF
cd -
