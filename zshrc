
# --- oh-my-zsh ---
export ZSH=/home/todyam01/.oh-my-zsh
export SHELL=$(which zsh)
DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=~/.custom_zshrc
ZSH_THEME="my-theme"
plugins=(my-zsh-options arm-secret modules lsf tmux vi-mode)
source $ZSH/oh-my-zsh.sh

