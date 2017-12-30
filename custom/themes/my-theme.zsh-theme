
local here=${0:h}
source $here/lib.zsh-theme

# =============
#    $PROMPT
# =============

# Status:
# - was there an error
# - am I root
# - are there background jobs?
function prompt_status() {
	local symbols
	if _powerline; then
		[[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
		[[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
		[[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"
		[[ -n "$symbols" ]] && prompt_bg_fg black default && echo -n "$symbols"
	else
		[[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}X"
		[[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}Z"
		[[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}B"
		[[ -n "$symbols" ]] && prompt_bg_fg black default && echo -n "$symbols"
	fi
}

# --- Build Prompt ---
build_prompt() {
	prompt_start
	PROMPT_BG='NONE'
	prompt_bg black
	prompt_status
	prompt_host
	_dir-permission
	prompt_end
}


# =============
#    $RPROMPT
# =============

function rprompt_git() {
	_git-check || return
	_git-blacklist && return
	rprompt_bg black
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

