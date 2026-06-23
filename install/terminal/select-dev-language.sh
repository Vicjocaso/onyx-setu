#!/bin/bash

# Go is always installed — it is required by the Onyx TUI binary.
mise use --global go@latest

# Install additional programming languages selected by the user.
if [[ -v ONYX_FIRST_RUN_LANGUAGES ]]; then
  languages=$ONYX_FIRST_RUN_LANGUAGES
else
  AVAILABLE_LANGUAGES=("Node.js" "Python" "<< Back")
  languages=$(gum choose "${AVAILABLE_LANGUAGES[@]}" --no-limit --height 5 --header "Select programming languages")
fi

if [[ -n "$languages" ]]; then
  for language in $languages; do
    case $language in
    Node.js)
      mise use --global node@lts
      ;;
    Python)
      mise use --global python@latest
      ;;
    esac
  done
fi
