#!/bin/bash

# Comparing dottet version numbers
# see: http://bkhome.org/blog/?viewDetailed=02199


# Remote cherry pick
# git --git-dir=../<some_other_repo>/.git format-patch -k -1 --stdout <commit SHA> | git am -3 -k

alias gd="git diff"
alias gdsm="git diff --stat origin/master"
alias gst="git status"
alias gf="git fetch"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias grb="git fetch && git rebase origin/master"


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias la='ls -A'
alias ll='ls -l'
alias l='ls -CF'
alias less='/usr/bin/less -O/dev/null'

alias ..="cd .."
alias ...="..;.."
alias ....="...;.."
alias .....="....;.."


function wiki() {
    dig +short txt $1.wp.dg.cx
}

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
    _IFS_OLD=$IFS

    # newline
    IFS="
"

    for line in `cat ~/.ssh/hostnames`; do
        IFS=" "
        fields=($line)
        hostname=${fields[0]}
        ipv4=${fields[1]}
        alias $hostname="ssh $ipv4"
    done
    IFS=$_IFS_OLD
fi

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
