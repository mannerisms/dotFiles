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

NEW_FILE=$(pwd)"/tmux.conf"
OLD_FILE="$HOME/.tmux.conf"

# delete existing vimrc
if [[ -e $OLD_FILE ]]; then
    rm $OLD_FILE
fi

# create symbolic link to current location
ln -s $NEW_FILE $OLD_FILE

echo "Tmux sucesfully updated"
exit 0
