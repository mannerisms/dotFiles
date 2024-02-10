#!/bin/bash

apt-get update

# ask if apt should be upgraded
read -p "Do you want to upgrade existing apt packages? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Upgrading apt"
    apt-get upgrade
else
    echo "Skipping apt upgrade"
fi

apt-get install -y tree
apt-get install -y yt-dlp
apt-get install -y nvm
apt-get install -y bat
apt-get install -y stow
apt-get install -y trash
apt-get install -y fzf

# ask user if they want to install -y zsh
read -p "Do you want to install zsh? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing zsh"
    apt-get install -y zsh
    apt-get install -y zsh-syntax-highlighting
    apt-get install -y zsh-autosuggestions
    apt-get install -y zsh-you-should-use
    sudo chsh -s $(which zsh)
else
    echo "Skipping zsh installation"
fi