
local here=${0:h}

# --- Aliases ---
alias detag=/arm/devsys-tools/abs/detag

# Open tcsh with tcsh rtl_setup script sourced
alias ares-sh="$here/cpg-sh.expect ares"
alias deimos-sh="$here/cpg-sh.expect deimos"
alias zeus-sh="$here/cpg-sh.expect zeus"

# Zeus module
alias -g zeusmodule='$(git rev-parse --show-toplevel)/tools/modules/zeus_trial'
alias zeusload='module load zeusmodule'

# Rosetta
function _detag_rosetta() {
	export ROSETTA_VERSION=${ROSETTA_VERSION-$(detag ARMCC:Rosetta:0.0)}
	echo $ROSETTA_VERSION
}

alias rose='/arm/warehouse/ARMCC/Rosetta/0.0/$(_detag_rosetta)/dynamic/linux-x86_64-rel-public/gcc-4.4.4/bin/rosetta-api-test -d'

# EBM
function _detag_ebm() {
	export EBM_VERSION=${EBM_VERSION-$($(detag PerformanceModeling:EBM:master::trunk))}
	echo $EBM_VERSION
}
alias ares_disasm='/arm/devsys-tools/warehouse/PerformanceModeling/EBM/master/$(_detag_ebm)/Linux/x86_64/gcc-4.9.2/rel_int/bin/ares_disasm'
alias deimos_disasm='/arm/devsys-tools/warehouse/PerformanceModeling/EBM/master/$(_detag_ebm)/Linux/x86_64/gcc-4.9.2/rel_int/bin/deimos_disasm'
alias zeus_disasm='/arm/devsys-tools/warehouse/PerformanceModeling/EBM/master/$(_detag_ebm)/Linux/x86_64/gcc-4.9.2/rel_int/bin/zeus_disasm'


# Rerun build log with extra debug
function vlog-debug() {
	local logfile=$1 debuglog=${2-debug.log} cmd
	cmd=$(head $logfile | grep vlog)
	$cmd -Edebug $debuglog
}

# Generate $WORK_DIR path
function cpg-workdir() {
	local temp_dir work_dir
	temp_dir=${WORK_DIR-$PWD/work_dir}
	work_dir=$(readlink -f $temp_dir) || work_dir=$PWD/$temp_dir
	echo ${work_dir/\/projects/\/arm\/projectscratch}
}

# Automatic $WORK_DIR for regress command
function regress() {
	local now=$(date +%Y%m%d-%H%M%S-Week%U-%a-%T)
	local args cmd work_dir
	args=$@
	cmd=regress${args:gs/ //}
	work_dir=$(WORK_DIR=$cmd/$now cpg-workdir)
	echo "Using WORK_DIR=$work_dir"
	WORK_DIR=$work_dir command regress $args
}

# FIXME: This thing is garbage and doesn't work at all
# Automatic $WORK_DIR for sim_tb command
function _sim_tb() {
	local now=$(date +%Y%m%d-%H%M%S-Week%U-%a-%T)
	local args cmd work_dir usetemp
	args=$@
	if [[ -n $LSB_BATCH_JID && -n ${args[(r)-local]} && -n ${args[(r)-build_local]} ]]; then
		usetemp=1
		work_dir=${WORK_DIR-$(mktemp -d)}
	else
		${WORK_DIR?needs to be set}
	fi
	echo "Using WORK_DIR=$work_dir"
	echo $args
	echo WORK_DIR=$work_dir command sim_tb $args
	WORK_DIR=$work_dir command sim_tb $args
	[[ -n $usetemp ]] && cd $work_dir
}



# --- compdef ---

# Completion for simulation *.log files
function _simlog() {
	_arguments "1:files:(($(ls *.@*.log)))"
}
compdef _simlog rerun.bash parse.bash

# Completion for *.fsdb files
function _fsdb() {
	_arguments "1:files:(($(ls *.fsdb)))"
}
compdef _fsdb fsdb

