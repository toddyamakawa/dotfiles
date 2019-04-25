
local here=${0:h}

alias awkvars="cat $here/awk.variables.txt"
alias awk.ts="$here/bin/timestamp.awk"

# --- awk columns ---
function awkc() {
	col=$1
	shift
	awk '{print $'$col'}' $@;
}
#for i in $(seq 1 11); do alias -g col$i="| awkc $i"; done

# --- awk rows ---
function awkr() {
	row=$1
	shift
	awk '(NR=='$row'){print $0}' $@
}
#for i in $(seq 1 11); do alias -g row$i="| awkr $i"; done

function awk_match() {
	awk 'match($0,/'$1'/, groups) {print groups['${2:-'0'}']}'
}

