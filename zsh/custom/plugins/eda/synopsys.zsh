
# --- Modules ---
#alias verdiload='mload novas/verdi3/2015.09'
alias verdiload='mload synopsys/verdi3/2017.12'


# --- Run ---
function bs_verdi() {
	which verdi || return 1
	bs32 -IS -XF verdi -ssv -ssy -f hw/config/top.vc -2001 -ssf E2W.fsdb -top top -syntaxerrormax 100000
}


# --- compdef ---

# Completion for *.fsdb files
function _fsdb_file() {
	_arguments "*:files:(($(ls *.fsdb)))"
}
compdef _fsdb_file bs_verdi

