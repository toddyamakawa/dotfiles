
# --- Module Load ---
mload gnu/tmux/2.1

# --- Aliases ---

# Force 256 color support
alias tmux='tmux -2'

# List Sessions
alias tlist='tmux ls'
alias tls='tmux ls'
# Attach Session
alias ta='tmux attach'
# New session
alias tnew='tmux new -s'
# Open session
alias topen='tmux attach -t'
# Switch Session
alias tsession='tmux switch-client -t'
alias ts='tmux switch-client -t'
# Last session
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

