
function calc() { bc -l <<< "$@"; }

function hex2dec() {
	echo $(( 16#$1 ))
}

alias dec2hex='printf "%x\n"'

