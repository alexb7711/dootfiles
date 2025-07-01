#!/bin/sh

# Update PATH
[ -d "$HOME/.local/bin" ] && \
        SCRIPT_DIR=$(find -L $HOME/.local/bin -name ".git" -prune -o -type d -print) && \
        export PATH="$PATH:${SCRIPT_DIR//$'\n'/:}" 
PATH=$PATH:$HOME/.local/bin

# Default Programs
export BROWSER="brave"
export EDITOR="vim"
export LANG="en_US.UTF-8"
export PDF_READER="zathura"
export QT_QPA_PLATFORMTHEME=qt5ct
export TERMINAL="st"
export VIFMRC="~/.config/vifm/vifmrc"
export SUDO_ASKPASS="$HOME/code/scripts/dmenu/dmenupass"

# ~/ Clean Up

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

export XINITRC="$XDG_CONFIG_HOME/x11/xinitrc"

[ -d "$XDG_CONFIG_HOME/x11" ] && mkdir -p "$XDG_CONFIG_HOME/x11"
export XAUTHORITY="$XDG_CONFIG_HOME/x11/xauthority"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
# export CUDA_CACHE_PATH="$HOME/.cache/nv"
# export GNUPGHOME="$XDG_DATA_HOME/.gnupg"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch/notmuchrc"
export NPM_CONFIG_USERCONFIG="$HOME/.config/npm/npmrc"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export RUSTUP_HOME="$HOME/.local/share/rustup"
export SSB_HOME="$XDG_DATA_HOME/zoom"
export TERMINFO="$XDG_DATA_HOME/terminfo"
export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo:/usr/share/terminfo"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"

export LESSHISTFILE="-"

export _JAVA_AWT_WM_NONREPARENTING=1 # <-- So matlab will load
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot=$HOME/.config/java

# Execute X if it is not running
[ -n $DISPLAY ] && startx ${XINITRC}
