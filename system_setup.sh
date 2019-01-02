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

# Check which system is running and copy appropriate files
if [ "$(uname)" == "Darwin" ]; then
    FILES=("bash_profile" "bashrc" "env.sh" "slate" "slate.js" "tmux.conf" "vimrc" "zshrc" "config")
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    FILES=("bash_profile" "bashrc" "env.sh" "tmux.conf" "vimrc" "zshrc" "config")
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
