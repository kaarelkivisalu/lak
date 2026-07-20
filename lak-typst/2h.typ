#import "lib.typ": *

== 2#H— <sec:2H>

This is a strong single-suited hand. Responder should assume a 6#plus#H suit
unless the vulnerability is favourable, in which case a lighter 5-card suit
is possible.

#bt(```
  2S   14+, 5+S, F1
  2N   14+, asks
    = (bid)
      * step 1   PASS or 5-card suit
        step 2   DBL/RDBL
        step *   next bids
    3C   MIN, bad suit
    3D   MIN, good suit
    3H   MAX, bad suit
    3S   MAX, good suit
  3C   14+, 5+C, F1
  3D   14+, 5+D, F1
  3N   asks for a stopper, GF
  4H   to play
  4N   quantitative
```)

/* Commented-out alternative from the original LaTeX source (2h.tex):
#bt(```
  2S   F1
  2N   strong ask, F3H
    = (bid)
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
