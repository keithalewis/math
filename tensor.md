---
title: Tensor
author: Keith A. Lewis
header-includes:
  - \usepackage{amsmath}
  - \usepackage{bm}
---
\newcommand\RR{\bm{R}}
\newcommand\CC{\bm{C}}
\newcommand\ZZ{\bm{Z}}
\newcommand\FF{\bm{F}}
\newcommand\NN{\bm{N}}
\newcommand\QQ{\bm{Q}}
\newcommand\LL{\mathcal{L}}
\newcommand\tr{\operatorname{tr}}
\newcommand\eval{\operatorname{eval}}
\newcommand\curry{\operatorname{curry}}
\newcommand\uncurry{\operatorname{uncurry}}
\newcommand\graph{\operatorname{graph}}

There seems to be some uncertainty in the computer science community
about exactly what a tensor is. THe only things involved are sets,
functions, and their composition.

This short note clarifies this by giving names to functions and
then composing them. The mathematical definitions can be translated
directly into any computer language that allows functions to be
defined and called.  We cover topics described in [The Tensor
Cookbook](https://tensorcookbook.com/) but have no need for their
graphical notations.

We assume the reader knows what a set is and use $\in$ to denote membership.
The _set exponential_ of the set $A$ and $B$ is $B^A = \{f\colon A\to B\}$, the set
of all functions from $A$ to $B$. Let's write $B^A$ as $\{A\to B\}$.
The _cartesian product_ of $A$ and $B$
is $A\times B = \{(a,b)\mid a\in A, b\in B\}$, the set of ordered pairs of
elements from the two sets.

__Exercise__. _Show we can identify the ordered pair $(a,b)$ with the 
set $\{a,\{a,b\}\}$_.

_Hint_: If $c \in \{a,\{a,b\}\}$ then either $c = a$ or $c = \{a,b\}$.
If $c = a$ then $c$ is the first element of the pair $(a,b)$,
otherwise $c = \{a,b\}$ and $b$ is 

__Exercise__. A function can be identified with its $\graph f = \{(a, f(a))\mid a\in A\} \subseteq A\times B$.

_Hint_: $f(a) = b$ if and only if $(a,b)\in\graph f$.

The _composition_ of two compatible functions is a function
$\circ\colon\{A\to B\}\times\{B\to C\}\to\{A\to C\}$
defined by $\circ(f,g)(a) = g(f(a))$, $a\in A$. Note the order of $f$ and $g$ are reversed.
This is also written as $g\circ f$
or simply $gf$ when it is clear composition is intended.
We could write $B^A$ as $\{B\leftarrow A\}$ and define
composition as $\circ\colon\{C\leftarrow B\}\times\{B\leftarrow A\}\to\{C\leftarrow A\}$
and $\circ(g,f)(a) = g(f(a))$ so we don't have to reverse the order of $f$ and $g$, but
we resist this temptation and stick to standard mathematical notation.

__Exercise__. _Show composition of functions is associative_.

_Hint_: If $f\colon A\to B$, $g\colon B\to C$, and $h\colon C\to D$
show $h\circ(g\circ f) = (h\circ g)\circ f$.

This allows us to write $h\circ g\circ f$ unambiguosly.

_Currying_ and _uncurrying_ provides the connection between set exponential and cartesian product.
The set $\{A\times B\to C\}$ is in one-to-one correspondence with
the set $\{A\to\{B\to C\}\}$. Given $f\in\{A\times B\to C\}$ define
$\curry f\colon A\to\{B\to C\}$ by $((\curry f)(a))(b) = f(a,b)$.
The inverse is _uncurrying_. Given $g\in\{A\to\{B\to C\}\}$ define
$\uncurry g\colon A\times B\to C$
by $(\uncurry g)(a,b) = (g(a))(b)$.




$f,\colon A\to\{B\to C\}$ by $f,a(b) = f(a,b)$.
The inverse is _uncurrying_. Given $g\in\{A\to\{B\to C\}\}$ define $,g\colon A\times B\to C$
by $,g(a,b) = ga(b)$.

__Exercise__. _Show $,(f,) = f$ and (,g), = g$_.

_Hint_. $,(f,)(a,b) = f,a(b) = f(a,b)$ and $(,g),a(b) = ,g(a,b) = ga(b)$.



_Evaluation_ is a function $\eval\colon\{A\to B\}\times A\to B$ defined
by $\eval(f,a) = f(a)$, $f\in\{A\to B}$, $a\in A$.


If the base of a set exponential is a [field](https://en.wikipedia.org/wiki/Field_(mathematics))
$\FF$ then $\FF^I$ is a _vector space_ for any _index set_ $I$. Typically
$\FF$ is the real numbers $\RR$, the complex numbers $\CC$, the rational
numbers $\QQ$, or integers modulo $p$ $\ZZ_p$ where $p$ is prime.
Scalar multiplication and vector addition are defined pointwise:
$(ax)(i) = a(x(i))$ and $(x + y)(i) = x(i) + y(i)$ for $a\in\FF$, $x,y\in\FF^I$.

__Exercise__. _Show vector space axioms are satisfied_.

The _standard basis_ of $\RR^I$ is $(e_i)_{i\in I}$ where $e_i(j) = \delta_{ij}$
is the Kronecker delta. We write $e_i^I$ to indicate $e_i\in\FF^I$ if necesary.

__Exercise__. _Show $x = \sum_{i\in I} x(i)e_i$ when $I$ is finite_.

_Hint_. If $x,y\in\FF^I$ then $x = y$ if and only if $x(j) = y(j)$ for all $j\in I$.

A simple but quite useful observation is that if $\sigma\colon J\to I$ is any function
then $\circ\sigma\colon\FF^I\to\FF^J$ by $x\mapsto x\circ\sigma$, $x\in\FF^I$.

For example, if $j\in I$ and $\sigma_j\colon\{j\}\to I$ by $j\mapsto j$ then
$x\circ\sigma_i) = x(i)$. If $I = {j}$ is a singleton then $\FF$ is in one-to-one
correspondence with $\FF^I$. The element $x\in\FF$ corresponds to
the function $j\mapsto x$.

<!--

The vector space $\RR^n$ is the set of tuples ${x = (x_1,\ldots,x_n)}$ where
${x_i\in\RR}$, ${1\le i\le n}$. _Scalar multiplication_
is defined by ${a(x_1,\ldots,x_n) = (ax_1,\ldots,ax_n)}$ for ${a\in\RR}$.
_Vector addition_ is defined by ${(x_1,\ldots,x_n) + (y_1,\ldots,y_n)
= (x_1 + y_1,\ldots,x_n + y_n)}$.

Definitions involving dots are not ammenable to computer
implementation. Every vector ${x\in\RR^n}$ determines a function
${\bm{x}\colon\bm{n}\to\RR}$ by ${\bm{x}(i) = x_i}$ for ${i\in\bm{n} = \{1,\ldots,n\}}$.
Scalar multiplication and vector addition can
be defined _pointwise_ by ${(a\bm{x})(i) = a(\bm{x}(i))}$ and
${(\bm{x} + \bm{y})(i) = \bm{x}(i) + \bm{y}(i)}$, ${1\le i\le n}$.

The set of tuples $\RR^n$ is not the same as the set of functions $\RR^\bm{n}$
but they are in one-to-one correspondence.
Define a map ${\iota\colon\RR^n\to\RR^\bm{n}}$ by ${\iota x(i) = x_i}$, ${x\in\RR^n}$, ${i\in\bm{n}}$.

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

## Cartesian Product

The _cartesian product_ $\prod_{i\in I}A_i$ of sets $A_i$, $i\in I$, is defined
by _projections_ $\pi_i\colon \Pi_{i\in I}A_i\to A_i$, $i\in I$ having the property
that if $P$ is a set with functions $p_i\colon P\to A_i$, $i\in I$, then there exists
a function $p\colon P\to\prod_{i\in I}A_i$ with $\pi_ip = p_i$, $i\in I$.

If $P$ is a set with functions $p_i\colon P\to A_i$, $i\in I$ having the property
that if $Q$ is a set with functions $q_i\colon Q\to A_i$, $i\in I$, then there exists
a function $q\colon Q\to P$ with $p_iq = q_i$, $i\in I$, then $P$ is in
one-to-one correspondence with $\prod_{i\in I}A_i$.

__Exercise__. _Prove this_.

_Hint_: Let $Q = \prod_{i\in I}A_i$ and $q_i = \pi_i$.

<details><summary>Solution</summary>
We have $p\colon P\to\prod_{i\in I}A_i$ with $\pi_ip = p_i$
and $q\colon\prod_{i\in I}A_i\to P$ with $p_i q = \pi_i$.
Use this to show this defines an isomorphism.
</details>

## Set Exponential

Given sets $A$ and $B$, the _set exponential_ $B^A$ is the set of all functions
from $A$ to $B$. It is related to cartesian product by $C^{A\times B}$
is in one-to-one correspondence with $C^{B^A}$.
If we write $B^A = \{A\to B\}$ this says
$\{A\times B\to C\}$ 
is in one-to-one correspondence with $\{A\to\{B\to C\}\}$
and is more easily recognized as _currying_.
If we have a function $f\colon A\times B\to C$ and $a\in A$ we
can define a function from $B\to C$ by $b\mapsto f(a,b)$.
Conversly, if we have a function $g\colon A\to C^B$ we can
define a function from $A\times B$ to $C$ by $(a,b)\mapsto (g(a))(b) = (ga)b$.

If $f\colon A\to B$ is a function then the value of $f$ at $a\in A$ is $f(a)$.
We reify this with the name $\eval_B^A\colon B^A\times A\to B$ defined
by $\eval_B^A(f,a) = f(a)$. If $g\in (C^B)^A$ and $a\in A$ then
$\eval_{C^B}^A(g, a)\in C^B$ is called _partial evaluation_.

## Tuple, Array

Given any _index set_ $I$ the cartesian product $\prod_{i\in I}\RR$ is
isomorphic to the set exponential $\RR^I$. 
Elements of the cartesian product are _tuples_. Elements
of the set exponential are _arrays_.

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

## Dual

The _dual_ of the vector space $\RR^I$ is the set of all linear operators from $\RR^I$ to $\RR$.
The _standard basis_ of $\RR^I$ is $(e_i)_{i\in I}$ where $e_i(j) = \delta_{ij}$
is the Kronecker delta: $\delta_{ij} = 1$ if $i = j$ and $\delta_{ij} = 0$ if $i \not= j$.

__Exercise__. _Show $x = \sum_{i\in I} x(i)e_i$ if $I$ is finite_.

_Hint_: Evaluate $x(j)$, $j\in I$.

## Matrix

A _matrix_ is an array where the index set is the cartesian product
of two sets $\RR^{I\times J}$.

A vector is usually represented on a computer as a contiguous array of memory
with elements of the same type. The real numbers are uniquely characterized
mathematically as a complete Archemedean ordered field. Computers
can only model real numbers as a finite number of bits. 
The most common representation is 64-bit or 32-bit IEEE 754 floating point.



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

