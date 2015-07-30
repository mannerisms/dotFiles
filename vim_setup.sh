#!/bin/bash
#===============================================================================
# File: vim_setup.sh
# Date Created: 2015-07-30
# Description:  2015-07-30
# 
#===============================================================================
# Exit Codes:
# 0) Succesful completetion
#===============================================================================

NEW_FILE=$(pwd)"/vimrc"
NEW_FOLDER=$(pwd)"/vim"
OLD_FILE="$HOME/.vimrc"
OLD_FOLDER="$HOME/.vim"

# delete existing vimrc
if [[ -e $OLD_FILE ]]; then
    rm $OLD_FILE
fi

# delete existing vim folder
if [[ -e $OLD_FOLDER ]]; then
    rm -r $OLD_FOLDER
fi

# create symbolic link to current location
ln -s $NEW_FOLDER $OLD_FOLDER

echo "Vim sucesfully installed"
exit 0