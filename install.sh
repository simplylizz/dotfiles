#!/bin/sh

# TODO: add backups
cp -rf .vimrc .vim .zshrc .gitconfig ~/ && vim +BundleInstall +qall
