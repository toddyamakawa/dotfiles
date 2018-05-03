#!/usr/bin/env zsh

# TODO: Finish writing this file

# Git
if git rev-parse --is-inside-work-tree &> /dev/null; then
	#git -C $(git rev-parse --show-toplevel) ls-files | sed -e 's/^/$(git rev-parse --show-toplevel)\//'
	git ls-files
fi

# List files
function zsh-files() {
	echo $1*(.) | xargs -n 1
}

# List directories
function zsh-dirs() {
	echo $1*(/) 2>/dev/null
}

function zsh-find() {
	local -U dirs
	zsh-files $1
	echo
	dirs=($(zsh-dirs $1))
	for d in $dirs; do
		zsh-files $d/
		echo
		dirs+=($(zsh-dirs $d/))
	done
}

echo
zsh-find

