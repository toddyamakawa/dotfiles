
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
	xdpyinfo -display $display &>/dev/null || return
	export DISPLAY=$display
	[[ -e ${TMUX%%,*} ]] && tmux set-environment DISPLAY $display
}

# --- Check ~/.DISPLAY File ---
function _check-display-file() {
	local display
	while read -r display; do
		if ( xdpyinfo -display $display &>/dev/null ); then
			echo "\e[32mPASS\e[0m $display"
		else
			echo "\e[31mFAIL\e[0m $display"
		fi
	done < ~/.DISPLAY
}

