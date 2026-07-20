#import "lib.typ": *

== 1#S— <sec:1S>

#bt(```
  1N     7-11, no S fit
  2m     11+, 5+m, unBAL
  2H     11+, 5+H
  2S     5-9, 3+S
* 2N     11-12 or 17+, 3+S, F3S
*   3CDH   4+m, F1
*   3S     MIN, no side suit
*   4CDH   MAX, splinter
*   3N     MAX, 5S(332)
*   4S     MAX, 6S(322) or 7S(222)
  3S     0-5, 4+S
  3N     13-16, no S fit, BAL
  4S     13-16, 3+S
```)

=== 1#S—(2#N minors)—

#bt(```
  DBL   penalty interest against at least one suit
* 3C    5+ H, GF
* 3D    11+, 3+S, INV+
  3H    nat, NF
* 3S    7-10, 3+S
```)

/* Commented-out alternatives from the original LaTeX source (1s.tex):
// Alternative structure idea that we currently do not use:
=== 1#S— <sec:1S-alt>

#bt(```
  1N   7-12, semiforcing, no fit
  2C   { 2+C, BAL, GF / 5+C, GF }
  2D   5+D, GF
  2H   5+H, GF
  2S   7-bad 11, 3S usually
  2N   4+S, GF
  3C   11+, 6+H, INV+
  3D   { good 11-12, 3+S, INV / weak splinter }
  3H   7-10, 4S
  3S   0-6, 4S
  3N   12-13, any splinter
  4C   10-12, 0C
  4D   10-12, 0D
  4H   10-12, 0H
  4S   to play
```)

=== 1#S—1#N— <1S1N>

#bt(```
  (bid)
    DBL   takeout, could be 6(331)
  PASS   10-13, BAL
  2C     4+C, unBAL
  2D     4+D, unBAL
  2H     4+H, may have 6S 4H
  2S     6+S, may have 4m
  3C     14-15, 5C, good suits, NF
  3D     14-15, 5D, good suits, NF
  3S     trick-based INV
```)

=== 1#S—2#C— <1S2C>

#bt(```
  (bid)
    DBL     penalty
    3C      3C, unBAL
    3 cue   4+C, shortness in opp's suit
  2D   4+D, denies 4H
  2H   4+H, may have 6S 4+H
  2S   4+S, 1-suiter or with 4 weak D
  2N   10-13, 5S(332)
  3C   5S 4/5C, unBAL
  3D   6+S 4+C
  3H   5224
  3S   great long S
```)

=== 1#S—2#D— <1S2D>

#bt(```
  2H   4+H
  2S   6+S, denies 4+H
  2N   { 5S(332) / 5S 4C without 3D }
  3C   5+S 5C
  3D   { 3D / 5242 }
  3H   4+D, 0-1H
  3S   great long S
  3N   5404
  4C   4+D, 0-1C
```)

=== 1#S—2#H— <1S2H>

#bt(```
  2S   6+S, may have 4m
  2N   5233 or 5S 4m without 3H
  3C   5+S 5C, no H fit
  3D   5+S 5H, no H fit
  3H   3+H
  3S   great long S
  3N   5044
  4C   3+H, 0C
  4D   3+H, 0D
  4H   3H, MIN
```)

=== 1#S—2#N <1S2N>

#bt(```
  (bid)
    DBL    shortness in their suit
    PASS   waiting
  3C       10-13
    3D       asks shortness, chooses not to show shortness
      3H       BAL
      3S       some void (R asks LMH)
      3N 4CD   singleton LMH
    3H       some void (R asks LMH)
    3SN 4C   singleton CDH
  3D       14-15, asks shortness, chooses not to show shortness
    3H       BAL
    3S       some void (R asks LMH)
    3N 4CD   singleton LMH
  3H       14-15, some void (R asks LMH)
  3SN 4C   14-15, singleton LMH
```)

=== 1#S—3#C— <1S3C>

#bt(```
  3D   accepts INV
  3H   declines INV, may have short H
  3S   great S, short H, NF
  3N   accepts INV, no interest in long H or 4m
  4m   natural
  4H   accepts INV, MIN
  4S   great S, short H, to play
```)

=== 1#S—3#D— <1S3D>

#bt(```
  3D   interest in game or slam
  3S   double negative
  4S   accepts INV but no splinter
```)

=== Reverse Drury

After #nth(3) hand opening.

#bt(```
  2C   11-12, 3+S, INV
    2D      11+
    2H      4+H
    2S      8-10
    other   11+, natural
```)
*/
