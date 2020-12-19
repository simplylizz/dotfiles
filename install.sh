#!/bin/sh

# TODO: add backups
# TODO: make links, not copy
git submodule update --init --recursive
cp -rf .vimrc .vim .zshrc* .oh-my-zsh .gitconfig .gitignore_global .config ~/
vim +BundleInstall +qall
