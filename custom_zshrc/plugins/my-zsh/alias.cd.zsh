
# --- cd ---
alias cd='cd -P'
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Refresh stale file handle
alias cdpwd='cd $PWD'

# cd to temp directory
alias cdtemp='cd $(mktemp -d)'

