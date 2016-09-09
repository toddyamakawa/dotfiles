
# --- awk columns ---
function awkc() { awk '{print $'$1'}'; }
for i in $(seq 1 11); do alias -g col$i="| awkc $i"; done

# --- awk rows ---
function awkr() { awk '(NR=='$1'){print $0}'; }
for i in $(seq 1 11); do alias -g row$i="| awkr $i"; done

function regex() {
	awk 'match($0,/'$1'/, groups) {print groups['${2:-'0'}']}'
}

