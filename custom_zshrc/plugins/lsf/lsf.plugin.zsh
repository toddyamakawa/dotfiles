
local here=${0:h}

# --- Modules ---
mload arm/clusterfg/1.0
mload arm/cluster/2.0

# --- bsub ---
alias my_bsub="bsub -W 96:00 -Jd sysbench-2.x-run_veloce_tbx -R 'select[rhe6 && x86_64 && os64]'"
alias bs1='my_bsub -M 1024000'
alias bs2='my_bsub -M 2048000'
alias bs4='my_bsub -M 4096000'
alias bs8='my_bsub -M 8192000'
alias bs16='my_bsub -M 16384000'
alias bs32='my_bsub -M 32768000'
alias bs64='my_bsub -M 65536000'
alias bs80='my_bsub -M 81920000'
alias bs128='my_bsub -M 131072000'
alias bs256='my_bsub -M 262144000'

alias bszsh='bs16 -Is -XF zsh'
alias bsbash='bs16 -Is -XF bash'
alias bsxterm='bs16 -XF xterm'

# --- bkill ---
alias bskill='awk '"'"'/^[0-9]/ {print $1}'"'"' | xargs bkill'

# --- bjobs ---
alias bawk='awk '"'"'BEGIN{RS=", +|;?\n"}{$1=$1;print}'"'"''
function bjobsu() { bjobs -UF $@ | bawk; }
alias bjobsf='bjobs -o "jobid:8 user:8 stat:5 project:9 run_time:-20 cmd"'
alias bemu='bjobsf -q emulation -u all'
function bpwd() {
	bjobs -UF $1 | sed -n 's/.*Execution CWD <\(.*\)>.*/\1/p'
}
alias -g bjobmail="$here/bjobmail.sh"
function bnotify() {
	bs1 -w 'ended('$1')' -o /dev/null bjobmail $1
}

# --- bwhat ---
alias bproj='bwhat -p'

# --- bmod ---
alias bmem='bmod -app HIGH-MEM'
alias bmodw='bmod -W'
alias bmodm='bmod -M'

