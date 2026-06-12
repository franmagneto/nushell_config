if ('ZELLIJ' in ($env | columns)) {
  let rgb: record = (
    term query $'(ansi osc)11;?(ansi st)'
      --prefix $'(ansi osc)11;'
      --terminator (ansi st)
    | decode
    | (parse -r 'rgb:(?P<r>....)/(?P<g>....)/(?P<b>....)').0
    | into int r g b --radix 16
  )

  let lum = (
    $rgb.r * $rgb.r * 299 +
    $rgb.g * $rgb.g * 587 +
    $rgb.b * $rgb.b * 114
  ) / 1000 | math sqrt

  if $lum <= 0x8000 {
    ^zellij action set-dark-theme
  } else {
    ^zellij action set-light-theme
  }
}
