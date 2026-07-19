#import "lib.typ": *

== 2#D— <sec:2D>

#bt(```
  2H        to play
    * 2S   4315
  2S        to play
  2N>2D2N   asks
  3C        to play
  3D        11+, good 6+D
  3H        7-9, 5H
    4H   4H, MAX
  3S        7-9, 5S
    4S   4S, MAX
  3N        to play
  4H        to play
  4S        to play
```)

/* Commented-out alternative from the original LaTeX source (2d.tex):
% \subsection{Interference over 2\D}
% Doubles are all penalty. 2\N\ is still asking, if available. Responder's bid in one of opener's 3 suits is to play, jump is a mixed raise.
% If opponents double 2\D, \XX\ asks for better major, \P\ to request opener to also \P.
*/

=== 2#D—2#N— <2D2N>

3-card majors are shown to make responder declarer.

#bt(```
* 3C   MIN
    * = 3D asks for a 3-card major
        3H   4315
        3S   3415
        3N   44 majors
* 3D   MAX, 44 majors, GF
    * 3H   sets H for cues
    * 3S   sets S for cues
* 3H   MAX, 4315
* 3S   MAX, 3415
```)

/* Commented-out alternative (Mulberry) from the original LaTeX source (2d.tex): 
% \subsection{Mulberry} \label{MB}

% Used for 3-suited hands. For RKC it is necessary for both players to understant what the trump suit is. For the RKC coding, we rank the suits in order of known length in the hand which is responding to RKC. Ties (or unknown) go to the lower suit.

% \begin{bidtable}
%     4\C & puppet to 4\D\ (for RCK) \\
%     \followups{
%         4\D & forced \\
%         \followups{
%             4\H & RCK for longest suit  \\
%             4\S & RCK for second longest suit \\
%             4\N & RCK for third longest suit \\
%             5\C & very strong ST in \C \\
%             5\D & very strong ST in \D \\
%             5\H & very strong ST in \H \\
%             5\S & very strong ST in \S \\
%             5\N & very strong ST in \N \\
%       }\\
%     }\\
%     4\D & puppet to 4\H\ (to sign off) \\
%     \followups{
%         4\H & forced \\
%         \followups{
%           \P & to play \\
%           4\S & to play \\
%           4\N & RCK for shortest suit \\
%           5\C & to play \\
%           5\D & to play \\
%         }\\
%     }\\
%     4\H & ST in \H \\
%     4\S & ST in \S \\
%     4\N & ST in \N \\
%     5\C & ST in \C \\
%     5\D & ST in \D \\
% \end{bidtable}
*/
