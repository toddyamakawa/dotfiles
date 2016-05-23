
awkc(){ awk '{print $'$1'}';}

regex() {
	awk 'match($0,/'$1'/, groups) {print groups['${2:-'0'}']}'
}


