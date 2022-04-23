#!/usr/bin/env bash
# Installation for sway config
NC="\033[0m$(tput rmso)"       # Text Reset

# Regular Colors
black='\e[38;5;0m'        # Black
red='\e[38;5;1m'          # Red
green='\e[38;5;2m'        # Green
yellow='\e[38;5;3m'       # Yellow
blue='\e[38;5;4m'         # Blue
purple='\e[38;5;5m'       # Purple
cyan='\e[38;5;6m'         # Cyan
white='\e[38;5;7m'        # White

bold="\e[1m"
offbold="\e[m"

function info() {
    printf "${green}${bold}${@}${NC}\n"
}

function error() {
    printf "${red}${bold}${@}${NC}\n"
}

function ask() {
    printf "${blue}${bold}${@}${NC}\n"
}

if ! command -v pacman > /dev/null; then
    error "Pacman hasn't been found."
    info "Exiting..."
    exit 1
fi

# pkgs to be installed with pacman
pkgs="kanshi \
    swayidle \
    grim \
    slurp \
    jq \
    wl-clipboard \
    gammastep \
    waybar \
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
    foot \
    mpv \
    mpv-mpris"
# pkgs in the aur
aur_pkgs="sway-borders-git \
    swaylock-effects-git \
    sddm-sugar-candy-git \
    funny-manpages \
    farge-git \
    rofi-lbonn-wayland \
    wob \
    bibata-cursor-theme \
    popsicle-git \
    vimv-git \
    cozette-otb \
    mako-git"

function _install() {
    programs=${@}
    info "Installing ${programs}"
    sleep 0.5
    ask "Continue? [y/N]"
    read answer
    if [[ $answer == "y" || $answer == "yes" ]]; then
        echo
        sudo pacman --sync --needed $programs
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
        paru --sync --sudoloop --needed $programs
    fi
}

function main() {
    _install $pkgs
    _aur_install $aur_pkgs
}
main
# vi:fdm=marker
