#!/usr/bin/env dash

editor=${VISUAL:-$EDITOR}
editor=${EDITOR:-vi}

case "$editor" in
*vi*)
  nvim -O "$TARGET/$TITLES" "$TARGET/$SHUFFLES" "$TARGET/$RENAMES" -c "windo set cursorbind scrollbind" -c "2wincmd w"
  ;;
*)
  printf "%s\n" config files are available at:
  printf "\t%s\n" "$TARGET/$TITLES: the parsed section titles' list"
  printf "\t%s\n" "$TARGET/$SHUFFLES: the reorganisation you wish to reorder (or drop) - ${red}names must stay exactly the same!${normal}"
  printf "\t%s\n" "$TARGET/$RENAMES: rename and renest kept sections as you wish"
  ;;
esac
