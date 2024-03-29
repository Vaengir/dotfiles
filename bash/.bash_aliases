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
alias uni="ssh wi21139@login.dhbw-stuttgart.de"
alias c="clear"
alias rwlan="sudo systemctl restart NetworkManager"
alias taskManager="htop"
alias addWifi="sudo nmcli --ask device wifi connect"
format() {
  find "$1" -name "*.tex" | xargs latexindent -s -wd
}

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

# Get current battery charge
alias bat="cat /sys/class/power_supply/BAT1/capacity"

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

# Xampp Shortcuts
alias xamppControl="sudo /opt/lampp/lampp"
alias xamppManage="cd /opt/lampp; sudo ./manager-linux-x64.run; cd"
alias xamppLogs="cat /opt/lampp/logs/php_error_log"

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

# Check for latest releases
latest_release() {
  git ls-remote --refs --sort="version:refname" --tags https://github.com/$@ | cut -d/ -f3-|tail -n1
}
