# zsh-you-should-use
export YSU_MESSAGE_POSITION="before"
export YSU_MODE=ALL
export YSU_MESSAGE_FORMAT=$(tput bold)"$(tput setaf 1)You stoopid forgot that there is an $(tput setaf 3)%alias_type$(tput setaf 9) for $(tput setaf 3)%command$(tput setaf 9). It is $(tput setaf 3)%alias$(tput setaf 9)$(tput sgr0)"

# zsh auto ls functions
auto-ls-custom_function() {
  if [ ! -d .git ]; then
    exa --icons --group-directories-first --long --header
  else
    git status
    exa --icons --group-directories-first --long --all --git --header
  fi
}

AUTO_LS_COMMANDS=(custom_function)
