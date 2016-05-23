
# --- Module Load ---
mload gnu/tmux/2.1

# --- Aliases ---
alias tmux='tmux -2'
alias tnew='tmux new -s'
alias tlist='tmux ls'
alias tls='tlist'
alias topen='tmux attach -t'
alias tkeys='tmux list-keys'
alias tkeysvi='tmux list-keys -t vi-copy'

# --- Functions ---
tsplit() {
	tmux split-window -d
	tmux kill-pane -a
	tmux split-window -dv -l 6
	tmux split-window -dh
}

