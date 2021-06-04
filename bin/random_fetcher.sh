#!/usr/bin/env bash

# ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
# ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
# ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
#
# FILE: /home/axolotl/.dotfiles/bin/random_fetcher.sh

fetchers=("/usr/local/bin/fm6000 --random" "/usr/bin/neofetch --config $HOME/.dotfiles/misc/configFiles/neofetch.conf" /usr/bin/nofetch) # /usr/bin/uwufetch 

random_num=$(($RANDOM % ${#fetchers[@]}))

random_fetcher=${fetchers[$random_num]}

$random_fetcher
