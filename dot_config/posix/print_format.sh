# ANSI formatting function (\033[<code>m)
# Example: p_format 1 31  => bold red
p_format() {
  [ $# -gt 0 ] || return
  printf '\033[%sm' "$*"
}

# Disable formatting if stdout is not a terminal
if [ ! -t 1 ]; then
  p_format() { :; }
fi

bold()      { p_format 1; }
red()       { p_format 31; }
green()     { p_format 32; }
yellow()    { p_format 33; }
underline() { p_format 4; }
reset()     { p_format 0; }

fmt_error() {
  printf '%sError: %s%s\n' "${bold}${red}" "$*" "$reset" >&2
}

