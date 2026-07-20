// lib.typ — shared definitions for the LAK Precision Typst edition.
// Mirrors the macros from the original LaTeX `preamble.tex`.

// ---- Colours (dvipsnames, expressed as CMYK for fidelity) ----
#let clubcol    = cmyk(91%, 0%, 88%, 12%)  // ForestGreen
#let diamondcol = cmyk(0%, 42%, 100%, 0%)  // YellowOrange
#let heartcol   = cmyk(0%, 100%, 100%, 0%) // Red
#let notrumpcol = cmyk(94%, 11%, 0%, 0%)   // Cerulean
#let hlcol      = yellow.lighten(60%)      // yellow!40

// ---- Suit / bid symbols (\C \D \H \S \N and friends) ----
#let C = text(fill: clubcol)[♣]
#let D = text(fill: diamondcol)[♦]
#let H = text(fill: heartcol)[♥]
#let S = [♠]
#let N = text(fill: notrumpcol)[⊙]
#let plus = super[+]
// Lowercase input, like `att`/`enc`/`disc` below: `smallcaps` only shrinks
// lowercase letters to cap-height capitals — feeding it already-uppercase
// text leaves it unchanged (full-size), since true small caps only apply to
// what would otherwise be lowercase.
#let dbl  = smallcaps[dbl]
#let rdbl = smallcaps[rdbl]
#let pass = smallcaps[pass]

// ---- Category abbreviations (\m \M \mm \MM) ----
#let m = [m]
#let M = [M]
#let mm = [mm]
#let MM = [MM]

// ---- Small-caps signal names (\att \enc \disc) ----
#let att  = smallcaps[att]
#let enc  = smallcaps[enc]
#let disc = smallcaps[disc]

// ---- Ordinals (\nth{1} -> 1st ...) ----
#let nth(n) = {
  let s = str(n)
  let suf = if s.ends-with("11") or s.ends-with("12") or s.ends-with("13") { "th" }
    else if s.ends-with("1") { "st" }
    else if s.ends-with("2") { "nd" }
    else if s.ends-with("3") { "rd" }
    else { "th" }
  [#n#super[#suf]]
}

// ---- Inline highlight (\colorbox{yellow!40}{...}) ----
#let hlt(body) = highlight(fill: hlcol, extent: 1pt, body)

// ---- Cases braces (mathtools dcases) ----
// Wrap a grid in a stretchy left brace. An explicit measured height is set on
// the returned inline box so that enclosing table rows reserve the full height
// (Typst does not grow rows for baseline-shifted inline math on its own).
#let _braced(g) = context {
  let gh = measure(g).height
  // `lr` renders the brace unpredictably taller than its content (up to ~1.7x
  // for many lines), which both wastes space and bleeds into neighbouring rows.
  // Scale the natural brace back to exactly the content height and reserve that.
  let natural = $lr(brace.l #box(height: gh))$
  let nh = measure(natural).height
  let brace = scale(y: gh / nh * 100%, origin: horizon, reflow: true, natural)
  // A little vertical breathing room so multi-line brace rows do not crowd
  // their neighbours (single-line rows are unaffected).
  let h = gh + 5pt
  box(baseline: 50%, height: h, stack(dir: ltr, spacing: 3pt,
    box(height: h, align(horizon, brace)),
    box(height: h, align(horizon, g)),
  ))
}
// dcases: single-column brace list of alternatives.
#let dcases(..items) = _braced(
  grid(columns: 1, row-gutter: 0.4em, align: left, ..items.pos())
)
// dcasesr: two-column brace, each row an (alternative, condition) pair.
#let dcasesr(..pairs) = {
  let cells = pairs.pos()
    .map(p => (p.at(0), if p.len() > 1 { p.at(1) } else { [] }))
    .flatten()
  _braced(grid(
    columns: (auto, auto), column-gutter: 1.2em, row-gutter: 0.4em, align: left,
    ..cells,
  ))
}

