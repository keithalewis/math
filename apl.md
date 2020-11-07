---
title: APL
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A Programming Language
...

The programming language _APL_ was invented by Ken E. Iverson, a mathematician
unsatisfied by the limited expressiveness of FORTRAN when it came to manipulating
multidimensional arrays. What follows is a mathematical description of
the objects and operations on them he invented to scratch that itch.

If $A$ and $B$ are sets then the _exponential_ $A^B = \{f\colon B\to A\}$ is
the set of all functions from $B$ to $A$. We use $n$ for the set
$\{1,\ldots, n\}$ so $A^n = \{(a_1,\ldots,a_n)\colon a_i\in A, 1\le i\le n\}$ represents the
functions $a\colon n\to A$ where $a(i) = a_i$.

A _data type_ is a set $X$. We assume $X$ is finite in what follows since we
are concerned with computer implementation.
Given data types from some index set $X_i$, $i\in I$,
their cartesian product is $X_I = \Pi_{i\in I}X_i$.

A _table_ is an element $R\in X_I^n$ with _rows_ $R = (r_j)$, $j\in n$.
When we don't care about the order of the rows it is convenient to consider
$R$ to be a subset of $X^I$, $\{r_j:j\in n\}$. If the $r_j$ are not distinct
we use the _disjoint union_ of the rows
$\{(j,r_j):j\in n\}\subseteq n\times R^I$ to identify the row a particular $r_j$ belongs to.

If $J\subseteq I$ let $\pi_{J}\colon X_I\to X_J$ be the _projection_ that
selects elements of $J$. If $I = n$ we write $\pi_j$ instead of $\pi_{\{j\}}$ for $j\in n$.
A _pointed set_ is a set $X$ with a special element $\star\in X$.
If the $X_i$ are pointed sets we can define the _injection_ $\nu{J}\colon X_J\to X_I$ by
replacing missing indices with the $\star$ for $X_i$, $i\not\in J$.
In APL this is written using the _backslash_ operator $J\setminus = \nu$.

__Exercise__. _Show $\pi_{J}\nu{J}\colon X_J\to X_J$ is the identity function on $X_J$_.

If $P\subseteq X_I$ the _restriction_ of $R$ to $P$ is $\{r\in R:r\in P\}$ and
written $R|P$. When $P$ is specified by relations involving the components of $X_I$
we can replace $P$ by those relations. For example R|x_i > 1$ are all rows with $x_i > a$.

## One Dimension

A table $R\in X^n$ is _one dimensional_. The projections $\pi_i$ select elements
from $R$. In APL $\pi_i x = x_i$ is written $x[i]$. Elements of $R$ can be
_taken_ from the front or back using projections. The table $R|_{m} = (x_1,\ldots,x_m$
is the pro

## Application

Given functions $f_i\colon X_i\to Y_i$ define _componentwise
application_ by $f_I\colon X_I\to Y_I$ where $f_I(x)(i) = f_i(x_i)$. More
generally, if $\sigma\colon I\to J$ and $f_i\colon X_i\to
Y_{\sigma(i)}$ then $f_{I,\sigma}\colon X_I\to Y_{\sigma(I)}$ by
$f_{I,\sigma}(x)(\sigma(i)) = f_i(x_i)$.

If we want to be more careful about notation, as Iverson was, we should distinguish between
a function $f\colon A\to B$ and its _push forward_ $f^*\colon\mathcal{P}(A)\to\mathcal{P}(B)$
defined by $f^*(S) = \{f(s):s\in S\}\subseteq B$ for $S\subseteq A$ where
the _power set_ of $A$ is the set of all subsets of $A$, $\mathcal{P}(A) = \{S\subseteq A\}$.
Similarly, the _pull back_ of $f$ is $f_*\colon\mathcal{P}(B)\to\mathcal{P}(A)$
defined by $f_*(T) = \{s\in A:f(s)\in T\}\subseteq A$ for $T\subseteq B$.

If all $X_i$ have the common data type $X$ and $f\colon X\to Y$ we can apply the single
function $f$ to all components $f_\_\colon X_I\to Y_I$ so $f_\_(x)(i) = f(x_i)$.
In APL this is written using diaeresis $f_\_ = f¨$.

# Reduce

If a data type $X$ is an _abelian monoid_ then we can define a measure on the
$\mathcal{P}(X)$ by $\oplus(\{x_j\})
= \oplus_j x_j$ where $\oplus$ is the binary monoid operation
and $\oplus(\emptyset) = 0$ is the identity element of the monoid.
Monoids are pointed sets with their identity being the special element.

Every abelian group is a moniod if we ignore the condition that groups
are required to have inverses. Monoids are only required to have an
associative and commutative binary operation, and an identity element.
Addition and multiplication of numbers are abelian groups.
The set $[-\infty,\infty)$ with binary
operation $x\vee y = \max\{x,y\}$ is an abelian monoid with identity
$-\infty$.  Similarly, $(-\infty,\infty]$ with $x\wedge y = \min\{x,y\}$
and identity $\infty$ is an abelian monoid.

__Exercise__. _Show $\oplus(\{s_j\}) = \oplus_j s_j$ is a well-defined measure on $X$_.

Technically we should write this as $\oplus(\{(j, s_j)\}) = \oplus_j s_j$
to avoid collapsing set elements.

Hint: Since monoid operations are associative and commutative
$\oplus(\{x_1,\ldots,x_n\}) = x_1\oplus\cdots\oplus x_n$ is well-defined.
You need to show $\oplus(U\cup V) = (\oplus(U))\oplus(\oplus(V))$ if
$U\cap V = \emptyset$ for $U,V\subseteq X$.
Start with $\oplus(U\cup \emptyset) = \oplus(U) =
(\oplus(U))\oplus 0 = (\oplus(U))\oplus(\oplus\emptyset)$ and use induction
on the number of elements of $V$.

If $R\in X^n$ then $\oplus R$ is an element of $X$. If $R\in X_I^n$
is a table and $X_i$ is an abelian monoid we can apply its operation at index $i$
to get $\oplus_i R\in X_I^n$ where the rows of $R$ have their $i-th$
component replaced by the constant value $\oplus R_{\{i\}}$.
This is called _reduction_ along column $i$ and in APL it is written using
the _forward slash_ operator $\oplus_i/R$.

## Expand

If an abelian monoid has a total ordering that is discrete with elements
$0 = x_0 < x_1 < \cdots $ define $\iota\colon \bm{N}\to $X^\infty$
by $\iota n = (x_0,\ldots,x_n)$.
