
# --- oh-my-zsh ---
export ZSH=/home/todyam01/.oh-my-zsh
export SHELL=$(\which zsh)
DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=~/.custom_zshrc
ZSH_THEME="my-theme"
plugins=(arm-secret modules my-zsh lsf tmux eda vi)
source $ZSH/oh-my-zsh.sh

