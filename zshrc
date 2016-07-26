
# --- oh-my-zsh ---
export ZSH=$HOME/.oh-my-zsh
export SHELL=$(\which zsh)
DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS="true"
ZSH_CUSTOM=$HOME/.custom_zshrc
ZSH_THEME="my-theme"

plugins=(modules my-zsh magic-enter tmux vi)
hostname --long | grep -q 'arm\.com' && plugins=(arm-secret modules my-zsh lsf magic-enter tmux eda vi)

#function source() {
#	local start=$(date +%s%N)
#	builtin source $1
#	echo "$(( $(date +%s%N) - $start )) $1"
#}

source $ZSH/oh-my-zsh.sh

