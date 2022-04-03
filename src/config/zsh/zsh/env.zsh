# ENV
# path
export PATH="$PATH:$HOME/.local/bin:$HOME/.dotfiles/bin/bin:$HOME/.cargo/bin"
typeset -U PATH path

# npm
export npm_config_prefix="$HOME/.local"

# editors
export EDITOR="nvim"
export VISUAL="nvim"
export SUDO_EDITOR=$EDITOR

# the manpager
export MANPAGER='nvim +Man!'
export DIFFPROG='nvim -d'

# fzf
export FZF_DEFAULT_COMMAND="fd --hidden"
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --number {} '"

export YTFZF_EXTMENU=" rofi -show drun -dmenu --width=1500"

source $HOME/.private_profile
