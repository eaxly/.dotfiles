#!/usr/bin/env bash
maim \
    --select\
    --hidecursor\
    $HOME/Pictures/Screenshots/Screenshot$(date +%d-%m-%Y_%R:%S).png\
    --shader=crosshair,

if [[ $? == 0 ]];then
    dunstify "Screenshot successful" "Successfully taken screenshot".
else
    dunstify "Screenshot failed" "Screenshot failed with error code: $?"
fi

