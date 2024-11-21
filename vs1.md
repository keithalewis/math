---
title: Vector Space
author: Keith A. Lewis
---

\newcommand\RR{\bm{R}}
\newcommand\LL{\mathcal{L}}
\newcommand\BB{\mathcal{B}}

If $A$ and $B$ are sets, the _set exponential_ $B^A = \{f\colon A\to B\}$ is the
set of all functions from $A$ to $B$.

__Exercise__. _Show $|A^B| = |A|^|B|$ where $|.|$ denotes the number of elements a set has_.

## Vector Space

Every vector space has the form $\RR^I$ where $\RR$ is the real numbers and $I$ is a set.
_Scalar multiplication_ and _vector addition_ are defined pointwise.
For $a\in\RR$, and $x,y\in\RR^I$ define ${(ax)(i) = a(x(i))}$ and ${(x + y)(i) = x(i) + y(i)}$.
We write $0_I$ for the function in $\RR^I$ with $0_I(i) = 0$ for $i\in I$.

If $I = \{1,\ldots,n\}$ then we can identify $x\in\RR^I$ with
$(x_1, \ldots, x_n)$ where $x(i) = x_i$, $i\in I$.

__Exercise__. _For $a,b\in\RR$, $x,y,z\in\RR^I$ show_
$$
\begin{aligned}
x + (y + z) &= (x + y) + z \\
x + y &= y + x \\
v + 0_I &= v \\
v + (-v) &= 0_I \\
a(bx) &= (ab)x \\
1v &= v \\
a(x + y) &= ax + ay \\
(a + b)x &= ax + bx \\
\end{aligned}
$$

Any set $V$ with a scalar multiplication and vector addition satisfying these
properties is a _vector space_. It is true that every 
vector space is isomorphic to $\RR^I$ for some set $I$, but you will have
to read the proof of this elsewhere.

The abstract definition of vector space is more difficult to work with
than the special case of

### Dot Product

If $I$ is finite define the _dot product_ $x\cdot y = \sum_{i\in I} x_i y_i$, $x,y\in\RR^I$.

__Exercise__. _Show $(ax + y)\cdot z = a(x\cdot z) + y\cdot z$, $a\in\RR$, $x,y,z\in\RR^I$_.

This shows $z^*(x) = x\cdot z$ is a linear map from $\RR^I$ to $\RR$,
$z^*(ax + y) = az^*(x) + z^*(y)$.

### Norm

Define the _(Euclidean) norm_ $\|x\|$ by $\|x\|^2 = x\cdot x$ for $x\in\RR^I$.

__Exercise__. (Cauchy-Schwartz) _Show $|x\cdot y|\le\|x\|\|y\|$, $x,y\in\RR^I$_.

_Hint_: Use $0\le\|tx + y\|^2 = t^2\|x\|^2 + 2tx\cdot y + \|y\|^2$ and the
discriminant of a quadratic having at most one root is non-negative.

__Exercise__. _Show $\|ax\| = |a|\|x\|$ and $\|x + y\|\le\|x\| + \|y\|$, $a\in\RR$, $x,y\in\RR^I$_.

_Hint_: Use $2x\cdot y\le2\|x\|\|y\|$.

Define the _$p$-norm_ $\|x\|_p$ by $\|x\|_p^p = \sum_{i\in I}|x_i|^p$ for $1 \le p < \infty$.

__Exercise__. _Show $\lim_{p\to\infty}\|x\|_p = \sup_{i\in I}|x_i| = \|x\|_\infty$_.

_Hint_: Consider $\sum_{i\in I} |x_i/\|x\|_\infty|^p$ and use $x^p\to 0$ on $[0,1)$ as $p\to\infty$.

## Canonical Basis

For $i\in I$ define $e_i\in\RR^I$ by $e_i(j) = 1$ if $i = j$ and $e_i(j) = 0$ if $i\not=j$, $j\in I$.
This can also be written $e_i(j) = \delta_{ij}$ using the Kronecker delta.

__Exercise__. _Show for $x\in\RR^I$ that $x = \sum_{i\in I} x(i)e_i$_.

_Hint_. Compute $x(j)$ for $j\in I$.

## Linear Transformation

If $\RR^I$ and $\RR^J$ are vector spaces a _linear transformation_ is a function $T\colon \RR^I\to \RR^J$
with ${T(ax + y) = aTx + y}$ for ${a\in\RR}$, and ${x,y\in\RR^I}$.

__Exercise__. _Show $T(ax) = aTx$ and $T(x + y) = Tx + Ty$, $a\in\RR$, $x,y\in\RR^I$_.

_Hint_. Take $y = 0_I$ and $a = 1$.

__Exercise__. _Show $T0_I = 0_I$ if $T$ is a linear transformation_.

_Hint_: Use $T(0_I + 0_I) = T0_I + T0_I$ and $x + x = x$ implies $x = 0_I$.

For $e_i\in\RR^I$ we have $Te_i\in\RR^J$ so there are $t_{ij}\in\RR$ with
$e_i = \sum_j t_{ij}e_j$. We call $[t_{ij}]_{i\in I, j\in J}$ the _matrix_ of $T$.

