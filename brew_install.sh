#!/bin/sh

set -eo pipefail

# Hmm, it even has iterm2. Should I install it through it though?
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
    vim \
    watch \

# otherwise ctrl+r won't work
$(brew --prefix)/opt/fzf/install
