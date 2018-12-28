export PATH=/usr/local/bin:$PATH

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

# Setting up tmux to run in full colour
alias tmux="tmux -2"

if [[ "$(expr substr $(uname -s) 1 5)" == "Linux" ]]; then
    # Set CAPS as CTRL when held
    /usr/bin/setxkbmap -option 'caps:ctrl_modifier'
fi
