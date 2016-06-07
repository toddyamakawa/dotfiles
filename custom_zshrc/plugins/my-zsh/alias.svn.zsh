
# --- SVN Modules ---
alias svnload162='mload tigris/subversion/1.6.2'
alias svnload1613='mload apache/subversion/1.6.13'
alias svnload173='mload apache/subversion/1.7.3'
alias svnload1811='mload apache/subversion/1.8.11'

# --- Default SVN ---
svnload1811

function svnver() {
	local version prev_version versions
	#local versions=$(module avail */subversion 2>&1 | \grep subversion)
	#local versions=$(mgrep */subversion | awk1)
	versions='tigris/subversion/1.6.2'
	versions+=' apache/subversion/1.7.3'
	versions+=' apache/subversion/1.8.11'
	for version in $versions; do
		module unload $prev_version
		prev_version=$version
		module load $version &>/dev/null || continue
		svn info &>/dev/null || continue
		echo $version
	done
}

alias svnload='mload $(svnver | head -n 1)'

