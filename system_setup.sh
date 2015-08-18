#!/bin/bash
#===============================================================================
# File: vim_setup.sh
# Date Created: 2015-07-30
# Description:  Setup OSX to include all the dot files
#
#===============================================================================
# Exit Codes:
# 0) Succesful completetion
#===============================================================================

FILES=("bash_profile" "vim" "bashrc" "slate" "tmux.conf" "vimrc")

# Remove all existing dotfiles
for FILE in ${FILES[@]}; do
    OLDFILE="$HOME/.$FILE"
    if [[ -e $OLDFILE ]]; then
        echo "removing $OLDFILE"
        rm -r $OLDFILE
    fi
    # Create symlink from file to new file
    NEWFILE=$(pwd)"/$FILE"
    echo "replacing $NEWFILE"
    ln -s $NEWFILE $OLDFILE
done

source ~/.basrc
tmux source-file ~/.tmux.conf

echo "Changes sucessfully applied"
exit 0
