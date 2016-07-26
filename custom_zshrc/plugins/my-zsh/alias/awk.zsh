
# --- awk columns ---
function awkc() { awk '{print $'$1'}'; }
for i in $(seq 1 11); do alias awk$i="awkc $i"; done

function regex() {
	awk 'match($0,/'$1'/, groups) {print groups['${2:-'0'}']}'
}

