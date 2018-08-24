
# --- Disassemble ---
function disass() {
	local file=$1
	bs1 -rn -app FG -K -oo $file.disass \
		mrun +arm/gcc_aarch64/4.9_2014.09 which aarch64-linux-gnu-objdump
		#mrun +arm/gcc_aarch64_elf/4.8_2014.01 which aarch64-linux-gnu-objdump -S $file
}
function disass.old() {
	local file=$1
	bs1 -rn -app FG -K -oo $file.disass \
		mrun +arm/rvct_aarch64 fromelf -a -c --text $file
}

alias disass_syms='awk '"'"'/^ +\w+$/ {new=$1} /^ +[0-9a-fx]+:/ && new!="" {print $1, new; new=""}'"'"''

