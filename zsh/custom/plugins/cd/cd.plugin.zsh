
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

# --- chpwd ---
# Automatically generate $CDPATH whenever the directory is changed
function chpwd() {
	local up up2
	up=$(dirname $PWD)
	up2=$(dirname $up)
	cdpath=('.' $(git rev-parse --show-toplevel 2>/dev/null))
	cdpath+=(${up%/} ${up2%/} $HOME/.links $HOME)
}

