
# `man zshoptions`

# --- Miscellaneous ---
# Disable annoying beeps
unsetopt BEEP
# Print red [stderr] for stderr
unsetopt MULTIOS
exec 9>&2 2> >(while read line; do echo "\e[31m[stderr]\e[0m $line"; done; )
exec 2>&- 2>&9

# --- Permissions ---
# rw-rw-r-- files
# rwxrwxr-x directories
umask 002
# rw-r--r-- files
# rwxr-xr-x directories
#umask 022

# --- Changing Directory ---
# `dir` -> `cd dir`
setopt AUTO_CD
# `cd dir` -> `push dir`
setopt AUTO_PUSHD
# `cd symlink/..` -> `cd /symlink/physical/path/..`
setopt CHASE_DOTS
# Do not search ~users
unsetopt CDABLE_VARS
# `cd symlink && pwd` ->  `echo /physical/path/to/symlink`
setopt CHASE_LINKS
# Do not push duplicate directories
setopt PUSHD_IGNORE_DUPS
# Silent `pushd` and `popd`
setopt PUSHD_SILENT
# `pushd` -> `pushd $HOME`
setopt PUSHD_TO_HOME

# --- Completion Options ---
# Move cursor to end of word at full completion
setopt ALWAYS_TO_END
# List choice on ambiguous completion
setopt AUTO_LIST
# Cursor stays in place until completed on both ends
setopt COMPLETE_IN_WORD

# --- Expansion/Globbing Options ---
setopt EXTENDED_GLOB
# Case-insensitive matching
unsetopt CASE_GLOB
# Report errors if no matches
unsetopt CSH_NULL_GLOB
# Report errors if no matches
unsetopt NULL_GLOB

# --- History Options ---
# Append parallel zsh sessions
setopt APPEND_HISTORY
# Perform textual history expansion
setopt BANG_HIST
# Save timestamps and duration
setopt EXTENDED_HISTORY
# Remove older duplicates when added
setopt HIST_IGNORE_ALL_DUPS
# Remove extra whitespace
setopt HIST_REDUCE_BLANKS

