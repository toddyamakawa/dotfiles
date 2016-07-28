
# --- Module Load ---
mload gnu/tmux/2.1



# --- Aliases ---

# Force 256 color support
alias tmux='tmux -2'

# Print Information
alias tprint='tmux display-message -p'
alias tlayout="tprint '#{window_layout}'"

# List Information
alias tls="tmux list-sessions -F '#{session_id} [#{session_windows} windows] #{session_name}'"
alias tll="tmux list-windows -a -F '#{session_id} #{session_name}:#{window_index} #{window_name} #{pane_current_path}'"
alias tpanes="tmux list-panes -a -F '#{pane_id} #{session_name}:#{window_index}.#{pane_index} #{window_name} #{pane_current_path}'"

alias tsave="tmux list-panes -a -F '#{session_name} #{window_index} #{window_name} #{pane_current_path} #{window_layout}'"

# Show Environment
alias tenv='tmux show-environment'

# Attach Session
alias ta='tmux attach'
# New Session
alias tnew='tmux new -s'
# Open Session
alias topen='tmux attach -t'
# Switch Session
alias tsession='tmux switch-client -t'
alias ts='tmux switch-client -t'
# Last Session
alias tsl='tmux switch-client -l'

# List Keys
alias tkeys='tmux list-keys'
alias tkeysvi='tmux list-keys -t vi-copy'


# --- Functions ---

# Split Window
function tsplit() {
	tmux split-window -d
	tmux kill-pane -a
	tmux split-window -dv -l 6
	tmux split-window -dh
}

