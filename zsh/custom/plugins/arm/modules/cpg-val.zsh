
# --- Aliases ---
alias detag=/arm/devsys-tools/abs/detag

# Zeus module
alias -g zeusmodule='$(git rev-parse --show-toplevel)/tools/modules/zeus_trial'
alias zeusload='module load zeusmodule'


# --- disasm ---

# Rosetta
export ROSETTA_VERSION=$(detag ARMCC:Rosetta:0.0)
alias rose='/arm/warehouse/ARMCC/Rosetta/0.0/$ROSETTA_VERSION/dynamic/linux-x86_64-rel-public/gcc-4.4.4/bin/rosetta-api-test -d'

# EBM
export EBM_VERSION=$(detag PerformanceModeling:EBM:master::trunk)
alias ares_disasm='/arm/devsys-tools/warehouse/PerformanceModeling/EBM/master/$EBM_VERSION/Linux/x86_64/gcc-4.9.2/rel_int/bin/ares_disasm'
alias deimos_disasm='/arm/devsys-tools/warehouse/PerformanceModeling/EBM/master/$EBM_VERSION/Linux/x86_64/gcc-4.9.2/rel_int/bin/deimos_disasm'
alias zeus_disasm='/arm/devsys-tools/warehouse/PerformanceModeling/EBM/master/$EBM_VERSION/Linux/x86_64/gcc-4.9.2/rel_int/bin/zeus_disasm'


# --- compdef ---

# Completion for simulation *.log files
function _simlog() {
	_arguments "*:files:(($(ls *.@*.log)))"
}
compdef _simlog rerun.bash parse.bash

