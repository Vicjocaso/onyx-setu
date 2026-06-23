#!/bin/bash

sudo echo "Running upgrade migration..."

# Add rustc and pgsql client libs
source $ONYX_PATH/install/terminal/libraries.sh

# Set name and class for desktop files
source $ONYX_PATH/applications/About.sh
source $ONYX_PATH/applications/Activity.sh
source $ONYX_PATH/applications/Docker.sh
source $ONYX_PATH/applications/Neovim.sh
source $ONYX_PATH/applications/Onyx.sh
source $ONYX_PATH/applications/WhatsApp.sh
