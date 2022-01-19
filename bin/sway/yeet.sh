#!/usr/bin/env bash
# ______ 
#< yeet >
# ------ 
#     \
#      \
#       ("`-'  '-/") .___..--' ' "`-._
#         ` *_ *  )    `-.   (      ) .`-.__. `)
#         (_Y_.) ' ._   )   `._` ;  `` -. .-'
#      _.. `--'_..-_/   /--' _ .' ,4
#   ( i l ),-''  ( l i),'  ( ( ! .-'    
#
#
# YEETSCRIPTION: yeet yourself outta that session** 
# YAUTHER: @ExtinctAxolotl

function get_options() {
    echo " Lock"
    echo " Suspend"
    echo " Logout"
    echo " Reboot"
    echo " Shutdown"
}

function main() {
    local options=$(get_options)

    local option=$( echo "${options}" | rofi -dmenu -i -p "Power: ")
    case $option in
        " Lock")
            playerctl pause
            swaylock
            ;;
        " Suspend")
            playerctl pause
            systemctl suspend
            ;;
        " Logout")
            playerctl pause
            swaymsg exit
            ;;
        " Reboot")
            reboot
            ;;
        " Shutdown")
            shutdown now
            ;;
    esac
}

main
