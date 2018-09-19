
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


# --- compdef ---

# Completion for simulation *.log files
function _simlog() {
	_arguments "*:files:(($(ls *.@*.log)))"
}
compdef _simlog rerun.bash parse.bash

