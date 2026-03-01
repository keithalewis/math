---
title: Vector Spaces done Righter
author: Keith A. Lewis
classoption: fleqn
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\FF{\bs{F}}

Sheldon Axler wrote a book called [Linear Algebra
Done Right](https://linear.axler.net/LADR4e.pdf) that
he has graciously made available under a [creative
commons](https://creativecommons.org/licenses/by-nc/4.0/) license.

<!--
He declared he hated determinants and left those to the last chapter in his book.
I did too in my first course on linear algebra until I learned about
[@Gra1844] 
-->

The usual definition of the vector space $\RR^n$
is the set of all $n$-tuples of real numbers $\{(x_1,\ldots,x_n)\mid x_j\in\RR, 1\le j\le n\}$
This is equivalent to $\RR^{\bs{n}} = \{\bs{x}\colon\bs{n}\to\RR\}$,
where $\bs{n} = \{1,\ldots,n\}$, by $x_j = \bs{x}(j)$, $j\in\bs{n}$.
Scalar multiplication and vector addition are preserved by this equivalence
so we call it an _isomorphism_ (same form).

__Exercise__. _Show $a(x_1,\ldots,x_n) = (ax_1,\ldots,ax_n)$
corresponds to $(a\bs{x})(i) = a(\bs{x}(i)$_.

__Exercise__. _Show $(x_1,\ldots,x_n) + (y_1\ldots,y_n) = (x_1 + y_1,\ldots,x_n + y_n)$
corresponds to $(\bs{x} + \bs{y})(i) = \bs{x}(i) + bs{y}(i)$_.

This shows the function $\iota\colon\RR^n\to\RR^{\bs{n}}$ by $x\mapsto\bs{x}$ is a
_linear operator_ that preserves scalar multiplicaton and vector addition.

$\RR$ to $FF$?

## Subspace

A _subspace_ of a vector space $V$ is a subset $U\subseteq V$
that is closed under scalar multiplication and vector addition.

__Exercise__. _If $U$ is a subspace of $V$ then $\RR U\subseteq U$_.

_Hint_: $\FF U = \{au\mid a\in\FF, u\in U\}$.

__Exercise__. _If $U$ is a subspace of $V$ then $U + U\subseteq U$_.

_Hint_: $U + U = \{u + u'\mid u,u'\in U\}$.

### Span

### Independence

### Basis

## Invariant Subspace

If $T\colon V\to V$ is a linear operator then clearly $TV\subseteq V$. 
If $U$ is a subspace of $V$ and $TU\subseteq U$ then $U$ is an _invariant subspace_.
How can we find all invariant subspaces of an operator?

If $Tv = \lambda v$ for some $v\in V$ and $\lambda\in\FF$
we say $v$ is an _eigenvector_ of $T$ with _eigenvalue_ $\lambda$.

__Exercise__. _If $v$ is an eigenvalue of $T$ then
$\FF v = \{av\mid a\in\RR\}$ is an invariant subspace of $T$_.

__Exercise__. _If $Tv = \lambda v$, $Tw = \mu w$, and $\lambda\not=w$ then
$v$ and $w$ are independent_.

If the eigenvectors of $T$ form a basis of $V$ then $T$ is _diagonalizable_.

__Exercise__. _If $T$ is diagonalizable with eigenvalues $\lambda_j$
then $\Pi_j (T - \lambda_j I) = 0$_.


