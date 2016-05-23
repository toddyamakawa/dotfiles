
# --- svn ---
alias svnload162='mload tigris/subversion/1.6.2'
alias svnload1613='mload apache/subversion/1.6.13'
alias svnload173='mload apache/subversion/1.7.3'
alias svnload1811='mload apache/subversion/1.8.11'
alias svnload=svnload162
svnload

function svnver() {
	local version prev_version
	local svn_versions=$(module avail */subversion 2>&1 | \grep subversion)
	for version in $svn_versions; do
		module unload $prev_version
		prev_version=$version
		module load $version &>/dev/null || continue
		svn info &>/dev/null || continue
		echo $version
	done
}

