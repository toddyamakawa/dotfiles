
# vi: syntax=sh

# --- zsh ---
alias zshrc='source ~/.zshrc'
alias vzshrc='vi ~/.zshrc'

# --- PATH ---
addpath() { export PATH=$PATH:$1; }

# --- General ---
# run n times
#run() { n=$1; shift; for i in $(seq $n); do $@ & done }
alias which=type
alias wrap="printf '\033[?7h'"
alias nowrap="printf '\033[?7l'"
alias tab2="expand -t2"
alias tab4="expand -t4"
alias tab8="expand -t8"
alias xterm='xterm -fg white -bg black -fa consolas -fs 10'


