
# --- Module ---
mload xclip/xclip/0.12

# --- Copy/Paste ---
function copy() { eval "$@" | xclip; }
alias -g paste='$(xclip -o)'
alias echop='echo Clipboard: paste'

# --- Files/Directories ---
function clip() { copy readlink -f $1; echop; }
alias pwdc='copy pwd && echop'
alias cdp='echo_eval cd paste'
alias cpp.='echo_eval cp paste .'
alias lnsp='echo_eval ln -s paste'

# --- LSF ---
alias bjobsp='echo_eval bjobs paste'
alias bjobsup='echo_eval bjobsu paste'
function bmodp() { echo_eval bmod "$@" paste; }

# --- SVN ---
alias svncop='echo_eval svn co paste'
alias svnlink='svn info | awk '"'"'/^URL/ {print $2}'"'"' | xclip && echop'

# --- Meld ---
alias meldp='echo_eval meld $(paste)'

