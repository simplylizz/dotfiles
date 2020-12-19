#!/bin/sh

set -eo pipefail

# TODO: add backups
# TODO: make links, not copy
git submodule update --init --recursive
cp -rf .vimrc .vim .zshrc* .oh-my-zsh .gitconfig .gitignore_global .config ~/
vim +BundleInstall +qall

ln -s com.googlecode.iterm2.plist  $HOME/Library/Preferences/com.googlecode.iterm2.plist
