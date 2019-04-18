
# ==============================================================================
# PROJECTS
# ==============================================================================

function _projects-status() {
	[[ -d $PROJ_HOME ]] || return
	local star=$_ZSH_STAR_HOLLOW fg=red
	[[ -d $WORK_DIR ]] && star=$_ZSH_STAR_SOLID
	which sim_tb &>/dev/null && fg=green
	_prompt-fg $fg $star
}

