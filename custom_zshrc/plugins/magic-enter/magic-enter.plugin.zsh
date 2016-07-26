
# --- Widget ---
zle -N magic-enter

# --- Function ---
function magic-enter() {
	[[ -z $BUFFER ]] && zle clear-screen || zle accept-line
}

# --- Key Binding ---
bindkey -M viins "^M" magic-enter

