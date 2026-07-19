#import "lib.typ": *

== 1#C— <sec:1C>

#bt(```
  1D>1C1D   0-7
  1H>1C1H   8-11, denies 5+S, AK is sufficient
  1S        8+, 5+S, AK is sufficient
* 1N        12+, 5+H
  2C        12+, 5+C
  2D        12+, 5+D
* 2H        14+, BAL
  2S        12+, (4441)
    2N   asks
* 2N        12-13, BAL
  3X        nat 7 weak
```)

Passed hand responses:

#bt(```
  1D>1C1D   0-7
  1H        8-10, 5H
  1S        8-10, 5S
  1N        8-10, BAL
  2C        8-10, 5+C
  2D        8-10, 5+D
  2S        8-10, (4441)
    2N   asks
  3X        nat 7 weak
```)

=== 1#C—1#D— <1C1D>

#bt(```
  1H   16-20, 5+H
  1S   16-20, 5+S
  1N   17-18 (18-19), BAL
    system on
  2C   16-20, 5+C
  2D   16-20, 5+D
  2H   21+, 5+H, F1
  2S   21+, 5+S, F1
  2N   21(22)-24 BAL
    system on
  3C   21+, 5+C, F1
  3D   21+, 5+D, F1
  3N   25+, BAL
```)

/* Commented-out alternative from the original LaTeX source (1c.tex):
% \begin{bidtable}
%     \P & (5)6\+\D, MIN, 1\N/2\D\ dangerous \\
%     \hyperref[1C1D1H]{1\H} & 4\+\H\ (if 4, (4441) or 5\+\m), F1 \\
%     \hyperref[1C1D1S]{1\S} & 4\+\S\ (if 4, (4441) or 5\+\m), F1 \\
%     1\N & 17--18 (18--19), BAL [5\M(332) can choose 1\M\ or 1\N] \\
%     \followups{
%         system on &  \\
%     }\\
%     2\C & 16--21, 6\+\C\ or 5\C 4\D, no 4\M, NF\\
%     2\D & 16--21, 6\+\D\ or 5\D 4\C, no 4\M, NF\\
%     2\H & 22\+, 5\+\H, GF\\
%     2\S & 22\+, 5\+\S, GF\\
%     2\N & 21(22)--23, BAL\\
%     \followups{
%         system on &  \\
%     }\\
%     3\C & 22\+, 6\+\C\ or 5\C 4\D, GF\\
%     3\D & 22\+, 6\+\D\ or 5\D 4\C, GF\\
%     3\H & \H\ flag, GF\\
%     3\S & \S\ flag, GF\\
%     3\N & 24--27, BAL\\
%     4\H & to play (good long suit, weak)\\
%     4\S & to play (good long suit, weak)\\
% \end{bidtable}

% \subsubsection[1\C--1\D--1\H]{1\C---1\D---1\H} \label{1C1D1H}
% \begin{bidtable}
%     \hyperref[1C1D1H1S]{1\S}  & 0--7, 4\+\S, denies 4\+\H, F1 \\
%     \hyperref[1C1D1H1N]{1\N}  & 0--5, denies 4\+\H\ and 4\+\S \\
%     \hyperref[1C1D1H2C]{2\C}  & 6--7, denies 3\+\H\ and 4\+\S \\
%     \hyperref[1C1D1H2D]{2\D}  & 5--7, 3\H \\
%     2\H & 0--4, 4--5\H \\
%     2\S & 4--6, great 6\+\S\\
%     2\N & 5--7, 4\H, splinter (R asks LMH)\\
%     3\C & 4--6, great 6\+\C\\
%     3\D & 4--6, great 6\+\D\\
%     3\H & 5--7, 4\H\+, BAL, INV \\
%     3\S & 6--7, 5\+\H, 0--1\S \\
%     4\C & 6--7, 5\+\H, 0--1\C \\
%     4\D & 6--7, 5\+\H, 0--1\D \\
% \end{bidtable}

% \paragraph{1\C---1\D---1\H---1\S---} \label{1C1D1H1S}
% \begin{bidtable}
%     1\N & 1444 likely, NF \\
%     2\C\D & 4\+ cards, could be 54\+, NF \\
%     2\H & 6\+\H \\
%     2\S & 16--19, 3\S / 16--17, 4\S \\
%     2\N & 21--22, likely 0--1 \S \\
%     3\C & 4\H, 5\+\C, GF \\
%     3\D & 4\H, 5\+\D, GF \\
%     3\H & long good suit, INV \\
%     3\S & 20--21, 3\S / 18--19, 4\S \\
%     3\N/4\H & to play \\
%     4\C\D & 20\+, 4\+\S, splinter \\
% \end{bidtable}

% \paragraph{1\C---1\D---1\H---1\protect\N---} \label{1C1D1H1N}
% \begin{bidtable}
%     \P & typically 44(14) \\
%     2\C\D & 4\+ cards, could be 54\+, NF \\
%     2\H & 6\+\H \\
%     2\S & 21\+, 5\H 4\S, GF \\
%     2\N & 22--23, INV, NF \\
%     3\C & 4\H, 5\+\C, GF \\
%     3\D & 4\H, 5\+\D, GF \\
%     3\H & long good suit, INV \\
%     3\N/4\H & to play \\
% \end{bidtable}

% \paragraph{1\C---1\D---1\H---2\C---} \label{1C1D1H2C}
% \begin{bidtable}
%     2\D & MIN, asks responder to show doubleton support or other major\\
%     2\H & 6\+\H, NF \\
%     2\S & 21\+, 5\H 4\S, F1 \\
%     2\N & waiting, GF \\
%     3\C & 4\H, 5\+\C, GF \\
%     3\D & 4\H, 5\+\D, GF \\
%     3\H & \H\ flag, GF \\
% \end{bidtable}

% \paragraph{1\C---1\D---1\H---2\D---} \label{1C1D1H2D}
% \begin{bidtable}
%     2\H & to play, usually 4\H \\
%     2\S & 4\+\S \\
%     2\N & artificial GF \\
%     3\C & 4\H, 5\+\C, GF \\
%     3\D & 4\H, 5\+\D, GF \\
%     3\H & 5\+\H, INV \\
%     3\N & to play \\
% \end{bidtable}

% \subsubsection[1\C--1\D--1\S]{1\C---1\D---1\S} \label{1C1D1S}
% \begin{bidtable}
%     \hyperref[1C1D1S1N]{1\N}  & 0--5, denies 4\+\S \\
%     \hyperref[1C1D1S2C]{2\C}  & 6--7, denies 4\+\S\ and 5\+\H \\
%     \hyperref[1C1D1S2D]{2\D}  & 5--7, 3\S \\
%     2\H & 6--7, 5\+\H, denies 3\+\S \\
%     2\S & 0--4, 4--5\S \\
%     2\N & 5--7, 4\S, splinter (R asks LMH)\\
%     3\C & 4--6, great 6\+\C\\
%     3\D & 4--6, great 6\+\D\\
%     3\H & 4--6, great 6\+\H\\
%     3\S & 5--7, 4\S\+, BAL, INV \\
%     4\C & 6--7, 5\+\S, 0--1\C \\
%     4\D & 6--7, 5\+\S, 0--1\D \\
%     4\H & 6--7, 5\+\S, 0--1\H \\
% \end{bidtable}

% \paragraph{1\C---1\D---1\S---1\protect\N---} \label{1C1D1H1N}
% \begin{bidtable}
%     \P & typically 44(14) \\
%     2\C\D & 4\+ cards, could be 54\+, NF \\
%     2\H & 21\+, 5\S 4\H, GF \\
%     2\S & 6\+\S \\
%     2\N & 22--23, INV, NF \\
%     3\C & 4\S, 5\+\C, GF \\
%     3\D & 4\S, 5\+\D, GF \\
%     3\S & long good suit, INV \\
%     3\N/4\S & to play \\
% \end{bidtable}

% \paragraph{1\C---1\D---1\S---2\C---} \label{1C1D1S2C}
% \begin{bidtable}
%     2\D & MIN, asks responder to show doubleton support or other major\\
%     2\H & 5\+\S 4\+\H, MIN \\
%     2\S & 6\+\S \\
%     2\N & waiting, GF \\
%     3\C & 4\S, 5\+\C, GF \\
%     3\D & 4\S, 5\+\D, GF \\
%     3\S & \S\ flag, GF \\
% \end{bidtable}

% \paragraph{1\C---1\D---1\S---2\D---} \label{1C1D1S2D}
% \begin{bidtable}
%     2\H & 4\+\H \\
%     2\S & to play, usually 4\S \\
%     2\N & artificial GF \\
%     3\C & 4\S, 5\+\C, GF \\
%     3\D & 4\S, 5\+\D, GF \\
%     3\S & 5\+\S, INV \\
%     3\N & to play \\
% \end{bidtable}
*/

=== 1#C—1#H— <1C1H>

Usually no slam when opener has minimum hand (16--19).

#bt(```
  1S      5+S
