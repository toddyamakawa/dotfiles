
# --- ps ---
alias psef='ps -ef | grep -v grep'
alias psaux='ps auxw | grep -v grep | sort -n -k3'
alias psefg='psef | grep'
alias psauxg='psauxg | grep'
alias killps='grep -v grep | awk2 | xargs kill'

# --- Functions ---
function psort() {
	ps -e -o "%cpu,%mem,user,pid,ppid,etime,time,cmd" | \
		grep -v grep | sort -n
}

function pme() {
	psort | grep $USER | awk '($NF != "-zsh") {$8="\033[1;34m"$8"\033[0m"; print}'
}
