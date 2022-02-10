#!/bin/sh
if command -v mpd &> /dev/null; then
    mpd && ~/.dotfiles/bin/bin/mpd-mpris > /dev/null & disown
else
    echo mpd is not installed
fi
