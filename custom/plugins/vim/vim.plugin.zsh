
# --- Environment Variables ---
export EDITOR=vim
export MANPAGER="vim -c MANPAGER -"


# --- Aliases ---
alias vi=vim
alias vless="col -b | vim -c 'set ts=8 nomod nolist' -"
alias vman='vim -c MANPAGER -'
alias vmin='vim --noplugin'
alias vnone='vim -u NONE'
alias vdiff='vimdiff'
alias vswp='vim -r 2>&1'


# --- Functions ---

function vimls() {
	vswp | awk '/^[0-9]/{file=$2}/process ID:/{print $0, file}'
	#return
	#for file in $(vswp | awk '/^[0-9]/{file=$2}/process ID:/{print $3, file}'); do
		#pid=$(lsof -t $(echo $file)) || continue
		#echo a: $pid $file
	#done
}
#vimls

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

