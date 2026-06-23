#!/bin/bash

source $ONYX_PATH/defaults/bash/functions

AVAILABLE_WEB_APPS=("Chat GPT" "Gemini" "Grok" "Google Photos" "Google Contacts" "<< Back")
apps=$(gum choose "${AVAILABLE_WEB_APPS[@]}" --no-limit --height 8 --header "Select web apps")

if [[ -n "$apps" ]]; then
  IFS=$'\n'
  for app in $apps; do
    case $app in
    "Chat GPT")
      web2app 'Chat GPT' https://chatgpt.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/chatgpt.png
      app2folder 'Chat GPT.desktop' WebApps
      ;;
    "Gemini")
      web2app 'Gemini' https://gemini.google.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-gemini.png
      app2folder 'Gemini.desktop' WebApps
      ;;
    "Grok")
      web2app 'Grok' https://grok.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/grok.png
      app2folder 'Grok.desktop' WebApps
      ;;
    "Google Photos")
      web2app 'Google Photos' https://photos.google.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-photos.png
      app2folder 'Google Photos.desktop' WebApps
      ;;
    "Google Contacts")
      web2app 'Google Contacts' https://contacts.google.com/ https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/google-contacts.png
      app2folder 'Google Contacts.desktop' WebApps
      ;;
    esac
  done
fi
