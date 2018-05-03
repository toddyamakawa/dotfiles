
# =============
#    PREEXEC
# =============

# --- preexec() ---
function preexec() {
	_set-display $(_find-display)
	_set-powerline
	unset elapsed_ms
	start_ms=$(_current-ms)
}


# ============
#    PRECMD
# ============

# --- precmd() ---
# Record elapsed time
function precmd() {
	elapsed_ms=${elapsed_ms-$(($(date +%s%3N)-$start_ms))}
	[[ -e ${TMUX%%,*} ]] && tmux refresh-client
	# TODO: Fix MAGIC_ENTER_BUFFER
	#_autonotify
}

