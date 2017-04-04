
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
	PROMPT_SEPARATOR=$'\ue0b0'
	RPROMPT_SEPARATOR=$'\ue0b2'
}


# ========================
#    PROMPT PERFORMANCE
# ========================
function prompt_performance() {
	local start_ms=$(date +%s%3N)
	build_prompt > /dev/null
	echo "build_prompt: $(($(date +%s%3N)-$start_ms))"
	start_ms=$(date +%s%3N)
	build_rprompt > /dev/null
	echo "build_rprompt: $(($(date +%s%3N)-$start_ms))"
}


# =============
#    $PROMPT
# =============

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
# BG Red: Bad permissions
# BG Magenta: vicmd mode
function prompt_dir() {
	local p=${PWD/$HOME/\~} bg=blue
	[[ $PWD =~ $(whoami) ]] || bg=cyan
	permission=$(prompt_permission)
	[[ -n $permission ]] || bg=red
	[[ $KEYMAP == vicmd ]] && bg=magenta
	prompt_bg_fg $bg white $permission${p##*/}
	#prompt_bg_fg $bg white $permission$(prompt_gitdir)
}

# --- Git Directory ---
function prompt_gitdir() {
	local gitdir=$(git rev-parse --git-dir 2>/dev/null)
	gitdir=$(readlink -f $gitdir 2>/dev/null)
	local githead=$(dirname ${gitdir%.git} 2>/dev/null)
	echo ${PWD##$githead/}
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

# --- Build Prompt ---
build_prompt() {
	RETVAL=$?
	PROMPT_BG='NONE'
	prompt_status
	prompt_host
	prompt_dir
	prompt_end
}

PROMPT='$(build_prompt)'


# =============
#    $RPROMPT
# =============

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

function rprompt_git_commits() {
	local stat
	stat=$(git status -sb)
	local ahead=$(echo $stat | sed -n '1s/.*ahead \([0-9]\+\).*/\1/p')
	local behind=$(echo $stat | sed -n '1s/.*behind \([0-9]\+\).*/\1/p')
	[[ -n $ahead ]] && rprompt_fg yellow " +$ahead"
	[[ -n $behind ]] && rprompt_fg red " -$behind"
}

function rprompt_git() {

	# Check if Git directory
	git rev-parse --is-inside-work-tree &>/dev/null || return

	# Check if blacklist
	local blacklist url=$(git config --get remote.origin.url 2>/dev/null)
	blacklist+=(ssh://hw-gerrit.nahpc.arm.com:29418/systems/porter)
	blacklist+=(ssh://ds-gerrit.euhpc.arm.com:29418/svos/linux)
	[[ -n ${blacklist[(r)$url]} ]] && return

	# Color Git branch name
	local fg=green branch=$(git rev-parse --abbrev-ref HEAD)
	git rev-parse @{u} &>/dev/null || fg=cyan
	git diff-index --quiet HEAD || fg=red
	rprompt_bg_fg black $fg $branch

	# Get ahead/behind commits
	[[ -n $url ]] || return
	rprompt_git_commits
}

# --- Get Milliseconds ---
start_ms=$(date +%s%3N)
function preexec() { start_ms=$(date +%s%3N); }
function precmd() {
	elapsed_ms=$(($(date +%s%3N)-$start_ms))
	#[[ $elapsed_ms -gt 300000 ]] && zenity --info --text "DONE\n$MAGIC_ENTER_BUFFER"
	#[[ -n $MAGIC_NOTIFY ]] && [[ $SECONDS -gt 300 ]] && zenity --info --text "DONE\n$MAGIC_ENTER_BUFFER"
}

# --- Right Prompt Elapsed Time ---
function rprompt_time() {
	rprompt_bg_fg blue white $(printf "%0.3f" $(($elapsed_ms/1000.0)))
}

# --- Right Prompt Background ---
function rprompt_bg() {
	local bg="%{%K{$1}%}"
	echo -n "%F{$1}%}$RPROMPT_SEPARATOR"
	echo -n ${bg/\%K\{reset\}/%k}
}

# --- Right Prompt Foreground ---
function rprompt_fg() { prompt_fg $@; }

# --- Right Prompt End ---
function rprompt_end() {
	#[[ $KEYMAP == vicmd ]] && prompt_bg_fg black white || prompt_bg_fg reset reset
}

# --- Build Right Prompt ---
build_rprompt() {
	rprompt_git
	rprompt_time
}

RPROMPT='$(build_rprompt)'

