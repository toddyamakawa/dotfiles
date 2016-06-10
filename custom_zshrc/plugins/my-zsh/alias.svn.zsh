
# --- SVN Modules ---
alias svnload162='mload tigris/subversion/1.6.2'
alias svnload1613='mload apache/subversion/1.6.13'
alias svnload173='mload apache/subversion/1.7.3'
alias svnload1811='mload apache/subversion/1.8.11'

# --- Default SVN ---
svnload1811

# --- Find SVN Version ---
function svnver() {
	local version prev_version versions
	versions=('tigris/subversion/1.6.2')
	versions+='apache/subversion/1.7.3'
	versions+='apache/subversion/1.8.11'
	for version in $versions; do
		mrun - +core +$version svn info &> /dev/null || continue
		echo $version
	done
}

# --- Load SVN Version ---
alias svnload='mload $(svnver | head -n 1)'

# --- Quick Checkout ---
function svnco() {
	local temp=$(mktemp -d)/${1##*/}
	svn checkout -q $1 $temp
	[[ -n $2 ]] && dest=$2 || dest='.'
	mv $temp $dest
}

