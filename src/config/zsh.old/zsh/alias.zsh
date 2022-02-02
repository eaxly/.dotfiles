# Zsh: aliases
# ls
alias ls="exa --icons --group-directories-first --long --git --header"
alias lT="exa --icons --group-directories-first --tree --git --header"
alias ll="exa --icons --group-directories-first --long --all --git --header"
alias la="exa --icons --group-directories-first --long --all --git --header"
# nvim
alias v="nvim"
alias vv="vim"
# mkdir cp etc
alias md="mkdir -p"
alias cp="cp -r"
# theF*ck
alias f="fuck"
# needed for thef*ck
eval $(thefuck --alias)
# python
alias py3="python3"
# cd
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
# paru
alias pain="paru -S"
alias pase="paru -Ss"
alias painfo="paru -Si"
alias pare="paru -R"
alias parem="paru -Rns"
alias paina="paru -S --aur"
# caffeine-install
alias cafin="paru -S --sudoloop --noconfirm"
# cargo
alias cr="cargo"
alias crr="cargo run"
alias crb="cargo build"
alias crn="cargo new --vcs=git"
alias crnn="cargo new --vcs=none"
alias crnl="cargo new --lib"
alias cri="cargo init"
# xinput
alias disintkey="xinput disable AT\ Translated\ Set\ 2\ keyboard"
alias enintkey="xinput enable AT\ Translated\ Set\ 2\ keyboard"
# bat
alias bat="bat"
# vscode
alias vsc="code --reuse-window"
# todoist
alias todoist="todoist --color --indent"
# task
alias t="task"
# lazygit
alias lzg="lazygit"
# neofetch
alias neo="neofetch"
# kitty
alias icat="kitty +kitten icat"
