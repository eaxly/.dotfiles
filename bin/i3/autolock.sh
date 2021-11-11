#!/usr/bin/env bash

# Only exported variables can be used within the timer's command.
export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"
export SECONDARY_DISPLAY=$(xrandr | grep " connected " | grep -v "primary" | awk '{print $1}')

# Run xidlehook
xidlehook \
  `# Don't lock when there's a fullscreen application` \
  --not-when-fullscreen \
  `# Don't lock when there's audio playing` \
  --not-when-audio \
  `# Dim the screen after 60 seconds, undim if user becomes active` \
  --timer 60 \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 0.1 --output "$SECONDARY_DISPLAY" --brightness 0.1' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1 --output "$SECONDARY_DISPLAY" --brightness 1' \
  `# suspend 45 minutes after it locks` \
  --timer 900\
    'systemctl suspend' \
    'xrandr --output "$PRIMARY_DISPLAY" --brightness 1 --output "$SECONDARY_DISPLAY" --brightness 1' \
    --socket "/tmp/xidlehook.sock"
