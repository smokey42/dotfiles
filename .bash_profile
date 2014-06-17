# ~/.bash_profile: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

for file in ~/bash/*.sh; do
    source $file
done
