#!/usr/bin/env bash
# YEETSCRIPTION: yeet yourself outta that session** 
# YAUTHER: @ExtinctAxolotl

function get_options() {
    echo "lock"
    echo "suspend"
    echo "logout"
    echo "reboot"
    echo "shutdown"
}

function main() {
    local options=$(get_options)

    local option=$( echo "${options}" | rofi -dmenu -i -p "Power: ")
    case $option in
        "lock")
            playerctl pause
            swaylock
            ;;
        "suspend")
            playerctl pause
            systemctl suspend
            ;;
        "logout")
            playerctl pause
            swaymsg exit
            ;;
        "reboot")
            reboot
            ;;
        "shutdown")
            shutdown now
            ;;
    esac
}

main
