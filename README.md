# The DOTFILES (also know as ~/.files)

# WARNING!
These are the v1 dotfiles where stow is used.  
In the v2 (main branch) mackup is used  
v1 is not used and updated any more


# OLD README
These are _my_ Dotfiles.  
I am a ~~wanna be~~ **very professional** Software Engineer.
These Dotfiles are meant to be used on ArchLinux.  
**I did not Test if they work on other distros, if not, submit an issue!**
## Managing the Dotfiles
I use GNU Stow to manage these dotfiles. There is no installation script what so ever.  
**You and you only have control over what configuration is applied.**  

## Installation of the configuration
1. Cloning
  ```bash
  git clone https://github.com/ExtinctAxolotl/dotfiles.git $HOME/.dotfiles
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
  You have now cloned and stowed every configuration file.
  Now you need to install the software needed.

## Additional Information
### Sheldon-sheldon and sheldon-config
+ `sheldon-sheldon`: will stow the files to ~/.sheldon/
+ `sheldon-config`: Will stow the files to ~/.config/sheldon

## Programs to install
+ [sheldon](https://github.com/rossmacarthur/sheldon)
```bash
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
  | bash -s -- --repo rossmacarthur/sheldon --to ~/.local/bin
```

+ [nvm](https://github.com/nvm-sh/nvm)
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
```

+ [starship]()
