---
title: Monoid
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Associative binary operation with an identity
...

\newcommand\cat[1]{\mathbf{#1}}
\newcommand\RR{\boldsymbol{R}}
\newcommand\o[1]{\overline{#1}}

If $a$, $b$, and $c$ are elements of a monoid then $(ab)c = a(bc)$
so we can unambiguously write $abc$. This is the basis of the map-reduce
algorithm. To compute $abcd$ we can compute $e = (ab)$ and $f = (cd)$ independently
then $ef$ to get the final result. Monoids are also used for pivot tables.
The partial calculations $e$ and $f$ are aggregations of the of the entire
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

A _semigroup_ is a set with a binary associative operation. A semigroup can
be turned into a monoid by adding an identity element.
If $S$ is a semigroup let $M = S\cup\{e\}$ (where $e\notin S$)
and define $se = s = es$ for $s\in S$.

__Exercise__. _Show $M$ is associative_.

A monoid is _abelian_/_commutative_ if $m(a,b) = m(b,a)$ for $a,b\in M$.

## Examples

Addition and multiplication are commutative with identity 0 and 1 respectivly.

Minimum and maximum are commutative with identity $\infty$ and $-\infty$ respectively.

Subsets of a set $S$ are a commutative monoid under union and intersection with
identity $\emptyset$ and $S$ respectively.

String concatenation is not commutative with identity element the empty string.

Categories with a single object form a monoid. 
A (small) _category_ is a partial monoid with
left and right identities. A category $\cat{C}$ has a partial binary
operation $\circ\colon\cat{C}\times\cat{C}\rightharpoonup\cat{C}$ and for
every $f\in\cat{C}$ there exist left and right identities $e_f\in\cat{C}$
with $e_f\circ f = f$ and ${}_f e\in\cat{C}$ with $f\circ {}_f e = f$.

### Aggregation

If $M$ is a commutative monoid define a function $m^+$ from finite subsets
of $M$ to $M$ by $m^+(\{m_1,\ldots,m_n\}) = m_1 \cdots m_n$ when $m_j$
are distinct and $m^+(\emptyset) = e$, the monoid identity.

__Exercise__. _Show this is well-defined_.

_Hint_: This requires $M$ to be commutative.

We can define a binary operation on disjoint finite subsets of $M$ to $M$ by $m^+(A,B) = m^+(A\cup B)$.

__Exercise__. _If $A,B\subseteq M$ are finite disjoint subsets show $m^+(A,B) = m^+(A)m^+(B)$_.

__Exercise__. _If $A,B,C\subseteq M$ are finite pairwise-disjoint subsets show
$m^+(m^+(A, B), C) = m^+(A, m^+(B,C))$_.

Since $m^+(\emptyset, A) = A = m^+(A, \emptyset)$ this shows finite
disjoint subsets of a monoid form a monoid with identity $\emptyset$.

The Kleene star of $M$ is the union of all finite sequences of elements
of $M$, $M^* = \cup_{n\ge0} M^n$ where $M^n = \{(m_1,\dots,m_n)\mid
m_j\in M\}$.  Define $m^*\colon M^*\to M$ by $m^*((m_1,\ldots,m_n)) =
m_1 \cdots m_n$ and $m^*(()) = e$, the monoid identity.

__Exercise__. _Show $M^*$ is a monoid under $m^*$ with identity $(())$_.

This does not require $M$ to be commutative.

### Equivalence Relation

Equivalence relations are a generalization of equality.
It is the case $a = a$, if $a = b$ then $b = a$ and if
$a = b$ and $b = c$ then $a = c$.

An _equivalence relation_ on a set $S$ is a subset $R\subseteq S\times S$
with $(s,s)\in R$, $(s,t)\in R$ implies $(t,s)\in R$, and
if $(s,t)\in R$ and $(t,u)\in R$ then $(s,u)\in R$. We write $sRt$ for $(s,t)\in R$.

__Exercise__. _Show $aRa$, $aRb$ implies $bRa$, and if $aRb$ and $bRc$ then $aRc$
if $R$ is an equivalence relation_.

__Exercise__. _Show $I = \{(s,s)\mid s\in S\}$ is an equivalence relation_.

_Hint_: $I$ is equality.

The _equivalence class_ of $s\in S$ is $\o{s} = \{t\in S\mid sRt\}$.

__Exercise__. _Show $s\in \o{s}$, $\o{s} = \o{t}$ if and only if $sRt$, and
$\o{s}\cap\o{t} = \emptyset$ if $\o{s}\not=\o{t}$_.

__Exercise__. _Show $\o{S} = \{\o{s}\mid s\in S\}$ is a a _partition_ of $S$_.

_Hint_: A partition of $S$ is a collection of pairwise disjoint sets
whose union is $S$.

## Pivot Tables

Pivot tables use monoids to aggregate data. Suppose we have tick data for
stock prices $(t_j, X_j)$. This determines a function $X\colon T\to\RR$
where $T = \{t_j\}$ are the trading times. We can partition $T$ by years,
months, days, etc. The _high_ and _low_ price apply max and min to all stock
prices falling in a given partition. The _open_ and _close_ price apply min
and max to the times in a given partition and return the corresponding
stock price.

Let $\mu\colon S\to M$ be a function where $S$ is a set and $M$ is a
commutative monoid.
If $\o{S}$ is a partition of $S$ define $\mu^+\colon\o{S}\to M$
by $\mu^+(\o{s}) = $.
