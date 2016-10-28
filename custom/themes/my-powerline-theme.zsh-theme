
# vim:ft=zsh

prompt_no_bg="%{%k%}"
prompt_no_fg="%{%f%}"

# Special Powerline characters
() {
	local LC_ALL="" LC_CTYPE="en_US.UTF-8"
	SEGMENT_SEPARATOR=$'\ue0b0'
}

# --- Prompt Background/Foreground ---
function prompt_bg() {
	if [[ $CURRENT_BG == 'NONE' || $CURRENT_BG == $1 ]]; then
		echo -n "%{%K{$1}%}"
	else
		echo -n "%{%K{$1}%F{$CURRENT_BG}%}$SEGMENT_SEPARATOR"
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
}

prompt_end() {
	echo -n "%{%F{$CURRENT_BG}%}$prompt_no_bg$SEGMENT_SEPARATOR"
	prompt_fg reset
}

# --- Host/LSF ---
function prompt_host() {
	prompt_bg black
	prompt_fg white "%n@"
	if [[ -n $LSB_BATCH_JID ]]; then
		prompt_fg yellow $LSB_BATCH_JID
	else
		prompt_fg white "%m"
	fi
}

# --- Directory ---
function prompt_dir() {
	local p=${PWD/$HOME/\~}
	prompt_fg default
	[[ $PWD =~ $(whoami) ]] && prompt_bg blue || prompt_bg cyan
	echo -n $c${p##*/}
}

# --- Permission ---
function prompt_permission() {
	local a=$(stat -c %a .)
	local u=$blue_bold$a[-3]
	local g=$blue_bold$a[-2]
	local o=$blue_bold$a[-1]
	[[ $(whoami) == $(stat -c %U .) ]] || u=$red_bold$a[-3]
	groups | grep -q $(stat -c %G .) || g=$red_bold$a[-2]
	[[ $(whoami) == $(stat -c %G .) ]] && g=$magenta_bold$a[-2]
	echo $u$g$o
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
	local symbols
	symbols=()
	[[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
	[[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
	[[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"
	[[ -n "$symbols" ]] && prompt_bg_fg black default && echo -n "$symbols"
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

