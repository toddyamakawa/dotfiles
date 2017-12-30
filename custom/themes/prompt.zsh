
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


# =========================
#    POWERLINE FUNCTIONS
# =========================

# --- Check Powerline ---
function _powerline() { xlsfonts |& command grep -q powerline; }


# ===========================
#    LEFT PROMPT FUNCTIONS
# ===========================

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
	shift && echo -n "${fg/\%F\{reset\}/%f}$@"
}

# --- Prompt Background/Foreground ---
function prompt_bg_fg() {
	prompt_bg $1
	shift && prompt_fg $@
}

# --- Prompt Start ---
function prompt_start() {
	RETVAL=$?
	if _powerline; then
		local LC_ALL="" LC_CTYPE="en_US.UTF-8"
		PROMPT_SEPARATOR=$'\ue0b0'
		RPROMPT_SEPARATOR=$'\ue0b2'
	else
		PROMPT_SEPARATOR=' '
		RPROMPT_SEPARATOR=' '
	fi
}

# --- Prompt End ---
function prompt_end() {
	prompt_bg_fg reset reset
	_powerline || echo -n "$no_color "
}


# ============================
#    RIGHT PROMPT FUNCTIONS
# ============================

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
	shift && rprompt_fg $@
}

# --- Right Prompt Start ---
function rprompt_start() {
	if _powerline; then
		local LC_ALL="" LC_CTYPE="en_US.UTF-8"
		PROMPT_SEPARATOR=$'\ue0b0'
		RPROMPT_SEPARATOR=$'\ue0b2'
	else
		PROMPT_SEPARATOR=' '
		RPROMPT_SEPARATOR=' '
	fi
}

# --- Right Prompt End ---
function rprompt_end() {
	#[[ $KEYMAP == vicmd ]] && prompt_bg_fg black white || prompt_bg_fg reset reset
}

