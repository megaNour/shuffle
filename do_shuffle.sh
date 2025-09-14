#!/usr/bin/env dash

[ ! -f "$TARGET/$SHUFFLES" ] && cp "$TARGET/$TITLES" "$TARGET/$SHUFFLES"
[ ! -f "$TARGET/$RENAMES" ] && touch "$TARGET/$RENAMES"

[ "$INTERACTIVE_ENABLED" ] && . "$ENTRY/3way.sh"

trap 'exec 3<&- 4<&-' INT TERM EXIT

exec 3<"$TARGET/$SHUFFLES"
exec 4<"$TARGET/$RENAMES"

while true; do
  read -r title <&3 || break
  read -r rename <&4 || rename=$title
  awk -v rename="$rename" 'NR==1{print rename} NR!=1{print}' <"$TARGET/$CONTENT/$title"
done
