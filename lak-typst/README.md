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
  coloured suit symbols, abbreviations, the `bt` / `bidtable` / `followups` / `hl`
  constructs, the `dcases` / `dcasesr` braces and the page/heading template.
- `btfmt.py` — aligns the description column inside `#bt(…)` blocks (see below).
- One content file per source `.tex` (`glossary.typ`, `openings.typ`, `1c.typ`, …).

## Writing bid tables — `#bt`

The preferred way to write a bid table is `#bt(…)` with a raw block, a compact
indentation-based notation that reads like the source system. Example (the outer
fence below is shown with four backticks only so the inner triple backticks
display):

````
#bt(```
  1D>1C1D   0-7                 // >label links the bid to <label>
  1H        8-11, denies 5+S    // 2+ spaces (or " | ") split bid / meaning
* 1N        12+, 5+H            // leading * highlights the row
    2N      asks                // deeper indent = followups (nested sub-table)
  = over 1X                     // "= text" is a full-width header row
  DBL   { 6-7 = always / *8+, BAL = over 2X }   // {…} = dcases / dcasesr
```)
````

Rules:

- **Columns:** the bid and its meaning are separated by **2 or more spaces**
  (or an explicit ` | `). A single space is *not* a separator — it keeps the
  whole thing as the bid — because bids may contain spaces (`non-jump new suit`).
- **Nesting:** indentation is significant. A line indented deeper than the row
  above it becomes a `followups` sub-table. The `* ` highlight marker sits in the
  left margin and does **not** change a row's nesting level.
- **Links:** `bid>label` renders the bid as a cross-reference to `<label>`
  (targets are the `<…>` labels on headings). Cross-referenced bids get a black
  underline in the PDF so they read as "there is more system here".
- **Notation** inside any cell: `C D H S N` (as whole all-suit words) become
  coloured suit symbols; a `+` attached to a token becomes a superscript (a
  standalone `+`, as in `5H + 4m`, stays on the baseline); `--` and digit-`-`-digit
  become en-dashes; a lone `X`/`Y`/`Z` becomes an italic variable suit;
  `PASS`/`DBL`/`RDBL` are styled. Anything else stays literal, so `BAL`, `GF`,
  `NT`, `AK`, `3NT`, `MIN`, `(4441)`, `5S(332)`, `2D-based` all render as written
  — there is **no** `#`-adjacency escaping to worry about.
- **Span escapes** inside a cell:
  - `` `verbatim` `` — emitted literally; use it when the suit-word rule would
    misfire, e.g. the idiom `` `P/C` `` ("pass or correct", where `C` must not
    become a club), or a bare `` `*` `` bid (a leading `*` would be the highlight
    marker; `` `n`N `` likewise keeps the `n` while `N` stays the NT symbol).
  - `_emphasis_` — italic, for convention names (`_Stayman_`, `_Lebensohl_`).
  - `[text](label)` — a cross-reference link inside a cell (e.g. `[XYZ](XYZ)`).
- Bid tables are kept on a single page (they never split across a page break).

### Auto-formatting

Getting the description column to line up by hand is tedious. Write the rows
with any ragged (≥ 2-space) spacing and run:

```sh
python3 btfmt.py 1c.typ            # rewrite in place, aligning every #bt block
python3 btfmt.py --stdout 1c.typ   # preview without writing
python3 btfmt.py --check *.typ     # exit 1 if anything is misaligned (CI/pre-commit)
python3 btfmt.py --gutter 2 1c.typ # narrower gap before the description (default 3)
```

Descriptions are aligned independently within each group of sibling rows (the
same units that render as one sub-table); bid text, links, markers, `= headers`
and `{ … }` cells are preserved exactly.

## Authoring notes (low-level `#bidtable`)

`#bt` compiles down to `#bidtable(row, row, …)`, which is still available for
cells that need arbitrary Typst. A row is:

- `([bid], [meaning])` — a normal row;
- `hl([bid], [meaning])` — a highlighted (`\hl`) row;
- `hdr([text])` (optionally `hl: true`) — a full-width label row such as `(DBL)`;
- `followups(row, row, …)` — an indented nested table.

- Suit / bid symbols are `#let` bindings used with `#`: `#C #D #H #S #N`,
  plus `#dbl #rdbl #pass #plus #m #M #mm #MM`.
- **In `#bidtable` cells, watch the `#`-then-`(`/digit/`-` trap.** A suit symbol
  immediately followed by `(`, a digit or `-` is parsed as a call/identifier;
  write the paren form as `5#S\(332)` and the digit/hyphen form as `#(S)3` /
  `#(D)-based`. (`#bt` cells have no such trap.)
- Alternatives inside a cell use `dcases([a], [b], …)` (single column) or
  `dcasesr(([a], [cond]), …)` (with a right-hand annotation); they nest.
- Commented-out alternatives from the original LaTeX are preserved verbatim in
  `/* … */` blocks so nothing was lost in the port; they are not yet translated.
- A few tables that need arbitrary Typst per cell stay in `#bidtable` form on
  purpose: the opening-summary table in `openings.typ` (nested `dcasesr` with
  `#nth` ordinals) and the Kickback step tables in `slam.typ` (`$X+1$` math).

## Headings, contents and dashes

- Bidding-sequence headings and inline auctions use Unicode em-dashes (`—`)
  because they sit next to `#`-macros (`#C—`, `#pass—`): Typst parses an ASCII
  `#C---` as the identifier `C---`, so `---` cannot be used there. Everywhere
  else (prose ranges like `10--13`) already uses ASCII `--`/`---`, which Typst
  renders as en/em dashes.
- The table of contents strips a **trailing** sequence dash from each entry
  (`1♣—1♦—` is listed as `1♣—1♦`) while the heading keeps it on the page. This
  is handled by a `show outline.entry` rule in `lib.typ`; nothing per-heading.

## Tables in `carding.typ`

The lead/signal tables use a small `leadtable` helper (a clean "booktabs" look:
black rules top / under-header / bottom, a shaded header, thin gray rules between
rows, no vertical lines) rather than a full LaTeX-style grid.
