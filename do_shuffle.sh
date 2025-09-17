#!/usr/bin/env dash

[ ! -f "$TARGET/$SHUFFLES" ] && cp "$TARGET/$TITLES" "$TARGET/$SHUFFLES"
[ ! -f "$TARGET/$RENAMES" ] && touch "$TARGET/$RENAMES"

[ "$INTERACTIVE_ENABLED" ] && . "$ENTRY/3way.sh"

trap 'exec 3<&- 4<&-' INT TERM EXIT

exec 3<"$TARGET/$SHUFFLES"
exec 4<"$TARGET/$RENAMES"

nb_sections=$(wc -l <"$TARGET/$SHUFFLES")
i=1
while :; do
  read -r title <&3 || break
  read -r rename <&4 || rename=$title

  # NOTE: De-escape '```' into '/' in a loop.
  # Considering the probability this occurs, it seems cheaper than
  # spawning (even a long-lived) sed to treat those.
  target=$rename
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

  # NOTE: the original last section with only one '\n' might now be in the middle
  # we need to ensure both:
  # - it doesn't get slugged with the next section by adding a second '\n'
  # - not every section gets an extra '\n'
  # - for now the very last one will keep it if it already has it but
  #   this seems to be a topic to tackle when shuffle handles footers.
  [ "$i" != "$nb_sections" ] && add_extra_nl=1
  gawk -v rename="$rename" -v add_extra_nl="$add_extra_nl" '
    NR==1 {
        print rename # Replace first line
    }
    NR>1 {
        print # Print all other lines
    }
    {
        last_line = $0 # Track last line
    }
    END {
        if (add_extra_nl && last_line != "") {
            print "" # Extra newline for last section
        }
    }
  ' <"$TARGET/$CONTENT/$target"
  i=$((i + 1))
done
