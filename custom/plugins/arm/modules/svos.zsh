
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
alias json2cfg='$(git rev-parse --show-toplevel)/misc/json2cfg.rb'
alias zshasp='source $(git rev-parse --show-toplevel)/misc/zsh_completion'

# --- arg.tcl ---
function tarmac_arg() {
	tclsh <(echo 'source arg.tcl; puts "-tracestart $tarmac(start) -traceend $tarmac(end)"')
}

# --- View Markdown Files ---
alias -s md=mk
function mk() {
	/arm/ref/pd/SVOS/tools/mk/bin/mk "$@" | less -FRX
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

# --- Archive ---
function backup_iris() {
	local new_iris=$1
	[[ -z $new_iris ]] && { echo "New directory name not specified"; return 1}
	[[ -f $new_iris || -d $new_iris ]] && { echo "'$new_iris' already exists"; return 1}
	[[ -d iris ]] || { echo "'iris' directory doesn't exists"; return 1}
	mv iris $new_iris
	mkdir iris
	cd iris
	ln -s ../$new_iris/* .
}

# --- KVS Reference Path ---
function kvs_info() {
	local ref=/arm/ref/pd/SVOS/projects/porter/mscp
	local config=${PWD##*/build_}
	config=${config%_kit_*}
	local root=$(svn info .. | awk '/Root Path:/{print $NF}')
	local tag=$(basename $(svn info $root | awk '/^URL:/{print $NF}'))
	echo $ref/$config/$tag
}

# TODO: Clean up function
function svos_brodie() {
	result_type=svos_svos
	project_name=svos
	brodie="http://brodie-api.arm.com"
	result="results/result_type/$result_type/project_name/$project_name"
	opts=""
	opts="?page_length=10&page_number=0&order=created_at.desc"
	url="$brodie/$result$opts"
	echo $url
	echo curl -s -su todyam01 -X GET --header "Accept: application/json" "$url"
	curl -s -su todyam01 -X GET --header "Accept: application/json" "$url"
}

# --- Register Parser ---
alias archex_reg='mrun +sun/jdk/1.8.0_77 java -jar /arm/ref/pd/SVOS/tools/register_parser.jar'

# --- Current Week ---
function weekly() {
	ruby -e 'puts Time.now.strftime("%g%V")'
}

# --- New Weekly ---
function newweek() {
	local lastweek=$(($(date +%y%U)-1)).txt
	local thisweek=$(($(date +%y%U))).txt
	[[ -f $thisweek ]] && return 1
	cp $lastweek $thisweek
}


alias ares_disasm='/arm/devsys-tools/warehouse/PerformanceModeling/EBM/master/$(/arm/devsys-tools/abs/detag PerformanceModeling:EBM:master::trunk)/Linux/x86_64/gcc-4.9.2/rel_int/bin/ares_disasm'

