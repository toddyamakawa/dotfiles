
# --- Check if Running in tmux ---
function _tmux-check() {
	[[ -e ${TMUX%%,*} ]]
}

# --- Refresh Client ---
function _tmux-refresh() {
	tmux refresh-client
}

# --- Active Window ---
function _tmux-window-active() {
	tmux display-message -p -t $TMUX_PANE '#{window_active}'
}

# --- Monitor Window ---
# $1=on/off
function _tmux-monitor() {
	_tmux-check && tmux set-window monitor-activity $1
}

