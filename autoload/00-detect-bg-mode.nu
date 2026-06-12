if ('BG_MODE' not-in $env) {
  let bg_color: record = (
    term query $'(ansi osc)11;?(ansi st)'
      --prefix $'(ansi osc)11;'
      --terminator (ansi st)
    | decode
    | (parse -r 'rgb:(?P<r>....)/(?P<g>....)/(?P<b>....)').0
    | into int r g b --radix 16
  )

  let bg_luminosity = (
    $bg_color.r * $bg_color.r * 299 +
    $bg_color.g * $bg_color.g * 587 +
    $bg_color.b * $bg_color.b * 114
  ) / 1000 | math sqrt

  if ($bg_luminosity > 0x8000) {
    $env.BG_MODE = 'light'
  } else {
    $env.BG_MODE = 'dark'
  }
}
