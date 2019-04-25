
# https://manpages.debian.org/testing/lastpass-cli/lpass.1.en.html

# --format
# %ai: account id
# %an: account name
# %aN: account name including path
# %au: account user
# %ap: account password
# %am: account modification time
# %aU: account last touch time
# %as: account share name
# %ag: account group name
# %al: account URL
# %fn: field name (for show)
# %fv: field value (for show)


# --- Environment ---
# An agent process handle commands for the user without asking for a password.
# $LPASS_AGENT_TIMEOUT environment variable
# - Agents quits after one hour if not set
# - Agent never quits if set to 0
# - Agent quits after number of seconds if set
LPASS_AGENT_TIMEOUT=0

# The agent is disabled if $LPASS_AGENT_DISABLE is set to 1
unset LPASS_AGENT_DISABLE

# Commands that support -c or --clip copies output using
# - xclip(1) or xsel(1) on X11-based systems
# - pbcopy(1) on OSX
# - putclip on Cygwin.
# Clipboard command an be overridden by $LPASS_CLIPBOARD_COMMAND
unset LPASS_CLIPBOARD_COMMAND


# --- Aliases ---
alias lp='lpass'
alias lastpass='lpass'

alias lpstat='lpass status'
alias lplogin='lpass login'
alias lplogout='lpass logout'
alias lpshow='lpass show'

# --- Search for LastPass Info ---
function _lpfzf() {
	lpass status --quiet || return $?
	local ret selected id

	# Select site with fzf
	selected=$(
		lpass ls --long | \
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
		lpass show --url $id
		echo "Username: $selected[2]"
		lpass show --password $id | xclip
		#lpass show --clip --password $id
		echo "Password copied to clipboard"
	else
		return $ret
	fi
}

