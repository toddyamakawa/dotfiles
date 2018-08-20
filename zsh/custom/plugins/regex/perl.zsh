
# --- Aliases ---
alias perlne='perl -ne'

# --- Perl Regex ---
function pregex() {
	local pattern="$@"
	perlne 'next unless @match=($_=~'"$pattern"'); print join(" ",@match)."\n"'
}

