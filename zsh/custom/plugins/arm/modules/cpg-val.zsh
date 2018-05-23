
# --- Module ---
alias -g zeusmodule='$(git rev-parse --show-toplevel)/tools/modules/zeus_trial'
alias zeusload='module load zeusmodule'

# --- disasm ---
export EBM_VERSION=$(/arm/devsys-tools/abs/detag PerformanceModeling:EBM:master::trunk)
alias ares_disasm='/arm/devsys-tools/warehouse/PerformanceModeling/EBM/master/$EBM_VERSION/Linux/x86_64/gcc-4.9.2/rel_int/bin/ares_disasm'
alias deimos_disasm='/arm/devsys-tools/warehouse/PerformanceModeling/EBM/master/$EBM_VERSION/Linux/x86_64/gcc-4.9.2/rel_int/bin/deimos_disasm'
alias zeus_disasm='/arm/devsys-tools/warehouse/PerformanceModeling/EBM/master/$EBM_VERSION/Linux/x86_64/gcc-4.9.2/rel_int/bin/zeus_disasm'

