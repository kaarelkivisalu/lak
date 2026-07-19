#import "lib.typ": *

== 1#N— <sec:1N>

#bidtable(
  ([2#C], [#emph[Stayman] #dcases([below INV, short #C], [#hlt[5#M, INV]], [4#M, INV#plus], [#hlt[54 or 64 #MM, INV#plus]])]),
  followups(
    ([#link(<1N2C2D>)[2#D]], [no 4#plus#M]),
    ([#link(<1N2C2H>)[2#H]], [4--5#H, may have 4#S]),
    ([#link(<1N2C2S>)[2#S]], [4--5#S, no 4#H]),
  ),
  ([2#D], [transfer to #H #dcases([5#plus#H below INV or GF], [#hlt[5#S 5#plus#H INV#plus]])]),
  followups(
    ([#link(<1N2D2H>)[2#H]], [accept transfer]),
  ),
  ([2#H], [transfer to #S #dcases([5#plus#S below INV or GF], [#hlt[6#plus#(S)5#plus#H, GF]])]),
  followups(
    ([#link(<1N2H2S>)[2#S]], [accept transfer]),
  ),
  ([#link(<1N2S>)[2#S]], dcases([6#plus#C], [range ask])),
  ([#link(<1N2N>)[2#N]], dcases([6#plus#D], [55 #mm, signoff])),
  ([#link(<1N3C>)[3#C]], [#emph[Puppet Stayman]]),
  ([3#D], [55 mm, GF]),
  ([3#H], [#H shortness, 54#plus minors, GF]),
  ([3#S], [#S shortness, 54#plus minors, GF]),
  ([3#N], [to play]),
  ([4#C], [#emph[Gerber] 1430]),
  ([4#D], [#emph[Texas] 6#plus#H 0--3#S, transfer to #H, no slam]),
  ([4#H], [#emph[Texas] 6#plus#S 0--3#H, transfer to #S, no slam]),
  ([4#S], [bad quant]),
  ([4#N], [good quant]),
)

=== 1#N—2#C—2#D— <1N2C2D>

#bidtable(
  ([2#H], [#MM, no game]),
  followups(
    ([2#S], [3#S 2#H]),
  ),
  ([2#S], [5#S, INV]),
  // \followups{
  //   \P & declines \\
  //   2\N & accepts, 2\S \\
  //   \followups{
  //     \P & BAL, mild invite \\
  //     3\m & 5\S 4\+\m, mild invite, NF\\
  //     3\N & to play \\
  //   }\\
  //   3\S & 3\S, MIN \\
  //   4\S & 3\S, MAX \\
  // }\\
  ([2#N], [INV, may have 5#H]),
  // \followups{
  //   3\m & 6 cards, to play\\
  // }\\
  ([3#C], [5#plus#C 4#M, GF]), // (3\D = R for LMH short, 3\M = noise with \C interest, 3\N = no interest)
  ([3#D], [5#plus#D 4#M, GF]), // (3\M = noise with \D interest, 3\N = no interest)
  hl([3#H], [5#S 4#H, GF]), // (3\S = 2\S 3\H, 3\N = to play, 4\C = good \S raise, 4\S = bad \S raise)
  hl([3#S], [5#H 4#S, GF]), // (4\C = good \H raise, 4\H = bad \H raise)
  ([3#N], [to play]),
  ([4#D], [#emph[Delayed Texas], 6#H 4#S]),
  ([4#H], [#emph[Delayed Texas], 6#S 4#H]),
  ([4#S], [bad quant]),
  ([4#N], [good quant]),
)

=== 1#N—2#C—2#H— <1N2C2H>

#bidtable(
  ([2#S], [5#S, INV]),
  ([2#N], [4#S, INV]),
  followups(
    hl([3#H], [5#H, accept]),
  ),
  ([3#C], [4#S 5#plus#C, GF]),
  // \followups{
  //   3\D & \C interest, asks LH short\\
  //   3\H & 5\H\\
  //   \followups{
  //     3\S & waiting, no fit or no \D stop\\
  //   }\\
  //   3\S & \S flag, asks LH short\\
  //   4\C & great hand for \C\\
  // }\\
  ([3#D], [4#S 5#plus#D, GF]),
  // \followups{
  //   3\H & 5\H\\
  //   \followups{
  //     3\S & waiting, no fit or no \C stop\\
  //   }\\
  //   3\S & \S flag, asks LH short\\
  //   4\m & great hand for \D\\
  // }\\
  ([3#H], [4#H, INV]),
  hl([3#S], [any splinter raise (R asks LMH)]),
  ([3#N], [to play]),
  hl([4#C], [RKC #H]),
  hl([4#D], [#emph[Last Train] (ST in #H, BAL)]),
  ([4#H], [to play]),
  ([4#S], [bad quant]),
  ([4#N], [good quant]),
)

=== 1#N—2#C—2#S— <1N2C2S>

#bidtable(
  ([2#N], [4#H, INV]),
  ([3#C], [4#H 5#plus#C, GF]),
  // \followups{
  //   3\D & \C interest, asks LH short\\
  //   3\H & 4\H, asks LH short\\
  //   3\S & 5\S\\
  //   4\C & great hand for \C\\
  // }\\
  ([3#D], [4#H 5#plus#D, GF]),
  // \followups{
  //   3\H & relay with some \D interest, asks LH short\\
  //   3\S & 5\S\\
  //   4\m & great hand for \D\\
  // }\\
  hl([3#H], [#S flag, unBAL, ST]),
  ([3#S], [4#S, INV]),
  ([3#N], [to play]),
  hl([4#C], [RKC #S]),
  hl([4#D], [bad quant]),
  hl([4#H], [#emph[Last Train] (ST in #S, BAL)]),
  ([4#S], [to play]),
  ([4#N], [good quant]),
)

=== 1#N—2#C—(#dbl)— <1N2CX>

#bidtable(
  ([#pass], [4#C, no 4M]),
  ([#rdbl], [good 4#plus#C]),
  ([2#D], [4#plus#D, no 4M]),
  ([2#H], [4--5#H]),
  ([2#S], [4--5#S, no 4#H]),
)

=== 1#N—2#D—2#H— <1N2D2H>

#bidtable(
  hl([2#S], dcases([5#H 5 other, INV], [5#S 5#H, GF], [6#plus#H, mild ST, splinter])),
  followups(
    hl([2#N], [waiting]),
    followups(
      hl([3#C], [5#H 5#C, INV]),
      ([3#D], [5#H 5#D, INV]),
      ([3#H], [5#S 5#H, INV]),
      ([3#S], [5#S 5#H, ST]),
      ([3#N 4#C#D], [6#plus#H mild ST, LMH splinter]),
    ),
    hl([3#H], [declines INV, 3#H]),
    hl([4#H], [accepts INV, 3#plus#H]),
  ),
  hl([2#N], [6#plus#H, INV to game or slam]),
  followups(
    hl([3#H], [declines INV]),
    hl([3#S], [accepts INV]),
  ),
  ([3#C], [4#plus#C, GF]), // followups were for this bid as 2N
  // \followups{
  //   3\C & no \H fit \\
  //   \followups{
  //     3\D & short \D \\
  //     3\H & short \S \\
  //     3\S & 2524, ST \\
  //     3\N 4\C & LH void, 55 \\
  //   }\\
  //   3\D & \H fit \\
  //   \followups{
  //     3\H & BAL, ST \\
  //     3\S & some void, ST (R asks LH)\\
  //     3\N 4\C & LH singleton, ST \\
  //     4\H & to play \\
  //   }\\
  //   3\N & values in other suits, usually 2\H 3\C \\
  // }\\
  ([3#D], [4#plus#D, GF]), // followups were for this bid as 3C
  // \followups{
  //   3\D & no \H fit \\
  //   \followups{
  //     3\H & short \C \\
  //     3\S & short \S \\
  //     3\N & 2542, ST \\
  //     3\C 4\D & LH void, 55 \\
  //   }\\
  //   3\H & \H fit \\
  //   \followups{
  //     3\S & BAL, ST \\
  //     3\N & some void, ST (R asks LH)\\
  //     4\C\D & LH singleton, ST \\
  //     4\H & to play \\
  //   }\\
  //   3\N & values in other suits, usually 2\H 3\C \\
  // }\\
  hl([3#H], [6#plus#H, mild INV (needs 3#H, MAX)]),
  hl([3#S 4#m], [void auto-splinter]),
  ([3#N], [COG, partner expected to bid 4#H with most 3-fits]),
  ([4#H], [strong 6/7 #H hand, BAL, ST]),
  ([4#S], [5#H\(332), bad quant]),
  ([4#N], [5#H\(332), good quant]),
)

=== 1#N—2#H—2#S— <1N2H2S>

#bidtable(
  hl([2#N], [6#plus#S 5#plus#H, GF]),
  followups(
    ([3#H], [#H flag]),
    ([3#S], [#S flag]),
    ([3#N], [22 majors]),
    ([4#M], [to play]),
  ),
  ([2#C], [4#plus#C, GF]),
  // \followups{
  //   3\C & no \S\ fit \\
  //   \followups{
  //     3\D & short \D \\
  //     3\H & short \H \\
  //     3\S & 5224, ST \\
  //     3\N 4\C & LH void, 55 \\
  //   }\\
  //   3\D & \S\ fit \\
  //   \followups{
  //     3\H & BAL, ST \\
  //     3\S & some void, ST (R asks LH)\\
  //     3\N 4\C & LH singleton, ST \\
  //     4\S & to play \\
  //   }\\
  //   3\N & values in other suits, usually 2\S 3\C \\
  // }\\
  ([3#D], [4#plus#D, GF]),
  // \followups{
  //   3\D & no \H\ fit \\
  //   \followups{
  //     3\H & short \C \\
  //     3\S & short \H \\
  //     3\N & 5242, ST \\
  //     4\C\D & LH void, 55 \\
  //   }\\
  //   3\H & \H\ fit \\
  //   \followups{
  //     3\S & BAL, ST \\
  //     3\N & some void, ST (R asks LH)\\
  //     4\C\D & LH singleton, ST \\
  //     4\S & to play \\
  //   }\\
  //   3\N & values in other suits, usually 2\S 3\C \\
  // }\\
  hl([3#H], [6#plus#S, INV to game or slam]),
  followups(
    ([3#S], [declines INV]),
    ([3#N], [accepts INV]),
  ),
  hl([3#S], [6#plus#S, mild INV]),
  ([3#N], [COG, partner expected to bid 4#S with most 3-fits]),
  hl([4#C#D#H], [void auto-splinter]),
  ([4#S], [strong 6/7 #S hand, BAL, ST]),
  ([4#N], [5#S\(332), quant]),
)

=== 1#N—2#S— <1N2S>

#bidtable(
  ([2#N], [MIN]),
  followups(
    hl([#pass], [to play]),
    ([3#C], [6#plus#C, to play]),
    ([3#D], [6#C 4#D, GF]),
    ([3#M], [6#plus#C, short #M, GF]),
    ([3#N], [6#plus#C, light BAL ST]),
    ([4#C], [6#plus#C, short #D, GF]),
    ([4#D], [RKC #C]),
    ([4#N], [quant with 6#C]),
  ),
  ([3#C], [MAX]),
  followups(
    hl([#pass], [to play]),
    ([3#D], [6#C 4#D, GF]),
    ([3#M], [6#plus#C, short #M, GF]),
    ([3#N], [was invite to 3#N]),
    ([4#C], [6#plus#C, short #D, GF]),
    ([4#D], [RKC #C]),
    ([4#N], [quant with 6#C]),
    ([5#N], [pick between 6#C/6#N]),
  ),
)

=== 1#N—2#N— <1N2N>

#bidtable(
  ([3#C], [rejects a #D#[-based] invite, may have MAX but 2#D]),
  followups(
    hl([#pass], [55 #mm, no game]),
    ([3#D], [to play]),
    ([3#M], [6#plus#D, short #M, GF]),
    ([3#N], [6#plus#D, to play]),
    ([4#C], [6#plus#D, short #C, GF]),
    ([4#D], [RKC #D]),
    ([4#N], [quant with 6#D]),
    ([5#N], [choose 6#N or 6#D]),
  ),
  ([3#D], [3#plus#D, accepts 3#D#[-based] invite, with side stops]),
  followups(
    hl([#pass], [55 #mm, no game]),
    ([3#M], [6#plus#D, short #M, GF]),
    ([3#N], [6#plus#D, was invite to game]),
    ([4#C], [6#plus#D, short #C, GF]),
    ([4#D], [RKC #D]),
    ([4#N], [quant with 6#D]),
    ([5#N], [choose 6#N or 6#D]),
  ),
)

=== 1#N—3#C— <1N3C>

#bidtable(
  ([3#D], [4#M, no 5#M]),
  followups(
    ([3#H], [4#S]),
    ([3#S], [4#H]),
    ([3#N], [no interest in 4#M]),
  ),
  ([3#M], [5#M]),
  ([3#N], [no #M]),
)

=== 1#N—(2#C)—

#bidtable(
  hdr([if #MM]),
  followups(
    ([\*], [natural]),
  ),
  hdr([else]),
  followups(
    ([#dbl], [#emph[Stayman]]),
    ([\*], [system on]),
  ),
)

=== 1#N—(2$X$ not #C)—

#bidtable(
  ([#dbl], [penalty-oriented]),
  ([2$Y$], [5+$Y$, below INV]),
  ([2#N], [#emph[Lebensohl] (puppet to 3#C)]),
  followups(
    hdr([(#dbl)]),
    followups(
      hdr([system on]),
    ),
    ([3#C], [forced]),
    followups(
      ([#pass], [below INV, #C suit]),
      ([3$Y$ below $X$], [5+$Y$, below INV]),
      ([3$X$], [asks 4 card #M, with stopper]),
      ([3$Y$ above $X$], [5+$Y$, INV]),
      ([3#N], [to play, with stopper]),
    ),
  ),
  ([3$Y$ below $X$], [5+$Y$, INV]),
  ([3$X$], [asks 4 card #M, no stopper]),
  ([3$Y$ above $X$], [5+$Y$, GF]),
  ([3#N], [to play, no stopper]),
  ([4$Y$ below $X$], [5+$Y$, GF]),
)
