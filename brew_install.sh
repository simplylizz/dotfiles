#!/bin/sh

set -eo pipefail

# More cli tools to check:
# https://devzen.ru/episode-0312/
brew install \
    ccusage \
    dive \
    eza \
    fd \
    fish \
    fzf \
    gemini-cli \
    gh \
    git \
    git-gui \
    go \
    htop \
    jless \
    jq \
    jump \
    mdcat \
    neovim \
    pre-commit \
    rg \
    telnet \
    uv \
    watch \

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
