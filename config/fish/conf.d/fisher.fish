# Bootstrap fisher (plugin manager) if missing.
# Plugins are listed in fish_plugins; install/update with: fisher update
#
# NB: download the file straight into functions/ instead of running
# `fisher install jorgebucaran/fisher`: fisher spawns child `fish -c`
# processes for fetching, each of them sources conf.d again and would
# re-run this bootstrap forever on a machine where fisher is not yet
# installed.
if not type -q fisher
    set -l dest $__fish_config_dir/functions/fisher.fish
    set -l tmp (mktemp)
    and curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish -o $tmp
    and test -s $tmp
    and mkdir -p (path dirname $dest)
    and mv $tmp $dest
    and source $dest
end
