
export DEPOT_SETUP_ROOT=/home/todyam01/.setup.zshrc/
source $DEPOT_SETUP_ROOT/init/zsh

alias sitename='hostname -f | \grep -o ..hpc'
alias nahpc='sitename | \grep -q nahpc'
alias euhpc='sitename | \grep -q euhpc'

alias getquota=/usr/local/bin/getquota

disass() {
	local file=$1
	module load arm/rvct_aarch64
	bs1 -oo $file.disass fromelf -a -c --text $file
}
alias disass_syms='awk '"'"'/^ +\w+$/ {new=$1} /^ +[0-9a-fx]+:/ && new!="" {print $1, new; new=""}'"'"''

# --- SVOS ---
alias tterminate='touch .TERMINATE'
alias uart='tailx uart.output'
alias tarmac_uart="awk '/NS:007ff8/ {num=strtonum(\"0x\"substr(\$6,7,2)); printf(\"%c\", num)}'"
#alias tarmac_uart_ts="awk '/clk ES/ {clk=\$1} /NS:007ff8/ {num=strtonum(\"0x\"substr(\$6,7,2)); printf(clk\" %c\\n\", num)}'"
alias tarmac_uart_ts="awk '{print} /NS:007ff8/ {num=strtonum(\"0x\"substr(\$6,7,2)); printf(\"UART %c\\n\", num)}'"

# --- Porter ---
export PROJ_HOME=/projects/ssg/pj01384_porter/todyam01/porter
export WORK_DIR=/arm/projectscratch/ssg/pj01384_porter/todyam01/porter
#source $PROJ_HOME/logical/shared/tools/bin/porter_rtl_setup_bash
alias new_porter='git clone ssh://hw-gerrit.nahpc.arm.com:29418/systems/porter && cd porter && git checkout dev'

