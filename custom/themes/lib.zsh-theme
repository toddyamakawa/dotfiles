
# =====================
#    PROMPT SETTINGS
# =====================

# Redraw prompt on terminal resize
function TRAPWINCH() {
  zle && zle reset-prompt
}

# Redraw prompt on keymap select
function zle-keymap-select() { zle reset-prompt; }
zle -N zle-keymap-select
zle -N edit-command-line


# ===========
#    TIMER
# ===========

# Record start time
[[ -z $start_ms ]] && start_ms=$(date +%s%3N)
function preexec() { start_ms=$(date +%s%3N); }

# Record elapsed time
function precmd() {
	elapsed_ms=$(($(date +%s%3N)-$start_ms))
	#[[ $elapsed_ms -gt 300000 ]] && zenity --info --text "DONE\n$MAGIC_ENTER_BUFFER"
	#[[ -n $MAGIC_NOTIFY ]] && [[ $SECONDS -gt 300 ]] && zenity --info --text "DONE\n$MAGIC_ENTER_BUFFER"
}

# Calculate seconds
function elapsed_time() { printf "%0.3f" $(($elapsed_ms/1000.0)); }

