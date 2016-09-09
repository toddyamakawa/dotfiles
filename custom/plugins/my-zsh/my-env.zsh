
# --- Environment Variables ---
export TERM=xterm-256color
export EDITOR=vim
export PAGER='less -r'
export MANPAGER="vim -c MANPAGER -"
unset LESS

# Print colors
function zsh_colors() {
	for color in RED YELLOW GREEN BLUE CYAN MAGENTA BLACK WHITE; do
		echo "$fg_bold[${(L)color}]BOLD $fg_no_bold[${(L)color}]$color"
	done
}

