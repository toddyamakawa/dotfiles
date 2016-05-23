
# --- Module ---
mload xclip/xclip/0.12

# --- Copy/Paste ---
function copy() { eval "$@" | xclip; }
alias paste='xclip -o'

# --- xclip ---
alias echop='echo "Clipboard: $(paste)"'
alias pwdc='copy pwd && echop'
alias cdp='echo_eval cd $(paste)'
alias cpp.='echo_eval cp $(paste) .'
alias lnsp='echo_eval ln -s $(paste)'

function clip() { copy readlink -f $1; echop; }

alias meldp='echo_eval meld $(paste)'
alias svncop='echo_eval svn co $(paste)'

alias svnlink='svn info | awk '"'"'/^URL/ {print $2}'"'"' | xclip && echop'

