#!/bin/zsh
source $ZSH/oh-my-zsh.sh

# PATH
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin"

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set vim as the default editor
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR

# switch caps and escape permanently
if [[ -f /usr/bin/setxbmap ]]; then
    setxkbmap -option caps:escape
fi

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -r . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# ALIASES
# Use vim for editing config files
alias zshconfig="vim ~/.zshrc"
alias envconfig="vim ~/.env.sh"

alias g="git "
alias gc="git commit -am "
alias gs="git status"

# open multiple files in vim as tabs
alias vim="vim -p"

# set python path
alias python=/usr/local/bin/python3

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
alias pip=/usr/local/bin/pip3
