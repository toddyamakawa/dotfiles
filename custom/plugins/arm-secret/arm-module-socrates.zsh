
# --- Socrates Modules ---
alias socratesload='mload eda duolog/license/eval duolog/socrates'

# --- socrates.sh ---
function socrates.sh() {
	socratesload
	command socrates.sh
}

# --- socrates_cli ---
function socrates_cli() {
	socratesload
	command socrates_cli
}

