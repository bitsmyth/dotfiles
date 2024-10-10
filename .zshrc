export XDG_CONFIG_HOME="$HOME/.config"
export ZSH="$HOME/.oh-my-zsh"
export BAT_THEME="1337"
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git rails)
zstyle ':omz:update' mode reminder

source $ZSH/oh-my-zsh.sh
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
source $HOME/.p10k.zsh
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

eval "$(fzf --zsh)"
eval "$(mise activate)"

alias dot="cd ~/github/dotfiles"
