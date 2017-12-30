
local here=${0:h}
source $here/lib.zsh-theme

# =============
#    $PROMPT
# =============

# --- Host/LSF ---
# FG White: Default
# FG Green: tmux is active
# FG Yellow: Interactive LSF shell
function prompt_host() {
	local fg=white host='%m'
	[[ -n $LSB_BATCH_JID ]] && { fg=yellow; host=$LSB_BATCH_JID; }
	[[ -e ${TMUX%%,*} ]] && fg=green
	prompt_fg $fg "%n@$host"
}

# --- Path ---
# Use Blue for paths with username
# Use Cyan for paths without username
function prompt_path() {
	local p=${PWD/$HOME/\~} fg=blue
	[[ $PWD =~ $(whoami) ]] || fg=cyan
	#permission=$(prompt_permission)
	#[[ -n $permission ]] || bg=red
	#[[ $KEYMAP == vicmd ]] && bg=magenta
	prompt_fg $fg $permission${p##*/}

}

# --- Vi-Mode $ ---
function prompt_vimode() {
	[[ $KEYMAP == vicmd ]] && echo "$cyan_bold\$" || echo "$blue_bold\$"
}

# --- Build Prompt ---
build_prompt() {
	prompt_start
	PROMPT_BG='NONE'

	#prompt_status
	prompt_bg black
	prompt_host

	_dir-permission
	prompt_end
}

# --- Pass/Fail Faces ---
prompt_pass="$green_bold:)"
prompt_fail="$red_bold:("

# --- Define $PROMPT ---
PROMPT="$(prompt_host) "
PROMPT+='$(prompt_permission) '
PROMPT+='$(prompt_path) '
PROMPT+="%(?.$prompt_pass.$prompt_fail)"
PROMPT+="${blue_bold}]"
PROMPT+='$(prompt_vimode)'
PROMPT+="${no_color} "

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
	rprompt_bg_fg blue white $(_elapsed-time)
}

# --- Build Right Prompt ---
build_rprompt() {
	rprompt_start
	rprompt_git
	rprompt_time
}

RPROMPT='$(build_rprompt)'

