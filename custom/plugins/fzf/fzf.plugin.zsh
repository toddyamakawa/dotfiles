
# --- Source ---
source ~/.fzf.zsh


# --- Key Bindings ---

#bindkey -M vicmd '^[c' fzf-cd-widget

bindkey -M vicmd '^R' fzf-history-widget
bindkey -M viins '^R' fzf-history-widget

bindkey -M viins '^[[Z' fzf-magic-complete
bindkey -M viins '^[[Z' fzf-magic-complete


# --- Widget ---
# Create fzf-magic-complete widget
zle -N fzf-magic-complete
function fzf-magic-complete() {
	if [[ $LBUFFER =~ '^cd\b' ]]; then
		local cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
			-o -type d -print 2> /dev/null | cut -b3-"}"
		setopt localoptions pipefail 2> /dev/null
		local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse $FZF_DEFAULT_OPTS $FZF_ALT_C_OPTS" $(__fzfcmd) +m)"
		LBUFFER="${LBUFFER}$dir"
	else
		LBUFFER="${LBUFFER}$(__fsel)"
	fi
	local ret=$?
	zle redisplay
	typeset -f zle-line-init >/dev/null && zle zle-line-init
	return $ret
}


# --- Aliases ---
alias vif='vi $(fzf)'