// ---- Bid tables (bidtable / \followups / \hl / \hlf) ----
#let linkcol = black            // cross-reference underline colour
#let fuindent = 4mm             // left indent of a followups sub-table
#let hl(bid, desc) = (kind: "row", bid: bid, desc: desc, hl: true)
#let hdr(body, hl: false) = (kind: "hdr", body: body, hl: hl)
#let followups(..rows) = (kind: "fu", rows: rows.pos())

// ---- Row-level diff styling, used only by the PR visual-diff pipeline ----
// Mirrors the `#diff-added`/`#diff-deleted` convention the typdiff-based prose
// diff already uses (blue underline / red strikethrough), so a table row and a
// changed sentence read as the same kind of change. Applied automatically by
// `bt` to rows whose source line starts with a `+ `/`- ` sentinel — see `_lines`.
#let diffaddcol = rgb("#0000ff")
#let diffdelcol = rgb("#cc0000")
#let diffaddbg  = rgb("#eaf2ff")
#let diffdelbg  = rgb("#fdeaea")
// Native `underline`/`strike` decorate per *text run*, not per line: a
// superscript (e.g. the `+` in `5+H`, from `super[+]`) is its own run at a
// shifted baseline and smaller size, so — even with an explicit `stroke:`
// and `evade: false` — the line still jumped up around it and picked up
// the local run's colour. Measuring the content and drawing a single flat
// line under/through it sidesteps run-level decoration entirely — but only
// works for content that renders on one line: a long typdiff-diffed prose
// sentence, or (in principle) a very long bid/meaning cell, can need to wrap
// across multiple lines, and a single flat line under a multi-line box would
// draw across only the last line's height at full (unconstrained) width,
// running off the page.
//
// So: below `_diff-line-width` (matching `conf`'s usable text width — the
// widest a single line can physically be in this document), draw the flat
// line; every bid-table cell and `dcases`/`dcasesr` alternative is far
// under that in practice (checked against the longest ones in this
// document), so this is really "is this bid-table content or prose", not a
// literal wrap prediction. At or above the threshold, fall back to native
// `underline`/`strike` — despite the run-jump around a superscript, it wraps
// correctly and evades descenders, both of which matter more for a
// multi-line span than one straight line.
//
// This used to ask `layout()` for the actually available width instead of
// using a fixed threshold, to predict wrapping precisely rather than
// guessing — but `layout()` needs its content laid out as its own region,
// which (a) forced a paragraph break when used inside heading content,
// moving every later heading, and (b) returned unreliable widths inside a
// `dcasesr` grid cell, causing spurious wraps (and so spurious evade gaps)
// on some alternatives but not others within the same brace. Plain
// `context` + `measure()`, with no `layout()`, has neither problem.
#let _diff-line-width = 16cm
#let _diffline(body, col, at: bottom) = context {
  let sz = measure(body)
  if sz.width < _diff-line-width {
    box(width: sz.width, height: sz.height, {
      body
      place(at, dy: if at == bottom { 1.5pt } else { 0pt },
        line(length: sz.width, stroke: col + 0.6pt))
    })
  } else if at == bottom {
    underline(stroke: col, evade: true, body)
  } else {
    strike(stroke: col, body)
  }
}
#let diff-added(body) = _diffline(text(fill: diffaddcol, body), diffaddcol, at: bottom)
#let diff-deleted(body) = _diffline(text(fill: diffdelcol, body), diffdelcol, at: horizon)

// Inner recursive renderer: builds the (possibly nested) table. Followups
// recurse through here so the top-level wrapper's page-break and link styling
// apply to the whole tree exactly once.
// A row's (or a `dcases`/`dcasesr` alternative's) background only ever comes
// from an explicit `hl` (the `* ` marker): an added/deleted row is otherwise
// left unfilled, styled the same as diffed prose (blue/red underline/strike
// via `diff-added`/`diff-deleted` — see `_parse-row`/`_braces`). `hl` on an
// added/deleted row swaps the usual yellow for the matching diff colour, so
// a highlighted row that changed still reads as "highlighted", not as an
// unrelated addition/deletion.
#let _hl-fill(status) = {
  if status == "added" { diffaddbg }
  else if status == "deleted" { diffdelbg }
  else { hlcol }
}
#let _row-fill(hl, status) = if hl { _hl-fill(status) } else { none }
#let _diffwrap-for(status) = {
  if status == "added" { diff-added }
  else if status == "deleted" { diff-deleted }
  else { body => body }
}

