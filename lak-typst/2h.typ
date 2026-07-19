#import "lib.typ": *

== 2#H— <sec:2H>

Assume 6#plus#H unless NV vs. VUL.

#bidtable(
  ([2#S], [14#plus, 5#plus#S, F1]),
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
  ([3#H], [0--13, 3#plus#H, preempt]),
  ([4#H], [to play]),
)

/* Commented-out alternative from the original LaTeX source (2h.tex): 
% \begin{bidtable}
%   2\S & F1 \\
%   2\N & strong ask, F3\H \\
%   \followups{
%     (bid) \\
%     \followups{
%       \P & good \\
%       \X & medium \\
%       3\S & bad \\
%     }\\
%     3\C & 6\H, no 4\S, MAX\\
%     \followups{
%       3\D & asks NLMH short\\
%       4\C & \hyperref[PRKC]{PRKC} \\
%     }\\
%     3\D & no 4\S, medium\\
%     \followups{
%       3\S & asks NLMH short\\
%       4\C & \hyperref[PRKC]{PRKC} \\
%     }\\
%     3\H & MIN\\
%     \followups{
%       3\S & asks NLMH short\\
%       4\C & \hyperref[PRKC]{PRKC} \\
%     }\\
%     3\S & good but not MAX\\
%     \followups{
%       4\C & asks NLMH short\\
%     }\\
%     3\N & 6\H 4\S, not MIN\\
%     \followups{
%       4\C & asks NLMH short\\
%     }\\
%   }\\
%   3\C & F1 \\
%   3\D & F1 \\
%   3\H & preempt \\
%   3\N & to play \\
%   3\S & 6\+\S, GF \\
%   4\C & \hyperref[PRKC]{PRKC} \\
%   4\H & to play \\
%   4\S & to play \\
% \end{bidtable}*/
