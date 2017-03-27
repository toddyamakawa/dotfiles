
export DEPOT_SETUP_ROOT=/home/jimcum01/.setup.zshrc
source $DEPOT_SETUP_ROOT/init/zsh

alias sitename='hostname -f | \grep -o ..hpc'
alias nahpc='sitename | \grep -q nahpc'
alias euhpc='sitename | \grep -q euhpc'

alias getquota=/usr/local/bin/getquota
alias projinfo='projinfo 2>/dev/null'

# --- Environment Variables ---
euhpc && [[ -z $LSB_BATCH_JID ]] && export LSB_DEFAULTPROJECT=PJ01384
nahpc && [[ -z $LSB_BATCH_JID ]] && export LSB_DEFAULTPROJECT=PJ01384DEFAULT

# --- Disassemble ---
function disass() {
	local file=$1
	module load arm/rvct_aarch64
	bs1 -oo $file.disass fromelf -a -c --text $file
}
alias disass_syms='awk '"'"'/^ +\w+$/ {new=$1} /^ +[0-9a-fx]+:/ && new!="" {print $1, new; new=""}'"'"''

# --- Porter ---
export PROJ_HOME=/projects/ssg/pj01384_porter/jimcum01/porter
export WORK_DIR=/arm/projectscratch/ssg/pj01384_porter/jimcum01/porter
#source $PROJ_HOME/logical/shared/tools/bin/porter_rtl_setup_bash

# --- SVOS ---
alias tterminate='touch .TERMINATE'
alias uart='tailx uart.output'
alias tarmac_uart="awk '/S:007ff80000/ {num=strtonum(\"0x\"substr(\$6,7,2)); printf(\"%c\", num)}'"
alias tarmac_uart_ts="awk '{print} /S:007ff80000/ {num=strtonum(\"0x\"substr(\$6,7,2)); printf(\"UART %c\\n\", num)}'"
alias asp_result='echo PASS: RESULT: \"SVOS TEST COMPELTE\" >> RESULT'
function asp_run2log() {
	local timestamp=$(date +%y_%m_%d_%H_%M_%S -r config.json)
	local testpath=${PWD##*run_dir/}
	local testname=${testpath%/*}
	local runtype=${testpath#*/}
	local newdir=$(readlink -f $PWD/../../../log_dir/$testname-$runtype-$timestamp)
	mv $PWD $newdir
	cd $newdir
}

function tarmac_arg() {
	tclsh <(echo 'source arg.tcl; puts "-tracestart $tarmac(start) -traceend $tarmac(end)"')
}

# --- Kits ---
export ARM_IP_LIBRARY=http://cam-svn2.cambridge.arm.com/svn/pdcss/ip/arm_ip_library
export ARM_IP_WAREHOUSE=/arm/warehouse/ARM_IP
alias svn_ip='svn ls $ARM_IP_LIBRARY'
alias svn_interconnect='svn ls $ARM_IP_LIBRARY/e_interconnect_f4/tags'
alias svn_porter='svn ls $ARM_IP_LIBRARY/porter/tags'

# --- Mail ---
function mailme {
	mail -s "\"$@\"" $(whoami)@arm.com
}

function mailo {
	mailme "$@" < <($@)
}

alias mailv='vi /var/spool/mail/$(whoami)'

