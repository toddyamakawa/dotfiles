
local here=${0:h}

# --- bsub ---
alias bs="bsub -Jd sysbench-2.x-run_veloce_tbx -R 'select[rhe6 && x86_64 && os64]' -W 96:00"
alias bs1='bs -M 1024000'
alias bs2='bs -M 2048000'
alias bs4='bs -M 4096000'
alias bs8='bs -M 8192000'
alias bs16='bs -M 16384000'
alias bs32='bs -M 32768000'
alias bs64='bs -M 65536000'
alias bs80='bs -M 81920000'
alias bs128='bs -M 131072000'
alias bs256='bs -M 262144000'

alias bszsh='bs16 -Is -XF zsh'
alias bsbash='bs16 -Is -XF bash'
alias bsshell='bs16 -Is -XF $SHELL'
alias bsxterm='bs16 -XF xterm'

# --- bkill ---
alias bskill='awk '"'"'/^[0-9]/ {print $1}'"'"' | xargs bkill'

# --- bhosts ---
alias bavail='bhosts | awk '"'"'($2="ok"){print $4-$5, $1}'"'"' | sort -n'

# --- bjobs ---

# Format output
alias bawk='awk '"'"'BEGIN{RS=", +|;?\n"}{$1=$1;print}'"'"''
function bjobsu() { bjobs -UF $@ | bawk; }
alias bjobsf='bjobs -o "jobid:8 user:8 stat:5 project:9 run_time:-20 cmd"'
alias bemu='bjobsf -q emulation -u all'

# Specific fields
function bprint() {
	local format=$1
	shift
	eval bjobs -o "'jobid:8 stat:5 $format'" $@
}
alias bcmd='bprint cmd'
alias bpwd='bprint sub_cwd'
alias bapp='bprint app'
alias bdep='bprint dependency'

# Specific values
alias -g uall='-u all'
alias -g qemu='-q emulation'
alias -g qemur='-q emulation -r'
alias -g qemup='-q emulation -p'
alias -g poddjob='-P ODDJOB'

# Mail notification
alias -g bjobmail="$here/bjobmail.sh"
function bnotify() {
	bcommands | grep -Eq "bjobmail.*$1" && return 1
	bs1 -w 'ended('$1')' -o /dev/null bjobmail $1
}

# --- bshares ---
alias bpriority='bshares -q PD | grep $LSB_DEFAULTPROJECT | sort -n -k 3 -r'
alias bprojstat='bjobs -noheader -u all -P $LSB_DEFAULTPROJECT | awk '"'"'{print $2, $3}'"'"' | sort | uniq -c'

# --- bwhat ---
alias bproj='bwhat -p'

# --- bmod ---
alias breset='unset LSB_DEFAULTPROJECT LSB_DEFAULTAPP LSB_DEFAULTQUEUE LSB_DEFAULTWORKFLOW'
function bmod() {
	echo $(breset; command bmod $@)
}
function bmodw() {
	duration=$1
	shift
	bmod -W $duration -We $duration $@
}
alias bmodfg='bmod -app FG'
alias bmodm='bmod -M'
alias bmod_appn='bmod -appn'
alias bmod_highmem='bmod -app HIGH-MEM'

