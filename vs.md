---
title: From $\bm{R}^n$ to Vector Spaces
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Axioms are more useful than accidents
...

\newcommand\bm[1]{\boldsymbol{#1}}
\newcommand\RR{\bm{R}}
\newcommand\FF{\bm{F}}
\newcommand\NN{\bm{N}}
\newcommand\LL{\mathcal{L}}
\newcommand\BB{\mathcal{B}}
\newcommand\ran{\operatorname{ran}}
\newcommand\ker{\operatorname{ker}}

<!--
My PhD involved infinite dimensional vector spaces so excuse me for being appalled
by cartoon introductions to vector spaces floating around the internet these days.
-->

This note starts from tuples of $n$ real numbers, $\RR^n$, and develops
facts about vector spaces useful in practice.
We unabashedly use mathematical proofs but keep the pesky details
to a minimum.  The exercises will teach you all the math you need to
know. Try them before peeking at the solution.

A vector space norm can be used to define a metric.
If the vector space is complete under the metric it is a _Banach space_.
A vector space inner product defines a norm.
A _Hilbert space_ is a Banach space under the norm defined by the
inner product.

Linear operators are functons between vector spaces that respect
the vector space structure. They are also vector spaces.

## $\RR^n$

The set of $n$-tuples of real numbers ${\RR^n = \{(x_1,\dots,x_n)\mid x_j\in\RR, 1\le j\le n\}}$ is 
a vector space. If $x = (x_1,\dots,x_n)$ and $y = (y_1,\dots,y_n)$
define _scalar multiplication_ $(ax)_j = ax_j$ and _vector addition_
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

Define $\bm{0} = (0, \ldots, 0)\in\RR^n$.

__Exercise__. _Show $x + \bm{0} = x$, $x\in\RR^n$_.

This shows $\bm{0}$ is the _additive identity_.

A _monoid_ is a semigroup having an identity element.

Define _additive inverse_ $-x$ by $-(x_1,\dots,x_n) = (-x_1,\ldots,-x_n)$.

__Exercise__. _Show $x + (-x) = \bm{0}$, $x\in\RR^n$_.

A _group_ is a monoid where every element has an inverse.

__Exercise__. _Show $1x = x$ and $a(bx) = (ab)x$, $a,b\in\RR$, $x\in\RR^n$_.

__Exercise__. _Show $(a + b)x = ax + bx$ and $a(x + y) = ax + ay$, $a,b\in\RR$, $x,y\in\RR^n$_.

## Vector Space

A _vector space_ is a set $V$ with a
a scalar multiplication $(a, x)\mapsto ax$ and
commutative group operation $(x,y)\mapsto x + y$, $x,y\in V$,
$a\in\RR$ and $x\in V$, that satisfy the properties in the above exercises.

The abstract definition allows us to consider vector spaces other than $\RR^n$
and clarifies essential properties.

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
Note the proof uses only the abstract vector space axioms distilled from the special case of $\RR^n$.
This is trivial to prove for $x\in\RR^n$, but using only the vector space axioms
allows us to consider a wider range of mathematical objects.

### Examples

If $A$ and $B$ are sets then the exponential $B^A = \{f\colon A\to B\}$ is the set
of all functons from $A$ to $B$. 

__Exercise__. _Show $\RR^n$ can be identified with $\RR^{\{1,\ldots,n\}}$_.

_Hint_: $x = (x_1,\ldots,x_n)\in\RR^n$ can be identified with the
function $x(i) = x_i$, $1\le i\le n$.

Every finite-dimensional vector space can be identified with $\RR^I$
where $I$ is a finite set. For $i\in I$ define $e_i\colon I\to\RR$ by
$e_i(j) = δ_{ij}$, $i,j\in I$, where the _Kronecker delta_ $δ_{ij} = 0$
if $i\not=j$ and $δ_{ij} = 1$ if $i=j$.

__Exercise__. _Show $x\colon I\to\RR$ is $x = \sum_{i\in I} x(i) e_i$_.

__Exercise__. _Show $\RR^S$ is a vector space for_ any _set $S$_.

Let $\RR^S_{00}$ be the set of functions $f\in\RR^S$ that are non-zero on a finite set of $s\in S$.

__Exercise__. _Show $\RR^S_{00}$ is a vector space_.

A function $f\in\RR^S$ is _bounded_ if the _norm_ of $f$ defined by $\|f\| = \sup_{s\in S} |f(s)|$ is finite.
The space of bounded functions on $S$ is $B(S) = \{f\in\RR^S\mid \|f\| < \infty\}$.

__Exercise__. _Show $B(S)$ is a vector space_.

__Exercise__. _Show $f\to\|f\|$ is a norm_.

_Hint_: Show $\|f\| = 0$ implies $f = 0$,
$\|a f\| = |a|\|f\|$ and $\|f + g\| \le \|f\| + \|g\|$, $a\in\RR$, $f,g\in B(S)$.

For any norm on a vector space we can define a metric by ${d(f, g) = \|f - g\|}$.

__Exercise__. _Show $d$ is a metric_.

_Hint_: Show $d(f, g) = 0$ implies $f = g$ and $d(f,g) + d(g, h) \ge d(f, h)$, $f,g,h\in B(S)$.

A metric space is _complete_ if every _Cauchy sequence_ converges to a point in the space.
A sequence $(f_n)_{n\in\NN}$ is Cauchy if for every $ε > 0$ there exists $N\in\NN$
such that $d(f_n, f_m) < ε$ when $n,m > N$. The metric space is complete if there
exists $f$ with $\lim_{n\to\infty} f_n = f$.

A Banach space is a normed vector space that is complete in the metric it defines.

__Exercise__. _Show the space of continuous functions on the interval $[a,b]$, $C([a,b])$,
is a vector space_.

__Exercise__. _Show $C([a,b])$ is contained in $B([a,b])$_.

__Exercise__. _Show the space of $n$ times differentiable functions on the interval $[a,b]$, $C^{(n)}([a,b])$,
is a vector space_.

__Exercise__. _Show the solutions $x(t)$ of the homogeneous differential equation
$\sum_{j=0}^n a_j x^{(j)}(t) = 0$, $a_j\in\RR$, are a vector space_.

__Exercise__. _Show polynomials are a vector space_.

_Hint_: A polynomial is a finite sum $p(x) = \sum_j a_j x^j$
that can be identified with an element of $\RR_{00}^{\NN}$.

## Linear Operator

Let $\LL(V,W)$ be the set of all functions from the vector space $V$
to the vector space $W$ that preserve vector space operations:
$T(av) = a(Tv)$ and $T(u + v) = Tu + Tv$, $a\in\RR$, $u,v\in V$.

__Exercise__. _Show if $T(a u + b) = aTu + Tv$, $a\in\RR$, $u,v\in V$, then $T$ is linear_.

_Hint_: Take $b = \bm{0}$ and $a = 1$.

For $S,T\in\mathcal{L}(V,W)$ define scalar multiplication $(aT)v = a(Tv)$
and vector space addition $(S + T)v = Sv + Tv$, $a\in\RR$, $v\in V$.

__Exercise__. _Show $\mathcal{L}(V, W)$ is a vector space_.

__Exercise__. _If $T\in\mathcal{L}(V, W)$ then $T\bm{0} = \bm{0}$_.

_Hint_: Consider $T(\bm{0} + \bm{0})$ and use $v + v = v$ implies $v = 0$.

If $T\in\mathcal{L}(V,W)$ where $V$ and $W$ are normed vector spaces
define $\|T\| = \sup_{\|v\|\le1} \|Tv\|$.

__Exercise__. _Show $T\mapsto\|T\|$ is a norm on $\mathcal{L}(V,W)$_.

Define $T\colon C^{(n)}([a,b])\to C([a,b])$ by
$Tx = \sum_{j=0}^n a_j x^{(j)}(t)$, where $a_j\in\RR$

__Exercise__. _Show $T$ is a linear operator_.

Integration is a linear operator. Define $T\colon C([a,b])\to C([a,b])$ by $Tf(x) = \int_a^x f(u)\,du$, $a\le x\le b$. 

__Exercise__. _Show $T$ is bounded_.

_Hint_. Show $\|Tf\| \le (b - a)\|f\|$.

Differentiation is a linear operator. Define $T\colon C^{(1)}([a,b])\to C([a,b])$ by $Tf = f'$.

__Exercise__. _Show $T$ is not bounded_.

### Operator Algebra

If $V = W$ we write $\LL(V)$ for $\LL(V,V)$. Operator composition
defines a product $\LL(V)\times\LL(V)\to\LL(V)$ by
$(S,T)\mapsto ST$. This makes $\LL(V)$ into an _algebra_ of operators.   

__Exercise__. _Show $(S + T)U = SU + TU$ and $S(T + U) = ST + SU$ for $S,T,U\in\LL(V)$_.

Define the _identity operator_ $I\colon V\to V$ by $Iv = v$, $v\in V$.
Clearly $IT = T = TI$ for $T\in\LL(V)$ so $I$ is the _multiplicative identity_
for the algebra.

__Exercise__. _Show $(aS)(bT) = (ab)(ST)$ for $a,b\in\RR$ and $S,T\in\LL(V)$_.

If $T\colon V\to V$ and $Tv = \lambda v$ where $\lambda\in\RR$ then
$v$ is an _eigenvector_ with _eigenvalue_ $\lambda$.

__Exercise__. _Show $\RR v = \{av\mid a\in\RR\}$ is an invariant subspace_.

If $p$ is a polynomial $p(x) = \sum_j a_j x^j$ define
$p(T)\colon V\to V$ by $p(T) = \sum_j a_j T^j$ for $T\in\LL(V)$.
This defines the _polynomial functional calculus_ from polynomials to $\LL(V)$.

__Exercise__ _Show the polynomial functional calculus is a linear operator from polynomials
to $\LL(V)$_.

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

The set of equvalence classes $V/W = \{v + W\mid v\in V\}$ can be made into a vector space.
Define scalar multiplcation by $a(v + W) = av + W$ and
addition by $(u + W) + (v + W) = (u + v) + W$, $a\in\RR$, $u, v\in V$.

__Exercise__. _Show $V/W$ is a vector space_.

If $V$ is a vector space and $W$ is a subspace then
$V = W + V/W$ for some mathematically rigourous interpretation of $=$ and $+$.

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

A set of vectors $\{x_i\}$ are _independent_ if for any finite _linear combination_
$\sum_j a_j x_j = \bm{0}$, $a_j\in\RR$, we have $a_j = 0$ for all $j$.

__Exercise__. _If $\sum_j a_j x_j = \bm{0}$ and $a_j \not= 0$ for some $j$
then the span of $\{x_i\}_{i\in I}$ equals the span of $\{x_i\}_{i\not=j}$_.

### Basis

A _basis_ of a vector space $V$ is a set of vectors $\{e_i\}_{i\in I}$ in $V$ that are independent and span $V$.
Every vector $v\in V$ can be written $v = \sum_{i\in I} a_i e_i$ for unique $a_i\in\RR$.

__Exercise__. _If $\sum_{i\in I} a_i e_i = \sum_{i\in I} b_i e_i$ then $a_i = b_i$ for all $i$_.

_Hint_: Use $\bm{0} = sum_{i\in I} a_i e_i - \sum_{i\in I} b_i e_i$.

This shows we can identify $V$ with $\RR^I$.

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

### Examples

What is the derivative of $\|x\|^p$? We assume $x\in\RR^n$
and ${\|x\|^p = \sum_j |x_j|^p}$. We have
$$
\begin{aligned}
	\|x + h\|^p - \|x\|^p &= \sum_j |x_j + h_j|^p - |x_j|^p \\
\end{aligned}
$$
-->
