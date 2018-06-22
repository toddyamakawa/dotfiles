#!/usr/bin/env zsh

# Git files
function fzf-gitfiles() {
	if [[ -d $GIT_TOP ]]; then
		git -C $GIT_TOP ls-files | sed -e 's/^/$GIT_TOP\//'
	fi
}

# List files
function fzf-files() {
	local dir=${1-.}
	find $dir -maxdepth 1 -type f
}

# Recrusively list files, shallow first
function fzf-find() {
	local dir file here=${1-.}
	local -U dirs

	dirs=($here)

	while (( ${#dirs} != 0 )); do
		dir=$dirs[1]
		dirs[1]=()
		for file in $(ls $dir); do
			entry=$dir/$file
			[[ -f $entry ]] && echo $entry
			[[ -d $entry ]] && dirs+=($entry)
		done
	done
}

fzf-gitfiles
fzf-find

