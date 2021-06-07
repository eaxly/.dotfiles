#!/usr/bin/env bash

# A script to install wanted software on my system

_exists() {
  command -v ${@} &> /dev/null
}

install() {
  program=${1}
  if _exists $program; then
    return
  else
    # I have only used debian and arch based systems
    if _exists pacman; then
      sudo pacman -S $program
    elif _exists apt; then
      sudo apt install $program
    fi
  fi
}

pacman_applications=(
  ranger
  rofi
  picom
)

aur_applications=(
  neovim-git
)


if [ -f $HOME/.dotfiles ]; then
  echo "You haven't installed the dotfiles."
  echo "Do you wan't to install them? [y/N]"
  read -n 1 answer
fi

if _exists pacman && ! _exists yay || ! _exists paru; then
  echo "You have no AUR manager installed on your system."
  echo "Do you wan't to install paru? [y/N]"
  read answer
  if [[ $answer != "y" || $answer != "yes" ]]; then
    return
  else
    git clone aur.archlinux.org/paru-bin.git $HOME/paru-bin
  fi
fi


# vim:foldmethod=marker
