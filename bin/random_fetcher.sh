#!/usr/bin/env bash

# ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
# ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
# ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
#
# FILE: /home/axolotl/.dotfiles/bin/random_fetcher.sh

fetchers=("fm6000 --random" neofetch nofetch uwufetch) # /usr/bin/uwufetch 

random_num=$(($RANDOM % ${#fetchers[@]}))

random_fetcher=${fetchers[$random_num]}

$random_fetcher
