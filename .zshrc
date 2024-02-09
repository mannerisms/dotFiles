export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Default PATH
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Homebrew to PATH
export PATH="/opt/homebrew/bin:$PATH"

# Set vim as the default editor
VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR=vim

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
source $HOME/.zsh/aliases.zsh

# open multiple files in vim as tabs
alias vim="vim -p"

eval 
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_ALIAS=fuck;
                export TF_SHELL_ALIASES=$(alias);
                export TF_HISTORY="$(fc -ln -10)";
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

bindkey '\t' menu-select "$terminfo[kcbt]" menu-select
bindkey -M menuselect '\t' menu-complete "$terminfo[kcbt]" reverse-menu-complete

eval "$(starship init zsh)"
