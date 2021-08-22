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
    'xrandr --output "$PRIMARY_DISPLAY" --output "$SECONDARY_DISPLAY" --brightness 0.1' \
    'xrandr --output "$PRIMARY_DISPLAY" --output "$SECONDARY_DISPLAY" --brightness 1' \
  `# Undim & lock after 10 more seconds` \
  --timer 10 \
    'xrandr --output "$PRIMARY_DISPLAY" --output "$SECONDARY_DISPLAY" --brightness 1; betterlockscreen -l blur --display 1 --span' \
    '' \
  `# Finally, suspend 45 minutes after it locks` \
  --timer 2700 \
    'systemctl suspend' \
    '' \
    --socket "/tmp/xidlehook.sock"
