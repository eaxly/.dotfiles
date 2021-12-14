#!/usr/bin/env bash
# switch theme

usage() {
    echo """
    switch_theme.sh THEME_NAME

    THEME_NAME can be \"d\"ark or \"l\"ight
    """
}

if [ ! $# -eq 1 ]; then
    usage
    exit 1
fi

THEME=$1
bombadil link -p sway_${THEME}
ERR_MSG=$?
if [ $ERR_MSG -eq 0 ]; then
    echo "$THEME" > ~/.bomb_theme
    killall oguri && swaymsg exec oguri
    if [ $THEME == "d" ]; then
        gsettings set org.gnome.desktop.interface gtk-theme "rose-pine-gtk"
    else
        gsettings set org.gnome.desktop.interface gtk-theme "rose-pine-dawn-gtk"
    fi
else
    notify-send.sh "Error $ERR_MSG" "bombadil couldn't link stuff for whatever reason. ran sway_$1 profile" --icon=warning
fi
