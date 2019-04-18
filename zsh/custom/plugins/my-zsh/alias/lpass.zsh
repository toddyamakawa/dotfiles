
# --- Environment ---
# An agent process handle commands for the user without asking for a password.
# $LPASS_AGENT_TIMEOUT environment variable
# - Agents quits after one hour if not set
# - Agent never quits if set to 0
# - Agent quits after number of seconds if set
LPASS_AGENT_TIMEOUT=0

# The agent is disabled if $LPASS_AGENT_DISABLE is set to 1
unset LPASS_AGENT_DISABLE


# --- Aliases ---
alias lp='lpass'
alias lastpass='lpass'

alias lpstat='lpass status'
alias lplogin='lpass login'
alias lpshow='lpass show'

# --- Search for LastPass Info ---
function _lpfzf() {
	lpass status --quiet || return 1
	local ret selected id

	# Select site with fzf
	selected=$(
		lp ls --long | \
			awk '/username: \w/{$1="";$2="";print}' | \
			sed -e 's/\(.*\)\[id:\s*\(\w\+\).*username:\s*\(.*\)\]/\2,\3,\1/' | \
			column -t -s ',' | \
			fzf
	)
	ret=$?

	# Print site information and copy password
	if [[ $ret -eq 0 ]]; then
		echo $selected
	else
		return $ret
	fi
}

function lpid() {
	local selected
	selected=($(_lpfzf))

	if (( $? == 0 )); then
		echo $selected[1] | xclip
		echo "Copied: $(xclip -o)"
	else
		return 130
	fi
}

function lpf() {
	local selected
	selected=($(_lpfzf))

	# Print site information and copy password
	if (( $? == 0 )); then
		id=$selected[1]
		lp show --url $id
		echo "Username: $selected[2]"
		lp show --password $id | xclip
		#lp show --clip --password $id
		echo "Password copied to clipboard"
	else
		return $ret
	fi
}

