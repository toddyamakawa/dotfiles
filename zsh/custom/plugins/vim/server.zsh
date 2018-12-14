
# List Servers
alias vls='vim --serverlist'

# Open New Server
function vstart() {
	local servername
	if [[ -e ${TMUX%%,*} ]]; then
		servername=$(tmux display-message -p '#{session_name}.#{window_index}.#{pane_index}')
	else
		servername=$(basename ${1?no file specified})
	fi
	vim --servername $servername $@
}

# Send Files to Server
# vsend <server> [FILES]
function vsend() {
	local servername=$1
	shift
	echo vim --servername $servername --remote $@
	vim --servername $servername --remote $@
}

# Completion for vsend()
function _vsend() {
	_arguments \
		"1:server:(($(vim --serverlist)))" \
		"*:files:_files"
}
compdef _vsend vsend

