eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
  jump shell fish | source
end

export PATH="$PATH:$HOME/go/bin:$HOME/.docker/bin"
export ENV_TYPE=dev
