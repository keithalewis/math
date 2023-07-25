---
title: Monoid
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Associative binary operation with an identity
...

\newcommand\cat[1]{\mathbf{#1}}

If $a$, $b$, and $c$ are elements of a monoid then $(ab)c = a(bc)$
so we can unambiguously write $abc$. This is the basis of the map-reduce
algorithm. To compute $abcd$ we can compute $e = (ab)$ and $f = (cd)$ independently
then $ef$ to get the final result. Monoids are also the used for pivot tables.
The partial calculations $e$ and $f$ are summaries of the of the entire
data set $a$, $b$, $c$, and $d$. This becomes more interesting when
many data values are involved.

A _moniod_ is a set $M$ with a binary operation $m\colon M\times M\to M$ that is
associative and has an identity element $e$.
A binary operation $m$ is _associative_ if $m(m(a,b),c) = m(a,m(b,c))$, $a,b,c\in M$.
Writing $ab$ for $m(a,b)$ this means $(ab)c = a(bc)$, so writing $abc$ is unambiguous.
An _identity element_ $e$ satisfies $ea = a = ae$ for $a\in M$.

__Exercise__. _If $e'\in M$ satisfies $e'a = a = ae'$, $a\in M$, then $e' = e$_.

<details><summary>Solution</summary>
$e' = e'e = e$.
</details>

This shows the monoid identity is unique.

A monoid is _abelian_/_commutative_ if $m(a,b) = m(b,a)$ for $a,b\in M$.

A _semigroup_ is a set with a binary associative operation. A semigroup can
be turned into a monoid by adding an identity element.
If $S$ is a semigroup let $M = S\cup\{e\}$ (where $e\notin S$)
and define $se = s = es$ for $s\in S$.

## Examples

Addition and multiplication are abelian with identity 0 and 1 respectivly.

Minimum and maximum are abelian with identity $\infty$ and $-\infty$ respectively.

String concatenation is not abelian with identity element the empty string.

Categories with a single object form a monoid. 
A (small) _category_ is a partial monoid with
left and right identities. A category $\cat{C}$ has a partial binary
operation $\circ\colon\cat{C}\times\cat{C}\rightharpoonup\cat{C}$ and for
every $f\in\cat{C}$ there exist left and right identities $e_f\in\cat{C}$
with $e_f\circ f = f$ and ${}_f e\in\cat{C}$ with $f\circ {}_f e = f$.

## Pivot Tables

Pivot tables use monoids to summarize data. 

The simplest example of a pivot table is a function from
a set $S$ to a monoid $M$, $δ\colon S\to M$.
