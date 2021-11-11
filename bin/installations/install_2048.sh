#!/usr/bin/env bash

if ! command -v curl &> /dev/null; then
  echo Curl is not installed!
  echo Installing Curl
  sudo apt install curl
fi

echo Downloading bash2048.sh to $HOME/.local/bin...
curl --silent https://raw.githubusercontent.com/JosefZIla/bash2048/master/bash2048.sh > $HOME/.local/bin/bash2048
sleep 0.5

echo Making $HOME/.local/bin/bash2048 executable
chmod +x $HOME/.local/bin/bash2048
sleep 0.5

echo To play the game, simply execute bash2048 in your terminal.
sleep 1
if ! command -v notify-send &> /dev/null; then
  echo "Done!"
  exit
fi


notify-send "BASH2048 INSTALLATION!" "The installation of bash2048 has succeeded!"
