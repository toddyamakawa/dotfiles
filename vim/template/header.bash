#!/usr/bin/env bash
declare -r here=$(readlink -f $PWD)
declare -r script=$(readlink -f $BASH_SOURCE)
declare -r script_dir=$(dirname $script)
declare -r now=$(date +%Y%m%d-%H%M%S-Week%U-%a-%T)
function _git() { git -C $script_dir $@; }
declare -r top=$(_git rev-parse --show-toplevel 2>/dev/null)

# Print stderr in red
exec 2> >(while read line; do echo -e "\e[31m$line\e[0m"; done)

# Print custom pipe in blue
exec 5> >(while read line; do echo -e "\e[32m$line\e[0m"; done)

# Immediately exit on failure
set -e

# Always run when script finishes
function finish() {
	local RETVAL=$?
	# Redirect stdout to custom pipe
	exec 1>&5
	echo -e "path: $here\ncommand: $@\nexit: $RETVAL"
}
eval trap "'finish $0 $@'" EXIT

# Parse arguments
declare -A ARGV
declare -a ARGS
while [[ $# -ge 1 ]]; do
	arg="$1" && shift
	case "$arg" in
		-*) [[ $1 == ${1#-} ]] && { ARGV["$arg"]="$1"; shift; } || ARGV["$arg"]=1;;
		*) ARGS=("${ARGS[@]}" "$arg");;
	esac
done

# Print argments with value
for arg in "${!ARGV[@]}"; do
	echo "$arg ${ARGV[$arg]}"
done

# Print flags
for arg in "${ARGS[@]}"; do
	echo "- $arg"
done

# Source setup scripts if available
if [[ -d /arm/tools/ ]]; then
	source /arm/tools/setup/init/bash
	umask 002
	module load core eda swdev util arm/cluster/2.0
	mrun=/arm/tools/setup/bin/mrun
fi

