
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

# --- Aliases ---
alias sstat='svn stat --ignore-externals'
alias scm='svn commit -m'
alias smerge='svn update --ignore-externals && svnr merge'
alias sswitch='svnr switch'

# --- Global Aliases ---
alias -g -- -nox='--ignore-externals'

# --- SVN Command using Relative Path ---
function svnr() {
	local root=$(svn info | awk '/^Repository Root:/{print $NF}')
	local cmd=$1 relative=$2
	[[ -n $relative ]] && shift 2 || shift
	echo svn $cmd $root/$relative $@
	svn $cmd $root/$relative $@
}

# --- Quick Checkout ---
function svnco() {
	local temp=$(mktemp -d)/$(basename $1)
	svn checkout -q $1 $temp
	[[ -n $2 ]] && dest=$2 || dest='.'
	mv $temp $dest
}

