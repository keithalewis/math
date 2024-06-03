---
title: Vector Space
author: Keith A. Lewis
---

\newcommand\RR{\bm{R}}
\newcommand\LL{\mathcal{L}}

If $A$ and $B$ are sets, the _set exponential_ $B^A = \{f\colon A\to B\}$ is the
set of all functions from $A$ to $B$.

## Vector Space

Every vector space has the form $\RR^I$ where $\RR$ is the real numbers and $I$ is a set.
_Scalar multiplicaton_ and _vector addition_ are defined pointwise.
For $a\in\RR$, and $x,y\in\RR^I$ define ${(ax)(i) = a(x(i))}$ and ${(x + y)(i) = x(i) + y(i)}$.

__Exercise__. _If $I = \{1,\ldots,n\}$ then we can identify $\RR^I$ with
$\RR^n = \{(x_1, \ldots, x_n)\mid x_i\in\RR\}$_.

_Hint_. $x(i) = x_i$, $i\in I$.

<!-- ...vs axioms... $x + x = x$. 0x = 0, 1x = x -->

### Dot Product

If $I$ is finite define the _dot product_ $x\cdot y = \sum_{i\in I} x_i y_i$.

__Exercise__. _Show $(ax + y)\cdot z = a(x\cdot z) + y\cdot z$, $a\in\RR$, $x,y,z\in\RR^I$_.

### Norm

Define the _norm_ $\|x\|$ by $\|x\|^2 = x\cdot x$.

__Exercise__. _Show $\|ax\| = |a|\|x\|$ and $\|x + y\|\le\|x\| + \|y\|$, $a\in\RR$, $x,y\in\RR^I$_.

__Exercise__. (Cauchy-Schwartz) _Show $|x\cdot y|\le\|x\|\|y\|$, $x,y\in\RR^I$_.

_Hint_: Find $t\in\RR$ minimizing $\|tx + y\|^2$ .

## Canonical Basis

For $i\in I$ define $e_i\in\RR^I$ by $e_i(j) = 1$ if $i = j$ and $e_i(j) = 0$ if $i\not=j$, $j\in I$.
This can also be written $e_i(j) = \delta_{ij}$ using the Kronecker delta.

__Exercise__. _Show for $x\in\RR^I$ that $x = \sum_{i\in I} x(i)e_i$_.

_Hint_. Compute $x(j)$ for $j\in I$.

## Linear Transformation

If $\RR^I$ and $\RR^J$ are vector spaces a _linear transformation_ is a function $T\colon \RR^I\to \RR^J$
with ${T(ax + y) = aTx + y}$ for ${a\in\RR}$, and ${x,y\in\RR^I}$.

__Exercise__. _Show $T(ax) = aTx$ and $T(x + y) = Tx + Ty$, $a\in\RR$, $x,y\in\RR^I$_.

_Hint_. Take $y = 0$ and $a = 1$.

__Exercise__. _Show $T0 = 0$ if $T$ is a linear transformation_.

_Hint_: Use $T(0 + 0) = T0 + T0$ and $x + x = x$ implies $x = 0$.

For $e_i\in\RR^I$ we have $Te_i\in\RR^J$ so there are $t_{ij}\in\RR$ with
$e_i = \sum_j t_{ij}e_j$. We call $[t_{ij}]_{i\in I, j\in J}$ the _matrix_ of $T$.

If $S\colon\RR^J\to\RR^K$ is a linear transformation then $ST\colon\RR^I\to\RR^K$.

__Exercise__. _Show $ST$ is linear_.

_Hint_: $(ST)(a x + y) = S(T(ax + y)) = \cdots$

__Exercise__. _Show the $i,k$ entry of the matrix of $ST$ is $\sum_{j\in J}t_{ij}s_{jk}$, $i\in I$, $k\in K$_.

The set of all linear transformations from $V$ to $W$ is denoted $\LL(V,W)$.
It is also a vector space with scalar multiplication $(aT)x = a(Tx)$ and vector addition
$(S + T)x = Sx + Tx$. Composition is an associative product making $\LL(V,W)$ a non-commutative _algebra_.

## Dual Space

The dual of a vector space $V$ is $V^* = \LL(V,\RR)$.
If $\xi^*\colon\RR^I\to\RR$ is a _linear functional_ define $\xi\in\RR^I$ by $\xi_i = \xi^*(e_i)$, $i\in I$.
This provides a map $*\colon(\RR^I)^*\to\RR^I$.

__Exercise__. _Show $\xi^*(x) = \xi\cdot x$, $\xi^*\in(\RR^I)^*$, $x\in\RR^I$_.

__Exercise__. _Show this map is linear, one-to-one, and onto_.

If $T\in\LL(V,W)$ define the _adjoint_ $T^*\in\LL(W^*,V^*)$
by $(T^*w^*)v = w^*(Tv)$, $w^*\in W^*$, $v\in V$.





