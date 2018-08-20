
# No header
alias bjobsn='bjobs -noheader'

# Print specific fields
function bprint() {
	local format=$1
	shift
	eval bjobs -o "'jobid:8 stat:5 $format'" $@
}

alias bcmd='bprint cmd'
alias bpwd='bprint sub_cwd'
alias bapp='bprint app'
alias bdepend='bprint dependency'
alias bjobsf='bprint "user:8 project:9 run_time:-20 cmd:20"'
alias bjobsfall='bprint "user:8 project:9 run_time:-20 cmd"'
alias bemu='bjobsf -q emulation -u all'
alias bemu='bjobsfall -q emulation -u all'

# Long output
alias bawk='awk '"'"'BEGIN{RS=", +|;?\n"}{$1=$1;print}'"'"''
function bjobsu() { bjobs -UF $@ | bawk; }

function btime() {
	while read job; do
		#echo "hi: $job"
		id=$(echo $job | awk '{print $1}')
		echo "Job ID $id"

		bjobs -UF $id | \
			awk '
				rtf{runtime=$1;rtf=0}
				rlf{runlimit=$1;rlf=0}
				/RUNTIME/{rtf=1}
				/RUNLIMIT/{rlf=1}
				END {print runtime, runlimit}
			'

		#bjobs $id | awk 'time{print time,$1;time=0}/RUNTIME|RUNLIMIT/{time=$1}/Job <|CWD/'
		#echo $job | awk 'time{print time,$1;time=0}/RUNTIME|RUNLIMIT/{time=$1}/Job <|CWD/'
	done < <(bjobsn $@)
	#done < <(bjobs $@)

	#bjobsu $@ | \
	#awk 'time{print time,$1;time=0}/RUNTIME|RUNLIMIT/{time=$1}/Job <|CWD/'
}

function binfo() {
	bjobsn $@ | awk '{print $1}'
	#local jobs=$(bjobs $@ | awk '{print $1}')
	#local jobs=$(bjobs $@ | awk '{print $1}')
	#echo $jobs
}

