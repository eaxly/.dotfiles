# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=2000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/samuel/.zshrc'
fpath+=~/.zfunc

autoload -Uz compinit
compinit
# End of lines added by compinstall


# === I demand to see your Manager! Lol ==>
export ZSH="$HOME/.local/share/sheldon/repos/github.com/ohmyzsh/ohmyzsh"
eval "$(sheldon source)"

# === VARIABLES ===

# Editor Definition
export EDITOR=nvim

# Pager
export PAGER="nvim -c 'set ft=man' -"

# sudoeditor
export SUDO_EDITOR=$EDITOR
# Auto ls-commands
# === FUNCTIONS ===

auto-ls-custom_function () {
  ls --color=always
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
# === COMPLETIONS ===

# === ALIASES ===
alias zshsrc="source ~/.zshrc"
alias zshconf="$EDITOR ~/.zshrc"

# nvim
alias vim="nvim"
alias v="nvim"
alias nvimconf="$EDITOR ~/.config/nvim/init.vim"
alias starconf="$EDITOR ~/.config/starship.toml"

alias speedby="speed-test -b"

# Pyton
alias py3="python3"
alias cvenv="virtualenv -p python3 venv"
alias srcenv="source venv/bin/activate"

alias yodl="youtube-dl"
alias ..="cd .."
alias ipy="ipython3"
alias flowconf="sudo -e /etc/systemd/user/flowy.service"

# paru
alias pain="paru -S"
alias pare="paru -R"
alias parem="paru -Rns"
alias pase="paru -Ss"

# exa (ls)
alias l1="exa -1"
alias lss="exa"
alias ls="exa -la"
alias la="exa -a"

# For debian systems
# alias bat="batcat"
# alias alien="alien-update"
# alias fd="fdfind"
# ===================================================================== END
sha256() {
    echo "$1 $2" | sha256sum --check
}

# COMPLETIONS
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


alias ls="ls --color=always"
# Nord Dir Colors
test -r ~/.dircolors/dircolors && eval $(dircolors ~/.dircolors/dircolors)
