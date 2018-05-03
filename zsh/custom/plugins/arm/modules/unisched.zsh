
alias uni_pbuild='mrun +google/golang/1.6 /arm/devsys-tools/abs/pbuild'
alias uni_new='uni_pbuild TOEF:scheduler:0.1 --update-xml --set-state spotless --use-tool=go:go:MODULES:google/golang/1.5.3'
alias uni_make='uni_pbuild /arm/devsys-tools/abs/pbuild --perform build,collect'

