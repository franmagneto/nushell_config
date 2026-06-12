# Env
$env.config.buffer_editor = "nvim"

# Path
use std/util "path add"
path add "~/.local/bin"
path add ($env.CARGO_HOME? | default ~/.cargo | path join "bin")

# External tools
if (which carapace | is-not-empty) {
  $env.CARAPACE_BRIDGES = "zsh,bash"
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
