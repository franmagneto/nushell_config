def --wrapped cat [...args] {
  if (which bat | is-not-empty) {
    $env.BAT_THEME = match $env.BG_MODE {
      'dark' => "Catppuccin Mocha",
      'light' => "Catppuccin Latte",
    }
    ^bat -pp ...$args
  } else {
    ^cat ...$args
  }
}
