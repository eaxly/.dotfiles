#!/usr/bin/env bash

directory=""

show_help() {
    echo -e """
    yt.sh: watch yt offline or online

    -d: offline directory ($directory)
    """
}

while [ $# != 0 ]; do
    case $1 in
        -d | -dir | -directory)
            directory=$2
            ;;
        -*)
            show_help
            exit
            ;;
        *)
    esac
done

if command -v rofi &> /dev/null; then
    rofi=true
    dmenu=false
elif command -v dmenu &> /dev/null; then
    rofi=false
    dmenu=true
else
    echo "Rofi or dmenu are not installed!"
    exit 
fi

offline() {
    directory="$(xdg-user-dir VIDEOS)/yt"

    if $rofi; then
        file=$(ls "$directory" | rofi -theme-str '#window {width: 80%;}' -dmenu -i -p 'Select Video: ')
    elif $dmenu; then
        file=$(ls "$directory" | dmenu -p "Select Video: ")
    else
        echo "Rofi or dmenu are not installed!"
        exit 
    fi

    if [ $? -eq 0 ]; then
        mpv "$directory/$file"
    fi
}

online() {
    if ! command -v ytfzf &> /dev/null; then
        echo "ytfzf not found"
        exit 1
    fi
    ytfzf -D
}

tv() {
    directory="$(xdg-user-dir VIDEOS)/tv"
    if $rofi; then
        file=$(ls "$directory" | rofi -theme-str '#window {width: 80%;}' -dmenu -i -p 'Select Video: ')
    elif $dmenu; then
        file=$(ls "$directory" | dmenu -p "Select Video: ")
    else
        echo "Rofi or dmenu are not installed!"
        exit 
    fi

    if [ $? -eq 0 ]; then
        mpv "$directory/$file"
    fi
}

if [ ! $directory = "" ]; then
    offline
fi

if $rofi; then
    selection=$(echo -e "Online\nOffline\nTV" | rofi -dmenu -i -p "Select mode: ")
elif $dmenu; then
    selection=$(echo -e "Online\nOffline\nTV" | dmenu -i -p "Select mode: ")
fi

case $selection in
    "Offline")
        offline
        ;;
    "Online")
        online
        ;;
    "TV")
        tv
        ;;
    *)
        exit 1
        ;;
esac
