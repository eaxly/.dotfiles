#!/usr/bin/env bash
# switch theme

bombadil link -p sway
ERR_MSG=$?
if [ $ERR_MSG -eq 0 ]; then
    killall oguri && swaymsg exec oguri
    gsettings set org.gnome.desktop.interface gtk-theme "rose-pine-gtk"
else
    notify-send.sh "Error $ERR_MSG" "bombadil couldn't link stuff for whatever reason. ran sway profile" --icon=warning
fi