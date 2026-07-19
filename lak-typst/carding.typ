#import "lib.typ": *

#let grayrule = luma(190)

// Table with black frame, black header rule and light-gray rules between data rows.
#let leadtable(header, rows) = {
  let cols = header.len()
  table(
    columns: cols,
    stroke: none,
    inset: (x: 6pt, y: 3.5pt),
    align: left,
    table.hline(y: 0, stroke: 0.6pt),
    ..range(cols + 1).map(i => table.vline(x: i, stroke: 0.6pt)),
    ..header,
    table.hline(stroke: 0.6pt),
    ..rows.enumerate().map(((i, r)) => {
      (if i > 0 { (table.hline(stroke: 0.5pt + grayrule),) } else { () }) + r.map(c => c)
    }).flatten(),
    table.hline(stroke: 0.6pt),
  )
}

== Leads

General style:
- Reverse attitude (low = #enc, high = #disc)
- Standard count (Hi/Lo = even)
- Attitude on A or Q (denies A)
- If needed, unblock on K, else count on K
- #nth(1), #nth(3) or #nth(5) in suit
- #nth(4) in NT with honour
- #nth(2) in NT without honour
- In partner's suit always #nth(1), #nth(3) or #nth(5)
- 10 or 9 is always #nth(1) or #nth(3)
- MUD for weak 3-counts

#v(1em)

#figure(
  caption: [Opening leads style.],
  table(
    columns: 3,
    stroke: 0.6pt,
    inset: (x: 6pt, y: 3.5pt),
    align: left,
    [], [Lead], [In Partner's Suit],
    [Suit], [#nth(1)/#nth(3)/#nth(5)], [#nth(1)/#nth(3)/#nth(5)],
    [Notrump], [#nth(4) (#nth(2) without honour)], [#nth(1)/#nth(3)/#nth(5)],
    [Subsequent], [#nth(1)/#nth(3)/#nth(5)], [#nth(1)/#nth(3)/#nth(5)],
  ),
)

#figure(
  caption: [Leads vs Suit.],
  leadtable(
    ([Card], [Combination], [Signal]),
    (
      ([Ace], [AK(+), Ax], [#att]),
      ([King], [AK(+), KQ(+)], [If needed unblock, else count]),
      ([Queen], [KQ(+), QJ(+), Qx], [#att]),
      ([Jack], [J10(+), Jx], [Count]),
      ([10], [HJ10(+), 109(+), 10x], [Count]),
      ([9], [H109(+), 98(+), 9x], [Count]),
      ([Hi-X], [Xx, xXx], [Count]),
      ([Lo-X], [xxXx, HxX(x), xxxxX, HxxxX], [Count]),
    ),
  ),
)

#figure(
  caption: [Leads vs NT.],
  leadtable(
    ([Card], [Combination], [Signal]),
    (
      ([Ace], [AK(+), Ax], [#att]),
      ([King], [AK(+), KQ(+)], [If needed unblock, else count]),
      ([Queen], [KQ(+), QJ(+), Qx], [#att]),
      ([Jack], [J10(+), Jx], [Count]),
      ([10], [HJ10(+), 109(+), 10x], [Count]),
      ([9], [H109(+), 98(+), 9x], [Count]),
      ([Hi-X], [Xx, xXx, xXxx(+)], [Count]),
      ([Lo-X], [HxxX(+), HHxX(+), HxX], [Count]),
    ),
  ),
)

#figure(
  caption: [Signals in order of priority.],
  table(
    columns: 4,
    stroke: none,
    inset: (x: 6pt, y: 3.5pt),
    align: left,
    table.hline(y: 0, stroke: 0.6pt),
    ..range(5).map(i => table.vline(x: i, stroke: 0.6pt)),
    [], [Partner's Lead], [Declarer's Lead], [Discarding],
    table.hline(stroke: 0.6pt),
    [1], [Lo = #enc], [Hi/Lo = Even], [odd=#enc, even=S/P],
    table.hline(stroke: 0.5pt + grayrule),
    [2 Suit], [Hi/Lo = Even], [], [],
    table.hline(stroke: 0.5pt + grayrule),
    [3], [S/P], [], [],
    table.hline(stroke: 0.6pt),
    [1], [Lo = #enc], [Hi/Lo = Even], [S/P],
    table.hline(stroke: 0.5pt + grayrule),
    [2 NT], [Hi/Lo = Even], [], [],
    table.hline(stroke: 0.5pt + grayrule),
    [3], [S/P], [], [],
    table.hline(stroke: 0.6pt),
  ),
)

For suit preference (S/P) a high card suggests the higher suit and a low card the lower suit.

== Discards

- Italian (aka. Odd-Even) in suit. This means odd=#enc, even Hi/Lo.
- Lavinthal in NT. This means Hi/Lo.
