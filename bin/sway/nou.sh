#!/usr/bin/env bash
# No U - don't start
date=$(date +%H)

if [ $date -lt 19 ] || [ $date -ge 21 ]; then
    echo "No U."
    shutdown now
fi
