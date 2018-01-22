
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


# --- Suffix Aliases ---

# Text files
alias -s err=vim
alias -s log=vim
alias -s output=vim
alias -s ts=vim
alias -s txt=vim

# Non-executable scripting files
alias -s pm=vim
alias -s vim=vim

# Data serialization files
alias -s cfg=vim
alias -s conf=vim
alias -s confg=vim
alias -s config=vim
alias -s html=vim
alias -s json=vim
alias -s xml=vim
alias -s yaml=vim
alias -s yml=vim

# C files
alias -s c=vim
alias -s h=vim

# Verilog files
alias -s v=vim
alias -s vh=vim
alias -s sv=vim
alias -s svh=vim


# --- Functions ---

# TODO: Clean up this function
function vimswp() {
	vim -r 2>&1 | awk '/^[0-9]/{file=$2}/process ID:/{print $0, file}'
}

# TODO: Make this function work
# Find tmux session with vim .swp file
function vtfind() {
	local -U pids
	vimswp | command grep -Po 'process ID: \K[0-9]+'
	#pids=(vimswp | command grep -Po 'process ID: \K[0-9]+')
	#for pid in $pids; do
		#echo "a $pid"
	#done
	#pid=$(lsof -t $1 2>/dev/null)
	#local pid=$(lsof -t $1)
	#echo "PID: $pid"
	#local pts=$(ps -o tty= -p $pid)
	#echo "PTS: $pts"
	#session=$(tmux list-panes -a -F '#{session_name}:#{window_index}.#{pane_index} #{pane_tty}' | grep $pts)
	#echo $session
}

