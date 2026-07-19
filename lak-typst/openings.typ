#import "lib.typ": *

== List of Openings

#bidtable(
  ([#link(<sec:1C>)[1#C]], [16#plus unBAL or 17+ BAL]),
  ([#link(<sec:1D>)[1#D]], [10--15, 2#plus#D, denies a 5-card major unless has 6 diamonds]),
  ([#link(<sec:1H>)[1#H]], dcasesr(
    ([10--15, 5#plus#H], [#nth(1), #nth(2), #nth(4)]),
    (dcases([8--9, 5#plus#H], [10--15, good 4#plus#H]), [#nth(3)]),
  )),
  ([#link(<sec:1S>)[1#S]], dcasesr(
    ([10--15, 5#plus#S], [#nth(1), #nth(2), #nth(4)]),
    (dcases([8--9, 5#plus#S], [10--15, good 4#plus#S]), [#nth(3)]),
  )),
  ([#link(<sec:1N>)[1#N]], dcasesr(
    ([14--16, BAL], [#nth(1), #nth(2) and #nth(3) NV]),
    ([15--17, BAL], [#nth(3) VUL and #nth(4)]),
  )),
  ([#link(<sec:2C>)[2#C]], [10--15, 6#plus#C]),
  ([#link(<sec:2D>)[2#D]], [10--15, 4414/4405/4315/3415]),
  ([#link(<sec:2H>)[2#M]], dcasesr(
    ([3--10 #dcasesr(([5#plus#M], [NV]), ([6#plus#M], [VUL]))], [#nth(1), #nth(2), #nth(3)]),
    ([10-13, 6#plus#M], [#nth(4)]),
  )),
  ([#link(<sec:2N>)[2#N]], dcasesr(
    ([19-20, BAL], [#nth(1), #nth(2) and #nth(3) NV]),
    ([20-21, BAL], [#nth(3) VUL and #nth(4)]),
  )),
  ([3$X$], [(0)3--9, (6)7#plus$X$, PRE]),
  ([#link(<sec:3N>)[3#N]], [Gambling, 7#plus#m with AKQ, no other A or K]),
  ([4#m], [(0)3--9, (7)8#plus#m, PRE]),
  ([4#M], [7#plus#M, to play]),
  ([4#N], [vanilla Blackwood]),
  ([5#m], [8#plus#m, to play]),
  ([5#M], [11 tricks, missing AK trumps]),
)
