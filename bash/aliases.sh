#!/bin/bash

alias click="cd $GOPATH/src/github.com/stylight-clickouts/clickouts"
alias pup="cd ~/puppet-configs"
alias dev="workon core; cd src/stylight/"
alias doc="workon core; cd docs/"
alias grb='git fetch && git rebase origin/master'

# Comparing dottet version numbers
# see: http://bkhome.org/blog/?viewDetailed=02199

alias gd="git diff"
alias gdsm="git diff --stat origin/master"
alias gst="git status"
alias gf="git fetch"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"
alias grb="git fetch && git rebase origin/master"


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
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