#import "lib.typ": *

== 2#N— <sec:2N>

#bidtable(
  ([3#C], [#emph[Muppet Stayman] #dcases([3#plus#M], [5#(S)3-5#H], [not 5#(H)4#S])]),
  followups(
    ([3#D], [4#M, no 5#M]),
    followups(
      ([3#H], [4-5#S, asks #S length]),
      followups(
        ([3#S], [3#(S)4#H]),
        ([3#N], [2#(S)4#H]),
        ([4#C], [4#S, MAX]),
        ([4#S], [4#S, MIN]),
      ),
      ([3#S], [4#H]),
      ([3#N], [to play (no 4#M)]),
      ([4#C], [44#plus#MM, SI]),
      followups(
        ([4#D], [RKC in #H]),
        ([4#H#S], [to play]),
        ([4#N], [RKC in #S]),
      ),
      ([4#D], [44#plus#MM, no SI]),
    ),
    ([3#H], [no 4#plus#M]),
    followups(
      ([3#S], [transfer to 3#N (to play)]),
      ([3#N], [5#S]),
      ([4#C], [55 #MM, SI]),
      followups(
        ([4#D], [RKC in #H]),
        ([4#H#S], [to play]),
        ([4#N], [RKC in #S]),
      ),
      ([4#D], [55 #MM, no SI]),
    ),
    ([3#S], [5#S]),
    ([3#N], [5#H]),
    followups(
      ([4#D], [transfer to 4#H]),
    ),
  ),
  ([3#D], [transfer to #H #dcases([5#plus#H], [5#(H)4#S])]),
  followups(
    hdr([3#H]),
    followups(
      ([3#S], [choose a game (indicating exactly 5#H)]),
      ([3#N], [5#(H)4#S, no SI if no fit, NF]),
    ),
  ),
  ([3#H], [transfer to #S, not 5#(S)3-5#H]),
  hl([3#S], [54#plus#mm or 6#plus #m, at least mild ST]),
  ([3#N], [to play]),
  ([4#C], [#emph[Gerber] 1430]),
  ([4#D], [6#plus#H, ST]),
  ([4#H], [6#plus#S, ST]),
  ([4#S], [bad quant]),
  ([4#N], [good quant]),
)
