
# --- Check Git Directory ---
function _git-check() {
	git rev-parse --is-inside-work-tree &>/dev/null
}

# --- Get Git URL ---
function _git-url() {
	git config --get remote.origin.url 2>/dev/null
}

# --- Git Commits ---
function _git-commits() {
	local stat ahead behind
	_git-url > /dev/null || return
	stat=$(git status -sb -uno | head -1)
	ahead=$(echo $stat | sed -n 's/.*ahead \([0-9]\+\).*/ +\1/p')
	behind=$(echo $stat | sed -n 's/.*behind \([0-9]\+\).*/ -\1/p')
	_rprompt-fg yellow $ahead
	_rprompt-fg red $behind
}

# --- Check Blacklist ---
function _git-blacklist() {
	local blacklist url
	url=$(_git-url) || return
	blacklist+=(ssh://hw-gerrit.nahpc.arm.com:29418/systems/porter)
	blacklist+=(ssh://ds-gerrit.euhpc.arm.com:29418/svos/linux)
	blacklist+=(ssh://hw-gerrit.nahpc.arm.com:29418/cores/ares)
	blacklist+=(ssh://hw-gerrit.euhpc.arm.com:29418/systems/amis)
	[[ -n ${blacklist[(r)$url]} ]] && return
	return 1
}

# --- Git Branch ---
function _git-branch() {
	local fg=green branch=$(git rev-parse --abbrev-ref HEAD)
	git rev-parse @{u} &>/dev/null || fg=cyan
	git diff-index --quiet HEAD || fg=red
	_rprompt-fg $fg $branch
}

