#!/bin/bash

# Needs ncurses-term under Ubuntu
export TERM=xterm-256color

if [ -f ~/bin/python-startup.py ]; then
    export PYTHONSTARTUP=~/bin/python-startup.py
    alias dev="source /var/www/dev/environment/bin/activate; cd /var/www/dev/repo"
fi

alias gst="git status"
alias grb="git fetch && git rebase origin/master"
alias gf="git fetch"
