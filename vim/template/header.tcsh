#!/bin/tcsh -f
set script = `readlink -f $0`
set here = `dirname $script`

if ( -d /arm/tools/ ) then
	source /arm/tools/setup/init/tcsh
	module load core eda swdev util arm/cluster/2.0
endif

