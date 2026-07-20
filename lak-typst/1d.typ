#import "lib.typ": *

== 1#D— <sec:1D>

#bt(```
  1H>1D1H   6+, 4+H, F1
  1S>1D1S   6+, 4+S, F1
  1N        7--bad 11, BAL, no 4M, NF
  2C        11+, (4)5+C, no 4M unless GF and 6+C, F1
  2D        11+, (4)5+D, no 4M unless GF and 6+D, F1
  2H        0-10, 5S 4-5H
  2S        11+, 5S 4-5H, INV opposite 10-13 BAL, F1
  2N        good 11-13, BAL, no 4M, INV
* 3C        6-10, 54 mm, `P/C`
  3D        5-10, 6+D
  3H        6-9, 7+H
  3S        6-9, 7+S
  3N        13-16, BAL, no 4M
* 4C        6-10, 55+ mm, `P/C`
  4D        6-9, 7+D
  4H        good 7 or 8+H, preemptive
  4S        good 7 or 8+S, preemptive
```)

Passed hand adjustments:

#bt(```
  2C   6-9, 5+C
  2D   6-9, 5+D
* 2H   6-9, 5S 4+H
* 2S   6-9, 6S 4+H
```)

=== Interference over 1#D

Negative doubles are used. 2-level free bids (2#D is a free bid) are F1. Support (re)doubles are on.

As a responder assume that opener has 10--13(14) BAL until told otherwise.

=== 1#D—1#H— <1D1H>

#bt(```
  (DBL)
    PASS   denies 3+H, may have 4S if BAL/3-suiter
    RDBL   3H
*   1S   4S
    1N     1--2 H
*   2C   54+mm
  (1S)
    PASS   denies 3H
    DBL    3H
    1N     1--2H, good stops
  * 2C   54+mm
  (1N nat)
    DBL   12-15, 3H
  * 2C   54+mm
  (2C)
    DBL   3H
  (2D)
    DBL   3H
  (2S)
    DBL   12-15, 3H
*   2N   good hand with 6D and stopper, NF
*   3C   55+mm
  1S   4S, other bids deny 4S
    `*`   [XYZ](XYZ)
  1N   10-13(14), no singleton, BAL
    `*`   [XYZ](XYZ)
  2C   8+ cards in the minors, not 6D 4C
  2D   10-12, 6+D
*   2S   artificial GF
  2H   { 10-13(14), 4H, BAL / 10-12, 4H, unBAL }
* 2S   5S 6+D
* 2N   13-15, 3H 6+D
* 3C   13-15, 55+ mm
  3D   13-15, 6+D
  3H   13-15, 4H, unBAL
```)

=== 1#D—1#S— <1D1S>

#bt(```
  (DBL)
    PASS   denies 3+S
    RDBL   3S
    1N     1--2 S
    * 2C   54+mm
  (1N nat)
    DBL   12-15, 3S
    * 2C   54+mm
  (2C)
    DBL   3S
  (2D)
    DBL   3S
  (2H)
    DBL   12-15, 3S
    * 2N   good hand with 6D and stopper, NF
    * 3C   55+mm
  1N   10-13(14), no singleton, BAL
    `*`   [XYZ](XYZ)
  2C   8+ cards in the minors, not 6D 4C
  2D   6+D
    * 2H   artificial GF
* 2H   5H 6+D
  2S   { 10-13(14), 4S, BAL / 10-12, 4S, unBAL / *3451 }
* 2N   13-15, 3S 6+D, BAL
* 3C   13-15, 55+ mm
  3D   13-15, 6+D
  3S   13-15, 4S, unBAL
```)

=== 1#D—(#dbl)—

#bt(```
  RDBL   INV+
  1H     4+H
  1S     4+S
  1N     7-11, BAL
```)

=== 1#D—(1#H)—

#bt(```
  DBL   4S
* 1S    5S
  1N    nat, does not promise stopper
  2C    5+C, F1
  2D    5+D, F1
* 2H    6+S
* 2S    INV+, 54+mm
  2N    nat INV, promises stopper
* 3C    mm, no game, worse than 2S
  3D    6+D, to play
