#!/usr/bin/env bash
script=$(readlink -f $BASH_SOURCE)
here=$(dirname $script)
top=$(git -C $here rev-parse --show-toplevel 2>/dev/null)

# Immediately exit on failure
set -e

# Always run when script finishes
function finish() {
	echo Cleaning up...
}
trap finish EXIT

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
	module load core eda swdev util arm/cluster/2.0
fi

