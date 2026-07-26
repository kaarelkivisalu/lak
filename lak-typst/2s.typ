#import "lib.typ": *

#pagebreak(weak: true)

== 2#S— <sec:2S>

Assume 6#plus#S unless NV vs. VUL.

#bt(```
  2N   14+, asks
    (bid)
*       step 1   PASS
*       step 2   DBL/RDBL
*       step *   next bids
    3C   MIN, bad suit
    3D   MIN, good suit
    3H   MAX, bad suit
    3S   MAX, good suit
  3C   INV, 5+C
  3D   INV, 5+D
  3H   INV, 5+H
  3S   0-13, 3+S, preempt
  4S   to play
```)

/* Commented-out alternative from the original LaTeX source (2s.tex):
#bt(```
  2N   strong ask, F3S
    3C   6S, no 4H, MAX
        3D   asks NLMH shorness
        4C   [PRKC](PRKC)
    3D   no 4H, medium
        3H   asks NLMH shorness
        4C   [PRKC](PRKC)
    3H   good but not MAX, no 4H
        4C   asks NLMH shorness
    3S   MIN
        4C   asks NLMH shorness
    3N   6S 4H, not MIN
        4C   asks NLMH shorness
  3C   H, F1
  3D   nat, NF
  3H   C, GF
  3S   preempt
  4C   [PRKC](PRKC)
```)
*/
