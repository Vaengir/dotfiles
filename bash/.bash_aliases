# Permanent aliases

# List aliases
alias ls="exa --icons --group-directories-first --sort=type --no-permissions --octal-permissions -B"
alias ll="ls -l --color=auto --group-directories-first"
alias la="ll -a"

# Shortcuts for ease of use
alias vim="nvim"
alias vi="vim"
alias v="vi"
alias s="sudo shutdown now"
alias taskManager="htop"

# Directory aliases
alias home="cd ~"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

# Go to old Directory
alias ld='cd -'

# mkdir alias
alias mkdir="mkdir -p"

# Tmux Shortcuts
alias ta="tmux at"
alias td="tmux detach"
alias tl="tmux ls"
alias tks="tmux kill-server"

# Streamlink Shortcut
strlnk() {
  streamlink -p mpv "$1" best
}

twstrlnk() {
  streamlink -p mpv --twitch-disable-ads https://www.twitch.tv/$1 best
}

# Show command line history
alias h="history | grep"

# Some git functions
alias gs="git status -sb"
alias gd="git diff"
alias gp="git push"
alias gsu="git submodule update --remote"
gcom() {
  git add "$1"
  git commit -m "$2"
}
gcoma() {
  git add .
  git commit -m "$1"
}
lazyg() {
  git add .
  git commit -m "$1"
  git push
}

# mkdircd function
mkdircd() {
  mkdir -p "$@" && eval cd "\"\$$#\"";
}
