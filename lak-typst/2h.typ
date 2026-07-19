#import "lib.typ": *

== 2#H— <sec:2H>

Assume 6#plus#H unless NV vs. VUL.

#bt(```
  2S   14+, 5+S, F1
  2N   14+, asks
    = (bid)
      * step 1   PASS
        step 2   DBL/RDBL
        step *   next bids
    3C   MIN, bad suit
    3D   MIN, good suit
    3H   MAX, bad suit
    3S   MAX, good suit
  3C   14+, 5+C, F1
  3D   14+, 5+D, F1
  3H   0-13, 3+H, preempt
  4H   to play
```)

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
