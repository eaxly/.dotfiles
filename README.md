# The DOTFILES (also known as .-files)
These are _my_ Dotfiles.  
I am a ~~wanna be~~ **very professional** Software Engineer.<sup>Everything in bold is to be read sarcastically.</sup>   
These Dotfiles are meant to be used on ArchLinux.  
**I did not Test weither they work on other distributions!** <sup>BTW is that how you spell weither, i'm sure it's not. please open an issue</sup>
## Managing the Dotfiles
I use GNU Stow to manage these dotfiles. There is no installation script what so ever.  
**You and you only have control over what configuration is applied.**  

## Installation
1. Cloning
  ```bash
  git clone https://github.com/ExtinctAxolotl/.-files.git $HOME/.-files
  ```
  With the command above, we just cloned our configuration files into the folder $HOME/.-files  
  you can replace $HOME/.-files with any directory you wan't!

2. CD-ing
  ```bash
  cd $HOME/.-files
  ```
  Are you Sirius? (get the pun?) u don't even know how to cd into a directory?!  
  Please learn the basics of UNIX before insatlling these! Thank You! :D

3. Stow-ing
  ```bash
  stow *
  ```
