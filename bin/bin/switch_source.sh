#!/bin/sh

curr_device=$(pactl get-default-source)
devices=$(pactl list sources | grep "Name" | cut -d" " -f2)
device=""

echo "Devices: $devices"
echo "Current: $curr_device"

for i in $devices; do
    if [ "$i" = "$curr_device" ] && [ "$i" != "n/a" ]; then
        echo "Switching too: $i"
        pactl set-default-source $i
        device=$i
    fi
done

if [ $? = 0 ]; then
    notify-send -a "switch_sink.sh" "Switched to $device" "Successfully switched input source to $device."
fi
