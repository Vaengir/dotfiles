# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
  *i*) ;;
  *) return;;
esac

# --- History ---
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=20000
HISTFILE="$XDG_STATE_HOME/bash/history"

# --- Shell options ---
shopt -s checkwinsize
shopt -s cdspell

# --- Colors ---
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
fi
export EXA_COLORS="ur=37:uw=37:gr=37:gw=37:tr=37:tw=37:sn=37:uu=32:un=33:da=37"

# --- Aliases ---
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'

function mkalias () {
  alias "$*";
  echo alias "$*" >> ~/.bash_aliases
}

# --- Completion ---
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
[ -f /usr/share/git/completion/git-completion.bash ] && . /usr/share/git/completion/git-completion.bash

# --- Make nala and apt interchangeable ---
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

# --- Environment ---
export LANG=en_DK.utf8
export FZF_DEFAULT_OPTS="--margin=5% --padding=2% --border"
export XDG_RUNTIME_DIR="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}"

# --- Rost Sessionizer (exports must come before the startup call) ---
export DEFAULT_SESSION=Default
SESSIONIZER_PATHS=""
for p in  vaengir \
          vaengir/rost_sessionizer \
          vaengir/rigit \
          vaengir/dotfiles \
          vaengir/Neovim \
          vaengir/Scripts \
          vaengir/AwesomeWM \
          vaengir/CLearn \
          vaengir/quicker.nvim \
          vaengir/raddebugger \
          vaengir/rost_interpreter \
          vaengir/symbols-outline.nvim \
          vaengir/tatr \
          vaengir/zig_compiler \
          vaengir/ZigLearn \
          personal/sja \
          personal/Bachelor_Latex \
          Documents \
          Downloads; do
  SESSIONIZER_PATHS+="$HOME/$p/:"
done
export SESSIONIZER_PATHS="${SESSIONIZER_PATHS%:}"

# --- Prompt and tools ---
eval "$(starship init bash)"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
eval "$(zoxide init bash --cmd j)"

# --- Auto start tmux (last, so everything above is inherited) ---
sessionizer="$HOME/vaengir/rost_sessionizer/main/target/release/rost_sessionizer"
if command -v tmux >/dev/null && [ -z "${TMUX}" ] && [ -x "$sessionizer" ]; then
  "$sessionizer" startup
fi
unset sessionizer
