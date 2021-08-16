#!/usr/bin/env bash
zenity --title=i3 --question --text="Exit i3?"

if [ $? == 0 ]; then
    i3-msg exit
fi
