
local here=${0:h}
source $here/lib.zsh-theme

# =============
#    $PROMPT
# =============

# Status:
# - was there an error
# - am I root
# - are there background jobs?
function _prompt-status() {
	local symbols
	if [[ -n $POWERLINE ]]; then
		[[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
		[[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
		[[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"
	else
		[[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}X"
		[[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}Z"
		[[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}B"
	fi
	_prompt-bg-fg black default "$symbols"
}

# --- Build Prompt ---
build_prompt() {
	_prompt-start
	PROMPT_BG='NONE'
	_prompt-bg black
	_prompt-status
	_hostinfo
	_dir-permission
	_prompt-end
}


# =============
#    $RPROMPT
# =============

function _rprompt-git() {
	_git-check || return
	_git-blacklist && return
	_rprompt-bg black
	_git-branch
	_git-commits
}

# --- Right Prompt Elapsed Time ---
function _rprompt-time() {
	_rprompt-bg-fg blue white $(_elapsed-time)
}

# --- Build Right Prompt ---
build_rprompt() {
	_rprompt-start
	_rprompt-git
	_rprompt-time
}

