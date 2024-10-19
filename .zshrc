# XDG Base Directory Specification defines standard folders to store configuration, cache, data, and state files.
# These environment variables ensure that applications store their files in the right places under our home directory.
# It helps keep things organized and prevents clutter in the home directory.
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_RUNTIME_DIR="$HOME/.cache/runtime"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export ZSH="$HOME/.oh-my-zsh"
export BAT_THEME="1337"
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
export MISE_RUBY_DEFAULT_PACKAGES_FILE="$XDG_CONFIG_HOME/mise/.default-gems"
export MISE_NODE_DEFAULT_PACKAGES_FILE="$XDG_CONFIG_HOME/mise/.default-npm-packages"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(zsh-syntax-highlighting git rails)
zstyle ':omz:update' mode reminder

source $ZSH/oh-my-zsh.sh
source $HOME/.p10k.zsh
source ~/powerlevel10k/powerlevel10k.zsh-theme
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(fzf --zsh)"
eval "$(mise activate)"

alias dot="cd ~/github/dotfiles"
