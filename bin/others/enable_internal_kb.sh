#!/usr/bin/env bash

if [[ $XDG_SESSION_TYPE == x11 ]]; then
  xinput enable "AT Translated Set 2 keyboard"

  if [[ $? == 0 ]]; then
    notify-send "Keyboard" "Keyboard enabled!" --icon=keyboard
  else
    notify-send "Keyboard" "Error ${?} has occured!"
  fi
else
  notify-send "Keyboard" "This is only available under X11, not under Wayland"
fi
