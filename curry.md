---
title: Currying
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Relationship between Cartesian product and exponentials.
...

\newcommand\mb[1]{\mathbf{#1}}
\newcommand\RR{\mb{R}}
\newcommand\cat[1]{\mathbf{#1}}

Notation can be used as a tool of thought, as
[Iverson](http://www.sigapl.org/Articles/Notation%20as%20a%20Tool%20of%20Thought_a1979-iverson.pdf)
pointed out, and won a Turing Award for.

The _cartesian product_ of sets $A$ and $B$ is the set of all pairs $A\times B = \{(a, b)\mid a\in A, b\in B\}$.

The _exponential_ of sets $A$ and $B$ is the set of all functions $A^B = \{f\colon B\to A\}$.

_Currying_ is the isomorphism between $A^{B\times C}$ and $(A^B)^C$.

The language Iverson invented, APL, parsed expressons from right to left.
We write $A^B = \{f\colon A\leftarrow B\}$ and $bf$ instead of $f(b)$.

If $f\colon A\leftarrow B\times C$ define $,f\colon (A\leftarrow B)\leftarrow C$
by $bc,f = b(c,f) = (b,c)f$.

__Exercise__. _Show $a = b(c,f)$ if and only if $a = (b,c)f$_.
