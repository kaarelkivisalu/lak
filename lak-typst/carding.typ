#import "lib.typ": *

#let grayrule = luma(190)

// A clean "booktabs" table: black rules top / under-header / bottom, a lightly
// shaded header, and thin gray rules between data rows (no vertical lines).
#let leadtable(header, rows) = table(
  columns: header.len(),
  inset: (x: 6pt, y: 3.5pt),
  align: left,
  fill: (_, y) => if y == 0 { luma(245) },
  stroke: (_, y) => if y >= 2 { (top: 0.5pt + grayrule) },
  table.hline(y: 0, stroke: 0.6pt),
  table.header(..header),
  table.hline(y: 1, stroke: 0.6pt),
  ..rows.flatten(),
  table.hline(stroke: 0.6pt),
)

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
  leadtable(
    ([], [Lead], [In Partner's Suit]),
    (
      ([Suit], [#nth(1)/#nth(3)/#nth(5)], [#nth(1)/#nth(3)/#nth(5)]),
      ([Notrump], [#nth(4) (#nth(2) without honour)], [#nth(1)/#nth(3)/#nth(5)]),
      ([Subsequent], [#nth(1)/#nth(3)/#nth(5)], [#nth(1)/#nth(3)/#nth(5)]),
    ),
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
    inset: (x: 6pt, y: 3.5pt),
    align: left,
    fill: (_, y) => if y == 0 { luma(245) },
    // black rule under the header (y==1) and between the Suit / NT blocks (y==4),
    // thin gray rules between the other data rows.
    stroke: (_, y) => if y == 1 or y == 4 { (top: 0.6pt) } else if y >= 2 { (top: 0.5pt + grayrule) },
    table.hline(y: 0, stroke: 0.6pt),
    table.header([], [Partner's Lead], [Declarer's Lead], [Discarding]),
    [1], [Lo = #enc], [Hi/Lo = Even], [odd=#enc, even=S/P],
    [2 Suit], [Hi/Lo = Even], [], [],
    [3], [S/P], [], [],
    [1], [Lo = #enc], [Hi/Lo = Even], [S/P],
    [2 NT], [Hi/Lo = Even], [], [],
    [3], [S/P], [], [],
    table.hline(stroke: 0.6pt),
  ),
)

For suit preference (S/P) a high card suggests the higher suit and a low card the lower suit.

== Discards

- Italian (aka. Odd-Even) in suit. This means odd=#enc, even Hi/Lo.
- Lavinthal in NT. This means Hi/Lo.
