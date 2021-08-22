#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

PRIMARY_MONITOR=$(xrandr | grep " connected " | grep -v "primary" | awk '{print $1}')

# Launch axolotl
echo "---" | tee -a /tmp/polybar1.log
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload axolotl 2>&1 | tee -a /tmp/polybar1.log & disown
    done

    polybar --reload tray 2>&1 | tee -a /tmp/polybar_tray.log & disown
else
    polybar --reload axolotl &
    polybar --reload tray &
fi

echo "Bars launched..."
