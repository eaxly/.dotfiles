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
# YOTICE: designed with fuzzel dmenu mode in mind

function get_options() {
    echo " Lock"
    echo " Suspend"
    echo " Logout"
    echo " Reboot"
    echo " Shutdown"
}

function main() {
    local options=$(get_options)

    local option=$( echo "${options}" | ~/.config/sway/fuzzel.sh --dmenu --prompt="Power: ")
    case $option in
        " Lock")
            swaylock
            ;;
        " Suspend")
            systemctl suspend
            ;;
        " Logout")
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
