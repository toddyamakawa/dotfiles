
local here=${0:h}


# --- Path ---
function addpath() { export PATH=$PATH:$1; }

# --- Source Files ---
function source_files() {
	for f in $(\ls $@); do
		source $f
	done
}

function echo_eval() {
	echo "$@"
	eval "$@"
}

# --- zsh ---
alias zshrc='source ~/.zshrc'
alias vzshrc='vi ~/.zshrc'

# --- General ---
alias a='alias'
alias h='history'
alias which=type

alias findn='find . -name'

alias hostname='hostname --long'

# --- General ---
alias wrap="printf '\033[?7h'"
alias nowrap="printf '\033[?7l'"
alias tab2="expand -t2"
alias tab4="expand -t4"
alias tab8="expand -t8"
alias xterm='xterm -fg white -bg black -fa consolas -fs 10'

alias lns='ln -s'

alias catn='cat -n'
alias tailf='tail -n 100 -f'

function calc() { bc -l <<< "$@"; }

function setdisp() {
	[[ -n $LSB_BATCH_JID ]] && return
	[[ -z $VNCDESKTOP ]] && return
	port=$(echo $VNCDESKTOP | awk 'match($1, /.*(:[0-9]+)/, groups) {print groups[1]}')
	export DISPLAY=$port.0
}
#setdisp
alias vncconfig='vncconfig -nowin &'

function rmrf() {
	for f in $@; do
		f=${f%/}
		mv $f deleting.$f.$$
		rm -rf deleting.$f.$$ &
	done
}


# --- Source Files ---
source $here/my-options.zsh
source_files $here/alias.*.zsh

