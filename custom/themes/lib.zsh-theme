
# =====================
#    PROMPT SETTINGS
# =====================

# --- Redraw on Resize ---
function TRAPWINCH() {
  zle && zle reset-prompt
}

# --- Redraw on Keymap Select ---
function zle-keymap-select() { zle reset-prompt; }
zle -N zle-keymap-select
zle -N edit-command-line

# --- Check Powerline ---
function _powerline() { xlsfonts |& grep -q powerline; }


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


# ==================
#    COLORIZATION
# ==================

# --- Prompt Background ---
function prompt_bg() {
	local bg="%{%K{$1}%}"
	echo -n ${bg/\%K\{reset\}/%k}
	if [[ $PROMPT_BG != 'NONE' && $PROMPT_BG != $1 ]]; then
		echo -n "%F{$PROMPT_BG}%}$PROMPT_SEPARATOR"
	fi
	PROMPT_BG=$1
}

# --- Prompt Foreground ---
function prompt_fg() {
	local fg="%{%F{$1}%}"
	echo -n ${fg/\%F\{reset\}/%f}
	shift && echo -n "$@"
}

# --- Prompt Background/Foreground ---
function prompt_bg_fg() {
	prompt_bg $1
	prompt_fg $2
	shift 2 && echo -n "$@"
}

# --- Prompt End ---
function prompt_end() {
	prompt_bg_fg reset reset
	_powerline || echo -n "$no_color "
}

# --- Right Prompt Background ---
function rprompt_bg() {
	local bg="%{%K{$1}%}"
	echo -n "%F{$1}%}$RPROMPT_SEPARATOR"
	echo -n ${bg/\%K\{reset\}/%k}
}

# --- Right Prompt Foreground ---
function rprompt_fg() { prompt_fg $@; }

# --- Right Prompt Background/Foreground ---
function rprompt_bg_fg() {
	rprompt_bg $1
	rprompt_fg $2
	shift 2 && echo -n "$@"
}

