---
title: Tensor
author: Keith A. Lewis
header-includes:
  - \usepackage{amsmath}
  - \usepackage{bm}
---
\newcommand\RR{\bm{R}}
\newcommand\NN{\bm{N}}
\newcommand\LL{\mathcal{L}}
\newcommand\tr{\operatorname{tr}}

There seems to be some uncertainty in the computer science community
about exactly what a tensor is. This short note clarifies this by giving
names to functions and composing them. The mathematical definitions can
be translated directly into any computer language that allows functions
to be defined and called.

The vector space $\RR^n$ is the set of tuples $x = (x_1,\ldots,x_n)$ where
$x_i\in\RR$, $1\le i\le n$. _Scalar multiplication_
is defined by $a(x_1,\ldots,x_n) = (ax_1,\ldots,ax_n)$ for $a\in\RR$.
_Vector addition_ is defined by $(x_1,\ldots,x_n) + (y_1,\ldots,y_n)
= (x_1 + y_1,\ldots,x_n + y_n)$.

Definitions involving dots are not ammenable to computer
implementation. Every vector $x\in\RR^n$ determines a function
$\bm{x}\colon\bm{n}\to\RR$ by $\bm{x}(i) = x_i$ for $i\in\bm{n} = \{1,\ldots,n\}$.
Scalar multiplication and vector addition can
be defined _pointwise_ by $(a\bm{x})(i) = a(\bm{x}(i))$ and $(\bm{x} +
\bm{y})(i) = \bm{x}(i) + \bm{y}(i)$, $1\le i\le n$.

The set of tuples $\RR^n$ is not the same as the set of functions $\RR^\bm{n}$
but they are in one-to-one correspondence.
Define a map $\iota\colon\RR^n\to\RR^\bm{n}$ by $\iota x(i) = x_i$, $x\in\RR^n$, $i\in\bm{n}$.

__Exercise__. _Show if $\iota x = \iota y$ then $x = y$, $x,y\in\RR^n$_

_Hint_: Use $x = y$ if and only if $x_i = y_i$ for all $i\in\bm{n}$.

This shows $\iota$ is _one-to-one_, or _injective_.

__Exercise__. _Show for every $\bm{x}\in\RR^\bm{n}$ there exists $x\in\RR^n$ with $\iota x = \bm{x}$_.

_Hint_: Given $\bm{x}\in\RR^\bm{n}$ let $x_i = \bm{x}(i)$, $i\in\bm{n}$.

This show $\iota$ is _onto_, or _surjective_.
A function that is one-to-one and onto is a _one-to-one correspondence_, or _bijective_.

__Exercise__. _Show $\iota(ax) = a(\iota x)$ and $\iota(x + y) = \iota x + \iota y$ for
$a\in\RR$, $x,y\in\RR^n$_.

This shows $\iota$ is a _linear operator_, a function from one vector space to
another that preserves the linear structure.
If a linear operator is bijective we call it an _isomorphism_.

## Array

Every finite dimensional vector space over the real numbers can be
identified with the _set exponential_ $\RR^I$ of all functions from an
_index set_ $I$ to $\RR$. Elements of $\RR^I$ are called _arrays_.

A _view_ of $\RR^I$ is a function $\sigma\colon J\to I$
and is used to define a function $\circ\sigma\colon\RR^I\to\RR^J$ by
right composition $(\circ\sigma)x = x\circ\sigma = x\sigma$ so
$(x\sigma)(j) = x(\sigma(j))$, $x\in\RR^I$, $j\in J$.

__Exercise__. _Show $\circ\sigma$ is a linear operator_.

_Hint_: Show $a(x\sigma) = (ax)\sigma$ and $(x + y)\sigma = x\sigma + y\sigma$.

__Exercise__. _Show if $\sigma$ is one-to-one then $\circ\sigma$ is onto._

_Hint_: Show there exists $\sigma^\dashv\colon I\to J$ with $\sigma^\dashv\sigma = 1_J$.
If $x\in\RR^J$ then $x\sigma^\dashv\in\RR^I$ and $x\sigma^\dashv\sigma = x$.

