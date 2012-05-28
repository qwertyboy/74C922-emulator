This is a program to emulate the 74C922 16-key encoder. The goal
is to create an *almost* drop-in compatible. Note however, that
the attiny2313 is a 20-pin device, and the power and ground pins
are not in the same locations. THIS IS NOT DIRECTLY COMPATIBLE
WITH EXISTING DESIGNS!!! For those who are making new designs, or
cannot source an original 74C922, then this may work for you. You
WILL have to make a custom adapter if replacing an existing chip.

The aim is to provide the same features as the original chip, so
using this replacement in a new design should be the same as using
the old one.

~nathan duprey / qwertyboy~