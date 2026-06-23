#!/bin/bash

# Install default programming languages
if [[ -v ONYX_FIRST_RUN_LANGUAGES ]]; then
  languages=$ONYX_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Node.js" "Go" "Python" "<< Back")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 6 --header "Select programming languages")
fi

if [[ -n "$languages" ]]; then
  for language in $languages; do
    case $language in
    Node.js)
      mise use --global node@lts
      ;;
    Go)
      mise use --global go@latest
      ;;
    Python)
      mise use --global python@latest
      ;;
    esac
  done
fi
