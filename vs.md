---
title: From $\bm{R}^n$ to Vector Spaces for Engineers
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Axioms are more useful than accidents
...

%\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\bm[1]{\mathbold{#1}}
\newcommand\RR{\mb{R}}
\newcommand\FF{\mb{F}}
\newcommand\ran{\operatorname{ran}}

<!--
My PhD involved infinite dimensional vector spaces so excuse me for being appalled
by cartoon introductions to vector spaces floating around the internet these days.
-->
This note starts from tuples of $n$ real numbers, a.k.a $\RR^n$,
and develops facts about vector spaces engineers might find useful in practice.
The exercises will teach you all the math you need to know. Try them
before peeking at the solution.

Along the way you will nail down some things you only have
partial knowlege of, so far. The notion of row vector and column vector
is a special case of the _dual_ of a vector space.
This can be generlized to higher dimensions using _tensors_. 

vector space, norm, inner product

## $\RR^n$

The set of $n$-tuples of real numbers ${\RR^n = \{x = (x_1,\dots,x_n)\mid x_j\in\RR, 1\le j\le n\}}$ is 
a vector space.
Define _scalar multiplication_ $(ax)_j = ax_j$ and _vector addition_
$(x + y)_j = x_j + y_j$ for $a\in\RR$ and $x,y\in\RR^n$.

__Exercise__. _Show vector space addition is commutative and associative_.

_Hint_: Show $x + y = y + x$ and $(x + y) + z = x + (y + z)$, $x,y,z\in\RR^n$
follow from the corresponding properties of real numbers.

<details><summary>Solution</summary>
We have $(x + y)_j = x_j + y_j = y_j + x_j = (y + x)_j$ and
$((x + y) + z)_j = (x + y)_j + z_j = (x_j + y_j) + z_j = x_j + (y_j + z_j) = x_j + (y + z)_j = (x + (y + z))_j$,
$1\le j\le n$
</details>

A _semigroup_ is a binary operation that is associative.

Define $\bm{0} = (0, \ldots, 0)$.

__Exercise__. _Show $x + \bm{0} = x$, $x\in\RR^n$_.

This shows $\bm{0}$ is the _additive identity_.

A _monoid_ is a semigroup having an identity element.

Define $-x$ by $-(x_1,\dots,x_n) = (-x_1,\ldots,-x_n)$.

__Exercise__. _Show $x + (-x) = \bm{0}$, $x\in\RR^n$_.

This shows $-x$ is the additive inverse of $x$.

A _group_ is a monoid where every element has an inverse.

__Exercise__. _Show $1x = x$ and $a(bx) = (ab)x$, $a,b\in\RR$, $x\in\RR^n$_.

__Exercise__. _Show $(a + b)x = ax + bx$ and $a(x + y) = ax + ay$, $a,b\in\RR$, $x,y\in\RR^n$_.

## Vector Space

A _vector space_ is a set $V$ with a commutative group operation $(x,y)\mapsto x + y$, $x,y\in V$,
and a scalar multiplication $(a, x)\mapsto ax$, $a\in\RR$ and $x\in V$, that satisfy the above properties.

__Exercise__. _Show $x + x = x$ implies $x = \bm{0}$ if $x$ is an element of a vector space_.

<details><summary>Solution</summary>
$$
\begin{aligned}
	x + x &= x \\
	&\langle a = b \text{ implies }a + c = b + c\rangle [a\leftarrow x + x, b\leftarrow x, c\leftarrow -x]\\
	(x + x) + (-x) &= x + (-x) \\
	&\langle (a + b) + c = a + (b + c)\rangle[a\leftarrow x, b\leftarrow x, c\leftarrow -x] \\
	x + (x + (-x)) &= x + (-x) \\
	&\langle a + (-a) = \bm{0}\rangle[a\leftarrow x\text{ twice}] \\
	x + \bm{0} &= \bm{0} \\
	&\langle a + \bm{0} = a\rangle[a\leftarrow x] \\
	x &= \bm{0} \\
\end{aligned}
$$
</details>

Axioms are written in angle brackets and substitution in square brackets.
Note the proof uses only the vector space axioms distilled from the special case of $\RR^n$.
This is trivial to prove for $x\in\RR^n$, but using only the vector space axioms
allows us to consider a wider range of mathematical objects.

There are many vector spaces other than $\RR^n$.

__Exercise__. _Show $\RR^S$ is a vector space for any set $S$_.

_Hint_: Recall if $A$ and $B$ are sets then $B^A = \{f\colon B\to A\}$ is the set of all functions from $B$ to $A$.

Let $\RR^S_{00}$ be the set of functions $f\in\RR^S$ that are non-zero on a finite set of $s\in S$.

__Exercise__. _Show $\RR^S_{00}$ is a vector space_.

A function $f\in\RR^S$ is _bounded_ if the _norm_ of $f$ defined by $\|f\| = \sup_{s\in S} |f(s)|$ is finite.
The space of bounded functions on $S$ is $B(S) = \{f\in\RR^S\mid \|f\| < \infty\}$.

__Exercise__. _Show $B(S)$, is a vector space_.

The space of bounded functions $B(S)$ is a _metric space_ with distance ${d(f, g) = \|f - g\|}$.

__Exercise__. _Show $d(f, g) = 0$ implies $f = g$ and $d(f,g) + d(g, h) \ge d(f, h)$, $f,g,h\in B(S)$_.

__Exercise__. _Show the space of continuous functions on the interval $[a,b]$, $C([a,b])$,
is a vector space_.

__Exercise__. _Show the space of $n$ times differentiable functions on the interval $[a,b]$, $C^{(n)}([a,b])$,
is a vector space_.

__Exercise__. _Show the solutions $x(t)$ of the homogeneous differential equation
$\sum_{j=0}^n a_j x^{(j)}(t) = 0$, $a_j\in\RR$, are a vector space_.

Let $\mathcal{L}(V,W)$ be the set of all functions from the vector space $V$
to the vector space $W$ that preserve vector space operations:
$T(av) = a(Tv)$ and $T(u + v) = Tu + Tv$, $a\in\RR$, $u,v\in V$.
For $S,T\in\mathcal{L}(V,W)$ define scalar multiplication $(aT)v = a(Tv)$
and vector space addition $(S + T)v = Sv + Tv$, $a\in\RR$, $v\in V$.

__Exercise__. _Show $\mathcal{L}(V, W)$ is a vector space_.

__Exercise__. _If $T\in\mathcal{L}(V, W)$ then $T\bm{0} = \bm{0}$_.

_Hint_: Consider $T(\bm{0} + \bm{0})$ and use $v + v = v$ implies $v = 0$.

### Subspace

A subset of a vector space that is also a vector space is a _subspace_.
Subspaces allow us to factor a space into smaller vector spaces.

For $T\in\mathcal{L}(V,W)$ define the _kernel_ $\ker T = \{v\in V\mid Tv =
\bm{0}\}$ and _range_ $\ran T = \{Tv\mid v\in V\}$.

__Exercise__. _Show $\ker T$ is a subspace of $V$ and $\ran T$ is a subspace of $W$_.

__Exercise__. _If $T\colon V\to W$ is a linear transformation and $\ker T = \{\bm{o}\}$
show $Tu = Tv$ implies $u = v$, $u,v\in V$_.

_Hint_: Consider $T(u - v)$.

In this case we say $T$ is _one-to-one_ or _injective_.

__Exercise__. _If $W$ is subspace of $V$ show $u\sim v$ defined by $u - v\in W$, $u,v\in V$,
is an equivalence relation_.

_Hint_: Show $v\sim v$, $u\sim v$ implies $v\sim u$, $u\sim v$ and $v\sim w$ imply $u\sim w$,
$u,v,w\in V$.

<details><summary>Solution</summary>
Since $v - v = \bm{0}\in W$ (identity) we have $v\sim v$. If $u \sim v$ then
${u - v\in W}$ so ${v - w = -(u - v)\in W}$ (inverse).
If $u\sim v$ and $v\sim w$ then $u - v$ and $v - w$ belong to $W$ so
${u - w = (u - v) + (v - w)\in W}$ (addition).
</details>

Equivalence relations pop up often. If $S$ is a set and $\sim$ is an equivalence
relation on $S$ then the set of _equivalence classes_ are a _partition_ of $S$.
The equivalence class of $x\in S$ is ${[x] = \{y\in S\mid y\sim x\}}$.

__Exercise__. _Show $x\in [x]$ and for $x,y\in S$ either $[x] = [y]$ or $[x]\cap [y] = \emptyset$_.

<details><summary>Solution</summary>
Since $x\sim x$ we have $x\in [x]$.
If $z\in [x]\cap[y]$ then $z\sim x$ and $z\sim y$ so $x\sim y$.
If $u\in [x]$ then $u\sim x$ so $u\sim y$ and $u\in [y]$.
Likewise, $[y]\subseteq [x]$ so $[x] = [y]$.

</details>

Translating a subspace $W$ by $v$ gives $v + W = \{v + w\mid w\in W\}$.

__Exercise__. _If $W$ is subspace of $V$ show $u\sim v$ if and only if $u + W = v + W$_.

The set of equvalence classes $V/W = \{v + W\mid v\in V\}$ can be made into a vector space.
Define addition by $(u + W) + (v + W) = (u + v) + W$ and scalar multiplcation by
$a(v + W) = av + W$, $a\in\RR$, $u, v\in V$.

__Exercise__. _Show $V/W$ is a vector space_.

If $W$ is a subspace of $V$ then we can split $V$ into a sum of $W$ and $V/W$.

$0\to W\to V\to V/W\to 0$.

### Span

The _span_ of a set of vectors $\{x_i\}_{i\in I}$ is the set of all finite
_linear combinations_ $\sum_j a_j x_j$, $a_j\in\RR$.

__Exercise__. _Show the span of a set of vectors is a vector space_.

### Independent

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \bm{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \bm{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{x_i\}$ that are independent and span $V$.

<!--
## Matrix

A _matrix_ is an element $T\in\RR^{m\times n}$. We write $T = [t_{ij}]$, $1\le i\le m$, $1\le j\le n$
for the matrix entries. If $x = (x_1,\ldots,x_n)\in\RR^n$ then
$Tx = y = (y_1,\ldots,y_m)\in\RR^m$ where $y_i = \sum_{j=1}^n t_{ij} x_j$.

__Exercise__. _Show $T(av) = a(Tv)$ and $T(v + w) = Tv + Tw$, $a\in\RR$, $v,w\in\R^n$_.

__Exercise__. _Show $T(av + w) = aTv + Tw$, $a\in\RR$, $v,w\in\RR^n$ implies
$T(av) = a(Tv)$ and $T(v + w) = Tv + Tw$_.

 _Hint_: Take $w = 0$ and $a = 1$.

## Linear Transformation

If $V$ and $W$ are vector spaces then a _linear transformaton_ $T\colon V\to W$ is a function
that preserves the vector space operations: $T(au + v) = aTu + Tv$,
$a\in\RR$, $u,v\in V$.

__Exericse__.  _If $T\colon V\to W$ is a linear transformation show $T\bm{0} = \bm{0}$_.

_Hint_: Consider $T(\bm{0} + \bm{0})$ and use $v + v = v$ imples $v = \bm{0}$.

__Exercise__. _The space of linear transformations from $V$ to $W$, $\mathcal{L}(V,W)$, is a vector space_.

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
-->
