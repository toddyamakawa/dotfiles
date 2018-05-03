#!/usr/bin/env bash

source $DEPOT_SETUP_ROOT/lib/sh

while [[ $# -ge 1 ]]; do
	arg="$1" && shift
	case "$arg" in
		- ) module purge;;
		+*) module load ${arg#+};;
		-*) module unload ${arg#-};;
		* ) prog=$arg; break;;
	esac
done

exec $prog ${1+"$@"}

