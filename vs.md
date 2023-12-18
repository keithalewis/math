---
title: From $\boldsymbol{R}^n$ to Vector Spaces for Engineers
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Axioms are more useful than accidents
...

\newcommand\mb[1]{\boldsymbol{#1}}
\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\bm{R}}
\newcommand\FF{\bm{F}}
\newcommand\NN{\bm{N}}
\newcommand\LL{\mathcal{L}}
\newcommand\BB{\mathcal{B}}
\newcommand\ran{\operatorname{ran}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\span{\operatorname{span}}

<!--
My PhD involved infinite dimensional vector spaces so excuse me for being appalled
by cartoon introductions to vector spaces floating around the internet these days.
-->

This note starts from tuples of $n$ real numbers and develops
facts about vector spaces that are useful in practice.
We unabashedly use mathematical proofs but keep the pesky details
to a minimum.  The exercises will teach you all the math you need to
know. Try them before peeking at the solution.

A vector space norm can be used to define a metric.
If the vector space is complete under the metric it is a Banach space.
A vector space inner product defines a norm.
A Hilbert space is a Banach space under the norm defined by the
inner product. The dual of a Hilbert space can be identified with itself.

Linear operators are functions between vector spaces that respect
the vector space structure. They are also vector spaces.

...


## $\RR^n$

The set of $n$-tuples of real numbers ${\RR^n = \{(x_1,\dots,x_n)\mid x_j\in\RR, 1\le j\le n\}}$ is 
a vector space. If $x = (x_1,\dots,x_n)$ and $y = (y_1,\dots,y_n)$
define _vector addition_ $(x + y)_j = x_j + y_j$
and _scalar multiplication_ $(ax)_j = ax_j$ for $a\in\RR$ and $x,y\in\RR^n$.

__Exercise__. _Show vector space addition is commutative and associative_.

_Hint_: Show $x + y = y + x$ and $(x + y) + z = x + (y + z)$, $x,y,z\in\RR^n$
follow from the corresponding properties of real numbers.

<details><summary>Solution</summary>
We have ${(x + y)_j = x_j + y_j = y_j + x_j = (y + x)_j}$ and
$$
\begin{aligned}
	((x + y) + z)_j &= (x + y)_j + z_j \\
		&= (x_j + y_j) + z_j \\
		&= x_j + (y_j + z_j) \\
		&= x_j + (y + z)_j \\
		&= (x + (y + z))_j \\
\end{aligned}
$$
for $1\le j\le n$.
</details>

A _semigroup_ is a set and a binary operation that is associative.
A _monoid_ is a semigroup having an _identity element_.
It is easy to turn a semigroup $S$ into a monoid. Just add an
identity element $e\not\in S$ with $es = s = se$ for all $s\in S$.

__Exercise__. _Show the identity element of a monoid is unique_.

_Hint_: If $e$ and $e'$ are identities consider $ee'$ to show $e = e'$.

Define $\bm{0} = (0, \ldots, 0)\in\RR^n$.

__Exercise__. _Show $x + \mb{0} = x$, $x\in\RR^n$_.

This shows $\mb{0}$ is the _additive identity_ of vector addition.

Define _additive inverse_ $-x$ by $-(x_1,\dots,x_n) = (-x_1,\ldots,-x_n)$.

__Exercise__. _Show $x + (-x) = \mb{0}$, $x\in\RR^n$_.

A _group_ is a monoid where every element has an inverse.

__Exercise__. _Show $1x = x$ and $a(bx) = (ab)x$, $a,b\in\RR$, $x\in\RR^n$_.

__Exercise__. _Show $(a + b)x = ax + bx$ and $a(x + y) = ax + ay$, $a,b\in\RR$, $x,y\in\RR^n$_.

## Vector Space

A _vector space_ is a set $V$ with a
commutative group operation $(x,y)\mapsto x + y$, $x,y\in V$
and a scalar multiplication $(a, x)\mapsto ax$, $a\in\RR$ and $x\in V$,
that satisfy the properties in the above exercises.

The abstract definition allows us to consider vector spaces other than $\RR^n$
and see essential properties more clearly.

__Exercise__. _Show $x + x = x$ implies $x = \mb{0}$ if $x$ is an element of a vector space_.

<details><summary>Solution</summary>
$$
\begin{aligned}
	x + x &= x \\
	&\langle a = b \text{ implies }a + c = b + c\rangle [a\leftarrow x + x, b\leftarrow x, c\leftarrow -x]\\
	(x + x) + (-x) &= x + (-x) \\
	&\langle (a + b) + c = a + (b + c)\rangle [a\leftarrow x, b\leftarrow x, c\leftarrow -x] \\
	x + (x + (-x)) &= x + (-x) \\
	&\langle a + (-a) = \mb{0}\rangle [a\leftarrow x\text{ twice}] \\
	x + \mb{0} &= \mb{0} \\
	&\langle a + \mb{0} = a\rangle [a\leftarrow x] \\
	x &= \mb{0} \\
\end{aligned}
$$
</details>

Axioms are written in angle brackets and substitution in square brackets.
Note the proof uses only the abstract vector space axioms distilled from the special case of $\RR^n$.
This is trivial to prove for $x\in\RR^n$, but using only the vector space axioms
allows us to consider a wider range of mathematical objects.

### Examples

Recall if $A$ and $B$ are sets then the _set exponential_ ${B^A = \{f\colon A\to B\}}$ is the set
of all functions from $A$ to $B$. 

We can identify $\RR^n$ with $\RR^{\{1,\ldots,n\}}$.
Every $x = (x_1,\ldots,x_n)\in\RR^n$ corresponds to the
function $x(i) = x_i$, $1\le i\le n$.

__Exercise__. _Show $\RR^I$ is a vector space for_ any _set $I$_.

For $i\in I$ define $e_i\colon I\to\RR$ by
$e_i(j) = δ_{ij}$, $i,j\in I$, where the _Kronecker delta_ $δ_{ij} = 1$
if $i=j$ and $δ_{ij} = 0$ if $i\not=j$.

Let $\RR^I_{00}$ be the set of functions $f\in\RR^I$ that are non-zero on a finite set of $i\in I$.

__Exercise__. _Show $\RR^S_{00}$ is a vector space_.

__Exercise__. _Show for every $x\in\RR_{00}^I$ that $x = \sum_{i\in I} x(i) e_i$_.

A function $f\in\RR^S$ is _bounded_ if the _norm_ of $f$ defined by $\|f\| = \sup_{s\in S} |f(s)|$ is finite.
The space of bounded functions on $S$ is $B(S) = \{f\in\RR^S\mid \|f\| < \infty\}$.

__Exercise__. _Show $B(S)$ is a vector space_.

__Exercise__. _Show $f\to\|f\|$ is a norm_.

_Hint_: Show $\|f\| = 0$ implies $f = 0$,
$\|a f\| = |a|\|f\|$ and $\|f + g\| \le \|f\| + \|g\|$, $a\in\RR$, $f,g\in B(S)$.

For any norm on a vector space we can define a metric by ${d(f, g) = \|f - g\|}$.

__Exercise__. _Show $d$ is a metric_.

_Hint_: Show $d(f, g) = 0$ implies $f = g$ and $d(f,g) + d(g, h) \ge d(f, h)$, $f,g,h\in B(S)$.

A sequence in a metric space, $(f_n)_{n\in\NN}$, is _Cauchy_ if for every $ε > 0$ there exists $N\in\NN$
such that $d(f_n, f_m) < ε$ when $n,m > N$. A metric space is complete if 
every Cauchy sequence has a limit in the space.

A _Banach space_ is a normed vector space that is complete in the metric it defines.

__Exercise__. _Show $B(S)$ is a Banach space_.

_Hint_: If $(f_n)_{n\in\NN}$ is Cauchy then so are $(f_n(s))_{n\in\NN}$ for each $s\in S$.
Since the real numbers are complete there exist $f(s) = \lim_{n\to\infty}f_n(s)$.

__Exercise__. _Show the space of continuous functions on the interval $[a,b]$, $C([a,b])$,
is a vector space_.

__Exercise__. _Show $C([a,b])$ is contained in $B([a,b])$_.

_Hint_: Every continuous function on $[a,b]$ attains its maximum and minimum value on $[a,b]$.

__Exercise__. _Show the space of $n$ times differentiable functions on the interval $[a,b]$, ${C^{(n)}([a,b])}$,
is a vector space_.

__Exercise__. _Show the solutions of the homogeneous differential equation
$\sum_{j=0}^n a_j x^{(j)}(t) = 0$, $a_j\in\RR$, are a vector space_.

__Exercise__. _Show polynomials are a vector space_.

_Hint_: A polynomial is a finite sum $p(x) = \sum_j a_j x^j$
that can be identified with an element of $\RR_{00}^{\NN}$.

For $p > 0$ define the $p$-_norm_ by $\|x\|_p = (\sum_j |x_j|^p)^{1/p}$.
Define ${\ell^p = \{x\in\RR^N\mid \|x\|_p < \infty\}}$.

__Exercise__. _Show the $p$-norm is a norm_.

__Exercise__. _Show $\lim_{p\to\infty} \|x\|_p = \sup_j |x_j|$_.

An _inner product_ is a bilinear function $( .\ , . ) \colon V\times V\to\RR$ where
$(v,v) = 0$ implies $v = 0$.
We write $v\cdot w$ for $(v, w)$.

__Exercise__. _Show $\|v\| = \sqrt{v\cdot v}$ is a norm_.

__Exercise__. (Cauchy-Schwartz Inequality) _Show for $x,y$ in an inner product space $(x,y) \le \|x\| \|y\|$_.

_Hint_ Use $0 \le \|x - ty\|^2$ for all $t\in\RR$ and minimize over $t$.
This also shows if equality holds and $x\not=\bm{0}$ then $x$ is a scalar multiple of $y$.

A _Hilbert space_ is a vector space with an inner product that is complete.

For $x,y\in\RR^n$ define $x\cdot y = \sum x_j y_j$.

__Exercise__. _Show this is an inner product on $\RR^n$_.

__Exercise__. _For $x,y\in\ell^2$ show $\sum_j |x_j y_j| < \infty$_.

## Linear Operator

A vector space is a set satisfying axioms. A _linear operator_ is a
function between vector spaces that preserves the vector space axioms.

Let $\LL(V,W)$ be the set of all functions $T\colon V\to W$ 
satisfying ${T(u + v) = Tu + Tv}$ for $u,v\in V$
and ${T(av) = a(Tv)}$, $a\in\RR$, $v\in V$.

__Exercise__. _Show if $T(a u + b) = aTu + Tv$, $a\in\RR$, $u,v\in V$, then $T$ is linear_.

_Hint_: Take $b = \bm{0}$ and $a = 1$.

For $S,T\in\mathcal{L}(V,W)$ define
vector addition ${(S + T)v = Sv + Tv}$, $v\in V$.
and scalar multiplication ${(aT)v = a(Tv)}$, $a\in\RR$.

__Exercise__. _Show $\mathcal{L}(V, W)$ is a vector space_.

__Exercise__. _If $T\in\mathcal{L}(V, W)$ then $T\mb{0} = \mb{0}$_.

_Hint_: Consider $T(\mb{0} + \mb{0})$ and use $v + v = v$ implies $v = 0$.

### Subspace

A subset $U\subseteq V$ of a vector space is a _subspace_ if $U$ is also a vector space.
Given a subspace $U$ define $v + U = \{v + u\mid u\in U\}$
and the _quotient space_ $V/U = \{v + U\mid v\in V\}$.
Define vector addition in $V/U$ by ${(v + U) + (w + U) = (v + w) + U$
and scalar multiplication by $a(v + U) = (av) + U$, $a\in\RR$, $v,w\in V$.

__Exercise__. _Show vector addition and scalar multiplication in $V/U$ are well-defined_.

Hint_: Use $v + U = w + U$ if and only if $v - w\in U$.

If $V$ and $W$ are vector spaces define the _direct sum_ $V\oplus W = V\times W$
with scalar multiplication $a(v, w) = (av, aw)$
and vector addition $(v, w)\oplus(x, y) = (v + x, w + y)$.

__Exercise__. _Show $V\oplus W$ is a vector space_.

If $U$ is a subspace of $V$ we can identify $V$ with $U\oplus V/U$ by
$u\oplus v + U$ corresponds to $u + v - u$.

Let $X$ be a subset of a vector space $V$. A _finite linear combination_ of elements of $X$
is a finite sum $\sum_i a_i x_i$ where $a_i\in\RR$, $x_i\in X$
The _span_ of $X$ is the collection of all finite linear combinations of elements of $X$.

__Exercise__. _Show the span of $X$ is a subspace_.

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \mb{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \mb{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{e_i\}_{i\in I}$ in $V$ that are independent and span $V$.
Every vector $v\in V$ can be written $v = \sum_{i\in I} a_i e_i$ for unique $a_i\in\RR$.

__Exercise__. _If $\sum_{i\in I} a_i e_i = \sum_{i\in I} b_i e_i$ then $a_i = b_i$ for all $i$_.

_Hint_: Use $\bm{0} = sum_{i\in I} a_i e_i - \sum_{i\in I} b_i e_i$.

This shows we can identify $V$ with $\RR^I$.




## Linear Operator

Let $\LL(V,W)$ be the set of all functions from the vector space $V$
### Subspace

A subset $U\subseteq V$ of a vector space is a _subspace_ if $U$ is also a vector space.
Given a subspace $U$ define $v + U = \{v + u\mid u\in U\}$
and the _quotient space_ $V/U = \{v + U\mid v\in V\}$.
Define vector addition in $V/U$ by ${(v + U) + (w + U) = (v + w) + U$
and scalar multiplication by $a(v + U) = (av) + U$, $a\in\RR$, $v,w\in V$.

__Exercise__. _Show vector addition and scalar multiplication in $V/U$ are well-defined_.

Hint_: Use $v + U = w + U$ if and only if $v - w\in U$.

If $V$ and $W$ are vector spaces define the _direct sum_ $V\oplus W = V\times W$
with scalar multiplication $a(v, w) = (av, aw)$
and vector addition $(v, w)\oplus(x, y) = (v + x, w + y)$.

__Exercise__. _Show $V\oplus W$ is a vector space_.

If $U$ is a subspace of $V$ we can identify $V$ with $U\oplus V/U$ by
$u\oplus v + U$ corresponds to $u + v - u$.

Let $X$ be a subset of a vector space $V$. A _finite linear combination_ of elements of $X$
is a finite sum $\sum_i a_i x_i$ where $a_i\in\RR$, $x_i\in X$
The _span_ of $X$ is the collection of all finite linear combinations of elements of $X$.

__Exercise__. _Show the span of $X$ is a subspace_.

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \mb{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \mb{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{e_i\}_{i\in I}$ in $V$ that are independent and span $V$.
Every vector $v\in V$ can be written $v = \sum_{i\in I} a_i e_i$ for unique $a_i\in\RR$.

__Exercise__. _If $\sum_{i\in I} a_i e_i = \sum_{i\in I} b_i e_i$ then $a_i = b_i$ for all $i$_.

_Hint_: Use $\bm{0} = sum_{i\in I} a_i e_i - \sum_{i\in I} b_i e_i$.

This shows we can identify $V$ with $\RR^I$.




## Linear Operator

### Subspace

A subset $U\subseteq V$ of a vector space is a _subspace_ if $U$ is also a vector space.
Given a subspace $U$ define $v + U = \{v + u\mid u\in U\}$
and the _quotient space_ $V/U = \{v + U\mid v\in V\}$.
Define vector addition in $V/U$ by ${(v + U) + (w + U) = (v + w) + U$
and scalar multiplication by $a(v + U) = (av) + U$, $a\in\RR$, $v,w\in V$.

__Exercise__. _Show vector addition and scalar multiplication in $V/U$ are well-defined_.

Hint_: Use $v + U = w + U$ if and only if $v - w\in U$.

If $V$ and $W$ are vector spaces define the _direct sum_ $V\oplus W = V\times W$
with scalar multiplication $a(v, w) = (av, aw)$
and vector addition $(v, w)\oplus(x, y) = (v + x, w + y)$.

__Exercise__. _Show $V\oplus W$ is a vector space_.

If $U$ is a subspace of $V$ we can identify $V$ with $U\oplus V/U$ by
$u\oplus v + U$ corresponds to $u + v - u$.

Let $X$ be a subset of a vector space $V$. A _finite linear combination_ of elements of $X$
is a finite sum $\sum_i a_i x_i$ where $a_i\in\RR$, $x_i\in X$
The _span_ of $X$ is the collection of all finite linear combinations of elements of $X$.

__Exercise__. _Show the span of $X$ is a subspace_.

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \mb{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \mb{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{e_i\}_{i\in I}$ in $V$ that are independent and span $V$.
Every vector $v\in V$ can be written $v = \sum_{i\in I} a_i e_i$ for unique $a_i\in\RR$.

__Exercise__. _If $\sum_{i\in I} a_i e_i = \sum_{i\in I} b_i e_i$ then $a_i = b_i$ for all $i$_.

_Hint_: Use $\bm{0} = sum_{i\in I} a_i e_i - \sum_{i\in I} b_i e_i$.

This shows we can identify $V$ with $\RR^I$.




## Linear Operator

Let $\LL(V,W)$ be the set of all functions from the vector space $V$
### Subspace

A subset $U\subseteq V$ of a vector space is a _subspace_ if $U$ is also a vector space.
Given a subspace $U$ define $v + U = \{v + u\mid u\in U\}$
and the _quotient space_ $V/U = \{v + U\mid v\in V\}$.
Define vector addition in $V/U$ by ${(v + U) + (w + U) = (v + w) + U$
and scalar multiplication by $a(v + U) = (av) + U$, $a\in\RR$, $v,w\in V$.

__Exercise__. _Show vector addition and scalar multiplication in $V/U$ are well-defined_.

Hint_: Use $v + U = w + U$ if and only if $v - w\in U$.

If $V$ and $W$ are vector spaces define the _direct sum_ $V\oplus W = V\times W$
with scalar multiplication $a(v, w) = (av, aw)$
and vector addition $(v, w)\oplus(x, y) = (v + x, w + y)$.

__Exercise__. _Show $V\oplus W$ is a vector space_.

If $U$ is a subspace of $V$ we can identify $V$ with $U\oplus V/U$ by
$u\oplus v + U$ corresponds to $u + v - u$.

Let $X$ be a subset of a vector space $V$. A _finite linear combination_ of elements of $X$
is a finite sum $\sum_i a_i x_i$ where $a_i\in\RR$, $x_i\in X$
The _span_ of $X$ is the collection of all finite linear combinations of elements of $X$.

__Exercise__. _Show the span of $X$ is a subspace_.

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \mb{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \mb{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{e_i\}_{i\in I}$ in $V$ that are independent and span $V$.
Every vector $v\in V$ can be written $v = \sum_{i\in I} a_i e_i$ for unique $a_i\in\RR$.

__Exercise__. _If $\sum_{i\in I} a_i e_i = \sum_{i\in I} b_i e_i$ then $a_i = b_i$ for all $i$_.

_Hint_: Use $\bm{0} = sum_{i\in I} a_i e_i - \sum_{i\in I} b_i e_i$.

This shows we can identify $V$ with $\RR^I$.




## Linear Operator

### Subspace

A subset $U\subseteq V$ of a vector space is a _subspace_ if $U$ is also a vector space.
Given a subspace $U$ define $v + U = \{v + u\mid u\in U\}$
and the _quotient space_ $V/U = \{v + U\mid v\in V\}$.
Define vector addition in $V/U$ by ${(v + U) + (w + U) = (v + w) + U$
and scalar multiplication by $a(v + U) = (av) + U$, $a\in\RR$, $v,w\in V$.

__Exercise__. _Show vector addition and scalar multiplication in $V/U$ are well-defined_.

Hint_: Use $v + U = w + U$ if and only if $v - w\in U$.

If $V$ and $W$ are vector spaces define the _direct sum_ $V\oplus W = V\times W$
with scalar multiplication $a(v, w) = (av, aw)$
and vector addition $(v, w)\oplus(x, y) = (v + x, w + y)$.

__Exercise__. _Show $V\oplus W$ is a vector space_.

If $U$ is a subspace of $V$ we can identify $V$ with $U\oplus V/U$ by
$u\oplus v + U$ corresponds to $u + v - u$.

Let $X$ be a subset of a vector space $V$. A _finite linear combination_ of elements of $X$
is a finite sum $\sum_i a_i x_i$ where $a_i\in\RR$, $x_i\in X$
The _span_ of $X$ is the collection of all finite linear combinations of elements of $X$.

__Exercise__. _Show the span of $X$ is a subspace_.

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \mb{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \mb{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{e_i\}_{i\in I}$ in $V$ that are independent and span $V$.
Every vector $v\in V$ can be written $v = \sum_{i\in I} a_i e_i$ for unique $a_i\in\RR$.

__Exercise__. _If $\sum_{i\in I} a_i e_i = \sum_{i\in I} b_i e_i$ then $a_i = b_i$ for all $i$_.

_Hint_: Use $\bm{0} = sum_{i\in I} a_i e_i - \sum_{i\in I} b_i e_i$.

This shows we can identify $V$ with $\RR^I$.




## Linear Operator

Let $\LL(V,W)$ be the set of all functions from the vector space $V$
### Subspace

A subset $U\subseteq V$ of a vector space is a _subspace_ if $U$ is also a vector space.
Given a subspace $U$ define $v + U = \{v + u\mid u\in U\}$
and the _quotient space_ $V/U = \{v + U\mid v\in V\}$.
Define vector addition in $V/U$ by ${(v + U) + (w + U) = (v + w) + U$
and scalar multiplication by $a(v + U) = (av) + U$, $a\in\RR$, $v,w\in V$.

__Exercise__. _Show vector addition and scalar multiplication in $V/U$ are well-defined_.

Hint_: Use $v + U = w + U$ if and only if $v - w\in U$.

If $V$ and $W$ are vector spaces define the _direct sum_ $V\oplus W = V\times W$
with scalar multiplication $a(v, w) = (av, aw)$
and vector addition $(v, w)\oplus(x, y) = (v + x, w + y)$.

__Exercise__. _Show $V\oplus W$ is a vector space_.

If $U$ is a subspace of $V$ we can identify $V$ with $U\oplus V/U$ by
$u\oplus v + U$ corresponds to $u + v - u$.

Let $X$ be a subset of a vector space $V$. A _finite linear combination_ of elements of $X$
is a finite sum $\sum_i a_i x_i$ where $a_i\in\RR$, $x_i\in X$
The _span_ of $X$ is the collection of all finite linear combinations of elements of $X$.

__Exercise__. _Show the span of $X$ is a subspace_.

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \mb{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \mb{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{e_i\}_{i\in I}$ in $V$ that are independent and span $V$.
Every vector $v\in V$ can be written $v = \sum_{i\in I} a_i e_i$ for unique $a_i\in\RR$.

__Exercise__. _If $\sum_{i\in I} a_i e_i = \sum_{i\in I} b_i e_i$ then $a_i = b_i$ for all $i$_.

_Hint_: Use $\bm{0} = sum_{i\in I} a_i e_i - \sum_{i\in I} b_i e_i$.

This shows we can identify $V$ with $\RR^I$.




## Linear Operator

### Subspace

A subset $U\subseteq V$ of a vector space is a _subspace_ if $U$ is also a vector space.
Given a subspace $U$ define $v + U = \{v + u\mid u\in U\}$
and the _quotient space_ $V/U = \{v + U\mid v\in V\}$.
Define vector addition in $V/U$ by ${(v + U) + (w + U) = (v + w) + U$
and scalar multiplication by $a(v + U) = (av) + U$, $a\in\RR$, $v,w\in V$.

__Exercise__. _Show vector addition and scalar multiplication in $V/U$ are well-defined_.

Hint_: Use $v + U = w + U$ if and only if $v - w\in U$.

If $V$ and $W$ are vector spaces define the _direct sum_ $V\oplus W = V\times W$
with scalar multiplication $a(v, w) = (av, aw)$
and vector addition $(v, w)\oplus(x, y) = (v + x, w + y)$.

__Exercise__. _Show $V\oplus W$ is a vector space_.

If $U$ is a subspace of $V$ we can identify $V$ with $U\oplus V/U$ by
$u\oplus v + U$ corresponds to $u + v - u$.

Let $X$ be a subset of a vector space $V$. A _finite linear combination_ of elements of $X$
is a finite sum $\sum_i a_i x_i$ where $a_i\in\RR$, $x_i\in X$
The _span_ of $X$ is the collection of all finite linear combinations of elements of $X$.

__Exercise__. _Show the span of $X$ is a subspace_.

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \mb{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \mb{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{e_i\}_{i\in I}$ in $V$ that are independent and span $V$.
Every vector $v\in V$ can be written $v = \sum_{i\in I} a_i e_i$ for unique $a_i\in\RR$.

__Exercise__. _If $\sum_{i\in I} a_i e_i = \sum_{i\in I} b_i e_i$ then $a_i = b_i$ for all $i$_.

_Hint_: Use $\bm{0} = sum_{i\in I} a_i e_i - \sum_{i\in I} b_i e_i$.

This shows we can identify $V$ with $\RR^I$.




## Linear Operator

Let $\LL(V,W)$ be the set of all functions from the vector space $V$
### Subspace

A subset $U\subseteq V$ of a vector space is a _subspace_ if $U$ is also a vector space.
Given a subspace $U$ define $v + U = \{v + u\mid u\in U\}$
and the _quotient space_ $V/U = \{v + U\mid v\in V\}$.
Define vector addition in $V/U$ by ${(v + U) + (w + U) = (v + w) + U$
and scalar multiplication by $a(v + U) = (av) + U$, $a\in\RR$, $v,w\in V$.

__Exercise__. _Show vector addition and scalar multiplication in $V/U$ are well-defined_.

Hint_: Use $v + U = w + U$ if and only if $v - w\in U$.

If $V$ and $W$ are vector spaces define the _direct sum_ $V\oplus W = V\times W$
with scalar multiplication $a(v, w) = (av, aw)$
and vector addition $(v, w)\oplus(x, y) = (v + x, w + y)$.

__Exercise__. _Show $V\oplus W$ is a vector space_.

If $U$ is a subspace of $V$ we can identify $V$ with $U\oplus V/U$ by
$u\oplus v + U$ corresponds to $u + v - u$.

Let $X$ be a subset of a vector space $V$. A _finite linear combination_ of elements of $X$
is a finite sum $\sum_i a_i x_i$ where $a_i\in\RR$, $x_i\in X$
The _span_ of $X$ is the collection of all finite linear combinations of elements of $X$.

__Exercise__. _Show the span of $X$ is a subspace_.

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \mb{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \mb{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{e_i\}_{i\in I}$ in $V$ that are independent and span $V$.
Every vector $v\in V$ can be written $v = \sum_{i\in I} a_i e_i$ for unique $a_i\in\RR$.

__Exercise__. _If $\sum_{i\in I} a_i e_i = \sum_{i\in I} b_i e_i$ then $a_i = b_i$ for all $i$_.

_Hint_: Use $\bm{0} = sum_{i\in I} a_i e_i - \sum_{i\in I} b_i e_i$.

This shows we can identify $V$ with $\RR^I$.




## Linear Operator

Let $\LL(V,W)$ be the set of all functions from the vector space $V$
to the vector space $W$ that preserve vector space operations:
$T(av) = a(Tv)$ and $T(u + v) = Tu + Tv$, $a\in\RR$, $u,v\in V$.

__Exercise__. _Show if $T(a u + b) = aTu + Tv$, $a\in\RR$, $u,v\in V$, then $T$ is linear_.

_Hint_: Take $b = \bm{0}$ and $a = 1$.

For $S,T\in\mathcal{L}(V,W)$ define scalar multiplication ${(aT)v = a(Tv)}$
and vector space addition ${(S + T)v = Sv + Tv}$, $a\in\RR$, $v\in V$.

__Exercise__. _Show $\mathcal{L}(V, W)$ is a vector space_.

__Exercise__. _If $T\in\mathcal{L}(V, W)$ then $T\mb{0} = \mb{0}$_.

_Hint_: Consider $T(\mb{0} + \mb{0})$ and use $v + v = v$ implies $v = 0$.


### Subspace

A subset $U\subseteq V$ of a vector space is a _subspace_ if $U$ is also a vector space.
Given a subspace $U$ define $v + U = \{v + u\mid u\in U\}$
and the _quotient space_ $V/U = \{v + U\mid v\in V\}$.
Define vector addition in $V/U$ by ${(v + U) + (w + U) = (v + w) + U$
and scalar multiplication by $a(v + U) = (av) + U$, $a\in\RR$, $v,w\in V$.

__Exercise__. _Show vector addition and scalar multiplication in $V/U$ are well-defined_.

Hint_: Use $v + U = w + U$ if and only if $v - w\in U$.

If $V$ and $W$ are vector spaces define the _direct sum_ $V\oplus W = V\times W$
with scalar multiplication $a(v, w) = (av, aw)$
and vector addition $(v, w)\oplus(x, y) = (v + x, w + y)$.

__Exercise__. _Show $V\oplus W$ is a vector space_.

If $U$ is a subspace of $V$ we can identify $V$ with $U\oplus V/U$ by
$u\oplus v + U$ corresponds to $u + v - u$.

Let $X$ be a subset of a vector space $V$. A _finite linear combination_ of elements of $X$
is a finite sum $\sum_i a_i x_i$ where $a_i\in\RR$, $x_i\in X$
The _span_ of $X$ is the collection of all finite linear combinations of elements of $X$.

__Exercise__. _Show the span of $X$ is a subspace_.

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \mb{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \mb{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{e_i\}_{i\in I}$ in $V$ that are independent and span $V$.
Every vector $v\in V$ can be written $v = \sum_{i\in I} a_i e_i$ for unique $a_i\in\RR$.

__Exercise__. _If $\sum_{i\in I} a_i e_i = \sum_{i\in I} b_i e_i$ then $a_i = b_i$ for all $i$_.

_Hint_: Use $\bm{0} = sum_{i\in I} a_i e_i - \sum_{i\in I} b_i e_i$.

This shows we can identify $V$ with $\RR^I$.




## Linear Operator

Let $\LL(V,W)$ be the set of all functions from the vector space $V$
to the vector space $W$ that preserve vector space operations:
$T(av) = a(Tv)$ and $T(u + v) = Tu + Tv$, $a\in\RR$, $u,v\in V$.

__Exercise__. _Show if $T(a u + b) = aTu + Tv$, $a\in\RR$, $u,v\in V$, then $T$ is linear_.

_Hint_: Take $b = \bm{0}$ and $a = 1$.

For $S,T\in\mathcal{L}(V,W)$ define scalar multiplication ${(aT)v = a(Tv)}$
and vector space addition ${(S + T)v = Sv + Tv}$, $a\in\RR$, $v\in V$.

__Exercise__. _Show $\mathcal{L}(V, W)$ is a vector space_.

__Exercise__. _If $T\in\mathcal{L}(V, W)$ then $T\mb{0} = \mb{0}$_.

_Hint_: Consider $T(\mb{0} + \mb{0})$ and use $v + v = v$ implies $v = 0$.

Sets are the foundation of mathematics. They consist of a bag of _elements_.
A function $f\colon A\to B$ is also a set. It is a subset of the cartesian
product $f\subseteq A\times B = \{(a, b)\mid a\in A, b\in B\}$ with the property
for every $a\in A$ there exists a unique $b\in B$ with $(a, b)\in f$.
We can use the notation $f(a) = b$ for $(a,b)\in f$ since $b$ is unique.

We say a function $f$ is _one-to-one_ if $f(a) = f(a')$ implies $a = a'$, $a,a'\in A$,
and $f$ is _onto_ if for every $b\in B$ there exists $a\in A$ with $f(a) = b$.

Equality has the properties $a = a$, $a = b$ implies $b = a$, and
$a = b$, $b = c$ implies $a = c$. Equivalence is a looser condition
that allows us to manage complexity. Sets $A$ and $B$ are _equivalent_, $A\equiv B$, if
there is a function $f\colon A\to B$ that is one-to-one and onto.
This captures the notion $A$ and $B$ have the same number of elements,
even if they are not equal.

__Exercise__. _Show $A\equiv A$, $A\equiv B$ implies $B\equiv A$ and
$A\equiv B$, $B\equiv C$ implies $A\equiv C$_.

A vector space is a set with with additional structure.

If $T\in\mathcal{L}(V,W)$ where $V$ and $W$ are normed vector spaces
define $\|T\| = \sup_{\|v\|\le1} \|Tv\|$.

__Exercise__. _Show $T\mapsto\|T\|$ is a norm on $\mathcal{L}(V,W)$_.

Define $T\colon C^{(n)}([a,b])\to C([a,b])$ by
$Tx = \sum_{j=0}^n a_j x^{(j)}(t)$, where $a_j\in\RR$

__Exercise__. _Show $T$ is a linear operator_.

Integration is a linear operator. Define $T\colon C([a,b])\to\RR$ by $Tf = \int_a^b f(x)\,dx$.

__Exercise__. _Show $T$ is bounded_.

_Hint_. Show $|Tf| \le (b - a)\|f\|$.

Differentiation is a linear operator. Define $T_x\colon C^{(1)}([a,b])\to\RR$ by $Tf = f'(x)$
where $x\in(a,b)$.

__Exercise__. _Show $T_x$ is not bounded_.

### Operator Algebra

If $V = W$ we write $\LL(V)$ for $\LL(V,V)$. Operator composition
defines a product $\LL(V)\times\LL(V)\to\LL(V)$ by
$(S,T)\mapsto ST$. This makes $\LL(V)$ into an _algebra_ of operators.   

__Exercise__. _Show $(S + T)U = SU + TU$ and $S(T + U) = ST + SU$ for $S,T,U\in\LL(V)$_.

Define the _identity operator_ $I\colon V\to V$ by $Iv = v$, $v\in V$.
Clearly $IT = T = TI$ for $T\in\LL(V)$ so $I$ is the _multiplicative identity_
for the algebra.

__Exercise__. _Show $(aS)(bT) = (ab)(ST)$ for $a,b\in\RR$ and $S,T\in\LL(V)$_.

If $p$ is a polynomial $p(x) = \sum_j a_j x^j$ define
$p(T)\colon V\to V$ by $p(T) = \sum_j a_j T^j$ for $T\in\LL(V)$.
This defines the _polynomial functional calculus_ from polynomials to $\LL(V)$.

__Exercise__ _Show the polynomial functional calculus is a linear operator from polynomials
to $\LL(V)$_.

__Exercise__. _Show $(pq)(T) = p(T)q(T)$ for polynomials $p$ and $q$_.

This functional calculus can be extended beyond polynomials.

### Subspace

A subset of a vector space that is also a vector space is a _subspace_.
Subspaces allow us to factor a space into smaller vector spaces.

For $T\in\mathcal{L}(V,W)$ define the 
_kernel_ $\ker T = \{v\in V\mid Tv = \bm{0}\}$ and 
_range_ $\ran T = \{Tv\mid v\in V\}$.

__Exercise__. _Show $\ker T$ is a subspace of $V$ and $\ran T$ is a subspace of $W$_.

__Exercise__. _If $T\colon V\to W$ is a linear transformation and $\ker T = \{\bm{0}\}$
show $Tu = Tv$ implies $u = v$ for $u,v\in V$_.

_Hint_: Consider $T(u - v)$.

In this case we say $T$ is _one-to-one_ or _injective_.
If $\ran T = W$ we say $T$ in _onto_ or _surjective_.
It $T$ is both one-to-one and onto we say $T$ is an _isomorphism_ or _bijective_.

Isomorphism is an _equivalence relation_ on vector spaces.
We write $V\sim W$ if there exists an isomorphism $T\colon V\to W$.

__Exercise__. _Show $V\sim V$, $V\sim W$ implies $W\sim V$,
$U\sim V$ and $V\sim W$ imply $U\sim W$_.

_Hint_: The identity map $I\colon V\to V$ is an isomorphism.
If $T\colon V\to W$ is an isomorphism so is $T^{-1}\colon W\to V$.
If $S\colon U\to V$ and $T\colon V\to W$ are isomorphisms
then the composition $TS\colon U\to W$ is an isomorphism.

<details><summary>Solution</summary>
Since $v - v = \mb{0}\in W$ (identity) we have $v\sim v$. If $u \sim v$ then
${u - v\in W}$ so ${v - w = -(u - v)\in W}$ (inverse).
If $u\sim v$ and $v\sim w$ then $u - v$ and $v - w$ belong to $W$ so
${u - w = (u - v) + (v - w)\in W}$ (addition).
</details>

If $S$ is a set and $\sim$ is an equivalence
relation on $S$ then the set of _equivalence classes_ are a _partition_ of $S$.
The equivalence class of $x\in S$ is ${[x] = \{y\in S\mid y\sim x\}}$.

__Exercise__. _Show $x\in [x]$ and for $x,y\in S$ either $[x]\cap [y] = \emptyset$
or $[x] = [y]$_. 

<details><summary>Solution</summary>
Since $x\sim x$ we have $x\in [x]$.
If $z\in [x]\cap[y]$ then $z\sim x$ and $z\sim y$ so $x\sim y$.
If $u\in [x]$ then $u\sim x$ so $u\sim y$ and $u\in [y]$.
Likewise, $[y]\subseteq [x]$ so $[x] = [y]$.
</details>

Equivalence relations are a generalization of equality.
It might not be the case $x = y$ but $[x] = [y]$ satisfies
the same laws as equality.

A subspace of a vector space defines an equivalence relation. 

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

Translating a subspace $W$ by $v$ gives $v + W = \{v + w\mid w\in W\}$.

__Exercise__. _If $W$ is subspace of $V$ show $u\sim v$ if and only if $u + W = v + W$_.

The set of equivalence classes $V/W = \{v + W\mid v\in V\}$ can be made into a vector space.
Define scalar multiplication by $a(v + W) = av + W$ and
addition by $(u + W) + (v + W) = (u + v) + W$, $a\in\RR$, $u, v\in V$.

__Exercise__. _Show $V/W$ is a vector space_.

If $T\in\LL(V,W)$ define $π\colon V\to V/\ker(T)$ by $π(v) = v + \ker T$
and $ν\colon V/\ker(T)\to W$ by $ν(v + \ker T) = Tv$, $v\in V$.

__Exercise__. _Show $π$ is onto_.

__Exercise__. _Show $ν$ is _well-defined.

_Hint_: Show if $v + \ker T = w + \ker T$ then $Tv = Tw$.

__Exercise__. _Show $ν$ is one-to-one_.

If $V$ is a vector space and $W$ is a subspace define
the _inclusion operator_ $ι\colon W\to V$ by $i(w) = w$
and the _projection operator_ $p\colon V\to V/W$ by $p(v) = v + W$.

__Exercise__. _Show $i$ is one-to-one and $p$ is onto_.

$V = W + V/W$ for some mathematically rigorous interpretation of $=$ and $+$.

#### Eigenvector/value

If $T\colon V\to V$ and $Tv = \lambda v$ where $\lambda\in\RR$ then
$v$ is an _eigenvector_ with _eigenvalue_ $\lambda$.

__Exercise__. _Show $\RR v = \{av\mid a\in\RR\}$ is an invariant subspace_.

__Exercise__. _Show $v$ is an eigenvector with eigenvalue $\lambda$ if and only
if $v\in\ker T - \lambda I$_.

### Span

The _span_ of a set of vectors $\{x_i\}_{i\in I}$ is the set of all finite
_linear combinations_ $\vee_{i\in I} \{x_i\} = \{\sum_{i\in I} a_i x_i \mid a_i\in\RR\}$.

__Exercise__. _Show the span of a set of vectors is a vector space_.

If $T\colon V\to V$ and $v\in V$ then the span of $\{T^n v\}_{n\in\NN}$ is
an _invariant subspace_ of $T$.

__Exercise__. _Show the span of $\{T^n v\}_{n\in\NN}$ is the range of
the the polynomial functional calculus_.


### Independent
## Matrix

If $T\colon V\to W$ is a linear transformation, $\{e_i\}$ is a basis of $V$,
and $\{f_j\}$ is a basis of $W$ then
$Te_i = \sum_j t_{ij} f_j$ for unique $t_{ij}\in\RR$.
This is the _matrix_ of $T$ under a basis for $V$ and $W$.

<!--

$$
\begin{bmatrix}
λ_1 & 0 & \cdots & 0 \\
0   & λ_2 & \cdots & 0 \\
0   & 0   & \ddots & 0 \\
0   & 0   & \cdots & λ_k \\
\end{bmatrix}
$$

$$
\begin{bmatrix}
λ_1 I + J_{n_1} & 0 & \cdots & 0 \\
0   & λ_2 I + J_{n_2} & \cdots & 0 \\
0   & 0   & \ddots & 0 \\
0   & 0   & \cdots & λ_k I + J_{n_k} \\
\end{bmatrix}
$$

## Matrix


__Exercise__. _Show $T(av) = a(Tv)$ and $T(v + w) = Tv + Tw$, $a\in\RR$, $v,w\in\R^n$_.

__Exercise__. _Show $T(av + w) = aTv + Tw$, $a\in\RR$, $v,w\in\RR^n$ implies
$T(av) = a(Tv)$ and $T(v + w) = Tv + Tw$_.

 _Hint_: Take $w = 0$ and $a = 1$.

## Linear Transformation

If $V$ and $W$ are vector spaces then a _linear transformaton_ $T\colon V\to W$ is a function
that preserves the vector space operations: $T(au + v) = aTu + Tv$,
$a\in\RR$, $u,v\in V$.

__Exericse__.  _If $T\colon V\to W$ is a linear transformation show $T\mb{0} = \mb{0}$_.

_Hint_: Consider $T(\mb{0} + \mb{0})$ and use $v + v = v$ imples $v = \mb{0}$.

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

### Examples

What is the derivative of $\|x\|^p$? We assume $x\in\RR^n$
and ${\|x\|^p = \sum_j |x_j|^p}$. We have
$$
\begin{aligned}
	\|x + h\|^p - \|x\|^p &= \sum_j |x_j + h_j|^p - |x_j|^p \\
\end{aligned}
$$
-->
