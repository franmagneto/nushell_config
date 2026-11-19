if  (which bat | is-not-empty) {
  $env.BAT_THEME = match $env.BG_MODE {
    'dark' => "Catppuccin Mocha",
    'light' => "Catppuccin Latte",
  }
}
