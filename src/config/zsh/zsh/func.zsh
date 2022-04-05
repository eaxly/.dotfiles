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
    tac $HISTFILE | fzf | wl-copy
}

ssh-add-pass() {
    ! command -v seahorse &> /dev/null && echo install seahorse || /usr/lib/seahorse/ssh-askpass $1 &> /dev/null
}

foot-terminfo-install() {
    echo on remote machine,
    echo copy paste this:
    echo "sed 's/@default_terminfo@/foot/g' foot.info | tic -x -e foot,foot-direct -"
    echo "sed 's/@default_terminfo@/foot/g' foot.info | tic -x -e foot,foot-direct -" | wl-copy
}

imgshow() {
    if [[ ! -z "$1" ]]; then
        curl "$1" -o - | chafa -
    fi
} 

# this script will fetch 
inst-script() {
    if [[ ! -z "$1" ]]; then
        sum="$(echo $1 | sha1sum | cut -d' ' -f1)"
        dl_file="inst-script$sum"
        echo $dl_file
        curl "$1" -o "/tmp/$dl_file"
        $EDITOR /tmp/$dl_file
        echo -en "is ok? [y/N] "
        read ok
        if [[ "$ok" = "y" ]]; then
            echo -en "where to save? "
            read save_path
            if [[ ! -z "$save_path" ]]; then
                mv /tmp/$dl_file "$save_path"
                chmod +x "$save_path"
            fi
        else
            echo shredding file
            shred -zu "/tmp/$dl_file"
        fi
    fi
}

# uwuclip - uwuify the clipboard
uwuclip() {
    uwu="$(wl-paste | uwuify) > /dev/null"
    echo $uwu | wl-paste
    echo $uwu
}

mscplay() {
    if [ ! -z "$2" ]; then
        mpv --no-video "$1" & disown
        return
    fi
    mpv --no-video "$1"
}

chtheme() {
    old="$(bombadil get vars -p sway | grep '^theme' | awk '{print $2}')"
    new="$1"
    dest="$HOME/.dotfiles/sway/sway.toml"
    sed s/$old/$new/g -i $dest
    ~/.dotfiles/bin/sway/reload.sh
}