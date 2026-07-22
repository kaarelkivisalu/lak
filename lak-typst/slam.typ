#import "lib.typ": *

== Slam Bidding

=== Kickback Roman Keycard Blackwood

Without Kickback (keycards are Aces and trump K):

#bt(```
  4N   RKC
    5C   1/4 keycards
    5D   0/3 keycards
    5H   2 keycard, no trump Q
    5S   2 keycard, trump Q
```)

With Kickback ($X$ is trump):

#bt(```
  4X+1   KRKC
    4X+2   1/4 keycards
    4X+3   0/3 keycards
    4X+4   2 keycard, no trump Q
    4X+5   2 keycard, trump Q
```)

Next step queries trump queen (if not known):

#bt(```
  Y   trump Q ask
    Y+1   no trump Q
    Y+2   trump Q
```)

Next step queries \#kings (then \#queens, ...):

#bt(```
  Z   #kings ask
    Z+1   0/3 kings
    Z+2   1/4 kings
    Z+3   2 kings
```)

=== Is it Kickback?

The answer is that if a 4-level jump bid could be construed as Kickback, and
there is any way to bid that suit naturally and forcing below game, then it is
Kickback.

If there are two suits, then the cheapest "impossible" bid is Kickback for the
lower suit and the next "impossible" bid is Kickback for the higher suit.

/* Commented out in the original LaTeX source:
=== Preemptive Roman Keycard Blackwood <PRKC>

// https://bridge-tips.co.il/wp-content/uploads/2020/06/aa_poor_man.pdf
Over our preempts (2#H#S, 3#D#H#S) 4#C asks (over 3#C, 4#D asks), then

#bt(```
  S1   0 keycards
  S2   1 keycard, no trump queen
  S3   1 keycard, with trump queen
  S4   2 keycards, no trump queen
  S5   2 keycards, with trump queen
```)
*/

=== Serious 3NT

When a major suit is trumps and slam is not yet ruled out, 3NT is not natural, but rather a waiting bid that shows a good hand in context. If you bypass 3NT, you deny a good hand in context.

Example:

1#H—2#C—2#H—3#H—

#bt(```
  3S   cue-bid, does not say whether serious or not
  3N   Serious 3NT (13-15 as 1H was 10-15), denies a spade cue
  4C   cue-bid, non-serious hand (10-12), denies a space cue, min but not the pits
  4D   cue bid, non-serious hand (10-12), no spade or club cue
  4H   the worst hand (10-11), bad distribution, honour location and slam cards
```)