__Exercise__. _Show if $\sigma$ is onto then $\circ\sigma$ is one-to-one._

_Hint_: Show there exists $\sigma^\vdash\colon J\to I$ with $\sigma\sigma^\vdash = 1_I$.
If $x\sigma = y\sigma$, $x,y\in\RR^I$, then $x\sigma\sigma^\vdash = y\sigma\sigma^\vdash$
and $x = y$.

This shows if $\sigma$ is one-to-one and onto then $\circ\sigma$ is an isomorphism.

If $J\subset I$ we write $[J]\colon J\to I$ for the inclusion map and
call $x[J]$ the _projection_ on $J$ of $x\in\RR^I$.

## Matrix

If $I = I_1\times I_2$ is a cartesian product of two index sets
the elements of $\RR^{I_1\times I_2}$ are _matrices_.

A vector is usually represented on a computer as a contiguous array of memory
with elements of the same type. The real numbers are uniquely characterized
mathematically as a complete Archemedean ordered field. Computers
can only model real numbers as a finite number of bits. 
The most common representation is 64-bit or 32-bit IEEE 754 floating point.


<!--

The _dual_ of a vector space $V$ over the real numbers $\RR$ is the set
of all linear functionals from $V$ to $\RR$.

The vector space $\RR^n$, where $\RR$ is the set of real numbers and
$n\in\NN$ is a natural number, can be identified with the set
of functions from $\bm{n} = \{1,\ldots, n\}$ to $\RR$.
The tuple $x = (x_1,\ldots,x_n)$ corresponds to the function
$\bm{x}\colon\bm{n}\to\RR$ by $\bm{x}(i) = x_i$, $i\in\bm{n}$.

The _dual_ of $\RR^n$ is the set of all _linear functionals_
from $\RR^n\to\RR$. 

$x^*y = x^*(y)$.

$xy^*\colon V\to V$ by $(xy^*)v = x(y^*v)$.

Hadamard Product $A\in\RR^{I\times J}$, $B\in\RR^{I\times J}$ 
$A\odot B = SAB$ where $Sxyz = xz(yz)$ is the $S$ combinator.

Trace. $\Delta\colon I\to I\times I$ by $i\mapsto (i,i)$. $\tr T = +*T\Delta$.

__Exercise__. _Show $\tr A^T = \tr B$_.

_Hint_. ${}^T\Delta = \Delta$.

__Exercise__. _Show $\tr TS = \tr ST$_.

$\RR^{n\times m}\times n\to \RR^m$, $(x, i)\mapsto (x,i)j = x(i,j)$, $j\in\bm{m}$

$\RR^{n\times m}\times m\to \RR^n$, $(x, j)\mapsto (x,j)i = x(i,j)$, $i\in\bm{n}$. 

Monoid. $m\colon M\times M\to M$. $m^*\colon M^*\to M$.
$m^* = m/$. Right vs left fold.

if $X$ and $Y$ are sets the _set exponential_ $Y^X = \{f\colon X\to Y\}$
is the set of all functions from $X$ to $Y$ and if $g\colon U\to X$
then _composition_ $\circ g\colon Y^X\to Y^U$ by $(\circ g)f = f\circ g = fg$,
where $(fg)(u) = f(g(u))$, $u\in U$.

__Exericise__: _Show if $g$ is one-to-one then so is $f\circ g$_.

_Hint_: Show $f\circ g(u) = f\circ g(u')$ then $u = u'$.

$\RR^n$ $X = n$, $Y = \RR$.

$\RR^{n\times n}$ $X = n\times m$, $Y = \RR$.

We use the somewhat unconventional name upper case capital $T$ 
for the function that transposes elements of an ordered pair:
${}^T\colon A\times B\to B\times A$ by ${}^T(a, b) = (b, a)$,
$a\in A$, $b\in B$.

__Exercise__. _Show ${}^T$ is bijective_.

We can generalize this to any permutation $\tau\colon X\to X$

$\RR^{n\times m}\to \RR^n$ by $T
-->

