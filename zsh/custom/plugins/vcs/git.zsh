
# --- Silver Searcher ---
function git-ag() {
	local pattern="$1"
	shift
	git ls-files -- "$@" | xargs -d "\n" ag -S "$pattern"
}

# --- Git Pull/Rebase ---
function gpull() {
	git stash
	git pull --rebase
	git stash pop
}

