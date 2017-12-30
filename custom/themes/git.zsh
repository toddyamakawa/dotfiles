
# --- Right Prompt Foreground ---
function rprompt_fg() { prompt_fg $@; }

# --- Right Prompt Background/Foreground ---
function rprompt_bg_fg() {
	rprompt_bg $1
	rprompt_fg $2
	shift 2 && echo -n "$@"
}

function rprompt_git_commits() {
	local stat
	stat=$(git status -sb -uno)
	local ahead=$(echo $stat | sed -n '1s/.*ahead \([0-9]\+\).*/\1/p')
	local behind=$(echo $stat | sed -n '1s/.*behind \([0-9]\+\).*/\1/p')
	[[ -n $ahead ]] && rprompt_fg yellow " +$ahead"
	[[ -n $behind ]] && rprompt_fg red " -$behind"
}

function rprompt_git() {

	# Check if Git directory
	git rev-parse --is-inside-work-tree &>/dev/null || return

	# Check if blacklist
	local blacklist url
	url=$(git config --get remote.origin.url 2>/dev/null) || return
	blacklist+=(ssh://hw-gerrit.nahpc.arm.com:29418/systems/porter)
	blacklist+=(ssh://ds-gerrit.euhpc.arm.com:29418/svos/linux)
	blacklist+=(ssh://hw-gerrit.nahpc.arm.com:29418/cores/ares)
	blacklist+=(ssh://hw-gerrit.euhpc.arm.com:29418/systems/amis)
	[[ -n ${blacklist[(r)$url]} ]] && return

	# Color Git branch name
	local fg=green branch=$(git rev-parse --abbrev-ref HEAD)
	git rev-parse @{u} &>/dev/null || fg=cyan
	git diff-index --quiet HEAD || fg=red
	rprompt_bg_fg black $fg $branch

	# Get ahead/behind commits
	[[ -n $url ]] || return
	rprompt_git_commits
}

