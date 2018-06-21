
# =============
#    PREEXEC
# =============
# Executed just after a command has been read and is about to be executed.

function preexec() {
	_set-display $(_find-display)
	_set-powerline

	# Enable tmux monitor
	_tmux-monitor on

	# Start timer
	unset elapsed_ms
	start_ms=$(_current-ms)
}


# ============
#    PRECMD
# ============
# Executed before each prompt. Note that precommand functions are not re-executed simply because the command line is redrawn.
# e.g. when a notification about an exiting job is displayed.

function precmd() {
	# Record elapsed time
	elapsed_ms=${elapsed_ms-$(($(date +%s%3N)-$start_ms))}

	# Disable tmux monitor
	_tmux-monitor off

	#[[ -e ${TMUX%%,*} ]] && tmux refresh-client

	# TODO: Fix MAGIC_ENTER_BUFFER
	#_autonotify
}

