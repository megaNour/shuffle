#!/usr/bin/env dash

# NOTE: quote EOF to make it all literal
cat <<EOF
$red .────────────────. $nor .────────────────. $gre .────────────────.
$red│ .──────────────. │$nor│ .──────────────. │$gre│ .──────────────. │
$red│ │    _______   │ │$nor│ │  ____  ____  │ │$gre│ │  _________   │ │
$red│ │   ╱  ___  │  │ │$nor│ │ │_   ││   _│ │ │$gre│ │ │_   ___  │  │ │
$red│ │  │  (__ ╲_│  │ │$nor│ │   │ │__│ │   │ │$gre│ │   │ │_  ╲_│  │ │
$red│ │   '.___'─.   │ │$nor│ │   │  __  │   │ │$gre│ │   │  _│      │ │
$red│ │  │'╲____) │  │ │$nor│ │  _│ │  │ │_  │ │$gre│ │  _│ │_       │ │
$red│ │  │_______.'  │ │$nor│ │ │____││____│ │ │$gre│ │ │_____│      │ │
$red│ │              │ │$nor│ │              │ │$gre│ │              │ │
$red│ '──────────────' │$nor│ '──────────────' │$gre│ '──────────────' │
$red '────────────────' $nor '────────────────' $gre '────────────────'
                    $yel .────────────────. $blu .────────────────.
                    $yel│ .──────────────. │$blu│ .──────────────. │
                    $yel│ │ _____  _____ │ │$blu│ │   _____      │ │
                    $yel│ ││_   _││_   _││ │$blu│ │  │_   _│     │ │
                    $yel│ │  │ │    │ │  │ │$blu│ │    │ │       │ │
                    $yel│ │  │ '    ' │  │ │$blu│ │    │ │   _   │ │
                    $yel│ │   ╲ '──' ╱   │ │$blu│ │   _│ │__╱ │  │ │
                    $yel│ │    '.__.'    │ │$blu│ │  │________│  │ │
                    $yel│ │              │ │$blu│ │              │ │
                    $yel│ '──────────────' │$blu│ '──────────────' │
                    $yel '────────────────' $blu '────────────────'
                                        $red .────────────────.
                                        $red│ .──────────────. │
                                        $red│ │  _________   │ │
                                        $red│ │ │_   ___  │  │ │
                                        $red│ │   │ │_  ╲_│  │ │
                                        $red│ │   │  _│  _   │ │
                                        $red│ │  _│ │___╱ │  │ │
                                        $red│ │ │_________│  │ │
                                        $red│ │              │ │
                                        $red│ '──────────────' │
                                        $red '────────────────'$nor

EOF
cat <<EOF
$NAME -- reassemble and rename markdown sections for painless flavoring.
Version: $VERSION
Author: alkotobnour@gmail.com

Description:
  - Input Markdown.
  - Configure what to keep, in which order, under which name/level.
  - Output Markdown.


Usage:
  See $NAME -h, --help
EOF
