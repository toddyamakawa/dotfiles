
# --- autorun ---
function autorun() {
	file=$1
	shift
	cmd="$@"
	ts0=$(stat -c %Y $file)
	while true; do
		sleep 0.1
		[[ -f $file ]] && ts=$(stat -c %Y $file)
		[[ $ts == $ts0 ]] && continue
		ts0=$ts
		echo "$fg_bold[blue]$cmd$reset_color"
		eval $cmd
	done
}

