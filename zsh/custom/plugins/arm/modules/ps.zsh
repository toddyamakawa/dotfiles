
function ps_mail() {
	local process pid user cpu mem etime days cmd
	local host subject body
	local format=user,%cpu,%mem,etime

	pid=$1
	process=$(ps -eo $format h -q $pid)
	user=$(awk '{print $1}' <(echo $process))
	cpu=$(awk '{print $2}' <(echo $process))
	mem=$(awk '{print $3}' <(echo $process))
	etime=$(awk '{print $4}' <(echo $process))
	days=$(cut -d- -f1 <(echo $etime))
	cmd=$(ps -eo args h -q $pid)

	host=$(hostname --long)
	subject="High resource process on $host"
	body+="Dear $user,\n\n"
	body+=""
	body+="You have a process running"
	[[ "$days" != "$etime" ]] && body+=" for $days+ days"
	body+=" with $cpu% CPU usage process running on $host.\n"
	body+="PID:$pid CPU:$cpu% MEM:$mem%\n"
	body+="COMMAND: $cmd\n\n"
	body+="Please end this process at your earliest convenience.\n\n"
	body+="Thanks,\n-Todd\n\n"
	body+="This message was generated from a script."
	echo -e "$body" | mail -s "$subject" -r $(whoami)@arm.com $user@arm.com
}

function ps_notify() {
	local cpu_percent=80 pid
	local format=pid,user,%cpu,%mem,etime,args
	local regex='($3>'$cpu_percent'&&$5~/-/)'
	while read line; do
		pid=$(awk '{print $1}' <(echo $line))
		echo $line
		ps_mail $pid
	done < <(ps -eo $format | awk $regex'{print}')
}

