
# --- CDPATH ---
export CDPATH="..:../..:$HOME"

# --- Directory Stat ---
alias d='dirs -v'
function c() { cd -$1; }

# --- Aliases ---
alias cd='cd -P'
alias cdpwd='cd $PWD'
alias cdtemp='cd $(mktemp -d)'


# --- cup ---

# cd 'up'
function cup() {
	cd ${PWD%$1*}/$1
	pwd
}

# compdef _cup
function _cup() {
	dir=$(pwd | sed 's:/: :g')
	_arguments "*:dir:(($dir))"
}
compdef _cup cup

