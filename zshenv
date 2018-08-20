
# --- Set Environment Variables ---
export PAGER='less -r'
export TERM=xterm-256color

# --- Display Setup ---
if [[ -n $DISPLAY ]]; then
	grep ${DISPLAY} $HOME/.DISPLAY &>/dev/null || echo $DISPLAY >> $HOME/.DISPLAY
fi
export DISPLAY_orig="$DISPLAY"
[[ -n $VNCDESKTOP ]] && export DISPLAY_vnc=$DISPLAY

# --- Terminal Line Settings ---
# Disable XON/XOFF flow control
# Fixes Ctrl-s causing Vim to hang
stty -ixon 2>/dev/null
