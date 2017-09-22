#!/bin/bash

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoreboth

if [ -e $HOME/opt/idea ]; then
    IDEA_HOME=$HOME/opt/idea
    alias idea=$IDEA_HOME/bin/idea.sh
    PATH=$PATH:$SCALA_HOME/bin
fi
export EDITOR=vim

export GOPATH=~/Projekte/go
if [ -d $GOPATH ]; then
    export PATH=$PATH:$GOPATH/bin
    mkdir -p $GOPATH
fi

if [ -d $HOME/.local/bin ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"


export WORKON_HOME=~/Projekte
mkdir -p $WORKON_HOME
WRAPPER=`which virtualenvwrapper.sh`
if [ -e $WRAPPER ]; then
    source $WRAPPER
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
