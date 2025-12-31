---
title: Types
author: Keith A. Lewis
---

# Types

A _type_ is a set with operations that satisfy axioms.

For example, a _semigroup_ is a set with a binary associative 
operation. If $m\colon S\times S$ is the binary operation
then it is associative if $m(a,m(b,c)) = m(m(a,b),c)$ for
all $a,b,c\in S$. Writing $m(a,b)$ as $ab$ we have
$a(bc) = (ab)c$ so $abc$ reads unambiguously in a semigroup.

We say $e\in M$ is an _identity element_ if $em = m = me$
for all $m\in M$.

__Exercise__. _Show if $e'$ satisfies $e'm = m = me'$ for
all $m\in M$ then $e' = e$_.

_Hint_: Use $e' = e'e$.

__Exercise__. _Show if $em = m$ for all $m$ in a monoid
$M$ then $me = m$ for all $m\in M$_.

_Hint_: $me = e(me) = (em)e = me$.$

A _monoid_ is a semigroup with an identity. 
If $S$ is a semigroup we can make it into a monoid
by adjoining $e\not\in S$ and define $ee = e$ and
$se = s = es$ for $s\in S$.

## Relation

A _relation_ on sets $A$ and $B$ is a subset $R\subseteq A\times B$.
We write $aRb$ for $(a,b)\in R$, $a\in A$, $b\in B$.
Define the _left coset_ $aR = \{b\in B\mid aRb\}$ and
the _right coset$ $Rb = \{a\in A\mid aRb\}$.

The _composition_ of $R\subseteq A\time B$ with the relation $S\subseteq B\times C$ is defined by
$c(SR)a$ if and only if there exists $b\in B$ with
$aRb$ and $bSc$. This is closely related to the
[`JOIN`](https://en.wikipedia.org/wiki/Join_(SQL)) of relational databases.
The _inner join_ of $R$ and $S$ is the set $\{(a,b,c)\mid aRb, bSc, a\in A, b\in B, c\in C\}$.

__Exercise__. _Show $a(SR)c$ if and only if the intersection of the left coset
$aR$ and right coset $Sc$ is not empty_.

For any set $A$ define the _diagonal_ $\Delta_A = \{(a,a)\mid a\in A\}\subseteq A\times A$.

__Exercise__ _Show if $R\subseteq A\times B$ then 
$\Delta_AR = R$ and $R\Delta_B = R$_.

Define the l

## Function

A _function_ $f\colon A\to B$ is a relation $f\subseteq A\times B$ where
every left coset $af$ has exactly one element. If $af = \{b\}$ we write
$f(a) = b$.

__Exercise__ _Show if $f\colon A\to B$ and $g\colon B\to C$ then
$(gf)(a) = g(f(a))$_.

Given functions $f\colon A\to B$ and $g\colon B\to C$
the _compostion_ $g\circ f$ is defined by $g\circ f(a) = g(f(a))$.
we can define a binary operation using function compo $m(f,g) = g\circ f$.

Category Theory provides a way of talking about sets and
functions without mentioning elements of sets.
This dicipline clarifies essention structure by
preventing incidental artifacts involving elements.

We express this in a categorical way as an $F$-algebra
in the category Set with the functor $F(S) = S\times S$
and the commutative diagram 
