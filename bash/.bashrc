# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

function mkalias () {
  alias "$*";
  echo alias "$*" >> ~/.bash_aliases
}

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# make nala and apt interchangeable
apt() {
  command nala "$@"
}
sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}

# Set XDG_RUNTIME_DIR
export XDG_RUNTIME_DIR=/run/user/$(id -u)

# Export to support all
export PATH="/home/weiberle/.local/bin:$PATH"
export LC_ALL=en_DK.utf8
export LANG=en_DK.utf8

# Zoxide setup
export _ZO_EXCLUDE_DIRS=/*/:$HOME/.*:/etc/*:$HOME/Downloads/:$HOME/personal/*/*:$HOME/work/*/*
eval "$(zoxide init bash --cmd j)"

# exa color setup
export EXA_COLORS="ur=37:uw=37:gr=37:gw=37:tr=37:tw=37:sn=37:uu=32:un=33:da=37"

# Cargo Setup
. "$HOME/.cargo/env"

# Go Setup
export PATH=$PATH:/usr/local/go/bin

# Starship setup
eval "$(starship init bash)"

# Allow spelling mistakes
shopt -s cdspell

# Fzf setup
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--margin=5% --padding=2% --border"

# Auto start tmux
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
  tmux attach -t Default || tmux >/dev/null 2>&1
fi

# Run neofetch on startup
# neofetch
