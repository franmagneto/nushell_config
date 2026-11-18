# Config
$env.config.show_banner = false

# Env
$env.EDITOR = "nvim"
if ("/etc/locale.conf" | path exists) {
  open /etc/locale.conf | lines
  | parse "{key}={value}"
  | transpose -rd
  | each { str trim --char '"' }
  | load-env
}

# Path
use std/util "path add"
path add "~/.local/bin"
path add ($env.CARGO_HOME? | default ~/.cargo | path join "bin")

# External tools
if (which carapace | is-not-empty) {
  mkdir ($nu.data-dir | path join "vendor/autoload")
  ^carapace _carapace nushell | save -f ($nu.data-dir | path join "vendor/autoload/carapace.nu")
}
if (which starship | is-not-empty) {
  mkdir ($nu.data-dir | path join "vendor/autoload")
  ^starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
}
if (which mise | is-not-empty) {
  mkdir ($nu.data-dir | path join "vendor/autoload")
  ^mise activate nu | save -f ($nu.data-dir | path join "vendor/autoload/mise.nu")
}
