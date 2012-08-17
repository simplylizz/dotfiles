#!/bin/sh

# lxde things
sudo apt-get install lxde openbox lxtasks gmrun

# TODO: add backups
cp -rf .vimrc .vim .zshrc .gitconfig .config ~/
vim +BundleInstall +qall
