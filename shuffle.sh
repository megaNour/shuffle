#!/usr/bin/env dash
set -e

ENTRY=$(CDPATH='' cd -- "$(dirname "$0")" && pwd)
NAME=${0##*/}
NAME=${NAME%.*}
VERSION=0.1.0

TITLES=titles.txt
SHUFFLES=shuffles.txt
RENAMES=renames.txt
CONTENT=content

. "$ENTRY/lib/logger.sh"
. "$ENTRY/lib/getopt.sh"

. "$ENTRY/parse.sh"

. "$ENTRY/do_shuffle.sh"
