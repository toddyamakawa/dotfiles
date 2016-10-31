
# --- oh-my-zsh ---
export ZSH=$HOME/.oh-my-zsh
export SHELL=$(builtin which zsh)
DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS="true"

# --- Setup Theme ---
ZSH_THEME_DEFAULT="my-theme"
xlsfonts | grep -q powerline && ZSH_THEME_DEFAULT="my-powerline-theme"
[[ -z $ZSH_THEME ]] && ZSH_THEME=$ZSH_THEME_DEFAULT

if [[ $(hostname --long) =~ arm.com$ ]]; then
	plugins=(arm-secret lsf eda)
else
	function module(){}
fi
plugins+=(modules my-zsh magic-enter cd xclip tmux vi)

#function source() {
#	local start=$(date +%s%N)
#	builtin source $1
#	echo "$(( $(date +%s%N) - $start )) $1"
#}

source $ZSH/oh-my-zsh.sh