* 1N      17-18 (18-19) or 24+, BAL
  2C      5+C
  2D      5+D
  2H      5+H
  2S      (4441)
    2N   asks
* 2N      21(22)-23, BAL
  3CDHS   flag, slam interest, demand cue-bids
```)

After responder's second bid jump shift shows a splinter with support for last bid suit.

=== 1#C—1#S—2#S– <1C1S2S>

#bt(```
  2N      5S(332)
    3CDH    4+ cards
    3S      4+S
    3N      to play (usually (4333) even with 4-card support)
    other   cues, serious 3NT, last train, kickback
  3CDH    4+ cards
  3S      6+S
  other   cues, serious 3NT, last train, kickback
```)

=== 1#C—1#N—2#H– <1C1N2H>

#bt(```
  2S/3CD   4+ cards
  2N       5H(332)
    3CD     4+ cards
    3H      4+H
    3N      to play (usually (4333) even with 4-card support)
    other   cues, serious 3NT, last train, kickback
  3H       6+H
  other    cues, serious 3NT, last train, kickback
```)

=== 1#C—(#dbl)—

If GF is established, further doubles are for penalty.

#bt(```
  PASS>1CXPbid   0-5
  RDBL           6-7
  1DHS 2C        8+
  1N             8+, BAL
    2C      asks lowest 4 card suit
      2D   4D
      2H   4H, no 4D
      2S   4S, no 4H or 4D
      2N   3334
    other   natural
  2DHS           5-7, 6-card suit
  3CDHS          5-7, 7-card suit
