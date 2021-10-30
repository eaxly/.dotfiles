#!/usr/bin/env bash

# ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
# ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
# ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
#
# FILE: /home/axolotl/.dotfiles/bin/random_fetcher.sh

if ! command -v pacman &> /dev/null; then
    echo pacman not found, go away
    exit
fi

fetchers=("fm6000 --random" neofetch nofetch ) # uwufetch "pokemon-colorscripts -r"

random_num=$(($RANDOM % ${#fetchers[@]}))

random_fetcher=${fetchers[$random_num]}

if command -v $random_fetcher &> /dev/null; then
    $random_fetcher
else
    echo $random_fetcher is not installed, install it or i will shoot you
fi
