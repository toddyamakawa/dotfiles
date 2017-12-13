
# --- Set Environment Variables ---
export PAGER='less -r'
export TERM=xterm-256color

# --- Setup Display ---
mkdir -p $HOME/display
echo $DISPLAY > $HOME/display/$DISPLAY
export DISPLAY_orig="$DISPLAY"

# --- Terminal Line Settings ---
# Disable XON/XOFF flow control
# Fixes Ctrl-s causing Vim to hang
stty -ixon 2>/dev/null

