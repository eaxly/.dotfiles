# ALIASES
# git
alias ga="git add"
alias gl="git pull"
alias gp="git push"
alias gf="git fetch"
alias gst="git status"
alias gc="git commit"
alias gco="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gr="git restore"
alias grs="git restore --staged"

# [ n ]vim
alias v="nvim"
alias vv="vim"
alias vd="nvim --noplugin"
alias vup="nvim --headless -c 'autocmd User PackerComplete qall' -c 'PackerSync'"

# ls
alias ls="ls --color=auto --group-directories-first"
alias ll="ls -l --color=auto"
alias la="ls -lA --color=auto"

# paru
alias pasy="paru -S"
alias pare="paru -R"
alias paren="paru -Rn"
alias pare="paru -Rns"
alias pase="paru -Ss"
alias cafin="paru -S --sudoloop"
alias cafino="paru -S --sudoloop --noconfirm"
alias sysup="paru -Syu --sudoloop"
alias sysupno="paru -Syu --sudoloop --noconfirm"

# pacman
alias pacin="sudo pacman -S"
alias pacre="sudo pacman -R"
alias pacren="sudo pacman -Rn"
alias pacrem="sudo pacman -Rns"
alias pacreps="pacman -Ss"

# av aliases
alias checkrootkits="sudo rkhunter --update; sudo rkhunter --propupd; sudo rkhunter --sk --check"
alias checkvirus="clamscan --recursive=yes --infected /home"
alias updateantivirus="sudo freshclam"

# misc
alias bomb="bombadil link -psway"
alias ma="macchina"
alias lzg="lazygit"
alias ncm="ncmpcpp"
alias jrnl=" jrnl"
alias py3="python3"
alias plz="sudo"
alias pingtest="ping -c3 eax.is-a.dev"
alias pyserve="python3 -m http.server -b 127.0.0.1 8000"
