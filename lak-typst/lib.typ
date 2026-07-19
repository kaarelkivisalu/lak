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
#let dbl  = text(size: 0.82em)[DBL]
#let rdbl = text(size: 0.82em)[RDBL]
#let pass = text(size: 0.82em)[PASS]

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
#let diff-added(body) = underline(text(fill: diffaddcol, body))
#let diff-deleted(body) = strike(text(fill: diffdelcol, body))

// Inner recursive renderer: builds the (possibly nested) table. Followups
// recurse through here so the top-level wrapper's page-break and link styling
// apply to the whole tree exactly once.
#let _render(rows) = {
  let cells = ()
  for r in rows {
    if type(r) == array {
      // plain (bid, desc) row
      cells.push(table.cell(r.at(0)))
      cells.push(table.cell(r.at(1)))
    } else if type(r) == dictionary and r.kind == "row" {
      let status = r.at("status", default: none)
      let f = if r.at("hl", default: false) { hlcol }
        else if status == "added" { diffaddbg }
        else if status == "deleted" { diffdelbg }
        else { none }
      cells.push(table.cell(fill: f, r.bid))
      cells.push(table.cell(fill: f, r.desc))
    } else if type(r) == dictionary and r.kind == "hdr" {
      let status = r.at("status", default: none)
      let f = if r.at("hl", default: false) { hlcol }
        else if status == "added" { diffaddbg }
        else if status == "deleted" { diffdelbg }
        else { none }
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
    out.push(_word(m.text))
    idx = m.end
  }
  if idx < s.len() { out.push(_plain(s.slice(idx))) }
  out.join()
}

// Render a bid label or meaning, with three span escapes:
//   `verbatim`       — emitted literally; the escape hatch when the suit-word
//                      rule would misfire, e.g. `P/C` ("pass or correct").
//   _emphasis_       — italic, for convention names (_Stayman_, _Lebensohl_, …).
//   [text](label)    — a cross-reference link to <label> inside a cell.
#let _notation(s) = {
  if s == "" { return [] }
  if not (s.contains("`") or s.contains("_") or s.contains("](")) {
    return _notation-core(s)
  }
  let out = []
  let idx = 0
  for m in s.matches(regex("`([^`]*)`|_([^_]*)_|\\[([^\\]]*)\\]\\(([^)]*)\\)")) {
    if m.start > idx { out += _notation-core(s.slice(idx, m.start)) }
    let c = m.captures
    if c.at(0) != none { out += [#(c.at(0))] }
    else if c.at(1) != none { out += emph(_notation-core(c.at(1))) }
    else { out += link(label(c.at(3)), _notation-core(c.at(2))) }
    idx = m.end
  }
  if idx < s.len() { out += _notation-core(s.slice(idx)) }
  out
}

// Parse a `{ a = c / b = c }` (dcasesr) or `{ a / b }` (dcases) cell. A leading
// `*` on an alternative highlights it inline.
#let _alt(a) = {
  a = a.trim()
  if a.starts-with("*") { hlt(_notation(a.slice(1).trim())) } else { _notation(a) }
}
#let _braces(inner) = {
  let rows = inner.split("/")
  if rows.any(r => r.contains(" = ")) {
    dcasesr(..rows.map(r => {
      let p = r.split(" = ")
      (_alt(p.at(0)), _notation(if p.len() > 1 { p.slice(1).join(" = ").trim() } else { "" }))
    }))
  } else {
    dcases(..rows.map(_alt))
  }
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
  let diffwrap = if status == "added" { diff-added }
    else if status == "deleted" { diff-deleted }
    else { body => body }
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
  // A `{ … }` at the end of the meaning is a dcases/dcasesr brace; any text
  // before it (e.g. "transfer to H") is rendered inline in front of the brace.
  let descc = if desc.contains("{") and desc.ends-with("}") {
    let o = desc.match(regex("\{")).start
    _notation(desc.slice(0, o)) + _braces(desc.slice(o + 1, desc.len() - 1))
  } else { _notation(desc) }
  (kind: "row", bid: diffwrap(bidc), desc: diffwrap(descc), hl: hl, status: status)
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
