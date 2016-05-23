
# --- Modules ---
alias velload='mload mentor/veloce/3.0.1.9'
alias tbxload='mload mentor/tbx/2.4.4.9'
alias visload='addpath /arm/projectscratch/pd/svos/tools/visualizer_beta5 && velload'
velload
tbxload

# --- Information ---
alias veluse='velec -usagestat'
alias velres='cat /arm/cluster/nahpc/conf/veloce-scheduler.cfg'
alias velavail='velec -availableres'
alias velstat='velec -getdesigninfo $(readlink -f .)'
function velinfo() {
	awk 'BEGIN {estimated_freq = 0}
	/NUMBER OF CRYSTALS IN DESIGN/ {crystals = $NF}
	/AVAILABLE NUMBER OF CRYSTALS/ {max_crystals = $NF}
	/NUMBER OF ARRAY BOARDS/ {boards = $NF}
	!estimated_freq && /Frequency.*kHz/ {estimated_freq = $(NF-1)}
	/Frequency.*kHz/ {compile_freq = $(NF-1)}
	END {
		print "Crystals: "crystals"/"max_crystals
		print "Boards: "boards
		print "Estimated Frequency: "estimated_freq" kHz"
		print "Compile Frequency: "compile_freq" kHz"
		print "Degradation: "100*(estimated_freq-compile_freq)/estimated_freq"%"
	}' veloce.log/compile_velgs_0.log veloce.med/velsyn.out/velsyn.report
}

# --- LSF ---
alias velsub='bs32 -q emulation -a veloce -oo output.log'
alias velsub2='bs32 -q emulation -a veloce2 -oo output.log'

# --- Velview ---
alias velwave='bs8 -I velview -tracedir veloce.wave/waves.stw'

# --- Project ---
alias vellock='velcomp -lock_project'
alias velunlock='velcomp -unlock_project'

# --- CUi ---
alias velcui='CUi_analyzer veloce.log -extract'

function vel_export_debug() {
	mkdir debug
	tmp=$(mktemp -d)
	output=$tmp/debug_info.tar.gz
	$VMW_HOME/tbx/bin/export_debug_info.csh -dir_path $PWD -o $output
	mv $output debug
}

alias vel2fsdb="echo '******************************' > sigs && \
bs8 -o wave.%J.log ecf2wave -tracedir veloce.wave/waves.stw -siglist sigs -fsdb -distribute -merge_fsdbs"

