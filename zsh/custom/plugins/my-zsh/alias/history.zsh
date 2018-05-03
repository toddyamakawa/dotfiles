
# --- History ---
#alias history="fc -t '[%T]' -l 1 | awk '{swp=\$1;\$1=\$2;\$2=swp;print}'"
alias history="fc -t \"$fg[yellow][%T]$reset_color\" -l 1 | awk '{swp=\$1;\$1=\$2;\$2=swp;print}'"
#alias h='history'
alias hg='history | grep'

