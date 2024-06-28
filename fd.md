---
title: Fréchet Derivative
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Infinite dimensional derivatives
---

\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\boldsymbol{R}}
\newcommand\BB{\mathcal{B}}
\newcommand\LL{\mathcal{L}}
\newcommand\MM{\mathcal{L}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}


If $F\colon X\to Y$ is a function between normed linear spaces
the Fréchet derivative ${DF\colon X\to\BB(X,Y)}$ is defined by
$$
	F(x + h) = F(x) + DF(x)h + o(h)
$$
for $x,h\in X$ where $\BB(X,Y)$ is the set of bounded linear operators from $X$ to $Y$.
The "little $o$" notation means
$\|F(x + h) - F(x) - DF(x)h\|/\|h\| \to 0$ as $\|h\| \to 0$.
The function $F$ can be approximated near $x$ by the linear operator $DF(x)$.

A _norm_ is a function $\|\cdot\|\colon X\to\RR$ satisfying
$\|ax\| = |a|\|x\|$, $\|x + y\| \le \|x\| + \|y\|$, $\|x\|\ge0$
and $\|x\| = 0$ implies $x = 0$ for $a\in\RR$, $x,y\in X$.

If $X = Y = \RR$ then $DF\colon\RR\to\BB(\RR,\RR)$ where $DF(x)h = F'(x)h$.

If $X = \RR^n$ and $Y = \RR^m$ then $DF(x)\colon\RR^n\to\RR^m$ is the Jacobian.

__Exercise__. _If $T\colon X\to X$ is a bounded linear operator then $DT = T$_.

If $G\colon Y\to Z$ then $D(G\circ F)(x) = DG(F(x))DF(x)$

__Exercise__: _Prove the chain rule for Frechet derivatives._

_Hint_: $G\circ F(x + h) = G(F(x + h)) = G(F(x) + DF(x)h + o(h)) = G(F(x)) + DG(F(x))DF(x)h + o(h)$.

Define the _dual_ of a normed linear space $X$ by $X^* = \BB(X,\RR)$.
If $X^I = \{x\colon I\to\RR\}$ is the set of functions from the set $I$
to $\RR$ we can define an _inner product_ $(\cdot,\cdot)\colon X\times
X\to\RR$ by $(x, y) = \sum_{i\in I}x(i) y(i)$ if $I$ is finite.  We also
write $x_i$ for $x(i)$.

__Exercise__. _Show the inner product is_ bilinear.

_Hint_: Show $(ax + y, z) = a(x,y) + (y,z)$ and $(x, ay + z) = a(x,y) + (x,z)$
for $a\in\RR$, $x,y,z\in X$ using $(x,y) = \sum_{i\in I}x_i y_i$.

The inner product defines a norm by $\|x\| = \sqrt{(x, x)}$.

__Exercise__. _Show $|(x,y)| \le \|x\| \|y\|$ for $x,y\in X$_.

_Hint_: Use $0\le\|ax + y\|$ for $a\in\RR$, $x,y\in X$ and minimize over $a$.

__Exercise__. _Show if $|(x,y)| = \|x\| \|y\|$ and $x\not=0$ then $y = ax$ for some $a\in\RR$_.

__Exercise__. _Show $\|\cdot\|$ is a norm_.

The _canonical basis_ of $\RR^I$ is $e_i\in\RR^I$, $i\in I$, defined by $e_i(j) = \delta_{ij}$,
where $\delta_{ij} = 1$ if $i = j$ and is zero otherwise.

__Exercise__: _Show $x = \sum_{i\in I} x(i)e_i$ for $x\in\RR^I$_.

_Hint_: Compute $x(j)$, $j\in I$.

Define the dual basis
$e_j^*\in(\RR^I)^*$, $j\in I$, by $e_j^*(e_i) = \delta_{ji}$.

__Exercise__: _Show $x^* = \sum_{j\in I} x^*(e_j) e_j^*$ for $x^*\in X^*$_.

_Hint_: Compute $x^*(e_i)$, $i\in I$.

The _dual map_ $*\colon\RR^I\to(\RR^I)^*$ defined by $e_i\mapsto e_i^*$ allows us to identify
$(\RR^I)^*$ with $\RR^I$.

__Exercise__. _Show the dual map is an isometric isomorphism_.

__Exercise__: _Show $D\|x\|^p = p\|x\|^{p-1}x^*$.

__Exercise__: _If $F(x) = x^2$ show $DF(x)h = xh + hx$_.
