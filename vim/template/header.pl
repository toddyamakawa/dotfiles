#!/usr/bin/env bash
exec /arm/tools/setup/bin/mrun +perl/perl/5.22.1 perl -x -S $0 ${1+"$@"}
#!/usr/bin/env perl

use strict;
use warnings;

# Print comand line args
use Data::Dumper;
print Dumper \@ARGV;

printf("perl %vd\n", $^V) ;

