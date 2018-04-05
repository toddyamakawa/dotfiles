
# --- Modules ---
alias questaload='mload mentor/questasim/10.7_1'

# --- Aliases ---
alias ucdb_report_parse="awk '/^\s*CLASS/{class=\$2} /^\s*TYPE/{type=\$2} /^\s*bin/{print class,type,\$2,\$3,\$4,\$5}'"

# --- Functions ---
function ucdb_dump() {
	vcover report -details $@ | ucdb_report_parse
}

