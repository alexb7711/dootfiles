#!/bin/zsh
#===============================================#
#   Alex's config for the Zoomer Shell          #
#  _________  _   _ ____   ____                 #
# |__  / ___|| | | |  _ \ / ___|                #
#   / /\___ \| |_| | |_) | |                    #
#  / /_ ___) |  _  |  _ <| |___                 #
# /____|____/|_| |_|_| \_\\____|                #
#===============================================#

#===============================================================================#
# ZSH CONFIGURATION
#===============================================================================#
setopt autocd                                                                   # Auto CD
setopt autopushd                                                                # Auto pushd
bindkey -e                                                                      # Emacs Keys

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="${HOME}/.cache/zsh/history"
setopt inc_append_history

#===============================================================================#
# FILES TO SOURCE
#===============================================================================#
[ -e "$HOME/.config/zsh/aliasrc" ]           && source "$HOME/.config/zsh/aliasrc"
[ -e "$HOME/.config/zsh/work_cfg" ]          && source "$HOME/.config/zsh/work_cfg"

#===============================================================================#
# Prompt
#===============================================================================#
function precmd()
{
    export PROMPT=$'$fg[green]%B[%@ ]%b : %U$fg[cyan]${HOST}@%d%u$fg[white] \n❯ '
}

# Enable colors and change prompt:
autoload -U colors && colors
autoload -Uz vcs_info

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats "(%b)"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
fpath=(~/.config/zsh/zfunc $fpath)
compinit
_comp_options+=(globdots)		# Include hidden files.

#===============================================================================#
# FUNCTIONS
#===============================================================================#

##------------------------------------------------------------------------------
# Jump to previously accessed directory
cdh()
{
    val=""
    dirs -v
    vared -p "Enter number: " -c val
    pushd "+${val}"
}

##------------------------------------------------------------------------------
# Run `ls` after every cd
chpwd() { ls -l --color=auto }

#===============================================================================#
# PALEOFETCH
#===============================================================================#
[ ! -z $(command -v paleofetch) ] && paleofetch

#===============================================================================#
# PLUGGINS
# - Should be Last
#===============================================================================#

autoload -Uz zmv

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
