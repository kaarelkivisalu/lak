#import "lib.typ": *

== 1#D— <sec:1D>

#bidtable(
  ([#link(<1D1H>)[1#H]], [6#plus, 4#plus#H, F1]),
  ([#link(<1D1S>)[1#S]], [6#plus, 4#plus#S, F1]),
  ([1#N], [7--bad 11, BAL, no 4#M, NF]),
  ([2#C], [11#plus, (4)5#plus#C, no 4#M unless GF and 6#plus#C, F1]),
  ([2#D], [11#plus, (4)5#plus#D, no 4#M unless GF and 6#plus#D, F1]),
  ([2#H], [0--10, 5#S 4--5#H]),
  ([2#S], [11#plus, 5#S 4--5#H, INV opposite 10--13 BAL, F1]),
  ([2#N], [good 11--13, BAL, no 4M, INV]),
  hl([3#C], [6--10, 54 mm, P/C]),
  ([3#D], [5--10, 6#plus#D]),
  ([3#H], [6--9, 7#plus#H]),
  ([3#S], [6--9, 7#plus#S]),
  ([3#N], [13--16, BAL, no 4M]),
  hl([4#C], [6--10, 55#plus mm, P/C]),
  ([4#D], [6--9, 7#plus#D]),
  ([4#H], [good 7 or 8#plus#H, preemptive]),
  ([4#S], [good 7 or 8#plus#S, preemptive]),
)

Passed hand adjustments:

#bidtable(
  ([2#C], [6--9, 5#plus#C]),
  ([2#D], [6--9, 5#plus#D]),
  hl([2#H], [6--9, 5#S 4#plus#H]),
  hl([2#S], [6--9, 6#S 4#plus#H]),
)

=== Interference over 1#D

Negative doubles are used. 2-level free bids (2#D is a free bid) are F1. Support (re)doubles are on.

As a responder assume that opener has 10--13(14) BAL until told otherwise.

=== 1#D—1#H— <1D1H>

#bidtable(
  hdr([(#dbl)]),
  followups(
    ([#pass], [denies 3#plus#H, may have 4#S if BAL/3-suiter]),
    ([#rdbl], [3#H]),
    hl([1#S], [4#S]),
    ([1#N], [1--2 #H]),
    hl([2#C], [54#plus#mm]),
  ),
  hdr([(1#S)]),
  followups(
    ([#pass], [denies 3#H]),
    ([#dbl], [3#H]),
    ([1#N], [1--2#H, good stops]),
    hl([2#C], [54#plus#mm]),
  ),
  hdr([(1#N nat)]),
  followups(
    ([#dbl], [12--15, 3#H]),
    hl([2#C], [54#plus#mm]),
  ),
  hdr([(2#C)]),
  followups(
    ([#dbl], [3#H]),
  ),
  hdr([(2#D)]),
  followups(
    ([#dbl], [3#H]),
  ),
  hdr([(2#S)]),
  followups(
    ([#dbl], [12--15, 3#H]),
    hl([2#N], [good hand with 6#D and stopper, NF]),
    hl([3#C], [55#plus#mm]),
  ),
  ([1#S], [4#S, other bids deny 4#S]),
  followups(
    ([\*], [#link(<XYZ>)[XYZ]]),
  ),
  ([1#N], [10--13(14), no singleton, BAL]),
  followups(
    ([\*], [#link(<XYZ>)[XYZ]]),
  ),
  ([2#C], [8#plus cards in the minors, not 6#D 4#C]),
  ([2#D], [10--12, 6#plus#D]),
  followups(
    hl([2#S], [artificial GF]),
  ),
  ([2#H], dcases([10--13(14), 4#H, BAL], [10--12, 4#H, unBAL])),
  hl([2#S], [5#S 6#plus#D]),
  hl([2#N], [13--15, 3#H 6#plus#D]),
  hl([3#C], [13--15, 55#plus mm]),
  ([3#D], [13--15, 6#plus#D]),
  ([3#H], [13--15, 4#H, unBAL]),
)

=== 1#D—1#S— <1D1S>

#bidtable(
  hdr([(#dbl)]),
  followups(
    ([#pass], [denies 3#plus#S]),
    ([#rdbl], [3#S]),
    ([1#N], [1--2 #S]),
    hl([2#C], [54#plus#mm]),
  ),
  hdr([(1#N nat)]),
  followups(
    ([#dbl], [12--15, 3#S]),
    hl([2#C], [54#plus#mm]),
  ),
  hdr([(2#C)]),
  followups(
    ([#dbl], [3#S]),
  ),
  hdr([(2#D)]),
  followups(
    ([#dbl], [3#S]),
  ),
  hdr([(2#H)]),
  followups(
    ([#dbl], [12--15, 3#S]),
    hl([2#N], [good hand with 6#D and stopper, NF]),
    hl([3#C], [55#plus#mm]),
  ),
  ([1#N], [10--13(14), no singleton, BAL]),
  followups(
    ([\*], [#link(<XYZ>)[XYZ]]),
  ),
  ([2#C], [8#plus cards in the minors, not 6#D 4#C]),
  ([2#D], [6#plus#D]),
  followups(
    hl([2#H], [artificial GF]),
  ),
  hl([2#H], [5#H 6#plus#D]),
  ([2#S], dcases([10--13(14), 4#S, BAL], [10--12, 4#S, unBAL], [#hlt[3451]])),
  hl([2#N], [13--15, 3#S 6#plus#D, BAL]),
  hl([3#C], [13--15, 55#plus mm]),
  ([3#D], [13--15, 6#plus#D]),
  ([3#S], [13--15, 4#S, unBAL]),
)

=== 1#D—(#dbl)—

#bidtable(
  ([#rdbl], [INV#plus]),
  ([1#H], [4#plus#H]),
  ([1#S], [4#plus#S]),
  ([1#N], [7-11, BAL]),
)

=== 1#D—(1#H)—

#bidtable(
  ([#dbl], [4#S]),
  hl([1#S], [5#S]),
  ([1#N], [nat, does not promise stopper]),
  ([2#C], [5#plus#C, F1]),
  ([2#D], [5#plus#D, F1]),
  hl([2#H], [6#plus#S]),
  hl([2#S], [INV#plus, 54#plus#mm]),
  ([2#N], [nat INV, promises stopper]),
  hl([3#C], [#mm, no game, worse than 2#S]),
  ([3#D], [6#plus#D, to play]),
  hl([3#H], [transfer to 3#N, stopper that prefer partner declare]),
  ([3#N], [to play]),
  ([3#m], [preempt]),
  ([4#S], [to play]),
)

=== 1#D—(1#S)—

#bidtable(
  ([#dbl], [negative]),
  ([1#N], [nat, does not promise stopper]),
  ([2#C], [5#plus#C, F1]),
  ([2#D], [5#plus#D, F1]),
  ([2#H], [5#plus#H, NF]),
  hl([2#S], [INV#plus, 54#plus#mm]),
  ([2#N], [nat INV, promises stopper]),
  hl([3#C], [#mm, no game, worse than 2#S]),
  ([3#D], [6#plus#D, to play]),
  ([3#H], [6#plus#H, GF]),
  hl([3#S], [transfer to 3#N, stopper that prefer partner declare]),
  ([3#N], [to play]),
  ([3#m], [preempt]),
  ([4#H], [to play]),
)

=== 1#D—(1#N)—

Same as #link(<sec:v1N>)[against 1#N].

/* Commented-out alternatives from the original LaTeX source (1d.tex): 
% \subsection[1\D--1\protect\N]{1\D---1\protect\N---} \label{1D1N}

% \begin{bidtable}
%   (\X) & \\
%   \followups{
%     2\C & 44\+ \mm, unBAL \\
%     2\D & 5\+\D \\
%   }\\
%   (2\M) \\
%   \followups{
%     \X & takeout \\
%     2\N & good 3\D rebid \\
%     3\C & 4/5\D 5\C \\
%     3\D & to play \\
%   }\\
%   2\D & 6+\D or 5\D unBAL \\
%   2\M & 14--15, short \M \\
%   2\N & 14--15, 4441 \\
%   3\M & 6\D 5\M, FG or F4\D \\
%   3\N & to play, based on long running \D \\
% \end{bidtable}

% \subsection[1\D--2\C]{1\D---2\C---} \label{1D2C}

% \begin{bidtable}
%   (2\M)\\
%   \followups{
%     \P & waiting\\
%     \X & penalty\\
%     2\N & good stops \\
%   }\\
%   2\D & 5\+\D, 0--3\C, unBAL \\
%   \followups{
%     3\C & 11--12, 5\+\C, INV \\
%     3\D & NF \\
%     other & GF \\
%   }\\
%   2\H & 11-13(14), BAL \\
%   \followups{
%     2\S & puppet to 2\N \\
%     \followups{
%       2\N & forced \\
%       \followups{
%         3\C & 5\+\C, GF \\
%         3\D & 5\C 4\D, GF \\
%         3\H & 4\H 6\C, GF \\
%         3\S & 4\S 6\C, GF \\
%         3\N & S/O \\
%       }\\
%     }\\
%     2\N & asks 4\+ card minor, ST, BAL, GF \\
%     3\C & 11--12, 5\+\C, INV \\
%     3\H & 5\H 6\C, GF \\
%     3\S & 5\S 6\C, GF \\
%     3\N & prefers to declare, S/O \\
%   }\\
%   2\S & 4\+\C, some splinter, GF \\
%   \followups{
%     2\N & asks \S\H\C \\
%     \followups{
%       3\C & \S\ splinter \\
%       3\D & \H\ splinter \\
%       3\H & \C\ splinter \\
%     }\\
%   }\\
%   2\N & 10--12, 4441 \\
%   3\C & (41)53, GF \\
%   \followups{
%     3\D & asks \\
%     \followups{
%       3\H & 4\H \\
%       3\S & 4\S \\
%     }\\
%   }\\
%   3\D & very good 6\+\D, GF \\
%   3\H & 5\H 6\D, GF \\
%   3\S & 5\S 6\D, GF \\
%   3\N & 13--15, 4441 \\
% \end{bidtable}

% \subsection[1\D--2\D]{1\D---2\D---} \label{1D2D}

% \begin{bidtable}
%   (2\M)\\
%   \followups{
%     3\D & \D fit, BAL, MIN \\
%     3\M & 4\+\D, short \M \\
%   }\\
%   2\H & 10-13(14), BAL \\
%   \followups{
%     2\S & puppet to 2\N \\
%     \followups{
%       2\N & forced \\
%       \followups{
%         3\C & 54\+ mm (could be 4\D 5\C), GF \\
%         3\D & 5\+\D, GF \\
%         3\H & 4\H 6\D, GF \\
%         3\S & 4\S 6\D, GF \\
%         3\N & S/O \\
%       }\\
%     }\\
%     2\N & asks 4\+ card minor, ST, BAL, GF \\
%     3\C & 11--12, 54\+ mm (could be 4\D 5\C), INV \\
%     3\D & 11--12, 5\+\D, INV \\
%     3\H & 5\S 6\D, GF \\
%     3\S & 5\S 6\D, GF \\
%     3\N & Prefers to declare, S/O \\
%   }\\
%   2\S & 4\+\D, some splinter, GF \\
%   \followups{
%     2\N & asks \S\H\C \\
%     \followups{
%       3\C & \S\ splinter \\
%       3\D & \H\ splinter \\
%       3\H & \C\ splinter \\
%     }\\
%   }\\
%   2\N & 10--12, 6\D, BAL\\
%   3\C & (41)35, GF \\
%   \followups{
%     3\D & asks \\
%     \followups{
%       3\H & 4\H \\
%       3\S & 4\S \\
%     }\\
%   }\\
%   3\D & very good 6\+\D, GF \\
%   3\H & 5\H 6\D, GF \\
%   3\S & 5\S 6\D, GF \\
%   3\N & 13--15, 6\D, BAL\\
% \end{bidtable}

% \subsection[1\D--2\S]{1\D---2\S---} \label{1D2S}

% 1\D---2\H--- is similar but the responder is limited.

% \begin{bidtable}
%   \P & preference for \S, MIN \\
%   2\N & asks \\
%   \followups{
%     3\C & 5\S 4\H, MIN \\
%     3\D & 5\S 4\H, MAX \\
%     3\H & 5\S 5\H, MIN \\
%     3\S & 5\S 5\H, MAX \\
%   }\\
%   3\C & 55\+ mm \\
%   3\D & 6\+\D \\
%   3\H & preference for \H, MIN \\
%   3\N & to play \\
%   4\H & to play \\
%   4\S & to play \\
% \end{bidtable}

% \subsection[1\D--2\protect\N]{1\D---2\protect\N---} \label{1D2N}

% \begin{bidtable}
%   \P & 10--12 \\
%   3\C & mm, \C better, 10--12, S/O \\
%   3\D & mm, \D better, 10--12, S/O \\
%   3\H & good 4\H, 0-1\S \\
%   3\H & good 4\S, 0-1\H \\
%   3\N & 13--15 \\
%   4\H & 5\H 6\D \\
%   4\S & 5\H 6\D \\
% \end{bidtable}
*/
