#import "lib.typ": *

== 2#H— <sec:2H>

Assume 6#plus#H unless NV vs. VUL.

#bt(```
  2S   INV, 5+S
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
  3H   0-13, 3+H, preempt
  4H   to play
```)

/* Commented-out alternative from the original LaTeX source (2h.tex):
#bt(```
  2S   F1
  2N   strong ask, F3H
    (bid)
      PASS   good
      DBL    medium
      3S     bad
    3C   6H, no 4S, MAX
      3D   asks NLMH short
      4C   [PRKC](PRKC)
    3D   no 4S, medium
      3S   asks NLMH short
      4C   [PRKC](PRKC)
    3H   MIN
      3S   asks NLMH short
      4C   [PRKC](PRKC)
    3S   good but not MAX
      4C   asks NLMH short
    3N   6H 4S, not MIN
      4C   asks NLMH short
  3C   F1
  3D   F1
  3H   preempt
  3N   to play
  3S   6+S, GF
  4C   [PRKC](PRKC)
  4H   to play
  4S   to play
```)
*/
