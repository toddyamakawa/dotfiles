
alias gccls='ls -1 /arm/devsys-tools/collections/gcc'

function gccload() {
	local version=$1
	eval `/arm/devsys-tools/abs/setup_eda_tool gcc:$version`
}

function latest_model_shell() {
	local version=$(command ls -1 /arm/warehouse/ESL/ModelShell/0.0 | sort -n | tail -n 1)
	ls /arm/warehouse/ESL/ModelShell/0.0/$version/Linux/bin/model_shell
}

