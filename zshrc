
# --- oh-my-zsh ---
export ZSH=$HOME/.oh-my-zsh
export SHELL=$(builtin which zsh)
DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS="true"
ZSH_THEME="my-theme"

plugins=(modules my-zsh magic-enter xclip tmux vi)
hostname --long | grep -q 'arm\.com' && plugins=(arm-secret modules my-zsh lsf magic-enter eda xclip tmux vi)

#function source() {
#	local start=$(date +%s%N)
#	builtin source $1
#	echo "$(( $(date +%s%N) - $start )) $1"
#}

source $ZSH/oh-my-zsh.sh