#let _render(rows) = {
  let cells = ()
  for r in rows {
    if type(r) == array {
      // plain (bid, desc) row
      cells.push(table.cell(r.at(0)))
      cells.push(table.cell(r.at(1)))
    } else if type(r) == dictionary and r.kind == "row" {
      let f = _row-fill(r.at("hl", default: false), r.at("status", default: none))
      cells.push(table.cell(fill: f, r.bid))
      cells.push(table.cell(fill: f, r.desc))
    } else if type(r) == dictionary and r.kind == "hdr" {
      let f = _row-fill(r.at("hl", default: false), r.at("status", default: none))
      cells.push(table.cell(colspan: 2, fill: f, r.body))
    } else if type(r) == dictionary and r.kind == "fu" {
      cells.push(table.cell(
        colspan: 2, inset: (x: 0pt, y: 2.5pt),
        pad(left: fuindent, _render(r.rows)),
      ))
    }
  }
  table(
    columns: (auto, auto),
    stroke: none,
    // Vertically centre cells so a bid label lines up with the beak of a
    // multi-line brace in the neighbouring column.
    align: left + horizon,
    inset: (x: 4pt, y: 2.5pt),
    ..cells,
  )
}

// A bid table is kept on a single page (`breakable: false`) and any bid that is
// a cross-reference gets a coloured underline so it reads as "there is more
// system here". Both apply once, to the whole nested tree.
#let bidtable(..rows) = block(breakable: false, {
  show link: it => underline(stroke: 0.6pt + linkcol, offset: 1.5pt, it)
  _render(rows.pos())
})

// ---- String-parsed bid tables (`bt`) ----------------------------------------
// A BML-style alternative front-end for `bidtable`. Takes a raw block and
// parses indentation-nested rows, so the common case reads like the source
// notation instead of `([bid], [meaning])`-with-commas. Compiles to the exact
// same cell structure as `bidtable`, so both front-ends can coexist.
//
//   #bt(```
//     1D>1C1D   0-7                 // `>label` links the bid to <label>
//     1H        8-11, denies 5+S    // 2+ spaces (or ` | `) split bid / meaning
//   * 1N        12+, 5+H            // leading `*` highlights the row
//       2N      asks                // deeper indent = followups (nested table)
//     = over 1X                     // `= text` is a full-width header row
//     DBL   { 6-7 = always / *8+, BAL = over 2X }   // `{…}` = dcases/dcasesr
//   ```)
//
// Notation inside cells: C/D/H/S/N (as whole all-suit words) become coloured
// suit symbols, `+` becomes a superscript, `--` and digit-to-digit `-` become
// en-dashes, single X/Y/Z become italic variable suits, and PASS/DBL/RDBL are
// styled. Anything that is not a bare suit run stays literal (so BAL, GF, NT,
// AK, 3NT, MIN … are untouched).

#let _suit = ("C": C, "D": D, "H": H, "S": S, "N": N)

