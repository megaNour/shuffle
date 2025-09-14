#!/usr/bin/env dash

red=$(tput setaf 1)
gre=$(tput setaf 2)
yel=$(tput setaf 3)
blu=$(tput setaf 4)
mag=$(tput setaf 5)
cya=$(tput setaf 6)
whi=$(tput setaf 7)
gry=$(tput setaf 8)
bol=$(tput bold)
nor=$(tput sgr 0)

# log debug
logd() {
  if [ "$DEBUG_ENABLED" ]; then
    printf "%s\n" "${gry}$*${nor}" >&2
  fi
}

# log debug color
logc() {
  read force color <<EOF
$1
EOF
  if [ "$DEBUG_ENABLED" ] || [ "$force" = f ]; then
    shift
    printf "%s\n" "${color}$*${nor}" >&2
  fi
}

# log positionals
logp() {
  i=0
  for arg in "$@"; do
    i=$((i + 1))
    logd "\$$i: $arg"
  done
}

# log payload
logpl() {
  if [ "$PAYLOAD_ENABLED" ]; then
    logc "f $gre" "$@"
  fi
}

# buffer
logb() {
  LOGGER_AGGREGATE="$LOGGER_AGGREGATE $*"
}

# aggregate and print
loga() {
  logb "$*"
  logd "$LOGGER_AGGREGATE"
}

# flush aggregate
logf() {
  local logger=$1 options=$2
  shift 2
  if [ $# = 2 ]; then
    set -- "$logger" "$options"
  else
    set -- "$logger"
  fi
  "$@" "$LOGGER_AGGREGATE"
  logr
}

# reset aggregate
logr() {
  unset LOGGER_AGGREGATE
}
