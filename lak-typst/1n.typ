#import "lib.typ": *

== 1#N— <sec:1N>

#bt(```
  2C        _Stayman_ { below INV, short C / *5M, INV / 4M, INV+ / *54 or 64 MM, INV+ }
    2D>1N2C2D   no 4+M
    2H>1N2C2H   4--5H, may have 4S
    2S>1N2C2S   4--5S, no 4H
  2D        transfer to H { 5+H below INV or GF / *5S 5+H INV+ }
    2H>1N2D2H   accept transfer
  2H        transfer to S { 5+S below INV or GF / *6+S5+H, GF }
    2S>1N2H2S   accept transfer
  2S>1N2S   { 6+C / range ask }
  2N>1N2N   { 6+D / 55 mm, signoff }
  3C>1N3C   _Puppet Stayman_
  3D        55 mm, GF
  3H        H shortness, 54+ minors, GF
  3S        S shortness, 54+ minors, GF
  3N        to play
  4C        _Gerber_ 1430
  4D        _Texas_ 6+H 0--3S, transfer to H, no slam
  4H        _Texas_ 6+S 0--3H, transfer to S, no slam
  4S        bad quant
  4N        good quant
```)

=== 1#N—2#C—2#D— <1N2C2D>

#bt(```
  2H   MM, no game
    2S   3S 2H
  2S   5S, INV
  2N   INV, may have 5H
  3C   5+C 4M, GF
  3D   5+D 4M, GF
* 3H   5S 4H, GF
* 3S   5H 4S, GF
  3N   to play
  4D   _Delayed Texas_, 6H 4S
  4H   _Delayed Texas_, 6S 4H
  4N   quant
```)

/* Commented-out alternative followups / annotations from the LaTeX source (1n.tex):
#bt(```
  followups for 2S (5S, INV)
    PASS   declines
    2N     accepts, 2S
      PASS   BAL, mild invite
      3m     5S 4+m, mild invite, NF
      3N     to play
    3S     3S, MIN
    4S     3S, MAX
  followups for 2N (INV, may have 5H)
    3m   6 cards, to play
  followups for 3C (5+C 4M, GF)
    3D   R for LMH short
    3M   noise with C interest
    3N   no interest
  followups for 3D (5+D 4M, GF)
    3M   noise with D interest
    3N   no interest
  followups for 3H (5S 4H, GF)
    3S   2S 3H
    3N   to play
    4C   good S raise
    4S   bad S raise
  followups for 3S (5H 4S, GF)
    4C   good H raise
    4H   bad H raise
```)
*/

=== 1#N—2#C—2#H— <1N2C2H>

#bt(```
  2S   5S, INV
  2N   4S, INV
*     3H   5H, accept
  3C   4S 5+C, GF
  3D   4S 5+D, GF
  3H   4H, INV
  3S  cue
  3N   to play
  4CD  cue
  4H   to play
  4S   RKC H
```)

/* Commented followups from the LaTeX source (1n.tex):
#bt(```
  followups for 3C (4S 5+C, GF)
    3D   C interest, asks LH short
    3H   5H
      3S   waiting, no fit or no D stop
    3S   S flag, asks LH short
    4C   great hand for C
  followups for 3D (4S 5+D, GF)
    3H   5H
      3S   waiting, no fit or no C stop
    3S   S flag, asks LH short
    4m   great hand for D
```)
*/

=== 1#N—2#C—2#S— <1N2C2S>

#bt(```
  2N   4-5H, INV
    3H  3H, accept
  3C   4H 5+C, GF
  3D   4H 5+D, GF
  3S   4S, INV
  3N   to play
  4CDH  cue
  4S   to play
  4N   RKC S
```)

/* Commented followups from the LaTeX source (1n.tex):
#bt(```
  followups for 3C (4H 5+C, GF)
    3D   C interest, asks LH short
    3H   4H, asks LH short
    3S   5S
    4C   great hand for C
  followups for 3D (4H 5+D, GF)
    3H   relay with some D interest, asks LH short
    3S   5S
    4m   great hand for D
```)
*/

=== 1#N—2#C—(#dbl)— <1N2CX>

#bt(```
  PASS   4C, no 4M
  RDBL   good 4+C
  2D     4+D, no 4M
  2H     4--5H
  2S     4--5S, no 4H
```)

=== 1#N—2#D—2#H— <1N2D2H>

#bt(```
* 2S      { 5H 5 other, INV / 5S 5H, GF / 6+H, mild ST, splinter }
*     2N   waiting
*         3C       5H 5C, INV
*         3D       5H 5D, INV
*         3H       5S 5H, INV
*         3S       5S 5H, ST
*         3N 4CD   6+H mild ST, LMH splinter
*     3H   declines INV, 3H
*     4H   accepts INV, 3+H
* 2N      6+H, INV to game or slam
*     3H   declines INV
*     3S   accepts INV
  3C      4+C, GF
  3D      4+D, GF
