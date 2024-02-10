#!/bin/bash

brew update 

# ask if brew should be upgraded
read -p "Do you want to upgrade existing brew packages? (y/n) " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Upgrading brew"
    brew upgrade
else
    echo "Skipping brew upgrade"
fi

brew install stow
brew install logseq
brew install fzf
brew install arc
brew install bat
brew install istat-menus
brew install docker
brew install docker-compose
brew install alfred
brew install trash
brew install tree
brew install yt-dlp
brew install whatsapp
brew install alt-tab
brew install alacritty
brew install tmux
brew install zsh-syntax-highlighting
brew install zsh-you-should-use
brew install zsh-autosuggestions
