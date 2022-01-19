#!/usr/bin/env bash

dir="$(xdg-user-dir VIDEOS)/yt"

show_help() {
    echo -e """
    yt.sh: watch yt offline or online

    -d: offline directory ($dir)
    """
}

while [ $# != 0 ]; do
    case $1 in
        -d | -dir | -directory)
            dir=$2
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
    if $rofi; then
        file=$(ls "$dir" | rofi -theme-str '#window {width: 80%;}' -dmenu -i -p 'Select Video: ')
    elif $dmenu; then
        file=$(ls "$dir" | dmenu -p "Select Video: ")
    else
        echo "Rofi or dmenu are not installed!"
        exit 
    fi

    if [ $? -eq 0 ]; then
        mpv "$dir/$file"
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
    dir="$(xdg-user-dir VIDEOS)/tv"
    if $rofi; then
        file=$(ls "$dir" | rofi -theme-str '#window {width: 80%;}' -dmenu -i -p 'Select Video: ')
    elif $dmenu; then
        file=$(ls "$dir" | dmenu -p "Select Video: ")
    else
        echo "Rofi or dmenu are not installed!"
        exit 
    fi

    if [ $? -eq 0 ]; then
        mpv "$dir/$file"
    fi
}

download() {
    if ! command -v ytfzf &> /dev/null; then
        echo "ytfzf not found!"
        exit 1
    fi
    cd $dir
    ytfzf -d -D
}

if $rofi; then
    selection=$(echo -e "Online\nOffline\nTV\nDownload" | rofi -dmenu -i -p "Select mode: ")
elif $dmenu; then
    selection=$(echo -e "Online\nOffline\nTV\nDownload" | dmenu -i -p "Select mode: ")
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
    "Download")
        download
        ;;
    *)
        exit 1
        ;;
esac
