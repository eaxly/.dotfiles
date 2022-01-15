#!/usr/bin/env bash
date=$(date +%H)

if [ $date -ge 21 ] || [ $date -lt 12 ]; then
    echo "No U."
    shutdown now
fi
