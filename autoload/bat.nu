def --wrapped cat [...args] {
  if (which bat | is-not-empty) {
    $env.BAT_THEME = "Catppuccin Mocha"
    ^bat -pp ...$args
  } else {
    ^cat ...$args
  }
}
