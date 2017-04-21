#!/bin/bash
script=$(readlink -f $0)
here=$(dirname $script)

declare -A ARGV
declare -a ARGS
while [[ $# -gt 1 ]]; do
	arg="$1" && shift
	case "$arg" in
		-*) ARGV["$arg"]="$1"; shift;;
		*) ARGS=("${ARGS[@]}" "$arg");;
	esac
done

for arg in "${!ARGV[@]}"; do
	echo "$arg ${ARGV[$arg]}"
done

for arg in "${ARGS[@]}"; do
	echo "- $arg"
done

