#!/usr/bin/env bash

if [[ $XDG_SESSION_TYPE == x11 ]]; then
  xinput disable "AT Translated Set 2 keyboard"

  if [[ $? == 0 ]]; then
    dunstify "Keyboard" "Keyboard disabled!" --icon=keyboard
  else
    dunstify "Keyboard" "Error ${?} has occured!"
  fi
else
  dunstify "Keyboard" "This is only available under X11, not under Wayland"
fi
