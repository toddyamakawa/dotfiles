
# --- CDPATH ---
export CDPATH=".:..:../..:$HOME/.links:$HOME"

# --- Directory Stat ---
alias d='dirs -v'
function c() { cd -$1; }

# --- Aliases ---
alias cd='cd -P'
alias cdpwd='cd $PWD 2>/dev/null || cd $(pwd) 2>/dev/null && pwd'
alias cdtemp='cd $(mktemp -d)'
alias cdl='cd $(command ls -t | head -n 1)'
alias cdgit='cd $(git rev-parse --show-toplevel)'

# --- Functions ---
function cdd() {
	cd $(dirname $1)
}

# --- cup ---
# cd 'up'
function cup() {
	cd ${PWD%$1/*}/$1
	pwd
}

