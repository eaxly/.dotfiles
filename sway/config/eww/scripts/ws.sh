#!/bin/sh

workspace_nums() {
    for i in $(swaymsg -rt get_workspaces | jq -r 'range(length)'); do
        swaymsg -rt get_workspaces | jq -r --arg i "$i" '(.[($i|tonumber)].num|tostring)+" "+(.[($i|tonumber)].focused|tostring)'        
    done
}

workspace_yuck() {
    buffered=""
    workspace_nums | while read -r id focused; do
        if $focused; then
            focused_class="focused"
            button_name="O"
        else
            focused_class="unfocused"
            button_name="."
        fi
        buffered+="(button :class \"$focused_class\" :onclick \"swaymsg workspace number $id\" \"$button_name\")"
        printf "$buffered"
        buffered=""
    done
}

swaymsg -t subscribe '["workspace"]' -m | while read -r; do
    box_attrs=':orientation "h" :class "workspace-button" :space-evenly true :halign "center" :valign "center" :hexpand true '
    eww update "workspaces-yuck=(box $box_attrs $(workspace_yuck))"
done
