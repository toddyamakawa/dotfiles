
[[ -f ~/bin/h.sh ]] || return 0
source $(readlink -f ~/bin/h.sh)

# --- Aliases ---
alias hlog='h -i error "info|success\w+" "warn\w+|exit\w+"'

