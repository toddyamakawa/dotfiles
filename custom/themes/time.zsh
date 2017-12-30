
# ===========
#    TIMER
# ===========

function current_ms() { date +%s%3N; }
function elapsed_time() { printf "%0.3f" $(($elapsed_ms/1000.0)); }

# Record start time
[[ -z $start_ms ]] && start_ms=$(current_ms)
function preexec() {
	set-display $(find-display)
	start_ms=$(current_ms)
}

# Record elapsed time
function precmd() {
	elapsed_ms=$(($(date +%s%3N)-$start_ms))
	[[ -e ${TMUX%%,*} ]] && tmux refresh-client
	# TODO: Fix MAGIC_ENTER_BUFFER
	#autonotify
}

# Automatic notification
ZSH_NOTIFY_CMD='^\s*(git|svn)'
ZSH_NOTIFY_TIME='300000'
function autonotify() {
	[[ $elapsed_ms -gt $ZSH_NOTIFY_TIME ]] || return
	[[ $MAGIC_ENTER_BUFFER =~ $ZSH_NOTIFY_CMD ]] || return
	zenity --info --text "DONE: $(elapsed_time) seconds\n$MAGIC_ENTER_BUFFER"
	tmux switch-client -t $(tmux display-message -p '#{session_id}') \; \
		select-window -t $(tmux display-message -p '#{window_id}') \; \
		select-pane -t $(tmux display-message -p '#{pane_id}')
}

