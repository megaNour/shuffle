# shuffle - the manual organizer you didn't know you need

With `shuffle` you can reorganize your mardown files easily in a programatic or
interactive fashion thanks to a 3 way layout:

| original sections     | reorder or ommit      | rename/change nesting |
| :-------------------- | :-------------------- | :-------------------- |
| # my title            | ## my other title     | # my new title        |
| ## my other title     | # my title            | ## my old title       |
| ## my dropped title   | ## my unchanged title |                       |
| ## my unchanged title | ## yet another title  | ## yet changing       |
| ## yet another title  |                       |                       |

will end up with the sections and their contents shuffled like so:

```markdown
# my new title
## my old title
## my unchanged title
## yet changing
```

## TL;DR

```sh
# Here installed as shuffle, otherwise call shuffle.sh
shuffle -ip <target_dir> <input_stream > output.md
shuffle -h # or --help
shuffle -v # or -V or --version
```

## Why Shuffle

`shuffle` allows you to merge, filter, reorder and rename any markdown you pipe
into it.
This allows decoupling source markdown from output. Enabling you to output
multiple flavors of your markdown without altering or duplicating the sources.

## A Concrete Use Case

You have a source `markdown` you crafted with love.
It's so rationale, it's so elaborated, it is... sooo delicate! (at least to you)

The thing is `Bobby` the `CPO` wants it to be organized in
his new - corporate - `Rainbow of Seasons` layout...
so it sells better to whoever!

`Bobby` decides to shuffle your `markdown`:

- swapping sections
- adding sections from multiple files
- dropping sections
- renaming sections
- which means possibly change their hierarchy on the fly
- oh, and `Bobby` IS productive BTW

In the middle of that rework, you can find typo corrections etc... that you want
to integrate, but it's all melted in the reshuffle.

Oh, and `Bobby` doesn't know how to work with `git`! (busy)
You! You just report the changes "when you have time (before tomorrow though)".

In fact, `Bobby` has friends, `Jimmy` and `Timmy` also are poets.
Obviously each one wants his own flavor of your markdown.

What about empowering them to generate their own flavored documentation easily for
themselves? This way you can keep your (really well-made) docs intact and easily
incorporate the rest of their (less questionable) contributions
that you do actually want in your single source of truth?

Voilà! Enter `shuffle`.

## Specs

- `markdown` filetype only
- `POSIX` syntax
- but `GNU` tools
- conf files mode
- interactive mode
- input from stdin
- outputs to stdout

## Requirements

- `dash`
- `GNU awk`
- `GNU getopt`

## Optional

- `*vi*`

## Limitations

- no installer yet, you need to call `shuffle.sh`
- developed on `macOS` with explicit `GNU` tools calls
- interactive mode works with a `VIM`-like editor
- no test suit yet
- only \`\`\` fences are considered for now, no \~~~, no \`\`\`\`+
- fences must be well-formatted, no leading space chars
- headers are not supported yet
- footers are not considered footers yet
- duplicate titles collisions are not handled yet (on the way)

## What Else

This project is as free as it can be.
