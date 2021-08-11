#!/usr/bin/env bash

# A script to install wanted software on my system
# It is by no means perfect nor clean, but who cares if it works.
# If it doesn't work, please open an issue.

# If you just wan't to install other packages, edit these two lines
# ↓ packages that need to be installed
packages="neovim kitty gnome touchegg"

aur_packages=""

_exists() {
    if command -v pacman &> /dev/null; then
        pacman -Q ${@} &> /dev/null
    fi
}

_install() {
    program=${@}
    echo -e "Installing ${program}..."
    if _exists pacman; then
        sudo pacman -S $program
    fi
}

_aur_install() {
    program=${1}
    if ! _exists $program; then
        paru -S $program
    fi
}

if _exists pacman && ! _exists yay && ! _exists paru && ! _exists yoghurt; then
    echo "You have no AUR manager installed on your system."
    echo "paru is an AUR helper written in Rust and an alternative to yay"
    echo "Do you wan't to install paru? [y/N]"
    read answer
    if [[ ${answer,,} == "n" || ${answer,,} == "no" ]]; then
        echo "OK! Skipping..."
    else
    echo Cloning...
    git clone https://aur.archlinux.org/paru-bin.git $HOME/paru-bin
    sleep 1

    echo Entering the home directory...
    cd $HOME/paru-bin
    sleep 1

    echo Making package...
    makepkg -si
    sleep 1
    echo DONE!
    fi
fi

if $packages != ""; then
    _install $packages
fi

if $aur_packages != ""; then
    _aur_install $packages
fi

post_install() {
    echo "Post installation stuff idk put stuff here."
}

post_install()

# vim:foldmethod=marker
