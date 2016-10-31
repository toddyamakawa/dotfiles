
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

# Special Powerline characters
() {
	local LC_ALL="" LC_CTYPE="en_US.UTF-8"
	SEGMENT_SEPARATOR=$'\ue0b0'
}


# =============
#    $PROMPT
# =============

# --- Prompt Background/Foreground ---
function prompt_bg() {
	local bg="%{%K{$1}%}"
	echo -n ${bg/\%K\{reset\}/%k}
	if [[ $CURRENT_BG != 'NONE' && $CURRENT_BG != $1 ]]; then
		echo -n "%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
	fi
	CURRENT_BG=$1
}

function prompt_fg() {
	local fg="%{%F{$1}%}"
	echo -n ${fg/\%F\{reset\}/%f}
	shift && echo -n "$@"
}

function prompt_bg_fg() {
	prompt_bg $1
	prompt_fg $2
	shift 2 && echo -n "$@"
}

function prompt_end() {
	#[[ $KEYMAP == vicmd ]] && echo "$cyan_bold\$" || echo "$blue_bold\$"
	#prompt_bg_fg reset reset
	[[ $KEYMAP == vicmd ]] && prompt_bg_fg black white || prompt_bg_fg reset reset
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
function prompt_status() {
	local symbols
	symbols=()
	[[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
	[[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
	[[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"
	[[ -n "$symbols" ]] && prompt_bg_fg black default && echo -n "$symbols"
}

# --- Host/LSF ---
# BG Black: Default
# FG White: Default
# FG Green: tmux is active
# FG Yellow: Interactive LSF shell
function prompt_host() {
	local fg=white host='%m'
	[[ -n $LSB_BATCH_JID ]] && { fg=yellow; host=$LSB_BATCH_JID; }
	[[ -e ${TMUX%%,*} ]] && fg=green
	prompt_bg_fg black $fg "%n@$host"
}

# --- Directory ---
# BG Blue: Username in path
# BG Cyan: Username not in path
function prompt_dir() {
	local p=${PWD/$HOME/\~} bg=blue
	[[ $PWD =~ $(whoami) ]] || bg=cyan
	permission=$(prompt_permission)
	[[ -n $permission ]] || bg=red
	prompt_bg_fg $bg white $permission$c${p##*/}
}

# --- Permission ---
function prompt_permission() {
	local default=white
	local access=$(stat -c %a .) || return
	local user=$default group=$default world=$default

	# User permission
	[[ $(whoami) == $(stat -c %U .) ]] || user=red
	prompt_fg $user $access[-3]

	# Group permission
	groups | grep -q $(stat -c %G .) || group=red
	#[[ $(whoami) == $(stat -c %G .) ]] && group=magenta
	prompt_fg $group $access[-2]

	# World permission
	prompt_fg $world "$access[-1] "
}

## Main prompt
build_prompt() {
	RETVAL=$?
	CURRENT_BG='NONE'
	prompt_status
	prompt_host
	prompt_dir
	prompt_end
}

PROMPT='$(build_prompt)'

