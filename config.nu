# Env
$env.config.buffer_editor = "nvim"
$env.BAT_THEME = "Catppuccin Mocha"

mkdir ($nu.data-dir | path join "vendor/autoload")
carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

# Path
use std/util "path add"
path add "~/.local/bin"
path add ($env.CARGO_HOME? | default ~/.cargo | path join "bin")
