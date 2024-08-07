# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZSH_DISABLE_COMPFIX=true

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=90

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    brew
    zsh-autosuggestions
)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

##### FROM OLD ZSH CONFIG ####

## shortcuts for ctrl+del/arrows
#bindkey '^[[1;5D' emacs-backward-word
#bindkey '^[[1;5C' emacs-forward-word
#bindkey -M emacs '^[[3;5~' delete-word

local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ %s)"
PROMPT='${ret_status}%{$fg_bold[green]%}%p %{$fg[cyan]%}$(print "%{\e[1;34m%}%n%{\e[0m%}@%{\e[1;34m%}%M%{\e[0m%}") %~ %{$reset_color%}$ '

unsetopt correctall
unsetopt correct

export LESS="--no-init --quit-if-one-screen $LESS"

# option+left/right bindings
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[[D"  backward-word
bindkey "^[[C" forward-word

# search cmd history with regex
bindkey '^R' history-incremental-pattern-search-backward

eval "$(jump shell)"

alias ls="eza"
alias rc="rg --color always"
export RIPGREP_CONFIG_PATH="${HOME}/.ripgreprc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/zsh_completion" ] && \. "$NVM_DIR/zsh_completion"

alias g="git"
alias k="kubectl"
