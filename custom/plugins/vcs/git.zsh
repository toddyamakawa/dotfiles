
# --- Git Pull/Rebase ---
function gpull() {
	git stash
	git pull --rebase
	git stash pop
}

