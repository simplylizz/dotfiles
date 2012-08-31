#!/bin/sh

# TODO: add backups
# TODO: make links, not copy
cp -rf .vimrc .vim .zshrc .gitconfig .config ~/
vim +BundleInstall +qall
