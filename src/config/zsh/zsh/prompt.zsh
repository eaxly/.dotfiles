# PROMPT
ICO_DIRTY="+"
ICO_BRANCH=""
ICO_AHEAD="⭡"
ICO_BEHIND="⭣"
ICO_DIVERGED="⭥"
PROMPT_STYLE='funcky'

_urlencode() {
	local length="${#1}"
	for (( i = 0; i < length; i++ )); do
		local c="${1:$i:1}"
		case $c in
			%) printf '%%%02X' "'$c" ;;
			*) printf "%s" "$c" ;;
		esac
	done
}

osc7_cwd() {
	printf '\e]7;file://%s%s\e\\' "$HOSTNAME" "$(_urlencode "$PWD")"
}

autoload -Uz add-zsh-hook
add-zsh-hook -Uz chpwd osc7_cwd

fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)

typeset -ga chpwd_functions
setopt PROMPT_SUBST

chpwd_functions+=('chpwd_auto_cd')

GIT_PROMPT() {
    is_git=$(git rev-parse --is-inside-work-tree 2> /dev/null)
    if [ $is_git ]; then
        branch="$ICO_BRANCH $(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
        dirty="" &&  [[ $(git diff --shortstat | tail -n1) != "" ]] && dirty="$ICO_DIRTY"
        stat="$(git status | sed -n 2p)"
        case "$stat" in
            *ahead*)
                stat=" $ICO_AHEAD"
                ;;
            *behind*)
                stat=" $ICO_BEHIND"
                ;;
            *diverged*)
                stat=" $ICO_DIVERGED"
                ;;
            *)
                stat=""
                ;;
        esac
        print "%B%F{yellow}$dirty$stat %F{red}$branch%f%b"
    fi
}

case $PROMPT_STYLE in
"shade")
PROMPT='%F{magenta}▓▒░%f '
RPROMPT='$(GIT_PROMPT)%F{yellow}░▒▓%f'
;;
"funcky")
PROMPT='%F{magenta}%~%f%f %F{11}  %f'
RPROMPT='$(GIT_PROMPT)%f'
;;
*)
PROMPT='%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# '
RPROMPT='$(GIT_PROMPT) [%F{11}%?%f]'
;;
esac
