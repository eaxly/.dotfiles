#!/usr/bin/env bash

# A script to install wanted software on my system
# It is by no means perfect nor clean, but who cares if it works.
# If it doesn't work, please open an issue.

# If you just wan't to install other packages, edit these two lines
# ↓ packages that need to be installed
packages=(neovim ranger rofi picom alacritty)

aur_packages=(neovim-git picom-jonaburg-git)

_exists() { if command -v pacman &> /dev/null; then
    pacman -Q ${@} &> /dev/null
  elif command -v apt &> /dev/null; then
    apt search ${@} &> /dev/null
  fi
}

_install() {
  program=${1}
  if _exists pacman; then
    sudo pacman -S $program
  elif _exists apt; then
    sudo apt install $program
  fi
}

_aur_install() {
  program=${1}
  if ! _exists $program; then
    sudo paru -S $program
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
    
    echo Going into the directory...
    cd $HOME/paru-bin
    sleep 1

    echo Making package...
    makepkg -si
    sleep 1
    echo DONE!
  fi
fi

for package in $packages; do
  _install $package
done

for package in aur_packages; do
  _aur_install $package
done

# vim:foldmethod=marker
