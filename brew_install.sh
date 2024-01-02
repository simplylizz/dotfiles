#!/bin/sh

set -eo pipefail

# More cli tools to check:
# https://devzen.ru/episode-0312/
brew install \
    dive \
    exa \
    fd \
    fzf \
    git \
    git-gui \
    go \
    htop \
    jump \
    mdcat \
    rg \
    telnet \
    neovim \
    watch \
    fish \

# otherwise ctrl+r won't work
$(brew --prefix)/opt/fzf/install

if [ grep 'homebrew' ~/.config/fish/config.fish ]; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' > ~/.config/fish/config.fish_new
  cat  ~/.config/fish/config.fish >> ~/.config/fish/config.fish_new
  mv ~/.config/fish/config.fish{_new,}
fi

if status is-interactive
  jump shell fish | source
end

sudo echo $(which fish) >> /etc/shells
chsh -s $(which fish)
