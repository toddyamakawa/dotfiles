
# --- Directory ---
# BG Blue: Username in path
# BG Cyan: Username not in path
# BG Red: Bad permissions
# BG Magenta: vicmd mode
function _dir-permission() {
	local p=${PWD/$HOME/\~} bg=blue
	[[ $PWD =~ $(whoami) ]] || bg=cyan
	permission=$(_permission-ugo)
	[[ -n $permission ]] || bg=red
	[[ $KEYMAP == vicmd ]] && bg=magenta
	p=$(basename ${p:gs/%/%%})
	_prompt-bg-fg $bg white $permission $p
}

# --- Permission ---
function _permission-ugo() {
	local access default=white
	local user=$default group=$default world=$default
	access=$(stat -c %a . 2>/dev/null) || return

	# User permission
	[[ $(whoami) == $(stat -c %U . 2>/dev/null) ]] || user=red
	_prompt-fg $user $access[-3]

	# Group permission
	[[ $(groups) =~ $(stat -c %G . 2>&1) ]] || group=red
	_prompt-fg $group $access[-2]

	# World permission
	_prompt-fg $world "$access[-1]"
}

# --- Relative Git Directory ---
function _dir-git() {
	local gitdir=$(git rev-parse --git-dir 2>/dev/null)
	gitdir=$(readlink -f $gitdir 2>/dev/null)
	local githead=$(dirname ${gitdir%.git} 2>/dev/null)
	echo ${PWD##$githead/}
}

