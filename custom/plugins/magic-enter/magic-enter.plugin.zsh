
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

# Set title
function set-title() {
	print -Pn "\e]0;$@\a"
}

# Set title to $TITLE or $BUFFER
function set-title-buffer() {
	[[ -n $TITLE ]] && set-title $TITLE || set-title $BUFFER
}

# --- Key Binding ---
bindkey -M viins "^M" magic-enter

