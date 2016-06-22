
alias interactive\?='[[ -n $PROMPT ]]'
function mload() { interactive? && module load $@; }
alias munload='module unload'
alias mlist='module list'

mload core util swdev eda

#mload linaro/gnueabi/2012.04-20120426
#mload arm/license/production

mload git/git/2.7.0

# Text editor
mload vim/vim/7.4

# Scripting languages
mload ruby/ruby/2.2.1 perl/perl/5.12.3 tct/tcl/8.6.1

