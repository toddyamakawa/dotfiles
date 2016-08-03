
# --- Widget ---
zle -N magic-enter

# --- Functions ---

# Runs everytime enter is pressed
function magic-enter() {
	set-title-buffer
	[[ -f ~/.DISPLAY ]] && export DISPLAY=$(cat ~/.DISPLAY)
	[[ -f ${TMUX%%,*} ]] && tmux set-environment DISPLAY $DISPLAY
	[[ -z $BUFFER ]] && zle clear-screen || zle accept-line
}

# Set title to $BUFFER
function set-title-buffer() {
	print -Pn "\e]0;$BUFFER\a"
}

# --- Key Binding ---
bindkey -M viins "^M" magic-enter

