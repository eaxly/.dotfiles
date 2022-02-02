# init
# export ZSH
export ZSH="$HOME/.local/share/sheldon/repos/github.com/ohmyzsh/ohmyzsh"
# Init sheldon
eval "$(sheldon source)"

# Init starship
eval "$(starship init zsh)"

# source private stuff
if [ ! -f $HOME/.private_profile ]; then; echo "No private profile found"; else; source $HOME/.private_profile; fi;
