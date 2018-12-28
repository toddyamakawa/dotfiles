
local here=${0:h}

# --- Aliases ---

# Force 256 color support
#alias tmux='tmux -2'

# Save/Restore Session
alias tsave="$here/tsave.zsh"
function trestore() { echo tmux source-file $1; }

# Print Information
alias tprint='tmux display-message -p'
alias tlayout="tprint '#{window_layout}'"
alias twidth='tmux resize-pane -x'
alias theight='tmux resize-pane -y'

# List Information
alias tls="tmux list-sessions -F '#{session_id} [#{session_windows} windows] #{session_name}'"
alias tll="tmux list-windows -a -F '#{session_id} #{session_name}:#{window_index} #{window_name} #{pane_current_path}'"
alias tpanes="tmux list-panes -a -F '#{pane_id} #{session_name}:#{window_index}.#{pane_index} #{window_name} #{pane_current_path}'"

# Show Environment
alias tenv='tmux show-environment'

# Attach Session
alias ta='tmux attach'

# Last Session
alias tsl='tmux switch-client -l'

# List Keys
alias tkeys='tmux list-keys'
alias tkeysvi='tmux list-keys -t vi-copy'

# Buffer
function tcopy () {
	tmux set-buffer $($@)
}
alias -g tpaste='tmux show-buffer'


# --- Functions ---

# Split Window
function tsplit() {
	tmux split-window -d
	tmux kill-pane -a
	tmux split-window -dv -l 6
	tmux split-window -dh
}

# New Session
function tnew() {
	local name="${1?usage: $0 <session_name>}"
	if [[ -n $TMUX && ! -e ${TMUX%%,*} ]]; then
		unset TMUX TMUX_PANE
	fi
	tmux new-session -d -s "$name"
	ts "$name"
}

# Search for tmux pane using pid
function tps() {
	local pid=${1?pid undefined} pane_id
	pane_id=$(ps hew $pid | sed 's/^.*TMUX_PANE=\(%[0-9]\+\).*/\1/')
	tmux display-message -t $pane_id -p '#{session_name}.#{window_index}.#{pane_index} #{pane_id}'
}

# TODO: Implement this function
# Figure out how tmux-fingers seemlessly swaps panes
# Run command and show result in current pane
function tcmd() {
	local cmd="$@"
}

# --- Open/Switch Session ---
function ts() {
	[[ -n $TMUX ]] && tmux switch-client -t $1 || tmux attach -t $1
}
function _ts-fzf() {
	# TODO: Implement this
}
function _ts() {
	session=$(tmux list-sessions -F "#{session_name}':#{session_id} [#{session_windows} windows]#{?session_attached, (attached),}'")
	_arguments "*:session:(($session))"
}
compdef _ts ts

