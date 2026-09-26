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
\newcommand\u[1]{\underline{#1}}
\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}

Monoids show up everywhere once you are aware of them. 
They can be used to reduce large amounts of data to a small amount of
data that can be understood by humans to make decisions.

A _monoid_ is a set $M$ with an associative binary operation $m$ that has an identity element $e$.
The binary operation is a function $m\colon M\times M\to M$ satisfying
the associative law $m(m(a,b),c) = m(a, m(b, c))$.
The identity element $e$ satisfies $ea = a = ae$ for all $a\in M$.

__Exercise__. _Show the identity element is unique_.

_Hint_: If $e'a = a = ae'$ for all $a\in M$ show $e = e'$.

A _semigroup_ has an associative binary operation but not necessarily an identity element.
If $s\colon S\time S\to S$ is the semigroup binary operation we can define $M = S\cup\{e\}$
where $e\not\in S$ and $m\colon M\times M\to M$ by $m(e,e) = e$, $m(e, s) = s = m(s, e)$
for $s\in S$, and $m(a,b) = s(a,b)$ for $a,b\in S$.

__Exercise__. _Show this is a monoid_.

A _group_ is a monoid where every element has an _inverse_. Let $g\colon G\times G\to G$
be the binary operation. Every $a\in G$ has an inverse $a^{-1}\in G$ with
$g(a,a^{-1}) = e$.

__Exercise__. _Show $g(a^{-1},a) = e$ for all $a\in G_.

If we write $ab$ for the monoid product $m(a,b)$ then the associative law is $(ab)c = a(bc)$.
This allows us to write $abc$ unambiguously. This can be generalized.

Define $m^n\colon M^n\to M$ for $n\ge0$ by
$m^0(()) = e$ and ${m^{n+1}((a_0,\ldots, a_n)) = m(a_0, m^n((a_1,\ldots,a_n))}$.

__Exercise__. _Show $m^1((a)) = a$ and $m^2((a,b)) = m(a,b)$_.

Define the Kleene star $M^* = \cup_{n\ge0} M^n$ and
$m^*\colon M^*\to M$ by
$m^*(a_1, \dots, a_n) = m^n((a_1,\ldots,a_n))$.

## Examples

Addition and multiplication of numbers are the most well known examples
of monoids with respective identities 0 and 1.

They are also monoids when restricted to non-negative numbers.

The maximum and minimum of numbers are also a monoid with respective
identities $-\infty$ and $+\infty$.

__Exercise__. _Show $\max\{x,-\infty\} = x$ and $\min\{x,+\infty\} = x$_.

String concatenation is another example of a monoid where the empty string is
the identity element.

### MapReduce

[@DeaGhe2004] made a breakthrough in distributed computing using monoids.
Calculating a monoid product $a_1\cdots a_n$ sequentially takes
order $O(n)$ time.
Breaking it into $k$ pieces of size $n/k$ allows the computation to
be _mapped_ over $k$ computers that can run simultaneously
in time $O(n/k)$. The results can then be _reduced_ in $O(k)$
time.

The total time is $O(n/k) + O(k)$ and we can can use a
back-of-the-envelope calculation to find the optimal number of pieces
by pretending we can take a derivative with respect to $k$.
If ${0 = (d/dk)(O(n/k) + O(k)) = O(-n/k^2) + O(1)}$ then ${k = \sqrt{n}}$
is optimal.

We can also break the computation into $k_1$ pieces and
each $n/k_1$ computation into $k_2$ pieces.

__Exercise__. (Due to Bill Goff) _What are the optimal values of $k_1$
and $k_2$_?

_Hint_: $O(n/k_1 k_2) + O(n/k_1) + O(k_1) = ? $

## Statistics

A _statistic_ is a function from a lot of numbers to one number.
The _(sample) mean_ of ${x_1,\ldots,x_n}$ is ${\mu = \mu(x_1,\ldots,x_n)
= (x_1 + \cdots + x_n)/n = \sum_{i=1}^n x_i/n$. It is a number giving an indication
of _location_. If all $x_i$ are equal to $x$ then the mean is $x$.

The _(sample) variance_ is ${\sigma^2 = \sigma^2(x_1,\ldots,x_n) = \sum_{i=1}^n (x_i - \mu)^2/n}$.
It is a number indicating the _spread_ of how far samples are from the average.
If all $x_i$ are equal to $x$ then the variance is $0$.

This can be repeated to come up with a measure of how good the variance statistic is.

Categories with a single object form a monoid. 
A (small) _category_ is a partial monoid with
left and right identities. A category $\cat{C}$ has a partial binary
operation $\circ\colon\cat{C}\times\cat{C}\rightharpoonup\cat{C}$ and for
every $f\in\cat{C}$ there exist right and left identities
${}_f e\in\cat{C}$ with $f\circ {}_f e = f$
and
$e_f\in\cat{C}$ with $e_f\circ f = f$.
Using the usual category theory
notation $f\colon A\to B$ where $A$ and $B$ are _objects_ with _arrow_ $f$
we can identify ${_f}e$ with $A = \dom f$ and
$e_f$ with $B = \cod f$. Objects are determined by arrows in category theory.

### Aggregation

If $M$ is a commutative monoid let $M^+$ be the collection of
all finite subsets of $M$.
Define a function $m^+\colon M^+\to M$
by $m^+(\{m_1,\ldots,m_n\}) = m_1 \cdots m_n$ when $m_j$
are distinct and $m^+(\emptyset) = e$, the monoid identity.

__Exercise__. _Show this is well-defined_.

_Hint_: This requires $M$ to be commutative.

We can define a binary operation on disjoint finite subsets of $M$ to $M$ by ${m^+(A,B) = m^+(A\cup B)}$.

__Exercise__. _If $A,B\subseteq M$ are finite disjoint subsets show ${m^+(A,B) = m^+(A)m^+(B)}$_.

__Exercise__. _If $A,B,C\subseteq M$ are finite pairwise-disjoint subsets show
$m^+(m^+(A, B), C) = m^+(A, m^+(B,C))$_.

Since $m^+(\emptyset, A) = A = m^+(A, \emptyset)$ this shows finite
disjoint subsets of a monoid form a monoid with identity $\emptyset$.

The Kleene star of $M$ is the union of all finite sequences of elements
of $M$, $M^* = \cup_{n\ge0} M^n$ where $M^n = \{(m_1,\dots,m_n)\mid
m_j\in M\}$.  Define $m^*\colon M^*\to M$ by $m^*((m_1,\ldots,m_n)) =
m_1 \cdots m_n$ and $m^*(()) = e$, the monoid identity.

__Exercise__. _Show $M^*$ is a monoid under $m^*$ with identity $(())$_.

### Equivalence Relation

Equivalence relations are a generalization of equality.
Equality satisfied $a = a$, if $a = b$ then $b = a$ and if
$a = b$ and $b = c$ then $a = c$.

An _equivalence relation_ on a set $S$ is a subset $R\subseteq S\times S$
with $(s,s)\in R$, $(s,t)\in R$ implies $(t,s)\in R$, and
if $(s,t)\in R$ and $(t,u)\in R$ then $(s,u)\in R$. We write $sRt$ for $(s,t)\in R$.

__Exercise__. _Show $aRa$, $aRb$ implies $bRa$, and if $aRb$ and $bRc$ then $aRc$
if $R$ is an equivalence relation_.

__Exercise__. _Show $I = \{(s,s)\mid s\in S\}$ is an equivalence relation_.

The _equivalence class_ of $s\in S$ is $\o{s} = \{s'\in S\mid sRs'\}$.

__Exercise__. _Show $\o{S} = \{\o{s}\mid s\in S\}$ is a a _partition_ of $S$_.

_Hint_: A partition of $S$ is a collection of pairwise disjoint sets
whose union is $S$.

__Exercise__. _If $\o{S} = \{S_i\}_{i\in I}$ is a partition of $S$
show $sRs'$ if and only if $s,s'\in S_i$ for some $i\in I$ is
an equivalence relation_.

This shows equivalence relations on $S$ are in 1-1 correspondence with partitions of $S$. 

## Pivot Tables

Pivot tables use monoids to aggregate data. Suppose we have tick data
for stock prices $(t_j, s_j)$. 
We can partition the trading times $\{t_j\}$
by years, months, days, etc. The _high_ and _low_ price apply max
and min to all stock prices falling in a given partition. The _open_
and _close_ price apply min and max to the times in a given partition
and return the corresponding stock price.

The first step in creating a pivot table is to specify a function.
For the example above define $S\colon T\to \RR$ by $S(t_j) = s_j$.
If $\o{T}$ is a partition of $T$ and $\mu$ is a commutative binary opreration
on $\RR$ define $\o{S}\colon \o{T}\to\RR$ by $\o{S}(\o{t}) = \mu^+(S(\o{t}))$.
This is how high and low are defined using max and min on $\RR$ respectively.
We can also define $\u{S}\colon \o{T}\to\RR$ by $\u{S}(\o{t}) = S(\mu^+(\o{t}))$.
This is how open and close are defined using min and max on $T$ respectively.
