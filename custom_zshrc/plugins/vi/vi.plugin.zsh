
# Select keymap vi
bindkey -v

# Ctrl-j and Ctrl-k to search history
bindkey '^J' down-line-or-search
bindkey '^K' up-line-or-search

# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
#bindkey '^P' up-history
#bindkey '^N' down-history

# allow v to edit the command line (standard behaviour)
#autoload -Uz edit-command-line
#bindkey -M vicmd 'v' edit-command-line



