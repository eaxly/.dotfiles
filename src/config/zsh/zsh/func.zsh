wttr() {
    curl "wttr.in/$1"
}

rate() {
    [ ! -z "$2" ] && range="@$2"
    curl "rate.sx/$1$range"
}

fcd() {
    _path="$(fd --type=d --hidden | fzf)"
    [ ! -z "$_path" ] && cd $_path
}

hst() {
    cat $HISTFILE | fzf | wl-copy
}
