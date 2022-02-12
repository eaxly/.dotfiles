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

# fzf
if command -v fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND="fd --hidden"
else
    echo "Install fd for better and faster search"
    export FZF_DEFAULT_COMMAND="find ."
fi
export FZF_DEFAULT_OPTS="--preview 'bat --color=always --number {} '"

export YTFZF_EXTMENU=" rofi -show drun -dmenu --width=1500"

source $HOME/.private_profile