* 3H    transfer to 3N, stopper that prefer partner declare
  3N    to play
  3m    preempt
  4S    to play
```)

=== 1#D—(1#S)—

#bt(```
  DBL   negative
  1N    nat, does not promise stopper
  2C    5+C, F1
  2D    5+D, F1
  2H    5+H, NF
* 2S    INV+, 54+mm
  2N    nat INV, promises stopper
* 3C    mm, no game, worse than 2S
  3D    6+D, to play
  3H    6+H, GF
* 3S    transfer to 3N, stopper that prefer partner declare
  3N    to play
  3m    preempt
  4H    to play
```)

=== 1#D—(1#N)—

Same as #link(<sec:v1N>)[against 1#N].

/* Commented-out alternatives from the original LaTeX source (1d.tex):
=== 1#D—1#N— <1D1N>

#bt(```
  (DBL)
    2C   44+ mm, unBAL
    2D   5+D
  (2M)
    DBL   takeout
    2N    good 3D rebid
    3C    4/5D 5C
    3D    to play
  2D   6+D or 5D unBAL
  2M   14-15, short M
  2N   14-15, 4441
  3M   6D 5M, FG or F4D
  3N   to play, based on long running D
```)

=== 1#D—2#C— <1D2C>

#bt(```
  (2M)
    PASS   waiting
    DBL    penalty
    2N     good stops
  2D   5+D, 0--3C, unBAL
    3C      11-12, 5+C, INV
    3D      NF
    other   GF
  2H   11-13(14), BAL
    2S   puppet to 2N
      2N   forced
        3C   5+C, GF
        3D   5C 4D, GF
        3H   4H 6C, GF
        3S   4S 6C, GF
        3N   S/O
    2N   asks 4+ card minor, ST, BAL, GF
    3C   11-12, 5+C, INV
    3H   5H 6C, GF
    3S   5S 6C, GF
    3N   prefers to declare, S/O
  2S   4+C, some splinter, GF
    2N   asks SHC
      3C   S splinter
      3D   H splinter
      3H   C splinter
  2N   10-12, 4441
  3C   (41)53, GF
    3D   asks
      3H   4H
      3S   4S
  3D   very good 6+D, GF
  3H   5H 6D, GF
  3S   5S 6D, GF
  3N   13-15, 4441
```)

=== 1#D—2#D— <1D2D>

#bt(```
  (2M)
    3D   D fit, BAL, MIN
    3M   4+D, short M
  2H   10-13(14), BAL
    2S   puppet to 2N
      2N   forced
        3C   54+ mm (could be 4D 5C), GF
        3D   5+D, GF
        3H   4H 6D, GF
        3S   4S 6D, GF
        3N   S/O
    2N   asks 4+ card minor, ST, BAL, GF
    3C   11-12, 54+ mm (could be 4D 5C), INV
    3D   11-12, 5+D, INV
    3H   5S 6D, GF
    3S   5S 6D, GF
    3N   Prefers to declare, S/O
  2S   4+D, some splinter, GF
    2N   asks SHC
      3C   S splinter
      3D   H splinter
      3H   C splinter
  2N   10-12, 6D, BAL
  3C   (41)35, GF
    3D   asks
      3H   4H
      3S   4S
  3D   very good 6+D, GF
  3H   5H 6D, GF
  3S   5S 6D, GF
  3N   13-15, 6D, BAL
```)

=== 1#D—2#S— <1D2S>

1#D—2#H— is similar but the responder is limited.

#bt(```
  PASS   preference for S, MIN
  2N     asks
    3C   5S 4H, MIN
    3D   5S 4H, MAX
    3H   5S 5H, MIN
    3S   5S 5H, MAX
  3C     55+ mm
  3D     6+D
  3H     preference for H, MIN
  3N     to play
  4H     to play
  4S     to play
```)

=== 1#D—2#N— <1D2N>

#bt(```
  PASS   10-12
  3C     mm, C better, 10-12, S/O
  3D     mm, D better, 10-12, S/O
  3H     good 4H, 0-1S
  3S     good 4S, 0-1H
  3N     13-15
  4H     5H 6D
  4S     5H 6D
```)
*/