// Render one alphabetic word.
#let _word(w) = {
  if w == "PASS" { pass }
  else if w == "DBL" { dbl }
  else if w == "RDBL" { rdbl }
  else if w == "X" { $X$ }
  else if w == "Y" { $Y$ }
  else if w == "Z" { $Z$ }
  else if w.clusters().all(c => _suit.keys().contains(c)) {
    w.clusters().map(c => _suit.at(c)).join()
  } else { [#w] }
}

// Render `X+1` / `Y+2` / `Z+3` (a Kickback-style "n steps above the variable
// suit" bid) as inline math, matching how a lone `X`/`Y`/`Z` becomes `$X$` —
// see the `([XYZ])\+([0-9]+)` case in `_notation`, the only caller.
#let _step(v, n) = if v == "X" { $X+#n$ } else if v == "Y" { $Y+#n$ } else { $Z+#n$ }

// Sentinel marking a `+` that should render as a superscript (one attached to a
// preceding token, as in 5+ / INV+), as opposed to a standalone "+" meaning
// "and" (as in "5H + 4m"), which stays on the baseline.
#let _plus = "\u{0001}"

// Render a run of non-word characters, turning superscript sentinels into `+`.
#let _plain(t) = {
  let acc = []
  for (i, p) in t.split(_plus).enumerate() {
    if i > 0 { acc += super[+] }
    acc += [#p]
  }
  acc
}

// Render a text fragment with bridge notation (suits, +, en-dashes, variables).
#let _notation-core(s) = {
  if s == "" { return [] }
  s = s.replace("--", "–")
  s = s.replace(regex("([0-9)])-([0-9(])"), m => m.captures.at(0) + "–" + m.captures.at(1))
  s = s.replace(regex("([0-9A-Za-z)])\\+"), m => m.captures.at(0) + _plus)
  let out = ()
  let idx = 0
  for m in s.matches(regex("[A-Za-z]+")) {
    if m.start > idx { out.push(_plain(s.slice(idx, m.start))) }
    let w = m.text
    // An ordinal suffix directly after a digit (as in `#nth`'s "1st", "2nd", …)
    // is superscripted; the same word standing alone is left as plain text.
    let is-ordinal-suffix = w == "st" or w == "nd" or w == "rd" or w == "th"
    if is-ordinal-suffix and m.start > 0 and s.at(m.start - 1).match(regex("[0-9]")) != none {
      out.push(super[#w])
    } else {
      out.push(_word(w))
    }
    idx = m.end
  }
  if idx < s.len() { out.push(_plain(s.slice(idx))) }
  out.join()
}

// Render a bid label or meaning, with four span escapes:
//   `verbatim`       — emitted literally; the escape hatch when the suit-word
//                      rule would misfire, e.g. `P/C` ("pass or correct").
//   _emphasis_       — italic, for convention names (_Stayman_, _Lebensohl_, …).
//   [text](label)    — a cross-reference link to <label> inside a cell.
//   X+1 / Y+2 / Z+3  — a Kickback-style step above a variable suit, as math.
#let _notation(s) = {
  if s == "" { return [] }
  if not (s.contains("`") or s.contains("_") or s.contains("](")
      or s.contains("X+") or s.contains("Y+") or s.contains("Z+")) {
    return _notation-core(s)
  }
  let out = []
  let idx = 0
  for m in s.matches(regex("`([^`]*)`|_([^_]*)_|\\[([^\\]]*)\\]\\(([^)]*)\\)|([XYZ])\\+([0-9]+)")) {
    if m.start > idx { out += _notation-core(s.slice(idx, m.start)) }
    let c = m.captures
    if c.at(0) != none { out += [#(c.at(0))] }
    else if c.at(1) != none { out += emph(_notation-core(c.at(1))) }
    else if c.at(2) != none { out += link(label(c.at(3)), _notation-core(c.at(2))) }
    else { out += _step(c.at(4), c.at(5)) }
    idx = m.end
  }
  if idx < s.len() { out += _notation-core(s.slice(idx)) }
  out
}

// Split `s` on `sep`, ignoring any `sep` nested inside `{ … }` — so a brace
// cell's alternative can itself contain a nested `{ … }` (its own `/`- and
// `=`-separated sub-alternatives) without being torn apart by the outer split.
#let _split-toplevel(s, sep) = {
  let parts = ()
  let depth = 0
  let cur = ""
  let i = 0
  let n = s.len()
  let sl = sep.len()
  while i < n {
    let c = s.at(i)
    if c == "{" { depth += 1; cur += c; i += 1 }
    else if c == "}" { depth -= 1; cur += c; i += 1 }
    else if depth == 0 and s.slice(i, calc.min(i + sl, n)) == sep {
      parts.push(cur); cur = ""; i += sl
    } else { cur += c; i += 1 }
  }
  parts.push(cur)
  parts
}

// Parse a `{ a = c / b = c }` (dcasesr) or `{ a / b }` (dcases) cell. A leading
// `*` on an alternative highlights it inline; an alternative may itself end in
// a nested `{ … }` (its own dcases/dcasesr), recursing through `_braces`.
// `parse-alt` is nested (rather than a top-level `_alt`) purely so it can
// call `_braces` back — Typst resolves names at definition time, so a
// top-level function cannot forward-reference a sibling defined later in the
// file, but a closure created *inside* `_braces`'s own body (i.e. every time
// `_braces` runs) can refer to `_braces` itself once it's already bound.
//
// `status` (the enclosing row's added/deleted/none) is threaded all the way
// down so each alternative gets its own diff-added/diff-deleted wrapping and,
// crucially, so a `* `-highlighted alternative swaps its usual yellow for the
// matching diff colour the same way a highlighted whole row does (`_row-fill`)
// — that swap has to happen per alternative, since a brace can freely mix
// highlighted and non-highlighted alternatives within the same (single) row.
#let _braces(inner, status: none) = {
  let diffwrap = _diffwrap-for(status)
  let parse-alt(a) = {
    a = a.trim()
    let hl = a.starts-with("*")
    if hl { a = a.slice(1).trim() }
    let body = if a.contains("{") and a.ends-with("}") {
      let o = a.match(regex("\{")).start
      diffwrap(_notation(a.slice(0, o))) + _braces(a.slice(o + 1, a.len() - 1), status: status)
    } else { diffwrap(_notation(a)) }
    if hl { highlight(fill: _hl-fill(status), extent: 1pt, body) } else { body }
  }
  let rows = _split-toplevel(inner, "/")
  if rows.any(r => _split-toplevel(r, " = ").len() > 1) {
    dcasesr(..rows.map(r => {
      let p = _split-toplevel(r, " = ")
      let cond = diffwrap(_notation(if p.len() > 1 { p.slice(1).join(" = ").trim() } else { "" }))
      (parse-alt(p.at(0)), cond)
    }))
  } else {
    dcases(..rows.map(parse-alt))
  }
}

// A meaning cell that ends in `{ … }` is a dcases/dcasesr brace; any text
// before it (e.g. "transfer to H") is rendered inline in front of the brace.
// Diff wrapping happens per-piece inside here (and inside `_braces`), not
// once around the return value — same reasoning as `_braces` above.
#let _maybe-braces(s, status: none) = {
  if s.contains("{") and s.ends-with("}") {
    let o = s.match(regex("\{")).start
    _diffwrap-for(status)(_notation(s.slice(0, o))) + _braces(s.slice(o + 1, s.len() - 1), status: status)
  } else { _diffwrap-for(status)(_notation(s)) }
}

