---
title: Invariant Subspaces
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Do they exist?
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\CC{\boldsymbol{C}}
\newcommand\FF{\boldsymbol{F}}
\newcommand\HH{\mathcal{H}}
\newcommand\MM{\mathcal{M}}
\newcommand\span{\operatorname{span}}
\newcommand\ran{\operatorname{ran}}
\newcommand\ker{\operatorname{ker}}

The invariant subspace problem is "Given a linear operator on a vector space does it have
a non-trivial invariant subspace?" The subspace consisting of the 0 vector and the
vector space are trivially invariant.

__Exercise__. _Show if $T\colon V\to V$ is a linear operator then $T0 = 0$_.

_Hint_: Show $v + v = v$ implies $v = 0$ and $T(0 + 0) = T0$.

Eigenvectors determine one-dimensional invariant subspaces.
If $V$ is a vector space over the field $\FF$ and $T\colon V\to V$ is
linear then $v\in V$ is an _eignenvector_ with _eigenvalue_ $\lambda\in\FF$
if $v\not=0$ and $Tv = \lambda v$.
The smallest subspace containing $v$ is ${\span\{v\} = \{\alpha v\mid \alpha\in\FF\} = \FF v}$.

__Exercise__. _Show $\FF v$ is an invariant suBspace of $T$ if $v$ is an eigenvalue_.

Not every operator on a finite-dimensional vector space has an invariant subspace.

__Exercise__. _Show $R\colon\RR^2\to\RR^2$ defined by $R(x, y) = (-y, x)$ has no eigenvectors_.

Note the linear operator $R$ corresponds to a $\pi/2$ radian counter-clockwise rotation.
We use $\RR$ to denote the field of real numbers and $\CC$ for the complex numbers.

__Exercise__. _Show $R\colon\CC^2\to\CC^2$ defined by $R(x, y) = (-y, x)$ has two eigenvectors_.

_Hint_: If $(-y, x) = \lambda(x,y)$ then $-y = \lambda x$ and $x = \lambda y$
so $-y = \lambda^2 y$ and $x = -\lambda^2 x$. The two eigenvalues are $i$ and $-i$.

When looking for invariant subspaces mathematicians pick up some bad habits.
Our first one is to assume the underlying field is always the complex numbers.

There are two usual suspects when looking for invariant subspaces, the _kernel_ and
the _range_ of the operator.

The kernel of $T\colon V\to V$ is $\ker T = \{v\in V\mid Tv = 0\}$.

__Exercise__. _Show $\ker T$ is an invariant subspace of $T$_.

The range of $T\colon V\to V$ is $\ran T = \{Tv\mid v \in V\}$.

__Exercise__. _Show $\ran T$ is an invariant subspace of $T$_.

Our next bad habit to always assume $\ket T = \{0\}$ and $\ran T = V$.

__Exercise__. _Show $v\not=0$ is an eigenvector with eigenvalue $\lambda$
if and only if $v\in\ker(T-\lambda I)$_.

We use $I\colon V\to V$ to denote the _identity operator_ $Iv = v$, $v\in V$.

Every linear operator on a vactor space over $\CC$ has an eigenvector, but this
is not trivial to prove. It is useful to introduce a _topology_ on vector spaces.

<!--

Topology is the mathematical study of the work 'near'.
It took quite some time to come up with the definition that a topology on
a set is a collection of subsets that is closed under finite intersection
and arbitrary unions.

A _metric_ on a set $S$ is a "distance" function $d\colon S\times S\to [0,\infty)$ satisfying
$d(x, y) = d(y, x)$, and $d(x,z) \ge d(x,y) + d(y,z)$ for $x,y,z\in S$.[^1]
Distance is symmetric and side trips never decrease the distance.

[^1]: Typically the condition $d(x,y) = 0$ implies $x = y$ is also required.
One can define an equivalence relation on $S$ by $x\sim y$ if and only if
$d(x,y) = 0$. If $[x] = \{y\in S\mid y\sim x\}$ then $d([x],[y]) = d(x,y)$
is well-defined and $d([x],[y]) = 0$ if and only if $[x] = [y]$.

__Exercise__. _Show $d(x,x) = 0$_.

_Hint_: $d(x, x) \ge 2d(x,x)$ and $d(x,x)\ge 0$.

A metric defines a topology. Define the _open ball_ $B(x,r) = \{y\in S\mid d(x,y) < r\}$.

-->

A _norm_ on a vector space is a function $\|.\|\colon V\to[0,\infty)$ satisfying
$\|v\| = 0$ implies $v = 0$, $\|\alpha v\| = |\alpha| \|v\|$ and $\|v + w\| \le \|v\| + \|w\|$.
Norms define a _metric_ $d(v, w) = \|v - w\|$. A vector space that is
_complete_ under this norm is a _Banach space_.

An _inner product_ on a vector space is a function $(.,.)\colon V\times V\to\FF$
satisfying $v \mapsto (v,w)$ and $w\mapsto (v,w)$ is linear for $v, w\in V$. etc...

__Exercise__. _Show $\|v\| = (v, v)$ is a norm_.

A vector space with an inner product that is complete under this norm is a _Hilbert space_.

There are bounded linear operators on a Hilbert space that have no eigenvectors.

## Shift Operator

The vector space of square summable sequences
${\ell^2 = \{(x_j)_{j=0}^\infty\mid \sum_j |x_j|^2 < \infty, x_j\in\CC\}}$
is a Hilbert space with inner product $(x,y) = \sum_j x_j\overline{y_j}$.
The shift operator $S\colon\ell^2\to\ell^2$ defined by
$S(x_0, x_1, \ldots) = (0, x_0, x_1,\ldots)$ has no eigenvectors.

__Exercise__. _If $Sx = \lambda x$ then $x = 0$_.

_Hint_: $0 = \lambda x_0$, $x_1 = \lambda x_0$, rinse and repeat when $\lambda\not=0$.
What if $\lambda = 0$?

The shift operator has lots of non-trivial invariant subspaces. Let $\MM_1 = \{(0, x_1,\ldots)\mid x_j\in\CC\}$.

__Exercise__. _Show $\MM_1$ is an invariant subspace._

It should be obvious to you now that $\MM_n = \{(0,\dots,0,x_n,\ldots)\mid x_j\in\CC\}$
is an invariant subspace for any $n \ge 0$.

### Beurling's Theorem

Arne Beurling figured out _all_ of the invariant subspaces of the shift operator.
The theory of vector spaces is quite spartan. Beurling brought in tools from
functional analysis to do the heavy lifting.

He started with identifying $\ell^2$ with the Hardy space
$H^2 = \{f(z) = \sum_{j=0}^\infty c_j z^j\mid \sum_j |c_j|^2 < \infty\}$ of analytic
functions on the unit disk $D = \{z\in\CC\mid |z| < 1\}$.
It is not trivial to prove $\bar{f}(e^{i\theta}) = \lim_{r\uparrow 1} f(re^{i\theta})$ exists
on the boundary $\partial D = \{z\mid |z| = 1\}$ with Lesbegure measure 1
and $f(z) = ... \bar{f}$.

$S\MM\subseteq\MM$. $\MM\ominus S\MM$.

$T\colon\HH\to\HH$ define $R\colon \HH\to\ell^2(\HH)$
by $x\mapsto(x, Tx, T^2x,\ldots)$.

__Exercise__. _Show $\MM_n$ can be identified with $z^n H^2$_.

Beurling showed every invariant subspace of the shift operator has
the form $\phi H^2$ where $|\phi| = 1$ on $\partial D$.
