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

brew install --cask \
    claude-code \
    codex \

# otherwise ctrl+r won't work
$(brew --prefix)/opt/fzf/install

fconfig="$HOME/.config/fish/config.fish"

if ! grep -q 'homebrew' "$fconfig"; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
  jump shell fish | source
end

export PATH="$PATH:$HOME/go/bin:$HOME/.docker/bin"
export ENV_TYPE=dev
' > "$fconfig"
fi

fpath="$HOME/.config/fish/functions"

echo 'function g --wraps=git --description '\''alias g=git'\''
  git $argv; 
end' > "$fpath/g.fish"

echo 'function k --wraps=kubectl --description '\''alias k=kubectl'\''
  kubectl $argv; 
end' > "$fpath/k.fish"

echo 'function ls --wraps=eza --description '\''alias ls=eza'\''
  eza $argv; 
end' > "$fpath/ls.fish"

echo 'function rc --wraps=rg --description '\''alias rc=rg --color always'\''
  rg --color always $argv; 
end' > "$fpath/rc.fish"

if ! grep -q fish /etc/shells; then
  echo "$(which fish)" | sudo tee -a /etc/shells
  chsh -s $(which fish)
fi
