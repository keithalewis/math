\newcommand\RR{\mathbf{R}}
\newcommand\ZZ{\mathbf{Z}}

Let $E$ be the set of legal _entities_ and $I$ be the set of _instruments_.

For any set $S$ we define $M(S) = \ZZ^S = \{\pi\colon S\to\ZZ\}$ to be
the set of all functions from $S$ to $\ZZ$.  $M(S)$ is a module over the
ring of integers.  Let $\mathcal{L}(M(S))$ be the space of all linear
functions from $M(S)$ to $M(S)$.

Instrument _amounts_ are quoted as an integer multiple of their smallest traded unit.

A _position_ is an element of the module $M(I\times E)$.

A _transaction_ occurs when a _buyer_ and a _seller_ exchanging positions.

Given a positions $\pi = a_{i,e}$ and $\pi' = a'_{i',e'}$.
define $\xi\colon M\times M\to M\times M$ by
$\xi(\pi,\pi') = (a_{i,e'}, a'_{i,e'})$.

$\xi\colon M\times\to M$ by $M - \pi + \xi\pi - \pi' + \xi(\pi')$
