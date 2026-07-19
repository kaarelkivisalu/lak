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
#let hl(bid, desc) = (kind: "row", bid: bid, desc: desc, hl: true)
#let hdr(body, hl: false) = (kind: "hdr", body: body, hl: hl)
#let followups(..rows) = (kind: "fu", rows: rows.pos())

#let bidtable(..rows) = {
  let cells = ()
  for r in rows.pos() {
    if type(r) == array {
      // plain (bid, desc) row
      cells.push(table.cell(r.at(0)))
      cells.push(table.cell(r.at(1)))
    } else if type(r) == dictionary and r.kind == "row" {
      let f = if r.hl { hlcol } else { none }
      cells.push(table.cell(fill: f, r.bid))
      cells.push(table.cell(fill: f, r.desc))
    } else if type(r) == dictionary and r.kind == "hdr" {
      let f = if r.hl { hlcol } else { none }
      cells.push(table.cell(colspan: 2, fill: f, r.body))
    } else if type(r) == dictionary and r.kind == "fu" {
      cells.push(table.cell(
        colspan: 2, inset: (x: 0pt, y: 2.5pt),
        pad(left: 2mm, bidtable(..r.rows)),
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

// Render a run of non-word characters, turning `+` into a superscript.
#let _plain(t) = {
  let acc = []
  for (i, p) in t.split("+").enumerate() {
    if i > 0 { acc += super[+] }
    acc += [#p]
  }
  acc
}

// Render a text fragment (bid label or meaning) with bridge notation.
#let _notation(s) = {
  if s == "" { return [] }
  s = s.replace("--", "–")
  s = s.replace(regex("([0-9)])-([0-9(])"), m => m.captures.at(0) + "–" + m.captures.at(1))
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

// Parse a single (already dedented) line into a bidtable row dict.
#let _parse-row(txt) = {
  let hl = false
  let t = txt
  if t.starts-with("* ") { hl = true; t = t.slice(2).trim() }
  if t.starts-with("= ") {
    return (kind: "hdr", body: _notation(t.slice(2).trim()), hl: hl)
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
  let descc = if desc.starts-with("{") and desc.ends-with("}") {
    _braces(desc.slice(1, desc.len() - 1))
  } else { _notation(desc) }
  (kind: "row", bid: bidc, desc: descc, hl: hl)
}

// Split source into (indent, text) pairs, dropping blank lines. Indentation is
// measured at the column where the *bid* begins, so a left-margin `* ` highlight
// marker does not shift a row's nesting level relative to unmarked siblings.
#let _lines(src) = {
  let out = ()
  for line in src.split("\n") {
    let s = line.trim(at: start)
    if s.trim() == "" { continue }
    let indent = line.len() - s.len()
    if s.starts-with("* ") {
      let rest = s.slice(2).trim(at: start)
      indent += s.len() - rest.len()
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
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    block(above: 0.4em, below: 0.9em, text(size: 1.5em, it))
  }
  show heading.where(level: 2): it => block(above: 1.1em, below: 0.65em, it)
  set list(indent: 0em, spacing: 0.6em, marker: ([•], [–], [\*]))
  set enum(indent: 0em, spacing: 0.6em)
  body
}
