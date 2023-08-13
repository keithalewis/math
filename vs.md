---
title: Vector Space
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Classified by dimension
...

\newcommand\mb[1]{\boldsymbol{#1}}
\newcommand\RR{\mb{R}}
\newcommand\FF{\mb{F}}

If $A$ and $B$ are sets then $B^A = \{f\colon B\to A\}$ is the set of all functions from $B$ to $A$.

The set of $n$-tuples of real numbers ${\RR^n = \{x = (x_1,\dots,x_n)\mid x_j\in\RR, 1\le j\le n\}}$ is 
a _vector space_.
Define _scalar multiplication_ $(ax)_j = ax_j$ and _vector addition_
$(x + y)_j = x_j + y_j$ for $a\in\RR$ and $x,y\in\RR^n$.

__Exercise__. _Show vector space addition is commutative and associative_.

_Hint_: Show $x + y = y + x$ and $(x + y) + z = x + (y + z)$, $x,y,z\in\RR^n$
follow from the corresponding properties of real numbers.

Define $\bm{0} = (0, \ldots, 0)$.

__Exercise__. _Show $x + \bm{0} = x$, $x\in\RR^n$_.

This shows $\bm{0}$ is the _additive identity_.

Define $-x$ by $-(x_1,\dots,x_n) = (-x_1,\ldots,-x_n)$.

__Exercise__. _Show $x + (-x) = \bm{0}$, $x\in\RR^n$_.

This shows $-x$ is the additive inverse of $x$.

__Exercise__. _Show $1x = x$ and $a(bx) = (ab)x$, $a,b\in\RR$, $x\in\RR^n$_.

__Exercise__. _Show $(a + b)x = ax + bx$ and $a(x + y) = ax + ay$, $a,b\in\RR$, $x,y\in\RR^n$_.

Matrix $\RR^{n\times m}$.


The _standard basis_ is $\{\delta^i\}_{i\in I}$ where
$\delta^i\in \FF^I$ is defined by $\delta^i(j) = \delta_{ij}$, the Kronecker delta function,
for $j\in I$,

The _dot product_ $\cdot\colon\RR^n\times\RR^n\to\RR$ of two vectors is $x\cdot y = \sum_j x_j y_j$.

__Exercise__. _Show $a(x\cdot y) = (ax)\cdot y = x\cdot(ay)$ and $(x + y)\cdot z = x\cdot z + y\cdot z$
for $a\in\RR$ and $x,y,z\in\RR^n$_.

The dot product is used to define the _norm_ of a vector $\|x\| = \sqrt{x\cdot x}$.

__Exercise__ (Cauchy–Schwarz inequality) _Show $|x\cdot y| \le \|x\| \|y\|$_.

_Hint_: Use $0\le \|ax - y\|^2 = a^2\|x\|^2 - 2a x\cdot y + \|y\|^2$, $a\in\RR$, $x,y\in\RR^n$.

<details><summary>Solution</summary>
We have $0\le a^2\|x\|^2 - 2a x\cdot y + \|y\|^2 = (a\|x\| - x\cdot y/\|x\|)^2 - (x\cdot y)^2/\|x\|^2 + \|y\|^2$.
Taking ${a = (x\cdot y)/\|x\|^2}$ gives ${0\le - (x\cdot y)^2/\|x\|^2 + \|y\|^2}$
so ${(x\cdot y)^2 \le \|x\|^2 \|y\|^2}$.

Note if ${(x\cdot y)^2 = \|x\|^2 \|y\|^2}$ then $ax = y$ for some $a\in\RR$.
</details>

__Exercise__. _Show $\|ax\| = |a|\|x\|$ and $\|x + y\| \le \|x\| + \|y\|$, for $a\in\RR$, $x,y\in\RR^n$_.

_Hint_: Use $2x\cdot y\le 2\|x\|\|y\|$.

<details><summary>Solution</summary>
We have $\|x + y\|^2 = \|x\|^2 + 2x\cdot y + \|y\|^2 \le \|x\|^2 + 2\|x\|\|y\| + \|y\|^2
= (\|x\| + \|y\|)^2$.
</details>

The norm provides a _metric_ $d\colon\RR^n\times\RR^n\to [0,\infty)$
defined by $d(x, y) = \|x - y\|$.

__Exercise__. _Show $d(x,y) = d(y,x)$, $d(x,y) + d(y,z) \le d(x,z)$ and
$d(x,x) = 0$ implies $x = 0$ for $x,y,z\in\RR^n$_.

_Hint_: Use $\|u + v\| \le \|u\| + \|v\|$ for appropriate $u,v\in\RR^n$.

Let $\FF$ be a field and $I$ be a set.
The _set exponential_ $\FF^I = \{x\colon I\to\RR\}$ is a _vector space_
under pointwise addition and scalar multiplication,
$(x + y)(i) = x(i) + y(i)$ and $(ax)(i) = ax(i)$, $i\in I$, $x,y\in\FF^I$, $a\in\FF$.

Dot product does not work in infinite dimensions.

The _vector space dual_ of $\FF^I$ is $\FF_I = (\FF^I)^* = \{x^*\colon \FF^I\to\FF\}$.
The _standard dual basis_ is $\{\delta_i\}_{i\in I}$ where
$\delta_i\in \FF_I$ is defined by $\delta_i(\delta^j) = \delta_{ij}$, $j\in I$,
