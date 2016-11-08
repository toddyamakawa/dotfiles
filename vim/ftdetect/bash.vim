autocmd BufNewFile *.bash 0put=\"#!/bin/bash\nscript=$(readlink -f $0)\nhere=$(dirname $script)\n\"
