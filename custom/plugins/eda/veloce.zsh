
# --- Modules ---
alias velload3018='mload mentor/veloce/3.0.1.8'
alias velload31611='mload mentor/veloce/3.16.1.1'
alias velload31612='mload mentor/veloce/3.16.1.2'
alias velload31614='mload mentor/veloce/3.16.1.4'
alias velload31615='mload mentor/veloce/3.16.1.5_patched'
alias velload31616='mload mentor/veloce/3.16.1.6'
alias velload='velload31616'
alias tbxload='mload mentor/tbx/2.4.4.9'
alias visload='mload mentor/questavdbg/10.5c'

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
alias viswave='vis -tracedir veloce.wave/waves.stw -designfile hw/veloce.med/visualizer.out/design.bin'

# --- Project ---
alias vellock='velcomp -lock_project'
alias velunlock='velcomp -unlock_project'
alias velcui='CUi_analyzer veloce.log -extract'
alias veltask='velcomp -task'
alias veldesign.bin='velunlock && veltask visualizer && vellock'

function vel_export_debug() {
	mkdir debug
	tmp=$(mktemp -d)
	output=$tmp/debug_info.tar.gz
	$VMW_HOME/tbx/bin/export_debug_info.csh -dir_path $PWD -o $output
	mv $output debug
}

function velcopy_logs() {
	mkdir -p veloce.log veloce.med/velsyn.out
	cp $1/compile.log .
	cp $1/veloce.config .
	cp $1/veloce.log/compile_velgs_0.log veloce.log/compile_velgs_0.log
	cp $1/veloce.med/velsyn.out/velsyn.report veloce.med/velsyn.out/velsyn.report
}

function vel2fsdb() {
	velload31611
	echo '******************************' > sigs
	bs32 -o wave.%J.log ecf2wave -tracedir veloce.wave/waves.stw -siglist sigs -fsdb -distribute -merge_fsdbs
}

