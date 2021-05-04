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

# Init starship
eval "$(starship init zsh)"

# Source fzf (on ubuntu 18.04, on 20.04 install with apt install fzf)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
  exa -l
  if [ -d .git ];then
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

sha256() {
  echo "$1 $2" | sha256sum --check
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
alias l1="exa -1"
alias lss="exa"
alias ls="exa -l"
alias la="exa -la"

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

# }}}

# Dircolors
test -r ~/.dircolors/dircolors && eval $(dircolors ~/.dircolors/dircolors)