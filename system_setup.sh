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

# Check if argument exists
if [[ "$1" -gt "-1" ]]; then
    FILES="$@"
else
    FILES=("gitignore" "bash_profile" "zshrc" "vim" "bashrc" "tmux.conf" "vimrc")
fi

# Remove all existing dotfiles
for FILE in ${FILES[@]}; do
    OLDFILE="$HOME/.$FILE"
    if [[ -e $OLDFILE ]]; then
        echo "removing $OLDFILE"
        rm -rf $OLDFILE
    fi
    # Create symlink from file to new file
    NEWFILE=$(pwd)"/$FILE"
    echo "replacing $NEWFILE"
    ln -s $NEWFILE $OLDFILE
done

echo "Changes sucessfully applied"
exit 0
