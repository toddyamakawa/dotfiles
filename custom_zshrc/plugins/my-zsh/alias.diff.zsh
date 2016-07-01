
# --- meld ---
MODULE_MELD=meld/meld/1.5.3
#MODULE_MELD=meld/meld/1.8.2
#MODULE_MELD=meld/meld/1.8.4
#MODULE_MELD=meld/meld/3.12.3

# --- tkdiff ---
MODULE_TKDIFF=tkdiff/tkdiff/4.2

# --- colordiff ---
MODULE_COLORDIFF=colordiff
alias diff='colordiff'
alias colordiff='colordiff -w'

# --- Load Modules ---
mload $MODULE_MELD $MODULE_TKDIFF $MODULE_COLORDIFF

