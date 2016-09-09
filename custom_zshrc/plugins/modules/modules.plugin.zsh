
# --- Module ---
# Ignore module if not defined
which module > /dev/null || function module(){}

# --- Aliases ---
alias interactive\?='[[ -n $PROMPT ]]'
alias munload='module unload'
alias mlist='module list'

# --- Functions ---
function mload() { interactive? && module load $@; }

# --- Load Essentials ---
mload core util swdev eda
mload git/git/2.7.0 vim/vim/7.4

# --- Scripting languages ---
alias rubyload='mload ruby/ruby/2.2.1'
alias pythonload='mload python/python/3.5.1'
alias perlload='mload perl/perl/5.12.3'
alias tclload='mload tct/tcl/8.6.1'
alias javaload='mload sun/jdk/1.8.0_77'
perlload

