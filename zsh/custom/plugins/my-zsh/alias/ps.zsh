
# --- ps ---
alias -g pso='-o %cpu,%mem,user,pid,ppid,etime,time,cmd'
alias psort='ps -e pso | grep -v grep | sort -n'
alias psef='ps -ef | grep -v grep'
alias psaux='ps auxw | grep -v grep | sort -n -k3'
alias psefg='psef | grep'
alias psauxg='psauxg | grep'
alias killps='grep -v grep | awk '"'"'{print $2}'"'"' | xargs kill'

