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
# if not installed, call shuffle.sh
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

Organizing your md with love, you face your company's stupid guidelines and
you realize there is no way around complying to them.
Does it make sense ? No.
Still, if you don't give him a solution, he will try to butcher your beautiful
md... or worse, copy/paste manually sections and code snippets into a new source
making it totally unmaintainable.

What about empowering him to generate his piece of... documentation easily for
himself? So you can keep your really well made docs intact and make him work on
everything other than shuffling all your work?

Voilà! you need `shuffle`.

## Specs

- `markdown` filetype only
- `POSIX` syntax
- but `GNU` tools
- conf files mode
- interactive mode

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

## What Else

This project is as free as it can be.
