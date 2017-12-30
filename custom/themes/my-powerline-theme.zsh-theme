
local here=${0:h}
source $here/lib.zsh-theme

# ========================
#    PROMPT PERFORMANCE
# ========================
function pperf() {
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

# Status:
# - was there an error
# - am I root
# - are there background jobs?
function prompt_status() {
	local symbols
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
	local access=$(stat -c %a . 2>/dev/null) || return
	local user=$default group=$default world=$default

	# User permission
	[[ $(whoami) == $(stat -c %U . 2>/dev/null) ]] || user=red
	prompt_fg $user $access[-3]

	# Group permission
	groups | grep -q $(stat -c %G . 2>/dev/null) || group=red
	#[[ $(whoami) == $(stat -c %G .) ]] && group=magenta
	prompt_fg $group $access[-2]

	# World permission
	prompt_fg $world "$access[-1] "
}

# --- Build Prompt ---
build_prompt() {
	prompt_start
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

function rprompt_git() {
	_git-check || return
	_git-blacklist && return
	_git-branch
	_git-commits
}

# --- Right Prompt Elapsed Time ---
function rprompt_time() {
	rprompt_bg_fg blue white $(elapsed_time)
}

# --- Build Right Prompt ---
build_rprompt() {
	rprompt_start
	rprompt_git
	rprompt_time
}

RPROMPT='$(build_rprompt)'

