
# vi: syntax=sh

# --- Locale Environment Variables ---
# Store original values
export LANGUAGE_orig="$LANGUAGE"
export LC_ALL_orig="$LC_ALL"
export LANG_orig="$LANG"
# Set in priority order:
export LANGUAGE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# --- Set Environment Variables ---
export TERM=xterm-256color
export EDITOR=vim
export PAGER='less -r'
export MANPAGER='vim -c MANPAGER -'

# --- Bash Settings ---
export HISTCONTROL=ignoreboth:erasedups

# --- Display ---
export DISPLAY_orig="$DISPLAY"

# Check if WSL
if (grep -qE 'Microsoft|WSL' /proc/version); then
	export DISPLAY=':0.0'
	if (which zsh &> /dev/null); then
		cd ~
		exec zsh
	fi
fi

