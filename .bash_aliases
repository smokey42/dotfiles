#!/bin/bash

git_version_string=`git --version`
# remove everything except the version number
GIT_VERSION=${git_version_string##* }

# Needs ncurses-term under Ubuntu
export TERM=xterm-256color

if [ -f ~/bin/python-startup.py ]; then
    export PYTHONSTARTUP=~/bin/python-startup.py
    if [ -d /var/www/dev/repo ]; then
        alias dev="source /var/www/dev/environment/bin/activate; cd /var/www/dev/repo"
    fi
    if [ -d /var/www/production/releases ]; then
        alias prod="source /var/www/production/environment/bin/activate; cd /var/www/production/releases/current"
    fi
fi

# Comparing dottet version numbers
# see: http://bkhome.org/blog/?viewDetailed=02199

# ignore-submodules introduced in git 1.7.2
if [ $GIT_VERSION = `echo -e "1.7.2\n$GIT_VERSION"|sort -t '.' -g|tail -n 1` ]; then
    alias gst="git status --ignore-submodules=dirty"
else
    alias gst="git status"
fi

alias grb="git fetch && git rebase origin/master"
alias gf="git fetch"

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

alias ..="cd .."
alias ...="..;.."
alias ....="...;.."
