
# --- Set Environment Variables ---
export DISPLAY_orig="$DISPLAY"
export PAGER='less -r'
export TERM=xterm-256color

# --- Unset Environment Variables ---
unset LESS

# --- Terminal Line Settings ---
# Disable XON/XOFF flow control
# Fixes Ctrl-s causing Vim to hang
stty -ixon

