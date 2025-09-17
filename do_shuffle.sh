#!/usr/bin/env dash

[ ! -f "$TARGET/$SHUFFLES" ] && cp "$TARGET/$TITLES" "$TARGET/$SHUFFLES"
[ ! -f "$TARGET/$RENAMES" ] && touch "$TARGET/$RENAMES"

[ "$INTERACTIVE_ENABLED" ] && . "$ENTRY/3way.sh"

cleanup() {
  local status=$?
  local pid_gawk=$1
  shift
  if [ -n "$pid_gawk" ]; then
    kill "$pid_gawk"
    wait "$pid_gawk" 2>/dev/null || : # NOTE: if the process is already dead, wait would error
  fi
  rm -f "$@"
  exec 3<&- 4<&-
  exit "$status"
}

trap 'cleanup "$pid_gawk" "$fifo_gawk"' INT TERM EXIT

fifo_gawk="/tmp/shuffle_gawk.$$"
mkfifo "$fifo_gawk"
exec 3<"$TARGET/$RENAMES"
exec 4<>"$fifo_gawk"

gawk '
  /^[[:space:]]*$/{
    blanks = blanks "\n" # buffer maybe useless newlines
    last_line = $0
    next
  }
  /^```/ {
    fenced = 1 - fenced
  }
  /^#/ && !fenced && NR > 1 && last_line {
    print ""
  }
  { # if there is content, print stored buffer and reset it
    if (blanks != "") {
      printf "%s", blanks
      blanks=""
    }
    print $0 # Print all other lines
    last_line = $0
  }
  END {
    if (last_line != "") { print ""}
  }
  ' <&4 &
pid_gawk=$!

while read -r title; do
  read -r rename <&3 || rename=$title # NOTE: || EOF fallback: swallow possible exit 1
  rename=${rename:-$title}            # NOTE: empty line fallback: still verify we didn't just succesfully read an empty line

  target=$title
  while :; do
    case "$target" in
    */*)
      pre=${target%/*}
      post=${target##*/}
      target=$pre\`\`\`$post
      ;;
    *) break ;;
    esac
  done

  printf "%s\n" "$rename" >&4
  tail -n +2 "$TARGET/$CONTENT/$target" >&4

done <"$TARGET/$SHUFFLES"
