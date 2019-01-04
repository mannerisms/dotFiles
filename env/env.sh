#!/bin/zsh
source $ZSH/oh-my-zsh.sh

# PATH
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/usr/local/mysql/bin"
# export PYTHONPATH=$PYTHONPATH
# export MANPATH="/usr/local/man:$MANPATH"

# Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# In linux use xcape to set CAPS to CTRL if held
if [[ -r /usr/bin/xcape ]]; then
   sh /usr/bin/xcape -e '#67=Escape' -t 101
fi

# Set vim as the default editor
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR

# Check for presence of virtualenvwrapper and source if available
if [[ -r /usr/local/bin/virtualenvwrapper.sh ]]; then
    source /usr/local/bin/virtualenvwrapper.sh
    # Virtual Environment
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Development
    export PIP_RESPECT_VIRTUALENV=true
    # ensure all new environments are isolated from the site-packages directory
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
fi

# FileSearch
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

#mkdir and cd
function mkcd() { mkdir -p "$@" && cd "$_"; }

# ALIASES
# Use sublimetext for editing config files
alias zshconfig="vim ~/.zshrc"
alias envconfig="vim ~/.env.sh"
alias g="git "

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"