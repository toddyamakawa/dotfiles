
# --- Aliases ---
alias interactive\?='[[ -n $PROMPT ]]'
alias munload='module unload'
alias mlist='module list'

# --- Functions ---
function mload() { interactive? && module load $@; }

# --- Load Essentials ---
mload core util swdev eda
mload git/git/2.7.0 vim/vim/7.4

# Scripting languages
alias rubyload='mload ruby/ruby/2.2.1'
alias perlload='perl/perl/5.12.3'
alias tclload='tct/tcl/8.6.1'
alias javaload='mload sun/jdk/1.8.0_77'

