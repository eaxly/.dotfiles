#!/usr/bin/env bash
echo "Making Directory..."
mkdir -p $HOME/.dircolors
sleep 0.5

echo "Getting File..."
curl --silent https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/develop/src/dir_colors > $HOME/.dircolors/dircolors
sleep 0.5
if command -v dunstify > /dev/null; then
  dunstify --icon=preferences-desktop-display "Nord Dircolors!" "Finished Installing Nord Dircolors."
 echo """
  ░█▀▄░█▀█░█▀█░█▀▀░█
  ░█░█░█░█░█░█░█▀▀░▀
  ░▀▀░░▀▀▀░▀░▀░▀▀▀░▀
  """
else
 echo """
  ░█▀▄░█▀█░█▀█░█▀▀░█
  ░█░█░█░█░█░█░█▀▀░▀
  ░▀▀░░▀▀▀░▀░▀░▀▀▀░▀
  """
fi
