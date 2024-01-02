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

fconfig="~/.config/fish/config.fish"

if grep -q 'homebrew' "$fconfig"; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' > ~/.config/fish/config.fish_new
  cat  ~/.config/fish/config.fish >> ~/.config/fish/config.fish_new
  mv ~/.config/fish/config.fish{_new,}
fi

if ! grep -q 'ENV_TYPE' "$fconfig"; then
  echo '
if status is-interactive
  jump shell fish | source
end

export PATH="$PATH:$HOME/go/bin:$HOME/.docker/bin"
export ENV_TYPE=dev
' >> "$fconfig"
fi

fpath="~/.config/fish/functions"

echo 'function g --wraps=git --description 'alias g=git'
  git $argv;
end' > "$fpath//g.fish"

echo 'function k --wraps=kubectl --description 'alias k=kubectl'
  kubectl $argv;
end' > "$fpath/k.fish"

echo 'function ls --wraps=exa --description 'alias ls=exa'
  exa $argv;
end' > "$fpath/ls.fish"

echo 'function rc --wraps='rg --color always' --description 'alias rc=rg --color always'
  rg --color always $argv;
end' > "$fpath/rc.fish"

if ! grep -q fish /etc/shells; then
  sudo echo $(which fish) >> /etc/shells
  chsh -s $(which fish)
fi
