
# --- Current Time (ms) ---
function _current-ms() { date +%s%3N; }
[[ -z $start_ms ]] && start_ms=$(_current-ms)

# --- Elapsed Time (ms) ---
function _elapsed-time() { printf "%0.3f" $(($elapsed_ms/1000.0)); }

# --- Automatic notification ---
ZSH_NOTIFY_CMD='^\s*(git|svn)'
ZSH_NOTIFY_TIME='300000'
function _autonotify() {
	[[ $elapsed_ms -gt $ZSH_NOTIFY_TIME ]] || return
	[[ $MAGIC_ENTER_BUFFER =~ $ZSH_NOTIFY_CMD ]] || return
	zenity --info --text "DONE: $(_elapsed-time) seconds\n$MAGIC_ENTER_BUFFER"
	tmux switch-client -t $(tmux display-message -p '#{session_id}') \; \
		select-window -t $(tmux display-message -p '#{window_id}') \; \
		select-pane -t $(tmux display-message -p '#{pane_id}')
}

