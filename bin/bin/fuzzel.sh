#!/bin/sh
if ! command -v fuzzel &> /dev/null; then
    dunstify "fuzzel" "Fuzzel not found successfully"
    exit
fi
fuzzel \
                --font="Iosevka Nerd Font:size=12.00" \
                --icon-theme="Papirus"\
                -l 20\
                -w 50\
                --prompt="ͷ "\
                --background="{{bg}}ff"\
                --text-color="{{fg}}ff"\
                --match-color="{{accent}}ff"\
                --selection-color="{{bg_alt}}ff"\
                --border-width=2\
                --border-color="{{bg_alt}}ff"\
                --selection-text-color="{{fg}}ff"\
                --border-radius=0\
                --border-color="{{bg_alt}}ff"\
                 $@ <&0
