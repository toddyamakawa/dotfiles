
local here=${0:h}

# --- Module Load ---
mload gnu/tmux/2.5


# --- Aliases ---

# Force 256 color support
#alias tmux='tmux -2'

# Save/Restore Session
alias tsave="$here/tsave.zsh"
function trestore() { echo tmux source-file $1; }

# Print Information
alias tprint='tmux display-message -p'
alias tlayout="tprint '#{window_layout}'"

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
	local name="$1"
	tmux new-session -d -s "$name"
	ts "$name"
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
function _ts() {
	session=$(tmux list-sessions -F "#{session_name}':#{session_id} [#{session_windows} windows]#{?session_attached, (attached),}'")
	_arguments "*:session:(($session))"
}
compdef _ts ts

