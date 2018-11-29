
local here=${0:h}
alias hex.rb="$here/hex.rb"

function calc() { bc -l <<< "$@"; }

function hex2dec() {
	echo $(( 16#$1 ))
}

alias dec2hex='printf "%x\n"'

