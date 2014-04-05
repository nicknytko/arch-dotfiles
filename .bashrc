#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#PS1='[\u@\h \W]\$ '
export PS1="\W \[$(tput bold)\]\[$(tput setaf 1)\]>\[$(tput setaf 6)\]>\[$(tput setaf 3)\]> \[$(tput setaf 5)\]\[$(tput sgr0)\]"

export PATH=$PATH:/home/nick/Android-SDK/platform-tools:/home/nick/Bin
export EDITOR=emacs

alias hc=herbstclient
alias git-force-pull="git fetch --all && git reset --hard origin/master"
