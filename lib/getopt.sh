#!/usr/bin/env dash

eval set -- "$(getopt -o dfhiVv -l debug,help,interactive,version -- "$@")"

while true; do
  case "$1" in
  -d | --debug)
    DEBUG_ENABLED=1
    shift
    ;;
  -h | --help)
    . "$ENTRY/lib/help.sh"
    exit 0
    ;;
  -i | --interactive)
    INTERACTIVE_ENABLED=1
    shift
    ;;
  -p | --parse | -f | --force)
    PARSE_ENABLED=1
    shift
    ;;
  -v | -V | --version)
    . "$ENTRY/lib/version.sh"
    exit 0
    ;;
  --)
    shift
    break
    ;;
  esac
done

TARGET=${1:?target directory is required}
