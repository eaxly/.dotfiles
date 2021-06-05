# ░█▀▄░█▀█░▀█▀░█▀▀░▀█▀░█░░░█▀▀░█▀▀
# ░█░█░█░█░░█░░█▀▀░░█░░█░░░█▀▀░▀▀█
# ░▀▀░░▀▀▀░░▀░░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀
#
# FILE: ~/.zshrc

# Some basics {{{

HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=1000000
setopt autocd extendedglob nomatch 
unsetopt beep

# Vim keybindings
bindkey -v

zstyle :compinstall filename '/home/axolotl/.zshrc'
autoload -Uz compinit && compinit
autoload -U promptinit && promptinit
# }}}

# $PATH {{{
# Check if $HOME/.local/bin is already part of the PATH variable
if [ ! $(echo $PATH | grep "$HOME/.local/bin") ] && [ -d ~/.local/bin ] ; then
  export PATH=$PATH:~/.local/bin
fi
# }}}

# Initializations {{{
# Init starship
eval "$(starship init zsh)"

# Init sheldon
eval "$(sheldon source)"
# export ZSH

# }}}

# Functions {{{

# }}}

# Variables {{{
# Editors
export EDITOR=nvim
export SUDO_EDITOR=nvim

# the manpager
export PAGER='nvim +Man!'

# Local variables {{{

# ZSHCONFIG
ZSHCONFIG=$HOME/.zshrc
# ALacritty Config
ALACRITTYCONFIG=$HOME/.config/alacritty/alacritty.yml
# etc
OPENBOXCONFIG=$HOME/.config/openbox/rc.xml
STARSHIPCONFIG=$HOME/.config/starship.toml
NVIMCONFIG=$HOME/.config/nvim/init.vim
MACKUPCONFIG=$HOME/.mackup.cfg
# }}}
# }}}

# Aliases {{{
# Config
alias zshconf="$EDITOR $ZSHCONFIG"
alias zshsource="source $ZSHCONFIG"
alias attyconf="$EDITOR $ALACRITTYCONFIG"
alias oboxconf="$EDITOR $OPENBOXCONFIG"
alias starconf="$EDITOR $STARSHIPCONFIG"
alias vonf="$EDITOR $NVIMCONFIG"
alias mackconf="$EDITOR $MACKUPCONFIG"
# ls
alias ls="exa --icons --group-directories-first --long --git"
alias lT="exa --icons --group-directories-first --tree --git"
alias ll="exa --icons --group-directories-first --long --all --git"
alias la="exa --icons --group-directories-first --long --all"
# nvim
alias v="nvim"
alias vv="vim"

# mkdir cp etc
alias md="mkdir -p"
alias cp="cp -r"
alias rm="echo 'Use something else!'"
# }}}

# SSH Agent
eval $(keychain --eval id_ed25519 -q)
# vim:foldmethod=marker
