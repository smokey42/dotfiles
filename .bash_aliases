#!/bin/bash

c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch() {
    if git rev-parse --git-dir >/dev/null 2>&1
    then
            gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
            if git diff --ignore-submodules=dirty --exit-code --quiet 2>/dev/null >&2
            then
                if git diff --ignore-submodules=dirty --exit-code --cached --quiet 2>/dev/null >&2
                then
                    gitver=${c_green}$gitver${c_sgr0}
                else
                    gitver=${c_cyan}'!'$gitver${c_sgr0}
                fi
            else
                    gitver=${c_red}'!'$gitver${c_sgr0}
            fi
    else
            return 0
    fi
    echo " $gitver"
}

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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$(parse_git_branch)\$ "

# Taken from .bashrc
# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# Make some convenient shortcuts for sshing into certain servers
#
# Format of .ssh/hostnames is
#
#   hostname1  127.0.0.1
#   hostname2  127.0.1.0
#   hostname3  127.0.1.1
#   hostname4  127.1.0.0
#
# and so on

if [ -f ~/.ssh/hostnames ]; then

    # IFS = Newline
    IFS="
"

    for line in `cat ~/.ssh/hostnames`; do
        IFS=" "
        fields=($line)
        hostname=${fields[0]}
        ipv4=${fields[1]}
        alias $hostname="ssh $ipv4"
    done

fi
