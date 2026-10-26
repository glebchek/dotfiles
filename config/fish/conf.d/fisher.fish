# Bootstrap fisher (plugin manager) if missing.
# Plugins are listed in fish_plugins; install/update with: fisher update
if not type -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    and fisher install jorgebucaran/fisher
end