* 3H      6+H, mild INV (needs 3H, MAX)
* 3S 4m   void auto-splinter
  3N      COG, partner expected to bid 4H with most 3-fits
  4H      strong 6/7 H hand, BAL, ST
  4S      5H(332), bad quant
  4N      5H(332), good quant
```)

/* Commented followups from the LaTeX source (1n.tex); these were for 3C (as 2N)
   and 3D (as 3C):
#bt(```
  followups for 3C (4+C, GF; written when this bid was 2N)
    3C   no H fit
      3D      short D
      3H      short S
      3S      2524, ST
      3N 4C   LH void, 55
    3D   H fit
      3H      BAL, ST
      3S      some void, ST (R asks LH)
      3N 4C   LH singleton, ST
      4H      to play
    3N   values in other suits, usually 2H 3C
  followups for 3D (4+D, GF; written when this bid was 3C)
    3D   no H fit
      3H      short C
      3S      short S
      3N      2542, ST
      3C 4D   LH void, 55
    3H   H fit
      3S    BAL, ST
      3N    some void, ST (R asks LH)
      4CD   LH singleton, ST
      4H    to play
    3N   values in other suits, usually 2H 3C
```)
*/

=== 1#N—2#H—2#S— <1N2H2S>

#bt(```
* 2N     6+S 5+H, GF
    3H   H flag
    3S   S flag
    3N   22 majors
    4M   to play
  2C     4+C, GF
  3D     4+D, GF
* 3H     6+S, INV to game or slam
    3S   declines INV
    3N   accepts INV
* 3S     6+S, mild INV
  3N     COG, partner expected to bid 4S with most 3-fits
* 4CDH   void auto-splinter
  4S     strong 6/7 S hand, BAL, ST
  4N     5S(332), quant
```)

/* Commented followups from the LaTeX source (1n.tex), for 2C (as 3C) and 3D (as 3D):
#bt(```
  followups for 2C (4+C, GF; written when this bid was 3C)
    3C   no S fit
      3D      short D
      3H      short H
      3S      5224, ST
      3N 4C   LH void, 55
    3D   S fit
      3H      BAL, ST
      3S      some void, ST (R asks LH)
      3N 4C   LH singleton, ST
      4S      to play
    3N   values in other suits, usually 2S 3C
  followups for 3D (4+D, GF)
    3D   no H fit
      3H    short C
      3S    short H
      3N    5242, ST
      4CD   LH void, 55
    3H   H fit
      3S    BAL, ST
      3N    some void, ST (R asks LH)
      4CD   LH singleton, ST
      4S    to play
    3N   values in other suits, usually 2S 3C
```)
*/

=== 1#N—2#S— <1N2S>

#bt(```
  2N   MIN
*     PASS   to play
*     3C     6+C, to play
*     3D     6C 4D, GF
*     3M     6+C, short M, GF
*     3N     6+C, light BAL ST
*     4C     6+C, short D, GF
*     4D     RKC C
*     4N     quant with 6C
  3C   MAX
*     PASS   to play
*     3D     6C 4D, GF
*     3M     6+C, short M, GF
*     3N     was invite to 3N
*     4C     6+C, short D, GF
*     4D     RKC C
*     4N     quant with 6C
*     5N     pick between 6C/6N
```)

=== 1#N—2#N— <1N2N>

#bt(```
  3C   rejects a D-based invite, may have MAX but 2D
*     PASS   55 mm, no game
*     3D     to play
*     3M     6+D, short M, GF
*     3N     6+D, to play
*     4C     6+D, short C, GF
*     4D     RKC D
*     4N     quant with 6D
*     5N     choose 6N or 6D
  3D   3+D, accepts 3D-based invite, with side stops
*     PASS   55 mm, no game
*     3M     6+D, short M, GF
*     3N     6+D, was invite to game
*     4C     6+D, short C, GF
*     4D     RKC D
*     4N     quant with 6D
*     5N     choose 6N or 6D
```)

=== 1#N—3#C— <1N3C>

#bt(```
  3D   no 5M
    3H   4S
    3S   4H
    3N   to play
  3M   5M
```)

=== 1#N—(2#C)—

#bt(```
  if MM
    `*`   natural
  else
    DBL   _Stayman_
    `*`   system on
```)

=== 1#N—(2$X$ not #C)—

#bt(```
  DBL          penalty-oriented
  2Y           5+Y, below INV
  2N           _Lebensohl_ (puppet to 3C)
    (DBL)
      system on
    3C   forced
      PASS         below INV, C suit
      3Y below X   5+Y, below INV
      3X           asks 4 card M, with stopper
      3Y above X   5+Y, INV
      3N           to play, with stopper
  3Y below X   5+Y, INV
  3X           asks 4 card M, no stopper
  3Y above X   5+Y, GF
  3N           to play, no stopper
  4Y below X   5+Y, GF
```)
