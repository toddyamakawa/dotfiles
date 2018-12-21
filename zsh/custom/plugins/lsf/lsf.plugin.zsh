
local here=${0:h}
source $here/alias.bjobs.zsh

alias bfield="cat $here/fields.txt"

# Default bsub variables
export _LSF_RHE='(rhe7||rhe6)'
export _LSF_RUNLIMIT='685:30'
export _LSF_DESCRIPTION='regress_tb-EA-sim_mti'

# --- bsub ---
alias bs='bsub -Jd $_LSF_DESCRIPTION -R "select[$_LSF_RHE && x86_64 && os64]" -W $_LSF_RUNLIMIT'
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

alias bszsh='bs16 -rn -app FG -Is -XF zsh'
alias bsbash='bs16 -rn -app FG -Is -XF bash'
alias bsshell='bs16 -rn -app FG -Is -XF $SHELL'
alias bsxterm='bs16 -rn -app FG -XF xterm'

# --- bkill ---
alias bskill='awk '"'"'/^[0-9]/ {print $1}'"'"' | xargs bkill'

# --- bhosts ---
alias bavail='bhosts | awk '"'"'($2="ok"){print $4-$5, $1}'"'"' | sort -n'
function butilization() {
	local resources=${1+-R $1}
	bhosts -noheader $resources | awk '
		{count=count+1; max=max+$4; used=used+$5}
		END {print "hosts="count, "total_slots="max, "used_slots="used, "utilization="100*used/max"%"}'
}

# Specific values
alias -g uall='-u all'
alias -g qemu='-q emulation'
alias -g pdefault='-P $LSB_DEFAULTPROJECT'
alias -g poddjob='-P ODDJOB'

# Mail notification
alias -g bjobmail="$here/bjobmail.sh"
function bnotify() {
	bcmd | grep -Eq "bjobmail.*$1" && return 1
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
alias bmodfg='bmod -rn -app FG'
alias bmodm='bmod -M'
alias bmod_appn='bmod -appn'
#alias bmod_highmem='bmod -app HIGH-MEM'
alias bmod_highmem='bmod -app RF-SSG-1'
#alias bmod_highmem='bmod -app RF-SSG-2'

# TODO: Figure out how to use this super useful bsub option
# -ti
# Enables automatic orphan job termination at the job level for a job with a dependency expression (set using -w).

