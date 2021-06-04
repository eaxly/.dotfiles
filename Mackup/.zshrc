# vim:foldmethod=marker
# Lines configured by zsh-newuser-install {{{
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/axolotl/.zshrc'
fpath+=~/.zfunc

autoload -Uz compinit
compinit
# End of lines added by compinstall }}}

autoload bashcompinit
bashcompinit

bindkey -v

# Bash

# Init starship
eval "$(starship init zsh)"
# Init brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# FZF {{{
# Source fzf (on ubuntu 18.04, on 20.04 install with apt install fzf)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
--color=fg:#c5cdd9,bg:#262729,hl:#6cb6eb 
--color=fg+:#c5cdd9,bg+:#262729,hl+:#5dbbc1 
--color=info:#88909f,prompt:#ec7279,pointer:#d38aea 
--color=marker:#a0c980,spinner:#ec7279,header:#5dbbc1'
# }}}

# === VARIABLES === {{{

# Editor Definition
export EDITOR=nvim

# Pager
export PAGER="nvim -c 'set ft=man' -"

# sudoeditor
export SUDO_EDITOR=$EDITOR

# PATH
if [ -d $HOME/.local/bin ];then
  export PATH=~/.local/bin/:$PATH
fi
if [ -d $HOME/.local/bin ];then
  export PATH="$HOME/.poetry/bin:$PATH"
fi
# === I demand to see your Manager! Lol ==>
export ZSH="$HOME/.local/share/sheldon/repos/github.com/ohmyzsh/ohmyzsh"
eval "$(sheldon source)"

# }}}

# === FUNCTIONS === {{{

auto-ls-custom_function () {
  exa -l --group-directories-first --icons
  if [ -d .git ];then
    onefetch
    git status
  fi
}
export AUTO_LS_COMMANDS=(custom_function)

noice () {
  for arg in "$@"; do
    toilet -f pagga $arg
  done
}

dots () {
  if [ $1 ];then
    toilet -f pagga "Dotfiles"
    echo FILE: $1
  else
    toilet -f pagga "Dotfiles"
    echo FILE:
  fi
}

mackse () {
  mackup list | grep "$1"
}

biradd () {
if command -v birthday > /dev/null; then
  birthday -n $1 -d $2
else
  echo "You need to install birtday!\nYou can install it with:\nnpm i -g birthday"
fi
}

gogh () {
  echo "Changing Theme..."
  sleep 5
  bash -c "$(wget -qO- https://git.io/vQgMr)"

}

sha256() {
  echo "$1 $2" | sha256sum --check
}

update_aseprite() {
  if [ "$PWD" != "$HOME/.aseprite" ]; then
    echo "You are not in the aseprite directory!"
    sleep 1
    cd $HOME/.aseprite
  fi
  git pull
  git submodule update --init --recursive
}
# }}} Functions END

# === ALIASES === {{{
alias zshsrc="source ~/.zshrc"
alias zshconf="$EDITOR ~/.zshrc"

alias disintkey="xinput disable 'AT Translated Set 2 keyboard'"
alias enintkey="xinput enable 'AT Translated Set 2 keyboard'"
# nvim
# alias vim="nvim"
alias v="nvim"
alias vconf="$EDITOR ~/.config/nvim/init.vim"
alias nvimconf="$EDITOR ~/.config/nvim/init.vim"
alias starconf="$EDITOR ~/.config/starship.toml"

alias speedby="speed-test -b"

# Pyton
alias py3="python3"
alias cvenv="virtualenv -p python3 venv"
alias srcenv="source venv/bin/activate"

# mackup
alias mackb="mackup backup"
alias mackli="mackup list"
alias mackun="mackup uninstall"
alias mackconf="$EDITOR ~/.mackup.cfg"
alias yodl="youtube-dl"

alias ipy="ipython3"
alias flowconf="sudo -e /etc/systemd/user/flowy.service"

alias f="fuck"
# cd
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."

# paru
#alias pain="paru -S"
#alias pare="paru -R"
#alias parem="paru -Rns"
#alias pase="paru -Ss"

# exa (ls)
alias l1="exa -1 --group-directories-first --icons"
alias lss="exa --group-directories-first --icons"
alias ls="exa -l --group-directories-first --icons"
alias la="exa -la --group-directories-first --icons"
alias lal="exa -la --group-directories-first --icons | lolcat"
# For debian systems
alias bat="batcat"
alias alien="alien-update"

# alias fd="fdfind"
alias fd="fd -H"

# apt
alias api="sudo apt install"
alias apar="sudo apt autoremove"
alias apr="sudo apt remove"
alias aps="apt search"

# dwall
alias dw="dwall"
alias dws="dwall -s"

# git
alias gclo="git clone"
# ===================================================================== END }}}

# === COMPLETIONS === {{{
# PIPENV

#compdef pipenv
_pipenv() {
  eval $(env COMMANDLINE="${words[1,$CURRENT]}" _PIPENV_COMPLETE=complete-zsh  pipenv)
}
if [[ "$(basename ${(%):-%x})" != "_pipenv" ]]; then
  autoload -U compinit && compinit
  compdef _pipenv pipenv
fi

# PIP and PIP3
# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip3
# pip zsh completion end

# zsh parameter completion for the dotnet CLI

# Dotnet zshcompletions
_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  reply=( "${(ps:\n:)completions}" )
}

compctl -K _dotnet_zsh_complete dotnet

# Pacstall completions
source /usr/share/bash-completion/completions/pacstall
# }}}

# Dircolors
test -r ~/.dircolors/dircolors && eval $(dircolors ~/.dircolors/dircolors)

clear && test -r $HOME/.dotfiles/bin/random_fetcher.sh && bash $HOME/.dotfiles/bin/random_fetcher.sh
