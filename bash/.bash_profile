# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# --- XDG base directories ---
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"

# --- Relocated program directories ---
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME/npm"
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config"

# SSH Auth
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# --- PATH setup (must come before .bashrc, which starts tmux) ---
# user's private bin directories, if they exist
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# --- Cargo ---
if [ -d "$CARGO_HOME/bin" ]; then
    PATH="$PATH:$CARGO_HOME/bin"
fi

# --- Emacs ---
if [ -d "$XDG_CONFIG_HOME/emacs/bin" ]; then
    PATH="$PATH:$XDG_CONFIG_HOME/emacs/bin"
fi

export PATH

# --- Include .bashrc for interactive bash login shells ---
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
