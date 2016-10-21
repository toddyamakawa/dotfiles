
# --- CDPATH ---
export CDPATH="..:../..:$HOME"

# --- Directory Stat ---
alias d='dirs -v'
function c() { cd -$1; }

# --- Aliases ---
alias cd='cd -P'
alias cdpwd='cd $PWD'
alias cdtemp='cd $(mktemp -d)'

