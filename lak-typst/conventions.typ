#import "lib.typ": *

== Conventions common for multiple opening bids

=== 1$X$—1$Y$—1$Z$— <XYZ>

Not used after 1#C opening. It is on in some competitive situations (not if opponents bid after $Z$).

#block[
1#D—1#H—1#S— \
1#D—1#H—1#N— \
1#D—1#S—1#N— \
1#H—1#S—1#N— \
1#D—(1#H)—#dbl—1#S— \
1#D—(1#H)—#dbl—1#N— \
1#D—(1#S)—#dbl—1#N—
]

#bidtable(
  ([1#N], [to play]),
  ([2#C], [puppet to 2#D #dcases([artificial invite], [long #D])]),
  ([2#D], [artificial GF]),
  ([2#H], [to play]),
  ([2#S], [natural]),
  hl([2#N], [natural, denies a 5 card $Y$, INV]),
  ([3#C], [to play]),
  hl([3#D], [5$Y$5#D, slam interest]),
  hl([3$Y$], [6#plus suit, slam interest]),
  followups(
    hl([3#N], [to play]),
    ([\*], [control for $Y$]),
  ),
  hl([double jump shift], [splinter for the last natural suit]),
)
