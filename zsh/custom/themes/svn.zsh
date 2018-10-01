
# --- Check SVN Directory ---
function _svn-check() {
	[[ -d .svn ]]
}

# --- Get SVN URL ---
# TODO: Make it work
function _svn-url() {
	svn info | awk '/^URL/ {print $2}'
}

