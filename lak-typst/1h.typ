#import "lib.typ": *

== 1#H— <sec:1H>

#bt(```
  1S   7+, 4+S, F1
  1N   7-11, no H fit
  2m   11+, 5+m, no H fit
  2H   5-9, 3+H
* 2N   11-12 or 17+, 3+H, F3H
*   3m      4+m, F1
*   3H      MIN, no side suit
*   3S/4m   MAX, splinter
*   3N      MAX, 5H(332)
*   4H      MAX, 6H(322) or 7H(222)
  3H   0-5, 4+H
  3N   13-16, no H fit, BAL
  4H   13-16, 3+H
```)

=== 1#H—(2#N minors)— <sec:1M-2N>

#bt(```
  DBL   penalty interest against at least one suit
* 3C    5+ S, GF
* 3D    11+, 3+H, INV+
* 3H    7-10, 3+H
  3S    nat, NF
```)

/* Draft rewrite of interference-over-1H from the LaTeX source (comp.tex): a
much larger structure (fit-jumps, transfer responses to DBL/1N) than the
single live `(2N minors)` subsection above. `comp.tex` is not currently
`\input` by lak.tex, and this draft has not been folded back into 1h.tex, so
none of it is part of the current system yet — kept here only for reference.
Translated to the same `#bt` notation as live content (so it compiles as-is
if the wrapper is ever removed), including a fix of one apparent source typo
(the last subsection's short title says "(4m)" while its LaTeX section-title
argument says "(3m)"; the content is clearly about 4-level minor overcalls,
so "(4m)" is used here).

=== 1#H—(#dbl)—

#bt(```
  RDBL   strength
  1S     4+S, F1
* 1N     TRF to C, F2C
* 2C     TRF to D, F2D
* 2D     8+, 3+H, F2H
  2H     0-7, 3+H
* 2S     FJ to 3H
* 2N     4+H, INV+
* 3m     FJ to 3H
  3H     4+H, PRE
  3S     FJ to 4H
  3N     to play
  4m     FJ to 4H
  4H     to play
```)

=== 1#H—(1#S)—

#bt(```
  DBL   takeout
  1N    nat
  2m    nat, F1
  2H    3+H
  2S    3H, INV+
* 2N    4+H, INV+
* 3m    FJ to 3H
  3H    PRE, 4+H
  3S    splinter
  3N    to play, with stopper
* 4m    FJ to 4H
  4H    to play
  5m    to play
```)

=== 1#H—(1#N)—

#bt(```
  DBL   strength
* 2C    5+S 3+H
* 2D    8+, 3+H, F2H
  2H    0-7, 3+H
  2S    nat, NF
* 3m    FJ to 3H
  3H    PRE
* 3S    FJ to 4H
* 4m    FJ to 4H
  4H    to play
  4S    to play
  5m    to play
```)

=== 1#H—(2#m)—

#bt(```
  DBL            takeout
  2D             nat, F1
  2H             3+H
  2S             nat, F1
* 2N             4+H, INV+
* 3C (over 2D)   nat, FG (PH: FNJ to 3H)
* 3D (over 2C)   FJ to 3H
  3m             3H, INV+
  3H             4+H, PRE
* 3S             FJ to 4H
  3N             to play, with stopper
  4m             splinter
* 4om            FJ to 4H
  4H             to play
  4S             to play
  5om            to play
```)

=== 1#H—(2#H Michaels)—

#bt(```
  DBL   strength
  2S    3+H, INV+
* 2N    C or D
* 3m    FNJ to 3H
  3H    MIX
  3N    to play, with S stopper
* 4m    FJ to 4H
  4H    preemptive
```)

=== 1#H—(2#S)—

#bt(```
  DBL   takeout
* 2N    4+H, INV+
* 3m    nat, FG (PH: FNJ to 3H)
  3H    3+H, NF
* 3S    H flag, FG
  3N    to play, with stopper
* 4m    FJ to 4H
* 4H    MIX
  5m    to play
```)

=== 1#H—(2#N minors)—

#bt(```
  DBL   penalty interest against at least one suit
* 3C    5+S, GF
* 3D    11+, 3+H, INV+
* 3H    MIX
  3S    nat, NF
  4m    splinter
  4H    to play
```)

=== 1#H—(3#m)—

#bt(```
  DBL            takeout
* 3D (over 3C)   nat, FG (PH: FNJ to 3H)
  3H             3+H, NF
* 3S             nat, FG (PH: FNJ to 4H)
  3N             to play, with stopper
