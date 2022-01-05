#!/bin/sh
if ! command -v fuzzel &> /dev/null; then
    notify-send "fuzzel" "Fuzzel not found successfully"
    exit
fi
fuzzel \
                --font="Iosevka Nerd Font:size=12.00" \
                --icon-theme="Papirus"\
                -l 20\
                -w 50\
                --prompt="ͷ "\
                --background="__[bg]__ff"\
                --text-color="__[fg]__ff"\
                --match-color="__[accent]__ff"\
                --selection-color="__[bg_alt]__ff"\
                --border-width=2\
                --border-color="__[bg_alt]__ff"\
                --selection-text-color="__[fg]__ff"\
                --border-radius=0\
                --border-color="__[bg_alt]__ff"\
                 $@ <&0
