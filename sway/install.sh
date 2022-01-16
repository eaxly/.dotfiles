#!/usr/bin/env bash
# Installation for sway config
NC="\033[0m$(tput rmso)"       # Text Reset

# Regular Colors
black='\033[0;30m'        # Black
red='\033[0;31m'          # Red
green='\033[0;32m'        # Green
yellow='\033[0;33m'       # Yellow
blue='\033[0;34m'         # Blue
purple='\033[0;35m'       # Purple
cyan='\033[0;36m'         # Cyan
white='\033[0;37m'        # White

bold=$(tput smso)
offbold=$(tput rmso)

function info() {
    echo -e "${green}${bold}${@}${NC}"
}

function error() {
    echo -e "${red}${bold}${@}${NC}"
}

function ask() {
    echo -e "${blue}${bold}${@}${NC}"
}

CX_INSTALLED=false
if pacman -Sl chaotic-aur &> /dev/null; then
    CX_INSTALLED=true
fi

if ! command -v pacman > /dev/null; then
    error "Pacman hasn't been found."
    info "Exiting..."
    exit 1
fi

# pkgs to be installed with pacman
pkgs="sway kanshi swayidle grim slurp jq wl-clipboard waybar mako discord-canaryplayerctl python-gobject neovim neofetch kitty starship zsh task sddm ripgrep imagemagick git-lfs strace exa networkmanager"
# pkgs in the chaotic aur
chaotic_pkgs="neovide-git swaylock-effects bibata-cursor-theme popsicle-git vimv-git"
# pkgs in the aur
aur_pkgs="bombadil-bin paruz fuzzel oguri-git activitywatch-bin sheldon-bin sddm-sugar-candy-git funny-manpages farge-git nerd-fonts-victor-mono"

function _install() {
    programs=${@}
    info "Installing ${programs}"
    sleep 0.5
    ask "Continue? [y/N]"
    read answer
    if [[ $answer == "y" || $answer == "yes" ]]; then
        echo
        sudo pacman -S --needed $programs
    fi
}

function _aur_install() {
    programs=${@}
    info "Installing ${programs}"
    sleep 0.5
    ask "Continue? [y/N]"
    read answer

    if [[ $answer,, = "y"* ]] && command -v paru > /dev/null; then
        echo
        paru -S --sudoloop --needed $programs
    fi
}

function _cx_install() {
    if [[ $CX_INSTALLED = true ]]; then
        _install $@
    else
        info "Chaotic AUR not installed."
        info "Installing via the AUR..."
        _aur_install $@
    fi
}

function main() {
    _install $pkgs
    _aur_install $aur_pkgs
    _cx_install $chaotic_pkgs
}
main
# vi:fdm=marker
