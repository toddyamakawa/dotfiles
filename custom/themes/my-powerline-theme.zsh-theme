
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

function rprompt_git_branch() {
	local fg=green
	local branch=$(git rev-parse --abbrev-ref HEAD)
	git rev-parse @{u} &>/dev/null || fg=cyan
	git diff-index --quiet HEAD || fg=red
	rprompt_bg_fg black $fg $branch
}

function rprompt_git_commits() {
	git rev-parse @{u} &>/dev/null || return
	local stat
	stat=$(git status -sb)
	local ahead=$(echo $stat | sed -n 's/.*ahead \([0-9]\+\).*/\1/p')
	local behind=$(echo $stat | sed -n 's/.*behind \([0-9]\+\).*/\1/p')
	[[ -n $ahead ]] && rprompt_fg yellow " +$ahead"
	[[ -n $behind ]] && rprompt_fg red " -$behind"
}

function rprompt_git() {
	git rev-parse --git-dir &>/dev/null || return
	rprompt_git_branch
	rprompt_git_commits
}

#function rprompt_elapsed_time() {
#	echo "${blue}$SECONDS${no_color}"
#	[[ -n $MAGIC_NOTIFY ]] && [[ $SECONDS -gt 300 ]] && zenity --info --text "DONE\n$MAGIC_ENTER_BUFFER"
#}

function rprompt_time() {
	local sec=$SECONDS
	rprompt_bg_fg blue white $sec
}

# --- Build Right Prompt ---
build_rprompt() {
	#RPROMNPT_BG='NONE'
	RPROMNPT_BG=$PROMPT_BG
	rprompt_git
	rprompt_time
}

RPROMPT='$(build_rprompt)'
#RPROMPT=''
