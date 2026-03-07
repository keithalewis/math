---
title: Vector Spaces Done Righter
author: Keith A. Lewis
classoption: fleqn
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\curry{\operatorname{curry}}
\newcommand\uncurry{\operatorname{uncurry}}
\newcommand\RR{\bs{R}}
\newcommand\FF{\bs{F}}

Sheldon Axler wrote a book called [Linear Algebra
Done Right](https://linear.axler.net/LADR4e.pdf) that
he has graciously made available under a [creative
commons](https://creativecommons.org/licenses/by-nc/4.0/) license.
He declared his hatred for determinants in both his prefaces and left those to the last chapter in his book.
I hated them too in my first linear algebra course. I even refused to learn
them, and got a grade of C.
Much later, I learned about [@Gra1844]. Hermann Grassmann showed how
determinants follow easily from his exterior product of points.
His rule is very simple: If $P$ and $Q$ are points in space then
$PQ = 0$ if and only if $P = Q$

__Exercise__. _Show $PQ = -QP$_.

_Hint_: $0 = (P + Q)(P + Q) = PQ + QP$.

__Exercise__. _Show $(aP + bQ)(cP + dQ) = (ad - bc)PQ$_.

The coefficient $ad - bc$ is the determinant of the matrix $\begin{bmatrix}a & b\\ c&d\end{bmatrix}$.
This generalizes to any number of dimensions.

...More stuff...

# $\RR^n$

The usual definition of the _vector space_ $\RR^n$ over the _real numbers_ $\RR$
is the set of all $n$-tuples of real numbers $\{x = (x_1,\ldots,x_n)\mid x_j\in\RR, 1\le j\le n\}$.
It has a _scalar multiplication_ $a(x_1,\ldots,x_n) = (ax_1,\ldots,ax_n)$, $a\in\RR$ and
_vector addition_ $(x_1,\ldots,x_n) + (y_1,\ldots,y_n) = (x_1 + y_1,\ldots,x_n + y_n)$
that satifies the _distributed laws_ $a(x + y) = ax + ay$ and $(a + b)x = ax + bx$, $a,b\in\RR$.

Vector addition is an _abelian group_. Addition is associative $x + (y + z) = (x + y) + z$
and commutative $x + y = y + x$. It has an _identity element_ $\bs{0} = (0,\ldots,0)$
and _additive inverse_ $-(x_1,\ldots,x_n) = (-x_1,\ldots,-x_n)$.

__Exercise__. _Show $(-1)x = -x$ for $x\in\RR^n$_.

__Exercise__. _Show $x + (-x) = \bs{0}$_.

We write $x - y$ for $x + (-y)$.

__Exercise__. _Show $1x = x$ for $x\in\RR^n$_.

__Exercise__. _Show $x + x = x$ implies $x = \bs{0}$_.

_Hint_: If $x + x = x$ then $(x + x) - x = x - x$.

There is a different, but equivalent, way to define $\RR^n$. 
Let $\bs{n} = \{1,\ldots,n\}$
and define $\RR^{\bs{n}} = \{\bs{x}\colon\bs{n}\to\RR\}$, the
set of all functions from $\bs{n}$ to $\RR$.
Scalar multiplication and vector addition are defined _pointwise_.
$(ax)(i) = a(x(i))$ and $(x + y)(i) = x(i) + y(i)$.

The first definition of $\RR^n$ is that it is a product of $n$ copies of $\RR$.
The second definition uses the _set exponential_ $B^A = \{f\colon A\to B\}$,
the set of all functions from $A$ to $B$.
They are in one-to-one correspondence by $x_i = \bs{x}(i)$, $i\in\bs{n}$.
Scalar multiplication and vector addition are preserved by this equivalence
so we call it an _isomorphism_ (same form).

__Exercise__. _Show $a(x_1,\ldots,x_n) = (ax_1,\ldots,ax_n)$
corresponds to $(a\bs{x})(i) = a(\bs{x}(i)$_.

__Exercise__. _Show $(x_1,\ldots,x_n) + (y_1\ldots,y_n) = (x_1 + y_1,\ldots,x_n + y_n)$
corresponds to ${(\bs{x} + \bs{y})(i) = \bs{x}(i) + \bs{y}(i)}$_.

This shows the function $\RR^n\to\RR^{\bs{n}}$ by $x\mapsto\bs{x}$ is a
_linear operator_ that preserves scalar multiplicaton and vector addition.

# $\RR^I$

We will drop the bold face type and define $\RR^I = \{I \to \RR\}$
for any _index set_ $I$ and try to convince you this is a righter way
to think about vector spaces.

## Standard Basis

For $i\in I$ define $e_i\in\RR^I$ by $e_i(j) = \delta_{ij}$ where
$\delta_{ij} = 1$ if $i = j$ and $\delta_{ij} = 0$ if $i\not=j$
is the _Kronecker delta_.

### Span

__Exercise__. _Show $x = \sum_{i\in I} x(i) e_i$ for $x\in\RR^I$._

_Hint_: $x(j) = \sum_{i\in I} x(i) e_i(j)$.

This shows the standard basis spans $\RR^I$.

The _span_ of a set of vectors is the smallest subspace containing the vectors.

__Exercise__. _Show the span of $x_i$, $i\in\bs{n}$ is
the set of _linear combinations_ $\{\sum a_i, x_i\mid a_i\in\RR\}$_.

_Hint_. The set contains $x_i$ for $i\in\bs{n}$ and is a vector space.

### Independence

__Exercise__. _Show $\sum_i a_i e_i = \bs{0}$ implies $a_i = 0$ for $i\in I$_.

This shows the standard basis in independent.

Vectors $x_i$, $i\in\bs{n}$, are _independent_ if $\sum_i a_i v_i = \bs{0}$
implies $a_i = 0$ for all $i\in\bs{n}$.

__Exercise__. _Show if $x_1,\ldots,x_n$ are not independent then there
exists $j$ with $x_j = \sum_{i\not=j} b_i x_i$ for some $b_i\in\RR$_.

_Hint_: We have $\sum_i a_i x_i = \bs{0}$ with some $a_j\not=0$.

## Standard Dual Basis

The _dual_ of $\RR^I$ is the set of linear operators from $\RR^I\to\RR$.

## Curry

Haskell Curry was a logician who extended Alonso Church's lambda calculus.

_Currying_ and _uncurrying_ provides the connection between set exponential and cartesian product.
The set ${A\times B\to C}$ is in one-to-one correspondence with
the set $\{\{A\to\{B\to C\}\}\}$. Given ${f\in\{A\times B\to C\}}$ define
${\curry f\colon A\to\{B\to C\}}$ by ${((\curry f)(a))(b) = f(a,b)}$.
The inverse is _uncurrying_. Given ${g\in\{A\to\{B\to C\}\}}$ define
${\uncurry g\colon A\times B\to C}$
by ${(\uncurry g)(a,b) = (g(a))(b) = (ga)b}$.

__Exercise__. _Show $\uncurry(\curry f) = f$ and $\curry(\uncurry g) = g$_.

The connection between cartesion product and exponential is
$C^{A\tims B}\cong $C^{B^A}$ where $\cong$ indicates equivalence.
If we write $B^A$ as $\{A\to B\}$ this becomes
$\{A\times B\to C\} \cong \{A\to \{B\to C\}\}$.

## Subspace

A _subspace_ of a vector space $V$ is a subset $U\subseteq V$
that is closed under scalar multiplication and vector addition.

__Exercise__. _If $U$ is a subspace of $V$ then $\RR U\subseteq U$_.

_Hint_: $\FF U = \{au\mid a\in\FF, u\in U\}$.

__Exercise__. _If $U$ is a subspace of $V$ then $U + U\subseteq U$_.

_Hint_: $U + U = \{u + u'\mid u,u'\in U\}$.

### Basis

A set of independent vectors that span a vector space is a _basis_.

## Invariant Subspace

If $T\colon V\to V$ is a linear operator then clearly $TV\subseteq V$. 
If $U$ is a subspace of $V$ and $TU\subseteq U$ then $U$ is an _invariant subspace_
of the operator $T$.
How can we find all invariant subspaces of an operator?

If $Tv = \alpha v$ for some $v\in V$ and $\alpha\in\FF$
we say $v$ is an _eigenvector_ of $T$ with _eigenvalue_ $\alpha$.

__Exercise__. _If $v$ is an eigenvalue of $T$ then
$\FF v = \{av\mid a\in\RR\}$ is an invariant subspace of $T$_.

__Exercise__. _If $Tv = \alpha v$, $Tw = \beta w$, and $\alpha\not=\beta$ then
$v$ and $w$ are independent_.

_Hint_: If $v$ and $w$ are not independent then $v = \gamma w$ for some
$\gamma\in\RR$. 

If the eigenvectors of $T$ form a basis of $V$ then $T$ is _diagonalizable_.

__Exercise__. _If $T$ is diagonalizable with eigenvalues $\alpha$
then $\Pi_j (T - \alpha I) = 0$_.


