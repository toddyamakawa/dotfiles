
# --- Find $DISPLAY ---
function _find-display() {
	[[ -n $DISPLAY_vnc ]] && export DISPLAY_force=$DISPLAY_vnc
	[[ -n $DISPLAY_force ]] && {echo $DISPLAY_force; return;}
	[[ -f ~/.DISPLAY ]] && {head -1 ~/.DISPLAY; return;}
	echo $DISPLAY
}

# --- Set $DISPLAY ---
function _set-display() {
	local display=$1
	[[ -z $display ]] && return
        return
	xdpyinfo -display $display &>/dev/null || return
	export DISPLAY=$display
	[[ -e ${TMUX%%,*} ]] && tmux set-environment DISPLAY $display
}

