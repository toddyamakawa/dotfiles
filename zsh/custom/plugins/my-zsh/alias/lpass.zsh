
alias lp='lpass'
alias lpstat='lpass status'
alias lplogin='lpass login'

# --- Search for LastPass Info ---
function lpf() {
	lpass status || return 1
	local ret selected id

	# Select site with fzf
	selected=($(
		lp ls --long | \
			awk '/username: \w/{$1="";$2="";print}' | \
			sed -e 's/\(.*\)\[id:\s*\(\w\+\).*username:\s*\(.*\)\]/\2,\3,\1/' | \
			column -t -s ',' | \
			fzf
	))
	ret=$?

	# Print site information and copy password
	if [[ $ret -eq 0 ]]; then
		id=$selected[1]
		lp show --url $id
		echo "Username: $selected[2]"
		lp show --password $id | xclip
		#lp show --clip --password $id
		echo "Password copied to clipboard"
	fi
}

