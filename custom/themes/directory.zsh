
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
	prompt_bg_fg $bg white $permission${p##*/}
	#prompt_bg_fg $bg white $permission$(prompt_gitdir)
}

# --- Permission ---
function _permission-ugo() {
	local default=white
	local access=$(stat -c %a . 2>/dev/null) || return
	local user=$default group=$default world=$default

	# User permission
	[[ $(whoami) == $(stat -c %U . 2>/dev/null) ]] || user=red
	prompt_fg $user $access[-3]

	# Group permission
	groups | grep -q $(stat -c %G . 2>/dev/null) || group=red
	#[[ $(whoami) == $(stat -c %G .) ]] && group=magenta
	prompt_fg $group $access[-2]

	# World permission
	prompt_fg $world "$access[-1] "
}

# --- Relative Git Directory ---
function _dir-git() {
	local gitdir=$(git rev-parse --git-dir 2>/dev/null)
	gitdir=$(readlink -f $gitdir 2>/dev/null)
	local githead=$(dirname ${gitdir%.git} 2>/dev/null)
	echo ${PWD##$githead/}
}

