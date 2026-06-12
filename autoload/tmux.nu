if (
  (which tmux | is-not-empty)
  and 'TMUX' not-in ($env | columns)
  and $env.TERM_PROGRAM? != 'vscode'
  and 'LAPCE_LOG' not-in ($env | columns)
) {
  mut TMUXCMD = [tmux]
  if (^tmux ls e> /dev/null | lines | where $it !~ attached | is-not-empty) {
    $TMUXCMD ++= [attach]
  }
  exec ...$TMUXCMD
}
