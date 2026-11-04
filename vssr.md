---
title: Vector Space Speed Run
author: Keith A. Lewis
header-includes:
	- \usepackage{bm}
---

\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\FF{\bs{F}}
\newcommand\CC{\bs{C}}
\newcommand\RR{\bs{R}}
\newcommand\NN{\bs{N}}
\newcommand\ZZ{\bs{Z}}
\newcommand\QQ{\bs{Q}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\LL{\operatorname{L}}
\newcommand\Hom{\operatorname{Hom}}
\newcommand\End{\operatorname{End}}

https://wikihack.netlify.app/a/1451/apl-programming-language

Karpathy

Fasten your seatbelt.

If you don't know what a vector space is, just assume it
is the set of $n$-tuples ${\RR^n = \{\bs{x} = (x_1,\ldots,x_n)\mid x_j\in\RR, 1\le j\le n\}}$
where $\RR$ is the _field_ of _real numbers_. We use bold face $\bs{x}$ to indicate
a vector tuple.
Any field will do, e.g., the _complex numbers_ $\CC$ or _finite
fields_ $\ZZ_p = \ZZ/p\ZZ$ of integers modulo a prime number $p$.
We will use $\FF$ to denote any field.

Vector spaces have a _scalar multiplication_ and _vector addition_.
For $a\in\FF$ and $x,y\in\FF^n$ the scalar multiplication and vector addtion are defined _pointwise_ by
$a(x_i) = (ax_i)$ and the vector addition is $(x + y)_i = (x_i + y_i)$, $1\le i\le n$.

A different, but equivalent, way to represent $\FF^n$ is
the set of all functions $x\colon\{1,\ldots,n\}\to\FF$
where $x_i$ corresponds to $x(i)$.
There seems to be no generally accepted mathematical notation
to distinguish them.

This was figured out long ago by [@Ive1980] when he was dissatisfied
with the expressive power of Fortran two decades earlier.
His brilliant APL: A Programming Language is still 
alive and kicking in its latest incarnation: kdb.

For any set $I$ define the _set product_
${\Pi_I\FF = \Pi_{i\in I}\FF = \{\bs{x} = (x_i)\mid x_i\in\FF, i\in I\}}$.
The _set exponential_ ${\FF^I = \{x\colon I\to\FF\}}$ is equivalent by identifying $x_i$ with $x(i)$,
$i\in I$.

Let's give an explicit name to this implicit correspondence:
$\Pi = \Pi_{\FF,I}\colon\FF^I\to \Pi_I\FF$ where $(\Pi\bs{x})_i = x(i)$.

It is a set _isomorphism_. It is injective (one-to-one) because
$\Pi x = \bm{x}$

This is our first example of a _linear operator_.

__Exercise__. _Show $\Pi(a x + y) = a\Pi(x) + \Pi(y)$_.

Hint: This follows from the laws satisfied by the field.

__Exercise__. _Show $\Pi(ax) = aPi(x)$ and $\Pi(x + y) = \Pi(x) + \Pi(y)$,
$a\in\FF$, $x,y\in \Pi_I \FF$.

_Hint_: Use $\Pi(0) = 0$ and $1x = x$.

If $V$ is a vector space then a subset $U\subseteq V$ is a _subspace_ if
it is closed under scalar multiplication and vector addition.
We can write this as $\FF U\subseteq U$ and $U + U\subseteq U$
where ${\FF U = \{au\mid a\in\FF, u\in U\}}$
and ${U + U = \{u + v\mid u,v\in U\}}$.

__Exercise__. _Show if $V$ and $W$ are vector spaces show their intersection $V\cap W$ and
sum $V + W$ are vector spaces_.

_Hint_: Show they are closed under scalar addition and vector multiplication.

Given a subspace $U\subseteq V$ define the _quotient_ space
${V/U = \{v + U\mid v\in V\}}$ with scalar multiplication
${a(v + U) = av + U}$ and vector addition ${(v + U) + (w + U)
= (v + w) + U}$.

__Exercise__. _Show scalar multiplication and vector addition
are well-defined_.

_Hint_: This means if $v + U = w + U$ then $a(v + U) = a(w + U)$
and 

Let ${\LL(V,W) = \{T\colon V\to W\mid T\text{ is linear}\}}$ be the set of all
linear operators from the vector space $V$ to the vector space $W$.
It is also a vector space with scalar prodcut $(aT)(v) = a(T(v))$
and vector addition $(T + U)(v) = T(v) + U(v)$, $a\in\FF$, $v\in V$.
This is also written as $\Hom(V,W)$ for the set of _homomorphism_:
functions that preserve the vector space structure.

The _kernel_ of a linear oprator $T\in\LL(V,W)$ is
$\ker T = \{v\in V\mid Tv = 0\}$ and the _range_
is $\ran T\{Tv\mid v\in V\}\subseteq W$.

If $V = W$ we write $\End(V)$ for $\Hom(V,V)$, the set of _endomorphisms_
for a vectorspace to itself.
