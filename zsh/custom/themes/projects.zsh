
# ==============================================================================
# PROJECTS
# ==============================================================================

function _projects-status() {
	[[ -d $PROJ_HOME ]] || return
	local star=$_ZSH_STAR_HOLLOW fg=red simcmd
	[[ -d $WORK_DIR ]] && star=$_ZSH_STAR_SOLID
	simcmd=$(\which sim_tb 2>/dev/null)
	[[ $simcmd -ef $PROJ_HOME/tools/shared/bin/sim_tb ]] && fg=green
	_prompt-fg $fg $star
}

