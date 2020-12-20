#!/bin/sh

set -eo pipefail

# TODO: add backups

./brew_install.sh

files=(
  .config
  .gitconfig
  .gitignore_global
  .vimrc
  .zshrc
  .zshrc.custom
)
path=`pwd`
for f in "${files[@]}"; do
  ln -svF $path/$f ~/
done

mkdir -p ~/.vim/autoload
ln -svF $path/.vim/autoload/pathogen.vim ~/.vim/autoload/
[[ -d ~/.vim/bundle/vundle ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle

[[ -d ~/.oh-my-zsh ]] || git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

vim +BundleInstall +qall

ln -sfv $path/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

mkdir -p ~/.ssh
ln -sfv $path/.ssh/config ~/.ssh/
