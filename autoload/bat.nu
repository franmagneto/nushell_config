def --wrapped cat [...args] {
  if (which bat | is-not-empty) {
    ^bat -pp ...$args
  } else {
    ^cat ...$args
  }
}
