
# --- Environment Variables ---
export EDITOR=vim
export MANPAGER="vim -c MANPAGER -"


# --- Aliases ---
alias vi="vim"
alias vless="col -b | vim -c 'set ts=8 nomod nolist' -"
alias vman='vim -c MANPAGER -'
alias vmin='vim --noplugin'
alias vnone='vim -u NONE'
alias vdiff='vimdiff'


# --- Functions ---

# Find tmux session with vim .swp file
function vtfind() {
	#pid=$(lsof -t $1 2>/dev/null)
	local pid=$(lsof -t $1)
	echo "PID: $pid"
	local pts=$(ps -o tty= -p $pid)
	echo "PTS: $pts"
	session=$(tmux list-panes -a -F '#{session_name}:#{window_index}.#{pane_index} #{pane_tty}' | grep $pts)
	echo $session
}

