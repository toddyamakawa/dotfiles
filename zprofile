
# --- Get $_OSTYPE ---
export _OSTYPE
if ( grep "Red Hat" /etc/*-release &>/dev/null ); then
	_OSTYPE="REDHAT"
elif ( grep "Debian" /etc/*-release &>/dev/null ); then
	_OSTYPE="DEBIAN"
fi

