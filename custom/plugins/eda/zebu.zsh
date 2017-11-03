
# --- Modules ---
alias zebuload='mload synopsys/zebu/2015.09-7_engfix_EF1'

# --- zSpy Aliases ---
alias zjobs='zSpy -batch -systemDir /arm/local/synopsys/zebu/zebu_system_dir_ZS3'
alias zfree='zSpy -free -systemDir /arm/local/synopsys/zebu/zebu_system_dir_ZS3'

# TODO: Figure out how to get this to work
#function zebu_pwd() {
	#local temp=${PWD##*/zebu*
#}

# TODO: Use zebu_pwd
function zebu_size() {
	ls -ldh build/zcui.work/backend_default/U?/M?
}

# TODO: Use zebu_pwd
function zebu_sum_cut() {
	grep 'SUM CUT' build/zcui.work/backend_default/Work.Part_*/zCoreBuild.log
}

