#!/bin/sh

set -eo pipefail

# TODO: add backups

./brew_install.sh

files=(
  .gitconfig
  .gitignore_global
  .vimrc
  #.zshrc
  #.zshrc.custom
  .ripgreprc
)
path=`pwd`
for f in "${files[@]}"; do
  ln -svF "$path/$f" "$HOME/$f"
done

mkdir -p ~/.vim/autoload
ln -svF $path/.vim/autoload/pathogen.vim ~/.vim/autoload/
[[ -d ~/.vim/bundle/vundle ]] || git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle

#[[ -d ~/.oh-my-zsh ]] || git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

vim +BundleInstall +qall

ln -sfv $path/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

mkdir -p ~/.ssh
ln -sfv $path/.ssh/config ~/.ssh/

# Install configs from dot_config
mkdir -p ~/.config
find $path/dot_config -type f | while read config_file; do
  # Get relative path from dot_config/
  rel_path="${config_file#$path/dot_config/}"
  target="$HOME/.config/$rel_path"
  target_dir=$(dirname "$target")

  # Create parent directory if needed
  mkdir -p "$target_dir"

  # Symlink the file
  ln -sfv "$config_file" "$target"
done

#git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
