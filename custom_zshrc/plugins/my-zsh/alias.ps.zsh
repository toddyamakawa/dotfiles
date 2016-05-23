
# --- ps ---
alias psef='ps -ef | grep -v grep'
alias psaux='ps auxw | grep -v grep | sort -n -k3'
alias psefg='psef | grep'
alias psauxg='psauxg | grep'
alias killps='grep -v grep | awk2 | xargs kill'

