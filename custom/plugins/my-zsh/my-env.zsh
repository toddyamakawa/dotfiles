
# --- Environment Variables ---
export TERM=xterm-256color
export PAGER='less -r'
unset LESS


# --- Terminal Line Settings ---

# Disable XON/XOFF flow control
stty -ixon


# --- Colors ---
function zsh_colors() {
	for color in RED YELLOW GREEN BLUE CYAN MAGENTA BLACK WHITE; do
		echo "$fg_bold[${(L)color}]BOLD $fg_no_bold[${(L)color}]$color"
	done
}

