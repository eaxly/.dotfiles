#!/usr/bin/env bash
# by @eaxly
screen_dir="$(xdg-user-dir PICTURES)/Screenshots"
screen_path="$screen_dir/$(date +'%Y-%m-%d_%X_grim.png')"
output="$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')"
if [ ! -d "$screen_dir" ]; then
    mkdir -p $screen_dir
fi

usage() {
    echo "
    $(basename $0) - make screenshots with style
    -c, --copy - copy screenshot
    -s, --selection - selection shot
    -f, --full - full shot
    "
}

while [ $# -ge 0 ]; do
    case "$1" in
        -c | --copy)
            copy=true
            shift
            ;;
        -s | --selection)
            selection=true
            shift
            ;;
        -f | --full)
            full=true
            shift
            ;;
        -*)
            usage
            exit
            ;;
        *)
            break
            ;;
    esac
done

selection_shot() {
    if [ ! "$copy" = true ]; then
        grim -g "$(slurp)" $screen_path
        stat="$?"
    else
        grim -g "$(slurp)" - | wl-copy -t image/png
        stat="$?"
    fi
    echo "copy: $copy $screen_path"
}

full_shot() {
    if [ ! "$copy" = true ]; then
        grim -o "$output" $screen_path
        stat="$?"
    else
        grim -o "$output" - | wl-copy -t image/png
        stat="$?"
    fi
    echo "copy: $copy $screen_path"
}

if [ "$full" = true ] && [ ! "$selection" = true ]; then
    full_shot
elif [ ! "$full" = true ] && [ "$selection" = true ]; then
    selection_shot
else
    echo nope
fi

if [ "$stat" = "0" ]; then
    if [ "$copy" = true ]; then
        wl-paste > /tmp/scrsht && image="/tmp/scrsht"
    else
        image="$screen_path" && copy=false
    fi
    dunstify --raw_icon $image "Screenshot taken!" "Copied: $copy"
fi