// Parse a single (already dedented) line into a bidtable row dict. A leading
// `+ ` / `- ` sentinel (before any `* ` highlight marker) marks the row as
// added/deleted for the PR visual-diff pipeline — see `btdiff.py`, which is
// the only producer of these sentinels; hand-authored tables never use them.
#let _parse-row(txt) = {
  let status = none
  let t = txt
  if t.starts-with("+ ") { status = "added"; t = t.slice(2).trim(at: start) }
  else if t.starts-with("- ") { status = "deleted"; t = t.slice(2).trim(at: start) }
  let hl = false
  if t.starts-with("* ") { hl = true; t = t.slice(2).trim() }
  let diffwrap = _diffwrap-for(status)
  if t.starts-with("= ") {
    return (kind: "hdr", body: diffwrap(_notation(t.slice(2).trim())), hl: hl, status: status)
  }
  let bid = t
  let desc = ""
  if t.contains(" | ") {
    let p = t.split(" | ")
    bid = p.at(0).trim(); desc = p.slice(1).join(" | ").trim()
  } else {
    let m = t.match(regex("  +"))
    if m != none { bid = t.slice(0, m.start).trim(); desc = t.slice(m.end).trim() }
    else { bid = t.trim() }
  }
  let lbl = none
  if bid.contains(">") { let bp = bid.split(">"); bid = bp.at(0).trim(); lbl = bp.at(1).trim() }
  let bidc = _notation(bid)
  if lbl != none { bidc = link(label(lbl), bidc) }
  let descc = _maybe-braces(desc, status: status)
  (kind: "row", bid: diffwrap(bidc), desc: descc, hl: hl, status: status)
}

