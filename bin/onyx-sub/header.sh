#!/bin/bash

VERSION=$(cat $ONYX_PATH/version)

# Build the header content
LOGO=$(source $ONYX_PATH/ascii.sh)
SUBTITLE=$(gum style --foreground 245 --italic "artificial-softworks")
VER=$(gum style --foreground 105 --bold "v$VERSION")
SPACER=$(gum style " ")

HEADER_CONTENT=$(gum join --vertical --align center "$LOGO" "$SUBTITLE" "$SPACER" "$VER")

HEADER=$(gum style \
  --border double \
  --border-foreground 105 \
  --padding "1 4" \
  --margin "1 2" \
  --align center \
  --width 50 \
  "$HEADER_CONTENT")

echo "$HEADER"
