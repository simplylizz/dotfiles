#!/bin/sh

set -eo pipefail

# More cli tools to check:
# https://devzen.ru/episode-0312/
brew install \
    dive \
    eza \
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
    jq \
    jless \
    gemini-cli \
    ccusage \

brew install --cask \
    claude-code \
    codex \

# otherwise ctrl+r won't work
$(brew --prefix)/opt/fzf/install

# Fish configs are installed via install.sh from dot_config/fish/
# Set fish as default shell
if ! grep -q fish /etc/shells; then
  echo "$(which fish)" | sudo tee -a /etc/shells
  chsh -s $(which fish)
fi
