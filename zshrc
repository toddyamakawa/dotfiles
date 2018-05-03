
# TODO: Investigate antibody: https://github.com/getantibody/antibody

# --- oh-my-zsh ---
export ZSH=$HOME/.oh-my-zsh
export SHELL=$(builtin which zsh)
export ZSH_CUSTOM=$HOME/.zsh/custom

DISABLE_AUTO_TITLE=true
COMPLETION_WAITING_DOTS="true"

# --- Setup .zcompdump Directory ---
[[ -z $ZSH_COMPDIR ]] && ZSH_COMPDIR=~/.zcompdir
mkdir -p $ZSH_COMPDIR
ZSH_COMPDUMP=$ZSH_COMPDIR/$(hostname --long)

# --- Setup Theme ---
ZSH_THEME_DEFAULT="my-theme"
[[ -z $ZSH_THEME ]] && ZSH_THEME=$ZSH_THEME_DEFAULT

if [[ $(hostname --long) =~ arm.com$ ]]; then
	plugins=(arm lsf eda)
else
	function module(){}
fi
plugins+=(bin modules my-zsh magic-enter cd vim xclip tmux vi-mode regex setup vcs)
[[ -f ~/.fzf.zsh ]] && plugins+=(fzf)

# --- Source Files ---
function source_files() {
	for f in $(command ls $@); do
		source $f
	done
}

#function source() {
#	local start_ms=$(date +%s%3N)
#	builtin source $1
#	echo "$(($(date +%s%3N)-$start_ms)) $1"
#}

source $ZSH/oh-my-zsh.sh

