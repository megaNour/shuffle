#!/usr/bin/env dash

if [ ! -t 0 ]; then
  rm -f "$TARGET/$TITLES"
  rm -rf "$TARGET/$CONTENT"
  mkdir -p "$TARGET/$CONTENT"
  gawk -v "TARGET=$TARGET" -v "CONTENT=$CONTENT" -v "TARGET_TITLES=$TARGET/$TITLES" '
  /^```/ {
    fenced = 1 - fenced
  }
  /^#/ && !fenced {
    title = $0
    gsub("/", "```", title)
    TARGET_CONTENT = TARGET "/" CONTENT "/" title
    print $0 >> TARGET_TITLES
  }
  {
    print $0 >> TARGET_CONTENT
  }
  '
fi
