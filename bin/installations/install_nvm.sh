#!/usr/bin/env bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

install_nvm() {
  echo Downloading with curl...
  if command -v curl &> /dev/null;then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  else
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  fi

  read -p "Do you wan't to install the latest LTS version of nodeJS? [y/N]" -n 1 answer
  if [[ $answer != "y" ]]; then
    echo
    echo OK! Have fun with NVM :D
  else
    echo
    echo Nice! Installing the latest LTS version of nodeJS...
    sleep 1
    nvm install --lts
  fi
}


if command -v nvm &> /dev/null; then
  echo "You already have nvm installed."
  echo
  sleep 1
  echo "Exiting..."
  exit 1
else
  echo "Installing NVM..."
  sleep 1
  install_nvm
fi