* 4m             H flag, FG
  4C (over 3D)   nat, FG
* 4D (over 3C)   FJ
* 4H             MIX
  4S             to play
  5om            to play
```)

=== 1#H—(3#S)—

#bt(```
  DBL   takeout
  3N    to play, with stopper
* 4m    nat, FG (PH: FNJ to 4H)
  4H    to play
  5m    to play
```)

=== 1#H—(4#m)—

#bt(```
  DBL            takeout
* 4D (over 4C)   nat, FG (PH: FNJ to 4H)
  4H             to play
  4S             to play
  5C (over 4D)   to play
  5D (over 4C)   to play
```)

Commented-out alternatives from the original LaTeX source (1h.tex):
Alternative structure idea that we currently do not use:

=== 1#H— <sec:1H-alt>

#bt(```
  1S   4+S, F1 (GF with 4S is 2C)
  1N   7-12, semiforcing, no fit
  2C   { 2+C, BAL, GF / 5+C, GF }
  2D   5+D, GF
  2H   7-bad 11, 3H usually
  2S   6+S, less than INV
  2N   4+H, (BAL or 14+ splinter), GF
  3C   { good 11-12, 3+H, INV / weak splinter }
  3D   7-10, 4H
  3H   0-6, 4H
  3S   12-13, any splinter
    3N   asks LMH
    4H   does not care
  3N   10-12, 0S
  4C   10-12, 0C
  4D   10-12, 0D
  4H   to play
  4S   to play
```)

=== 1#H—1#S— <1H1S>

#bt(```
  1N   10-13, BAL
    `*`   [XYZ](XYZ)
  2C   4+C, may have 3S
  2D   4+D, may have 3S
  2H   6+H, may have 4m
  2S   10-13, 4S or 3S unBAL
  2N   6+H, 3S
  3C   14-15, 5C
  3D   14-15, 5D
  3H   long H suit, INV, NF
  3S   14-15, 4S
  4m   void splinter
  4H   12-14, 8.5 tricks, 7-8 H missing one of the top 5 honours
  4S   11 cards in S and H, MIN
```)

=== 1#H—1#N— <1H1N>

#bt(```
  (bid)
    X   takeout
  PASS   10-13, { BAL / 4S 5H, no 4m }
  2C     4+C
  2D     4+D
  2H     6+H
  2S     14-15, 4S 5H
  2N     { 6H 4m / 6H 5S, superMAX }
  3C     14-15, 5C, good suits, NF
  3D     14-15, 5D, good suits, NF
  3H     trick-based INV
```)

=== 1#H—2#C— <1H2C>

#bt(```
  (bid)
    X       penalty
    3C      3C, unBAL
    3 cue   4+C, shortness in opp's suit
  2D   4+D, denies 4S
  2H   6+H, 1-suiter or with 4 weak D
  2S   4+S, may have 6S or 45(04)
  2N   10-13, 5H(332)
  3C   5H 4/5C, unBAL
  3D   6+H 4+C
  3H   2524
  3S   great long H
```)

=== 1#H—2#D— <1H2D>

#bt(```
  2H   6+H, denies 4+S
  2S   4+S, denies 6+H unless 6+H 5+S
  2N   { 11-33, 5H(332) / 5H 4C without 3D }
  3C   5+H 5C
  3D   { 3D / 2542 }
  3H   great long H
  3S   4+D, 0-1S
  3N   4504
  4C   4+D, 0-1C
```)

=== 1#H—2#N— <1H2N>

#bt(```
  (bid)
    X      shortness in their suit
    PASS   waiting
  3C       10-13
    3D       asks shortness, chooses not to show shortness
      3H       BAL
      3S       some void (R asks LMH)
      3N 4CD   singleton LMH
    3H       some void (R asks LMH)
    3SN 4C   singleton CDS
  3D       14-15, asks shortness, chooses not to show shortness
    3H       BAL
    3S       some void (R asks LMH)
    3N 4CD   singleton LMH
  3H       14-15, some void (R asks LMH)
  3SN 4C   14-15, singleton LMH
```)

=== 1#H—3#C— <1H3C>

#bt(```
  3D   interest in game or slam
    3H       bad INV
    3S 4CD   LMH splinter
    3N       3H(433) good INV, NF
    4H       good INV
  3H   double-negative
  4H   accepts INV but no splinter
```)

=== Reverse Drury

After #nth(3) hand opening.

#bt(```
  2C   Drury response
    2D      11+
    2H      8-10
    other   11+, natural
```)
*/
