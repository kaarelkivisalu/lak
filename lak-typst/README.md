# LAK Precision — Typst edition

A [Typst](https://typst.app) port of the `lak/` LaTeX system notes.

## Build

```sh
typst compile lak.typ            # -> lak.pdf
typst watch lak.typ              # live rebuild while editing
```

Requires the **New Computer Modern** font (bundled with most Typst installs; it
ships with a full TeX distribution otherwise).

## Layout

- `lak.typ` — main document: title page, table of contents, chapter headings and
  `#include`s of every content file.
- `lib.typ` — shared definitions (the equivalent of the old `preamble.tex`):
  coloured suit symbols, abbreviations, the `bidtable` / `followups` / `hl`
  constructs, the `dcases` / `dcasesr` braces and the page/heading template.
- One content file per source `.tex` (`glossary.typ`, `openings.typ`, `1c.typ`, …).

## Authoring notes

- Suit / bid symbols are `#let` bindings used with `#`: `#C #D #H #S #N`,
  plus `#dbl #rdbl #pass #plus #m #M #mm #MM`.
- **Watch the `#`-then-`(`/digit/`-` trap.** A suit symbol immediately followed
  by `(`, a digit or `-` is parsed as a call/identifier. Write the paren form as
  `5#S\(332)` (escaped paren) and the digit/hyphen form as `#(S)3` / `#(D)-based`.
- A bid table is `#bidtable(row, row, …)` where a row is:
  - `([bid], [meaning])` — a normal row;
  - `hl([bid], [meaning])` — a highlighted (`\hl`) row;
  - `hdr([text])` (optionally `hl: true`) — a full-width label row such as `(DBL)`;
  - `followups(row, row, …)` — an indented nested table.
- Alternatives inside a cell use `dcases([a], [b], …)` (single column) or
  `dcasesr(([a], [cond]), …)` (with a right-hand annotation); they nest.
- Commented-out alternatives from the original LaTeX are preserved verbatim in
  `/* … */` blocks so nothing was lost in the port; they are not yet translated.
