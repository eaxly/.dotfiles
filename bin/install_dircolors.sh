#!/usr/bin/env bash
echo "Making Directory...\n"
mkdir -p $HOME/.dircolors
sleep 0.5

echo "Getting File...\n"
curl --silent https://raw.githubusercontent.com/arcticicestudio/nord-dircolors/develop/src/dir_colors > $HOME/.dircolors/dircolors
sleep 0.5
if command -v notify-send > /dev/null; then
  notify-send --icon=preferences-desktop-display "Nord Dircolors!" "Finished Installing Nord Dircolors."
else
 echo """
  ░█▀▄░█▀█░█▀█░█▀▀░█
  ░█░█░█░█░█░█░█▀▀░▀
  ░▀▀░░▀▀▀░▀░▀░▀▀▀░▀
  """
fi
