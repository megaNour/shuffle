#!/usr/bin/env dash

cat <<EOF
Usage: $NAME [options] target_dir... [< input_stream] [> output.md]

  Shuffles parsed content inside target_dir according to its config files.
  If target_dir doesn't exist, input_stream will be parsed to generate it.
  If interactive mode is enabled and a Vim-like editor is available,
  the config files will be opened for editing.
  Output goes to stdout if not redirected.

Environment:
  VISUAL        Optional, determines your preferred full-screen editor.
  EDITOR        Optional, fallback if VISUAL is not set.

Options:
  -h, --help
        Display this message.

  -i, --interactive
        If the editor matches '*vi*', display 3-way interactive mode.
        Otherwise, config file paths will be printed with descriptions.

  -v, -V, --version
        Display version info -- with outstanding ascii art

  -d, --debug,
        Activate debug logs.
EOF
