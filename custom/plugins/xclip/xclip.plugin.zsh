
# --- Module ---
mload xclip/xclip/0.12

# --- Copy/Paste ---
function copy() { eval "$@" | _xclip; }
function _xclip() {
	xclip
	[[ -e ${TMUX%%,*} ]] && tmux set-buffer "$(xclip -o)"
}
alias -g _paste='$(xclip -o)'
alias echop='echo Clipboard: _paste'

# --- Files/Directories ---
function clip() { copy readlink -f $1; echop; }
alias pwdc='copy pwd && echop'
alias cdp='echo_eval cd _paste'
alias cpp.='echo_eval cp _paste .'
alias lnsp='echo_eval ln -s _paste'

# --- LSF ---
alias bjobsp='echo_eval bjobs _paste'
alias bjobsup='echo_eval bjobsu _paste'
function bmodp() { echo_eval bmod "$@" _paste; }

# --- SVN ---
alias svncop='echo_eval svn co _paste'
alias svnlink='svn info | awk '"'"'/^URL/ {print $2}'"'"' | _xclip && echop'

# --- Meld ---
alias meldp='echo_eval meld $(_paste)'