// Split source into (indent, text) pairs, dropping blank lines. Indentation is
// measured at the column where the *bid* begins, so a left-margin `* ` highlight
// marker does not shift a row's nesting level relative to unmarked siblings. A
// `+ `/`- ` diff sentinel (see `_parse-row`) is stripped first and contributes
// nothing to indent at all — it is a zero-width flag, not part of the layout —
// so a changed row nests exactly like its unchanged siblings regardless of
// whether it (or they) carry a sentinel.
#let _lines(src) = {
  let out = ()
  for line in src.split("\n") {
    let s = line.trim(at: start)
    if s.trim() == "" { continue }
    let indent = line.len() - s.len()
    let rest = s
    if rest.starts-with("+ ") or rest.starts-with("- ") {
      rest = rest.slice(2).trim(at: start)
    }
    if rest.starts-with("* ") {
      let hlrest = rest.slice(2).trim(at: start)
      indent += rest.len() - hlrest.len()
      rest = hlrest
    }
    out.push((indent, s.trim(at: end)))
  }
  out
}

// Recursively fold indentation into rows + nested `followups`.
#let _parse-rows(lines, start, base) = {
  let rows = ()
  let i = start
  while i < lines.len() {
    let (ind, txt) = lines.at(i)
    if ind < base { break }
    let row = _parse-row(txt)
    i = i + 1
    if i < lines.len() and lines.at(i).at(0) > ind {
      let res = _parse-rows(lines, i, lines.at(i).at(0))
      rows.push(row)
      rows.push((kind: "fu", rows: res.at(0)))
      i = res.at(1)
    } else {
      rows.push(row)
    }
  }
  (rows, i)
}

#let bt(body) = {
  let src = if type(body) == str { body } else { body.text }
  let lines = _lines(src)
  if lines.len() == 0 { return }
  let res = _parse-rows(lines, 0, calc.min(..lines.map(l => l.at(0))))
  bidtable(..res.at(0))
}

// ---- Plain two-column reference table (glossary etc.) ----
#let deftable(..rows) = bidtable(..rows)

// Drop a trailing sequence dash (em/en) from a heading body — used for table-of
// -contents entries only, so "1♣—1♦—" reads as "1♣—1♦" in the contents while the
// heading itself keeps its trailing dash on the page.
#let _strip-tail-dash(body) = {
  if body.has("children") {
    let ch = body.children
    if ch.len() > 0 and ch.at(-1).func() == text and ch.at(-1).has("text") {
      let t = ch.at(-1).text.trim(regex("[\u{2014}\u{2013} ]+"), at: end)
      ch = ch.slice(0, -1)
      if t != "" { ch.push(text(t)) }
      return ch.join()
    }
  }
  body
}

// ---- Document template ----
#let conf(body) = {
  set page(
    paper: "a4",
    margin: (top: 1.5cm, bottom: 1.5cm, left: 2.5cm, right: 2.5cm),
    numbering: "1",
  )
  set text(font: "New Computer Modern", size: 11pt)
  set par(justify: false, leading: 0.6em, spacing: 0.85em)
  set heading(numbering: "1.1.1.1")
  show outline.entry: it => it.indented(it.prefix(), {
    _strip-tail-dash(it.body())
    box(width: 1fr, it.fill)
    h(0.4em)
    it.page()
  })
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    block(above: 0.4em, below: 0.9em, text(size: 1.5em, it))
  }
  show heading.where(level: 2): it => block(above: 1.1em, below: 0.65em, it)
  set list(indent: 0em, spacing: 0.6em, marker: ([•], [–], [\*]))
  set enum(indent: 0em, spacing: 0.6em)
  body
}
