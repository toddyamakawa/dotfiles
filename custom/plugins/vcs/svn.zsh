
# --- SVN Modules ---
alias svnload162='mload tigris/subversion/1.6.2'
alias svnload1613='mload apache/subversion/1.6.13'
alias svnload173='mload apache/subversion/1.7.3'
alias svnload1811='mload apache/subversion/1.8.11'
alias svnload194='mload apache/subversion/1.9.4'

# --- Default SVN ---
svnload194

# --- Find SVN Version ---
function svnver() {
	local version prev_version versions
	versions=('tigris/subversion/1.6.2')
	versions+='apache/subversion/1.7.3'
	versions+='apache/subversion/1.8.11'
	versions+='apache/subversion/1.9.4'
	for version in $versions; do
		mrun - +core +$version svn info &> /dev/null || continue
		echo $version
	done
}

# --- Load SVN Version ---
alias svnload='mload $(svnver | head -n 1)'

# --- Quick Checkout ---
function svnco() {
	local temp=$(mktemp -d)/$(basename $1)
	svn checkout -q $1 $temp
	[[ -n $2 ]] && dest=$2 || dest='.'
	mv $temp $dest
}

# --- Merge with Relative Path ---
function smerge() {
	local root=$(svn info | awk '/^Repository Root:/{print $NF}')
	svn update --ignore-externals
	echo svn merge $root/$1
	svn merge $root/$1
}

# --- Commit with Message ---
function scm() {
	svn commit -m "$@"
}

# --- Aliases ---
alias -g -- -nox='--ignore-externals'

