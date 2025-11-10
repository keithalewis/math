---
title: Monoid
author: Keith A. Lewis
---

A _semigroup_ is a set with an associative binary operation.
If we write $ab$ for the binary operation then
$a(bc) = (ab)c$ is the associative law.
This allows us to write $abc$ unambiguously.
A semigroup is _commutative_, or _abelian_, if
$ab = ba$ for every element of the semigroup.

The binary operation for a semigroup is a function $m\colon S\times S\to S$ on the
cartesian product of the set of elements satisfying
$m(a,m(b,c)) = m(m(a,b),c)$ whenever $a,b,c\in S$.
If we write $ab$ for $m(a,b)$ this becomes $a(bc) = (ab)c$.

A _monoid_ is a semigroup $\langle M,m\rangle$ with an identity element $e\in M$
satisfying $me = m = em$ for $m\in M$.

__Exercise__. _Show the identity element of a monoid is unique_.

_Hint_: If $e'$ is another identity element then $e = ee' = e'$.

<!-- ??? Every left identity is a right identity ??? -->

Every semigroup can be turned into a monoid by adjoining an identity element.

If $\langle S,m\rangle$ is a semigroup pick any $e\not\in S$
and define $m^e(a,b) = m(a,b)$ and
$m^e(e,c) = c = m^e(c,e)$ for $a,b,c\in S$.

__Exercise__. _Show $\langle S\cup\{e\}, m^e\rangle$ is a monoid_.

Semigroups and monoids are ubiquitous. Addition and multiplication of
numbers are all abelian semigroups. Strings under concatenation are
a non-abelian monoids with identity the empty string.

__Exercise__. _Show subtraction and division over the rational numbers is not associative_.

Monoids might seem to be too trivial to be useful, but they are
the foundation of [MapReduce](https://en.wikipedia.org/wiki/MapReduce).
You can chop $a_1\cdots a_n$ into $k$ pieces and run their
product in parallel on $k$ computers. Each piece has $n/k$
elements so the total parallel computation time is $O(n/k)$.
The $k$ partial products can be computed in $O(k)$ time.
The value of $k$ that minimizes $n/k + k$ is $k = \sqrt{n}$
so the total computation time is $2\sqrt{n}$.
