#import "lib.typ": *

#pagebreak(weak: true)

== 2#S— <sec:2S>

Assume 6#plus#S unless NV vs. VUL.

#bidtable(
  ([2#N], [14#plus, asks]),
  followups(
    hdr([(bid)]),
    followups(
      hl([step 1], [#pass]),
      ([step 2], [#dbl/#rdbl]),
      ([step \*], [next bids]),
    ),
    ([3#C], [MIN, bad suit]),
    ([3#D], [MIN, good suit]),
    ([3#H], [MAX, bad suit]),
    ([3#S], [MAX, good suit]),
  ),
  ([3#C], [14#plus, 5#plus#C, F1]),
  ([3#D], [14#plus, 5#plus#D, F1]),
  ([3#H], [14#plus, 5#plus#H, F1]),
  ([3#S], [0--13, 3#plus#S, preempt]),
  ([4#S], [to play]),
)

/* Commented-out alternative from the original LaTeX source (2s.tex): 
% \begin{bidtable}
%   2\N & strong ask, F3\S \\
%   \followups{
%     3\C & 6\S, no 4\H, MAX \\
%     \followups{
%       3\D & asks NLMH shorness \\
%       4\C & \hyperref[PRKC]{PRKC} \\
%     }\\
%     3\D & no 4\H, medium \\
%     \followups{
%       3\H & asks NLMH shorness \\
%       4\C & \hyperref[PRKC]{PRKC} \\
%     }\\
%     3\H & good but not MAX, no 4\H\\
%     \followups{
%       4\C & asks NLMH shorness \\
%     }\\
%     3\S & MIN \\
%     \followups{
%       4\C & asks NLMH shorness \\
%     }\\
%     3\N & 6\S 4\H, not MIN\\
%     \followups{
%       4\C & asks NLMH shorness \\
%     }\\
%     \followups{
%       3\D & asks NLMH shorness \\
%       4\C & \hyperref[PRKC]{PRKC} \\
%     }\\
%   }\\
%   3\C & \H, F1 \\
%   3\D & nat, NF \\
%   3\H & \C, GF \\
%   3\S & preempt \\
%   4\C & \hyperref[PRKC]{PRKC} \\
% \end{bidtable}*/
