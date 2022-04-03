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

if ! command -v pacman > /dev/null; then
    error "Pacman hasn't been found."
    info "Exiting..."
    exit 1
fi

# pkgs to be installed with pacman
pkgs="sway \
    kanshi \
    swayidle \
    grim \
    slurp \
    jq \
    wl-clipboard \
    gammastep \
    waybar \
    mako \
    discord-canary \
    playerctl \
    python-gobject \
    neovim \
    neofetch \
    starship \
    zsh \
    task \
    sddm \
    ripgrep \
    imagemagick \
    git-lfs \
    strace \
    networkmanager \
    base-devel \
    papirus-icon-theme \
    pavucontrol \
    swaybg \
    dina-font \
    mpd \
    ncmpcpp \
    pamixer \
    zsh-syntax-highlighting \
    toml-bombadil \
    rofimoji \
    wtype \
    mpv \
    mpv-mpris"
# pkgs in the aur
aur_pkgs="swaylock-effects-git \
    sddm-sugar-candy-git \
    funny-manpages \
    farge-git \
    nerd-fonts-victor-mono \
    rofi-lbonn-wayland \
    wob \
    bibata-cursor-theme \
    popsicle-git \
    vimv-git \
    foot \
    cozette-otb"

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

function main() {
    _install $pkgs
    _aur_install $aur_pkgs
}
main
# vi:fdm=marker
