
# --- meld ---
meld() { mrun +meld/meld meld $@; }

# --- tkdiff ---
tkdiff() { mrun +tkdiff/tkdiff tkdiff -w $@; }

# --- colordiff ---
alias diff='colordiff'
colordiff() { mrun +colordiff/colordiff colordiff -w $@; }