```)

=== 1#C—(#dbl)—#pass—(bid)— <1CXPbid>

#bt(```
  DBL   takeout or 23+
  bid   natural "overcall"
  cue   Michaels
  2N    Unusual
```)

=== 1#C—(1$X$ or 2$X$)—

Trap is usually with 5 or more cards in their suit (with sure defensive tricks and unlimited strength) and is preparing to pass a reopening takeout double by opener.

If GF is established, further doubles are for penalty.

#bt(```
* PASS                0-5 or trap
  DBL                 { 6-7 = always / *8+, BAL, without stopper, GF (cue later to reveal) = over 2X }
    = over 1X
      PASS        penalty
      1M          4+M, F1
      1N>sec:1N   17-18 (18-19), BAL, with stopper, system on, NF
      2m          5+ cards, F1
      2X          GF
      2N          21(22)+, BAL, system on, GF
      jump suit   6+ cards, GF
  non-jump new suit   8+, 5+ cards, GF
  N bid               8+, BAL, with stopper, GF
    cheapest C   asks lowest 4 card suit
      D   4D
      H   4H, no 4D
      S   4S, no 4H or 4D
      N   3334
    other        natural
  2-level cue         8+, BAL, without stopper, GF
* jump shift          5-7 with a long suit and strength in the suit
* 3-level cue         3-suited hand (short in opponent's suit), GF
```)

=== 1#C—(3$X$ or 4$X$)—

#bt(```
* PASS       0-6 (bad 7) or trap
    * DBL   takeout
* DBL        7+, no suit to bid below 3N, GF
  3N         to play usually, with stopper
  new suit   5+ cards, GF
```)

=== Waiting 2#N

In non-fit auctions 2#N implies a hand that has no side 5-card suit, no great 7-card suit, and no great support for partner's minor.

Example:

1#C—1#H—2#D—2#H—

#bt(```
  2S      4+S (shorter than D), denies 3+H
  2N      waiting, may have 4C, denies 3+H
  3C      5+D 5+C, denies 3+H
  3D      7+D (or 6 very good ones), denies 3+H
  3H      H flag, hearts is trump
  3S/4C   splinter for hearts
  4H      a very bad raise
```)

=== The Implied Cue-bid

Before a fit is agreed, bidding a suit that is unreasonable as a possible trump suit at the level of 3#D or higher implies a fit with partner's last bid suit. This is known as an "Implied Cue-bid".

The logic is: you need at least two ways to raise partner to show the difference between a bad or good hand for the auction to date.
