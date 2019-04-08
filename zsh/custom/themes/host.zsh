
# --- Host/LSF ---
# FG White: Default
# FG Green: tmux is active, hide hostname
# FG Yellow: Interactive LSF shell
function _hostinfo() {
	local fg=white host='@%m'
	[[ -n $LSB_BATCH_JID ]] && { fg=yellow; host="@$LSB_BATCH_JID"; }
	[[ -e ${TMUX%%,*} ]] && { fg=green; host=""; }
	_prompt-fg $fg "%n$host"
}

