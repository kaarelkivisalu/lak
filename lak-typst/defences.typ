#import "lib.typ": *

== Takeout Doubles

Equal level conversion only over 1#M openings with o#M and #D, see #ref(<def:1M-X>, supplement: none).

== Against Strong 1#C

#bidtable(
  ([#dbl], [#MM]),
  ([n#N], [#mm]),
)

== Against 1$X$ natural

#bidtable(
  ([2$X$ over 1#m], [#MM, 55#plus]),
  ([2$X$ over 1#M], [o#M and m, 55#plus]),
  ([2#N], [two lowest unbid suits (at least 55)]),
)

=== (1#M)—#pass—(2#M)—#dbl—

#bidtable(
  hdr([(#rdbl)]),
  followups(
    hdr([system on]),
  ),
  ([2#S], [5+#S, below INV]),
  ([2#N], [#emph[Lebensohl] (usually puppet to 3#C)]),
  followups(
    hdr([(#dbl)]),
    followups(
      hdr([system on]),
    ),
    ([3#C], [usually forced]),
    followups(
      ([#pass], [below INV, #C suit]),
      ([3$X$ below #M], [5+$X$, below INV]),
      ([3#M], [asks 4 card o#M, with stopper]),
      ([3$X$ above #M], [5+$X$, INV]),
      ([3#N], [to play, with stopper]),
    ),
    ([3#D#H#S 4#C], [18#plus, 5#plus strong suit]),
    ([3#N], [18#plus, semiBAL, with stopper]),
  ),
  ([3$X$ below #M], [5+$X$, INV]),
  ([3#M], [asks 4 card o#M, no stopper]),
  ([3$X$ above #M], [5+$X$, GF]),
  ([3#N], [to play, no stopper]),
  ([4$X$ below #M], [5+$X$, GF]),
)

=== (1#M)—#dbl— <def:1M-X>

#bidtable(
  ([2#C], []),
  followups(
    ([2#D], [#emph[Equal Level Conversion], o#M and #D]),
  ),
)

=== (1#M)—#dbl—(2#M)—

#bidtable(
  ([#dbl], [responsive]),
  ([2#S], [5+#S, below INV]),
  ([2#N], [#emph[Lebensohl] (usually puppet to 3#C)]),
  followups(
    hdr([(#dbl)]),
    followups(
      hdr([system on]),
    ),
    ([3#C], [usually forced]),
    followups(
      ([#pass], [below INV, #C suit]),
      ([3$X$ below #M], [5+$X$, below INV]),
      ([3#M], [asks 4 card o#M, with stopper]),
      ([3$X$ above #M], [5+$X$, INV]),
      ([3#N], [to play, with stopper]),
    ),
    ([3#D#H#S 4#C], [18#plus, 5#plus strong suit]),
    ([3#N], [18#plus, semiBAL, with stopper]),
  ),
  ([3$X$ below #M], [5+$X$, INV]),
  ([3#M], [asks 4 card o#M, no stopper]),
  ([3$X$ above #M], [5+$X$, GF]),
  ([3#N], [to play, no stopper]),
  ([4$X$ below #M], [5+$X$, GF]),
)

== Against 1#D precision

1#D is treated as a natural 1$X$ opening with the following exceptions. This means that #D is used for cue bids later even though it is not used in the first overcall.

#bidtable(
  ([#dbl], [short #D not needed]),
  ([1#N], [does not promise a #D stopper]),
  hl([2#D], [natural]),
  ([2#H], [#emph[Michaels cue], 55#plus #S#H]),
  ([2#N], [#emph[Unusual], 55#plus #H#C]),
  hl([3#D], [#emph[Super-Michaels], 55#plus #S#H, F1]),
)

== Against 1#N <sec:v1N>

#bidtable(
  ([#dbl], [penalty]),
  ([2#C], [54#plus #MM]),
  ([2#D], [6#plus #M]),
  ([2#H], [5#H + 4#plus#m]),
  ([2#S], [5#S + 4#plus#m]),
  ([2#N], [55#plus #mm]),
)

== Against 2#m majors

#bidtable(
  ([#dbl], [4#plus#M]),
  ([2#H], [54#plus #mm, #C better]),
  ([2#S], [54#plus #mm, #D better]),
)

== Against weak 2$X$

#bidtable(
  ([#dbl], dcasesr(
    ([12#plus, 3#plus cards in unbid suits, shortness in $X$],),
    ([18#plus, 5#plus strong suit], [rebid suit]),
    ([18#plus, semiBAL, with stopper], [rebid #N]),
  )),
  followups(
    hdr([(#rdbl)]),
    followups(
      hdr([system on]),
    ),
    ([2$Y$], [5+$Y$, below INV]),
    ([2#N], [#emph[Lebensohl] (usually puppet to 3#C)]),
    followups(
      hdr([(#dbl)]),
      followups(
        hdr([system on]),
      ),
      ([3#C], [usually forced]),
      followups(
        ([#pass], [below INV, #C suit]),
        ([3$Y$ below $X$], [5+$Y$, below INV]),
        ([3$X$], [asks a 4 card #M, with stopper]),
        ([3$Y$ above $X$], [5+$Y$, INV]),
        ([3#N], [to play, with stopper]),
      ),
      ([3#D#H#S 4#C], [18#plus, 5#plus strong suit]),
      ([3#N], [18#plus, semiBAL, with stopper]),
    ),
    ([3$Y$ below $X$], [5+$Y$, INV]),
    ([3$X$], [asks 4 card #M, no stopper]),
    ([3$Y$ above $X$], [5+$Y$, GF]),
    ([3#N], [to play, no stopper]),
    ([4$Y$ below $X$], [5+$Y$, GF]),
  ),
  ([2$Y$], [10--17, 5#plus cards]),
  followups(
    hdr([(3$X$)], hl: true),
    followups(
      ([#dbl], [responsive, 10#plus, length in unbid suits, no support for $Y$]),
    ),
    ([#pass], [0--7]),
    ([3$X$], [strong raise in $Y$, GF]),
    ([3$Y$], [8--10, 3#plus $Y$]),
    ([3$Z$], [5#plus suit, F1]),
    ([4 not $Y$], [splinter]),
  ),
  ([2#N], [14--17, semiBAL, with stopper]),
  hl([3$Y$ below $X$], [12--17, (5)6#plus cards]),
  hl([3$Y$ above $X$], [16#plus, very strong 6#plus cards]),
  ([3$X$], [stopper ask for #N]),
  ([3#N], [16#plus, with stopper and a long-running minor]),
  ([4$X$], [55#plus, #mm]),
  hl([4#m], [55#plus, #m and o#M (or #MM over 2#D)]),
  hl([4#H#S if not $X$], [16#plus strong 6#plus cards]),
)

== Against precision 2#C

Treat as weak 2$X$.

== Against 2#N minors

#bidtable(
  ([#dbl], [penalty interest in at least one minor]),
  ([3#C], [#MM, #H better]),
  ([3#D], [#MM, #S better]),
  ([3#H], [nat]),
  ([3#S], [nat]),
)

== Against weak 3$X$

#bidtable(
  ([#dbl], dcasesr(
    ([14#plus, 3#plus cards in unbid suits, shortness in $X$],),
    ([18#plus, 5#plus strong suit], [rebid suit]),
    ([23#plus, semiBAL, with stopper], [rebid #N]),
  )),
  ([3$Y$], [12--17, (5)6#plus cards]),
  ([3#N], [16-22, with stopper]),
  hl([4$X$ over #m], [55#plus, #MM]),
  hl([4$X$ over #M], [55#plus, o#M + #m]),
  hl([4#m (not $X$)], [55#plus, #m + #M (other or unspecified)]),
  hl([4#M (not $X$)], [16#plus strong 6#plus cards]),
  hl([4#N over #M], [55#plus #mm]),
)

== Against weak 4#m

#bidtable(
  hl([#dbl], [takeout]),
  hl([4#N], [natural with stopper(s)]),
  hl([5#m (cue)], [55#plus #MM]),
  ([other], [natural]),
)

== Against weak 4#H

#bidtable(
  ([#dbl], [penalty-oriented]),
  followups(
    hl([bid], [5#S or 6#plus card suit]),
  ),
  hl([4#N], [55#plus #mm]),
  ([other], [natural]),
)

== Against weak 4#S

#bidtable(
  ([#dbl], [penalty-oriented]),
  followups(
    hl([bid], [6#plus card suit]),
  ),
  hl([4#N], [takeout]),
  ([other], [natural]),
)
