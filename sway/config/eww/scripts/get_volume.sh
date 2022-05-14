#!/usr/bin/env bash
# taken from elkowar's configuration
get_volume() {
    pamixer --get-volume;
    pactl subscribe \
      | grep --line-buffered "Event 'change' on sink " \
      | while read -r evt;
      do [ "$(pamixer --get-mute)" = "false" ] && pamixer --get-volume | cut -d " " -f1 || echo "0";
    done
}
get_volume
