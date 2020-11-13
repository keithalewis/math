---
title: APL
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A Programming Language
...

\newcommand\RR{\bm{R}}
\newcommand\NN{\bm{N}}
\newcommand\ZZ{\bm{Z}}
\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\newcommand\hom{\operatorname{hom}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Set{\mathbf{Set}}
\newcommand\eq{\text{$=$}}
\newcommand\from{\widehat{\phantom{x}}}


> _APL is a mistake carried through to perfection_ &mdash; Edsgar W. Dijkstra

A Programming Language _APL_ was invented by Ken E. Iverson, a mathematician
unsatisfied by the limited expressiveness of FORTRAN when it came to manipulating
multidimensional arrays. What follows is a mathematical description of
the objects and operations on them he envisioned to scratch that itch.
It is simply a matter of giving explicit names to the operations that can be
performed on collections of data; what Iverson called "tools of thought."

There have been many languages inspired by APL and this writeup takes
liberties with the classical language.  Our approach is informed by
advances in mathematics and best practices for implmementing functional
languages on current computer architectures. 
We take a purely functional view so no side effects are allowed and data cannot
be mutated.  Similar to Everett's many-world interpretation, this makes
it easy to reason about programs mathematically, but can be hard on
computers computationally.  Using lazy evaluation, lenses, and
other implementation techniques can help with that.

## Set

Given a function $f\colon X\to Y$ we write $f(x)$ as $fx$.  If $g\colon
Y\to Z$ we write the composition $g(f(x))$ as $gfx$.  Right to left
association is natural in functional languages to chain application. If
$h\colon Z\to W$ then $h(gf) = (hg)f$ so writing $hgf$ is unambiguous. The
identity function of a set $X$ is $1_X\colon X\to X$ with $1_X(x) =
x$, $x\in X$ and $f1_X = f = 1_Yf$ whenever $f\colon X\to Y$.  Sets and
functions are the objects and arrows of the category $\Set$.

$\Set$ is _cartesian closed_ &ndash; it has products and exponentials.
The product of sets $X$ and $Y$ is the cartesian product
$X\times Y = \{(x,y):x\in X, y\in Y\}$ is the set of all pairs from each set
and the exponential $Y^X = \{f\colon X\to Y\}$ is the set of functions
from $X$ to $Y$.

Products and exponentials are related by $Z^{X\times Y}$ is in one-to-one
correspondence with $Z^{Y^X}$.[^1] Every $f\in Z^{X\times Y}$ corresponds
to $g\in Z^{Y^X}$ via $f(x,y) = z$ if and only if $g(x)(y) = (gx)y = z$,
$x\in X$, $y\in Y$, $z\in Z$.
This correspondence can be written
$$
	(X\times Y)\to Z \leftrightarrow X\to(Y\to Z)
$$
Going from left to right is _currying_ and going from right to left
is _uncurrying_. Given $f\colon X\times Y\to Z$ we write $fx\colon Y\to Z$
for _partial application_ instead of $g(x)$.

Given $f\in Z^{Y^X}$ we write ???

### Product

The cartesian product of a set $X$ with itself $Y$ times,
$\Pi X_Y = \Pi_{y\in Y} X$, can be defined for any set $Y$.
It can be identified with $X^Y$ and has
_projections_ $\pi_y\colon \Pi X_y\to X$
defined by $\pi_y x = x(y)$, $x\in X^Y$, $y\in Y. We write $\pi_y x = x_y$
and $x = (x_y)$ _as an array_ in the product for $x$ _as a function_
in the exponential.

__Exercise__. _If $u,v\in\Pi X_Y$ and $\pi_y u = \pi_y v$ for
all $y\in Y$ then $u = v$ as functions in $Y^X$_.

[^1]: In fancy pants category theory language this is expressed as
the product functor $F_Y(X) = X\times Y$ and the exponential functor
$G_Y(Z) = Z^Y$ are adjoint: $\hom(F_Y(X),Z)\cong\hom(X,G_Y(Z))$.

### Each

If $f\colon X\to Y$ and $x\colon Z\to X$ then $fx\colon Z\to Y$.
This can be viewed as a function $f^Z\colon X^Z\to Y^Z$.
It is common to call this _apply_ or _map_ or _fmap_, but in APL
it is called _each_. With $X^Z$ and $Y^Z$ as products,
$x\mapsto fx$ where $(fx)_z = f(x_z)$

### Index

If $y\colon Y\to Z$ and $f\colon X\to Y$ then $yf\colon X\to Z$.
This can be viewed as a function $f_Z\colon Z^Y\to Z^X$.  It is
common to call this _projection_, but in APL it is called _index_.
With $Z^Y$ and $Z^X$ as products, $y\mapsto yf$ where $(yf)_x = y_{fx}$.
If $X\subseteq Y$ and $f\colon X\to Y$ is the inclusion map
then $Z^Y\to Z^X$ is the projection $\Pi Z_Y\to \Pi Z_X$.
If we write the inclusion map as $[X]$ then $y[X]$ selects
the $X$ indices from $y = y[Y]$.

APL is primarily concerned with arrays $X^{n_0\times\cdots n_{m-1}}$
and giving names to the functions operating on those.
Most often $X$ is $\RR$, the set of real numbers,
but $X$ can also be a set of characters.

## Example

APL lets you turn a number into a lot of numbers.  The function $\iota$
(iota) is used to produce sequences. If $n\in \NN$ then $\iota n = (0,
1, \ldots n-1)$ where $\NN$ is the set of natural numbers. It
is related to our convention $n = \{0,\ldots, n-1\}$ but
$\iota n$ is not equal to $n$, it is an element of $\NN^n$.
Note $(\iota n)_i = i$, $i\in n$ so $\iota n$ is the identity function
on $n$.

In two dimensions the $n\times n$ identity matrix is
$(\delta_{ij})_{i,j\in n}\in \NN^{n\times n}$. In APL
it is $\delta$ applied to each element of $n\times n$.
The elements of $n\times n$ are $\{(i,j):i,j\in n\}$ so
$\delta n\times n = \{\delta(i,j):(i,j)\in n\times n\}$.

We can define $\delta\colon X^n\to X$ for any $n$
by $\delta(x_0,\ldots,x_n-1) = 1$ if all $x_i$ are equal and $0$ otherwise.
We should probably use `true` and `false` instead of $1$ and $0$.
If we use $X$ as the name of the _type conversion_ function
`true`$\mapsto 1$ and `false`$\mapsto 0$
we would write $X(\delta)$, or $X\delta$, instead of $\delta$.

In APL we use $\eq$ instead of pussyfooting around with $\delta$.
This can be written more succinctly
as $\eq n^2$ since $n^2$ is equivalent to $n\times n$.
The $k$-dimensional identity matrix is $\eq n^k$. If we
define $\from(A, B) = A\from B = A^B$, ⍣ in APL,
then $\eq \from$ allows us to parameterize over $n$ too since
$\eq \from(n,k)$ is $\eq n^k$.

Never play code golf with an APLer.

### Reduce

APL also lets you turn a lot of numbers into one number.
For instance, $+/(a_0,\ldots,a_n) = a_0 + \cdots + a_n$
where slash ($/$) is called _reduce_. Other languages
call this _fold_.

Any binary operator $\bullet\colon X\times X\to X$ can
be extended to
$\bullet/\colon X^n\colon X$ for $n > 2$
inductively by $\bullet/(x_0, x_1, \ldots) = x_0 \bullet (\bullet/(x_1, \dots))$.
This is called _right reduce_. If the array is finite then
then _left reduce_ is $/\bullet(x_0,\ldots,x_n) = (/\bullet(x_0,\ldots,x_{n-1}))\bullet x_n$.
Here we are using _infix notation_ $\bullet(x,y) = x\bullet y$.

If $\bullet$ is associative then right and left right reduce are equal.
If we define $\bullet/(x) = x$ then $\bullet/(x,y) = (\bullet/x)\bullet(\bullet/y)$
where $(x,y)$ is the concatenation of array $x$ with array $y$. Likewise for $/\bullet$.
If $\bullet$ has an _identity element_ $e\in X$ we can define
$\bullet/\emptyset = e = /\bullet\emptyset$
and this holds when $x$ or $y$ are empty. These conditions make $X$ a _monoid_ under $\bullet$.

If the binary operation is commutative then changing the order of the array elements does not alter the result.

### Dimension

The main datatype in APL is a _multi-dimensional array_ $X^{n_0\times\cdots n_{m-1}}$.
The _shape_ of the array is $n_0\times\cdots n_{m-1}$. It is a function from exponentials
to sets defined by $\rho X^Y = Y$.
Every $f\in X^Y$ is a function $f\colon X\to Y$ so $\rho$ is a constant function,
$\rho f = Y$ for all $f\in X^Y$.

### Lens

A _lens_ has a getter and a setter. 

set(get(y,x), x) = y,  set(get(set(get(y,x)),z) = set(get(y,z),z).




