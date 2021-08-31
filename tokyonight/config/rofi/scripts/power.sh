#!/usr/bin/env bash
function get_options()
{
    echo " lock"
    echo " suspend"
    echo " logout"
    echo " restart"
    echo " shutdown"
}

function main()
{
    local options=$(get_options)

    local option=$( echo "${options}" | rofi -dmenu -p " :" -config ~/.config/rofi/scripts/power.rasi )
    
    if echo $option | grep lock; then
        betterlockscreen --lock
    elif echo $option | grep suspend; then
        systemctl suspend
    elif echo $option | grep restart; then
        reboot
    elif echo $option | grep shutdown; then
        shutdown now
    elif echo $option | grep logout; then
        i3-msg exit
    fi
    
}
main
