---
title: Monoid
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Associative binary operation with an identity
...

Monoids show up everywhere. You will experience the Baader-Meinhof Phenomenon
once you learn about them. For example, they are used in pivot tables and the map-reduce algoithm.
The basic idea is that the associative law $a(bc) = (ab)c$ means $abc$ in unambiguous.

A _moniod_ is a set $M$ with a binary operation $m\colon M\times M\to M$ that is
associative and has an identity element $e$.

A binary operation $m$ is _associative_ if $m(m(a,b),c) = m(a,m(b,c))$, $a,b,c\in M$.
Writing $ab$ for $m(a,b)$ this means $(ab)c = a(bc)$, so writing $abc$ in unambiguous.

An _identity element_ $e$ satisfies $ea = a = ae$ for $a\in M$.

__Exercise__. _If $e'\in M$ satisfies $e'a = a = ae'$, $a\in M$, then $e' = e$_.

<details><summary>Solution</summary>
$e' = e'e = e$.
</details>

This shows the monoid identity is uniqure.

## Examples

If $M$ is the set of real numbers then multiplication is a monoid with identity element 1.
Addition is a monoid with identity element 0. Maximum is a monoid with identity element $-\infty$.
Minimum is a monoid with identity element $\infty$.
String concatenation is a monoid with identity element the empty string.
The arrows of a category with a single object form a monoid.

## Rational

Monoids are the basis of the map-reduce algorithm.
If $a_j$ are elements of a monoid then the calculation of $a_1\cdots a_n$ can
be partitioned into seperate calculations $A_1 = a_1\cdots a_{k_0}$,
$A_2 = a_{k_0 + 1}\cdots a_{k_1}$, $\dots$, $a_{k_j + 1}\cdots a_n$.
