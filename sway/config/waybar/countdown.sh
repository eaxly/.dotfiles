#!/bin/bash
# @CalinLeafshade you absolute legend
PIDFILE="/var/run/user/$UID/countdown.pid"

declare -a PIDs

_down() {
    ~/.dotfiles/bin/bin/countdown watch &
    PIDs+=($!)
}

while read p
do
    kill -s SIGKILL $p
done < $PIDFILE

_down

printf "%s\n" "${PIDs[@]}" > $PIDFILE
