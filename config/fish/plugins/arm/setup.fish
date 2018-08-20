
# --- Environment Variables ---
set -x DEPOT_INSTALL_ROOT /arm/tools
set -x DEPOT_SETUP_ROOT   /arm/tools/setup
set -x DEPOT_PLATFORM     (eval $DEPOT_SETUP_ROOT/bin/platform depot-platform)

# Get most recent tclsh version
set -u tclsh (ls $DEPOT_INSTALL_ROOT/tct/tcl/*/$DEPOT_PLATFORM/bin/tclsh | sort | tail -n 1)

# --- mgrep ---
abbr -a mgrep /arm/tools/setup/bin/mgrep

# --- module ---
#eval "function module; eval (eval $tclsh $DEPOT_SETUP_ROOT/lib/modulecmd.tcl fish \$argv); end"
eval "function module; eval (eval $tclsh /home/todyam01/dotfiles/config/fish/plugins/arm/modulecmd.tcl fish \$argv); end"

