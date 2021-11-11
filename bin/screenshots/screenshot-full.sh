#!/usr/bin/env bash
maim \
    --hidecursor\
    $HOME/Pictures/Screenshots/Screenshot$(date +%d-%m-%Y_%R:%S).png

if [[ $? == 0 ]];then
    notify-send "Screenshot successful" "Successfully taken screenshot".
else
    notify-send "Screenshot failed" "Screenshot failed with error code: $?"
fi