If $S\colon\RR^J\to\RR^K$ is a linear transformation then $ST\colon\RR^I\to\RR^K$
is the _composition_ $(ST)x = S(Tx)\in\RR^K$, $x\in\RR^I$.

__Exercise__. _Show $ST$ is linear_.

_Hint_: $(ST)(a x + y) = S(T(ax + y)) = \cdots$

__Exercise__. _Show the $i,k$ entry of the matrix of $ST$ is $\sum_{j\in J}t_{ij}s_{jk}$, $i\in I$, $k\in K$_.

This shows matrix multiplication is composition of linear transformations.

The set of all linear transformations from $V$ to $W$ is denoted $\LL(V,W)$.
It is also a vector space with scalar multiplication $(aT)x = a(Tx)$ and vector addition
$(S + T)x = Sx + Tx$. Composition is an associative product making $\LL(V,W)$ a non-commutative _algebra_.

## Dual Space

The dual of a vector space $V$ is $V^* = \LL(V,\RR)$.
If ${\xi^*\colon\RR^I\to\RR}$ is a _linear functional_ define ${\xi\in\RR^I}$ by ${\xi_i = \xi^*(e_i)}$, $i\in I$.
This provides a map $*\colon(\RR^I)^*\to\RR^I$.

__Exercise__. _Show $\xi^*(x) = \xi\cdot x$ for $\xi^*\in(\RR^I)^*$, $x\in\RR^I$_.

__Exercise__. _Show this map is linear, one-to-one, and onto_.

The dual of a finite dimensional vector is isomorphic with itself via the canonical basis.

## Adjoint

If $T\in\LL(V,W)$ define the _adjoint_ $T^*\in\LL(W^*,V^*)$ by $(T^*w^*)v = w^*(Tv)$, $w^*\in W^*$ for $v\in V$.

__Exercise__. _Show $(ST)^* = T^*S$_.

## Integration

For any set $S$ let ${B(S) = \{f\colon S\to\RR\mid \sup_{s\in S}|f(s)| = \|f\| < \infty\}}$ be the normed
vector space of _bounded functions_ on $S$. Its dual is the set of all bounded linear functionals on $B(S)$.
If $L\colon B(S)\to\RR$ is a bounded linear functional define
$\lambda(E) = L(1_E)$ for $E\subseteq S$, where 
$1_E(s) = 1$ if $s\in E$ and $1_E(s) = 0$ if $s\not\in E$.

__Exercise__. _Show $\lambda(E\cup F) = \lambda(E) + \lambda(F) - \lambda(E\cap F)$ and $\lambda(\emptyset) = 0$
for $E,F\subseteq S$_.

_Hint_: Use $1_{E\cup F} = 1_E + 1_F - 1_{E\cap F}$ and $1_\emptyset = 0$.

This shows every bounded linear functional on $B(S)$ gives rise to a finitely additive measure on $S$.
The normed vector space of finitely additive measures is denoted $ba(S)$.

A _simple function_ $f = \sum a_j A_j$ is a finite sum with $a_j\in\RR$ and $A_j\subseteq S$
define $\int_S f\,d\lambda = \sum_j a_j\lambda(A_j)$.

__Exercise__. _If $\{A_j\}$ are disjoint show $\sum_j a_j 1_{A_j} = 0$ implies $a_j = 0$ for all $j$_.

_Hint_: Every $s\in S$ belongs to at most one $A_j$.

__Exercise__. _If $\sum_k b_k B_k$ is a finite sum with $b_k\in\RR$ and $B_k\subseteq S$
show there exist $a_j\in\RR$ and disjoint $A_j\subseteq S$ with 
$\sum_j a_j 1_{A_j} = \sum_k b_k 1_{B_k}$_.

_Hint_: Start with  $b_1 1_{B_1} + b_2 1_{B_2}
= b_1 1_{B_1\setminus B_2} + (b_1 + b_2)1_{B_1\cap B_2} + b_2 1_{B_2\setminus B_1}$
where $A\setminus B = \{a\in A\mid a\not\in B\}$ is _set difference_ and use induction.

__Exercise__. _If $\sum_k b_k B_k = 0$ is a finite sum with $b_k\in\RR$ and $B_k\subseteq S$
show $\int_S \sum_k b_k\,d\lambda = 0$_.

These two exercises show the definition of integration is _well-defined_ for simple functions.

## Frechet Derivative

If $F\colon V\to W$ is a function between two normed linear spaces the Frechet derivative
$DF\colon V\to\BB(V,W)$
at $x\in V$ is a linear operator approximating $F$ near $x$
$$
	F(x + h) = F(x) + DF(x)h + o(\|h\|).
$$

__Exercise__. _Show the Frechet derivative of $\|x\|^2$ is $2x^*$_.

_Hint_. $\|x\|^2 = x^*x$.

__Exercise__. _Show the Frechet derivative of $\|x\|^p$ is $p\|x\|^{p-2}x^*$_.

_Hint_. $\|x\|^p = \exp((p/2)\log\|x\|^2)$.

__Exercise__. _Show the Frechet derivative of $x^*Tx$ is $x^*T + T^*x^*$_.
