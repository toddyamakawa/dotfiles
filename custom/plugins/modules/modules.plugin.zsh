
# --- Module ---
# Ignore module if not defined
#which module > /dev/null || function module(){}

# --- Aliases ---
alias interactive\?='[[ -n $PROMPT ]]'
alias munload='module unload'
alias mlist='module list'

# --- Functions ---
function mload() { interactive? && module load $@; }

# --- Load Essentials ---
mload core util swdev eda
mload arm/cluster/2.0 arm/license/production
mload git/git/2.7.0 python/git-review_py2.7.8/1.25.0 vim/vim/8.0.5

# --- Scripting Languages ---
alias rubyload='mload ruby/ruby/2.2.3 ruby/gems/2.6.11'
alias pythonload='mload python/python/2.7.8 python/python/3.5.1'
alias perlload='mload perl/perl/5.12.3'
alias tclload='mload tct/tcl/8.6.1'
alias javaload='mload sun/jdk/1.8.0_77'
perlload

# --- mrun ---
function mruby() { mrun +swdev +ruby/ruby/2.2.3 +ruby/gems/2.6.11 ruby $@; }
function mgem() { mrun +swdev +ruby/ruby/2.2.3 +ruby/gems/2.6.11 gem $@; }
function mperl() { mrun +swdev +perl/perl/5.12.3 perl $@; }
function mtclsh() { mrun +swdev +tct/tcl/8.6.1 tclsh $@; }
function mjava() { mrun +swdev +sun/jdk/1.8.0_77 java $@; }

