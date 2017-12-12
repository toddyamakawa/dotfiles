
# --- Key Binding ---
# Beind enter to magic-enter widget
bindkey -M viins "^M" magic-enter
bindkey -M vicmd "^M" magic-enter


# --- Widget ---
# Create magic-enter widget
zle -N magic-enter


# --- Functions ---
function magic-enter() {
	set-title-buffer
	export MAGIC_ENTER_BUFFER="$BUFFER"
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

