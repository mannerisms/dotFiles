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
if [[ "$#" -ne 0 ]]; then
    FILES="$@"
    echo ${FILES[@]}
else
    FILES=("bash_profile" "bashrc" "env.sh" "gitconfig" "gitignore" "slate" "slate.js" "system_setup.sh" "tmux.conf" "vim" "vimrc" "zshrc")
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
