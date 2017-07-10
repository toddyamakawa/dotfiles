
# --- Disassemble ---
alias fromelf='mrun +arm/rvct_aarch64 fromelf'
function disass() {
	local file=$1
	bs1 -oo $file.disass fromelf -a -c --text $file
}
alias disass_syms='awk '"'"'/^ +\w+$/ {new=$1} /^ +[0-9a-fx]+:/ && new!="" {print $1, new; new=""}'"'"''

