#!/usr/bin/env bash
if ! command -v pacman > /dev/null; then
    echo "Pacman has been found!"
    sleep 1
else
    echo "Pacman hasn't been found."
    echo "Exiting..."
    exit 1
fi

# pkgs to be installed with pacman
pkgs="gnome xorg python-pip"
# pkgs in the chaotic aur
chaotic_pkgs="neovide-git"
# pkgs in the aur
aur_pkgs="paruz "


_install() {
    programs=${@}
    echo -e "Installing ${programs}..."
    sleep 0.5
    echo "Is that alright? [y/n]"
    read -n 1 answer
    if [[ $answer == "y",, || "yes",, ]]; then
        sudo pacman -S $programs
    fi
}

_aur_install() {
    programs=${@}
    echo -e "Installing ${programs}..."
    sleep 0.5
    echo "Is that alright?"
    read -n 1 answer
    if [[ $answer == "y",, || "yes",, ]] && command -v paru > /dev/null; then
        paru -S $programs
    fi
}
