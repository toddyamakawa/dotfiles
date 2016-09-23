
# --- Key Binding ---
# Beind enter to magic-enter widget
bindkey -M viins "^M" magic-enter


# --- Widget ---
# Create magic-enter widget
zle -N magic-enter


# --- Functions ---
# Runs whenever enter is pressed
function magic-enter() {
	SECONDS=0
	set-title-buffer
	set-display
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

# Set title to $TITLE or $BUFFER
function set-display() {
	[[ -f ~/.DISPLAY ]] && export DISPLAY=$(cat ~/.DISPLAY)
	[[ -f ${TMUX%%,*} ]] && tmux set-environment DISPLAY $DISPLAY
}

