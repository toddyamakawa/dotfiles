
# --- ASP ---
alias tterminate='touch .TERMINATE'
function asp_run2log() {
	local timestamp=$(date +%y_%m_%d_%H_%M_%S -r config.json)
	local testpath=${PWD##*run_dir/}
	local testname=${testpath%/*}
	local runtype=${testpath#*/}
	local newdir=$(readlink -f $PWD/../../../log_dir/$testname-$runtype-$timestamp)
	mv $PWD $newdir
	cd $newdir
}
alias asp_parse_dir="perl -pe 's/\S*asp\/work\/([^\/]+)\/(\d+)\/\w+/\1:\2/'"

# --- arg.tcl ---
function tarmac_arg() {
	tclsh <(echo 'source arg.tcl; puts "-tracestart $tarmac(start) -traceend $tarmac(end)"')
}

# --- Tarmac ---
alias tarmac_uart="awk '/S:007ff80000/ {num=strtonum(\"0x\"substr(\$6,7,2)); printf(\"%c\", num)}'"
alias tarmac_uart_ts="awk '{print} /S:007ff80000/ {num=strtonum(\"0x\"substr(\$6,7,2)); printf(\"UART %c\\n\", num)}'"

# --- Archive ---
function save_uart() {
	local asp_work=$1/work
	for uart_log in $(command ls $asp_work/*/*/log_dir/*/uart.output.ts); do
		local temp=${uart_log##$asp_work/}
		local name=${temp//\//:}
		cp $uart_log $name
	done
}


# --- Register Parser ---
alias archex_reg='mrun +sun/jdk/1.8.0_77 java -jar /arm/ref/pd/SVOS/tools/register_parser.jar'

# --- New Weekly ---
function newweek() {
	local lastweek=$(($(date +%y%U)-1)).txt
	local thisweek=$(($(date +%y%U))).txt
	[[ -f $thisweek ]] && return 1
	cp $lastweek $thisweek
}


