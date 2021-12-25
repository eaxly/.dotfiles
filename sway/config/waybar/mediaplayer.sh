#!/bin/bash
# @CalinLeafshade you absolute legend
PIDFILE="/var/run/user/$UID/mediaplayer.pid"

declare -a PIDs

_mp() {
    python3 ~/.config/waybar/mediaplayer.py &
    PIDs+=($!)
}

while read p
do
    kill -s SIGTERM $p
done < $PIDFILE

_mp

printf "%s\n" "${PIDs[@]}" > $PIDFILE
