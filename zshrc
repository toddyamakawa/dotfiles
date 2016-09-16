
# --- oh-my-zsh ---
export ZSH=$HOME/.oh-my-zsh
export SHELL=$(builtin which zsh)
DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS="true"

# --- Setup Theme ---
ZSH_THEME_DEFAULT="my-theme"
[[ -z $ZSH_THEME ]] && ZSH_THEME=$ZSH_THEME_DEFAULT

if [[ $(hostname --long) =~ arm.com$ ]]; then
	plugins=(arm-secret modules my-zsh lsf magic-enter eda xclip tmux vi)
else
	plugins=(modules my-zsh magic-enter xclip tmux vi)
	function module(){}
fi

#function source() {
#	local start=$(date +%s%N)
#	builtin source $1
#	echo "$(( $(date +%s%N) - $start )) $1"
#}

source $ZSH/oh-my-zsh.sh

