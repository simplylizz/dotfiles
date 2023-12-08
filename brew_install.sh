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

# otherwise ctrl+r won't work
$(brew --prefix)/opt/fzf/install
