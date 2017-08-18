
# --- Set Language ---
export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'

# --- Set Environment Variables ---
export DISPLAY_orig="$DISPLAY"
export PAGER='less -r'
export TERM=xterm-256color

# --- Unset Environment Variables ---
unset LESS

# --- Terminal Line Settings ---
# Disable XON/XOFF flow control
stty -ixon

