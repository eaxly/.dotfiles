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

# Plugins Config {{{
# zsh-you-should-use
export YSU_MESSAGE_POSITION="after"
export YSU_MODE=ALL
export YSU_MESSAGE_FORMAT=$(tput bold)"$(tput setaf 1)You stoopid forgot that there is an $(tput setaf 3)%alias_type$(tput setaf 9) for $(tput setaf 3)%command$(tput setaf 9). It is $(tput setaf 3)%alias$(tput setaf 9)"

auto-ls-custom_function() {
  if [ ! -d .git ]; then
    exa --icons --group-directories-first --long
  else
    onefetch
    git status
    exa --icons --group-directories-first --long --all --git
  fi
}

AUTO_LS_COMMANDS=(custom_function)
# }}}

# Functions {{{

noice() {
  if command -v toilet > /dev/null; then
    for arg in $@; do
      toilet -f pagga "$arg"
    done
  else
    echo Toilet not installed!
  fi
}

# }}}

# Variables {{{
# Editors
export EDITOR=nvim
export SUDO_EDITOR=nvim

# the manpager
export MANPAGER="nvim -c MANPAGER -"

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
KITTYCONF=$HOME/.config/kitty/kitty.conf
# }}}
# }}}

# Aliases {{{
# Config
alias zshconf="$EDITOR $ZSHCONFIG"
alias zshsource="source $ZSHCONFIG"
alias attyconf="$EDITOR $ALACRITTYCONFIG"
alias oboxconf="$EDITOR $OPENBOXCONFIG"
alias starconf="$EDITOR $STARSHIPCONFIG"
[ -d $HOME/.config/nvim/init.lua ] && alias vlconf="$EDITOR $HOME/.config/nvim/init.lua"
alias vconf="$EDITOR $NVIMCONFIG"
alias mackconf="$EDITOR $MACKUPCONFIG"
alias kittyconf="$EDITOR $KITTYCONF"
# ls
alias ls="exa --icons --group-directories-first --long --git"
alias lT="exa --icons --group-directories-first --tree --git"
alias ll="exa --icons --group-directories-first --long --all --git"
alias la="exa --icons --group-directories-first --long --all --git"

# nvim
alias v="nvim"
alias vv="vim"

# mkdir cp etc
alias md="mkdir -p"
alias cp="cp -r"
alias rm="echo 'Use something else!'"
# }}}

# Startup {{{
# SSH Agent
if ! command -v seahorse > /dev/null; then
  eval $(keychain --eval id_ed25519 -q)
fi

# Random fetcher
[ -f $HOME/.dotfiles/bin/random_fetcher.sh ] && bash $HOME/.dotfiles/bin/random_fetcher.sh
# }}}
# Vim keybindings
bindkey -v

# vim:foldmethod=marker
