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
fpath+=$HOME/.zfunc


zstyle :compinstall filename '/home/axolotl/.zshrc'
autoload -Uz compinit && compinit
autoload -U promptinit && promptinit
# }}}

# $PATH {{{
# Check if $HOME/.local/bin is already part of the PATH variable
if [ ! $(echo $PATH | grep "$HOME/.local/bin") ] && [ -d ~/.local/bin ] ; then
  export PATH=$PATH:~/.local/bin
fi
if [ ! $(echo $PATH | grep "$HOME/.emacs.d/bin") ] && [ -d ~/.emacs.d/bin ] ; then
  export PATH=$PATH:~/.emacs.d/bin
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

# zsh auto ls functions
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

dots() {
  if command -v toilet > /dev/null; then
    toilet -f pagga "Dotfiles"
    echo
    echo "File:"
    echo "By: @ExtinctAxolotl"
  fi
}

mackse() {
  # mackup search with grep
  mackup list | grep "$@"

}
# }}}

# Variables {{{
# Editors
export EDITOR=nvim
export SUDO_EDITOR=nvim

# the manpager
export MANPAGER="nvim -c MANPAGER -"
export PAGER="nvim +Man! -c MANPAGER -"
# }}}

# Aliases {{{
# Config
alias zshconf="$EDITOR ~/.zshrc"
alias zshsource="source ~/.zshrc"
alias alaconf="$EDITOR ~/.config/alacritty/alacritty.yml"
# alias oboxconf="$EDITOR ~/.config/openbox/rc.xml"
alias starconf="$EDITOR ~/.config/starship.toml"
alias vconf="$EDITOR ~/.config/nvim/init.vim"
! [ -f $HOME/.config/nvim/init.vim ] && [ -f $HOME/.config/nvim/init.lua ] && alias vconf="$EDITOR $HOME/.config/nvim/init.lua"
alias mackconf="$EDITOR ~/.mackup.cfg"
alias kittyconf="$EDITOR ~/.config/kitty/kitty.conf"
alias herbstconf="$EDITOR ~/.config/herbstluftwm/autostart"

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
# alias rm="echo 'Use something else!'"

# theF*ck
alias f="fuck"
# needed for thef*ck
eval $(thefuck --alias)

# python
alias py3="python3"

# p

# }}}

# Startup {{{
# SSH Agent
# eval $(keychain --eval id_ed25519 -q)

# Random fetcher
[ -f $HOME/.dotfiles/bin/random_fetcher.sh ] && bash $HOME/.dotfiles/bin/random_fetcher.sh
# }}}

# Vim keybindings
bindkey -v

# vim:foldmethod=marker
