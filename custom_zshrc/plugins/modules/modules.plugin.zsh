
alias interactive\?='[[ -n $PROMPT ]]'
function mload() { interactive? && module load $@; }
alias munload='module unload'
alias mlist='module list'

mload core util swdev eda

mload linaro/gnueabi/2012.04-20120426
mload arm/license/production

#mload apache/subversion/1.7.3
mload tigris/subversion/1.6.2
mload git/git/2.7.0

mload vim/vim/7.4
mload tkdiff/tkdiff/4.2
mload colordiff && alias diff='colordiff'
mload perl/perl/5.12.3
mload ruby/ruby/2.2.1
mload meld/meld/1.5.3
mload tct/tcl/8.6.1
mload xclip/xclip/0.12
mload adobe/acrobat/8.1.3

#alias mgrep='module avail 2>&1 | awk '"'"'BEGIN {RS="[ \t\n]+"} {print}'"'"' | grep'
#alias module_reload='eval "$(egrep ^module ~/.bashrc)"'

