---
title: Functional Calculus
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Apply a function to an operator
...

\newcommand\RR{\bm{R}}
\newcommand\CC{\bm{C}}
\newcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}

If $T\colon V\to V$ is a linear transformation then $p(T)$ is well-defined for
any polynomial $p$. This is the _polynomial functional calculus_.
Recall the _spectrum_, $σ(T)$, of an operator $T$ is the set of complex numbers $λ$
such that $T - λ I$ is invertable, where $I$ is the identity operator.
If $v$ is an eigenvector with eigenvalue $λ$ then $λ\in σ(T)$ since
$T - λ I$ has $v$ in its kernel.

__Exercise__. _If $V$ is finite dimensional its spectrum is the set of eigenvalues of $T$_.

The polynomial functional calculus can be used to find invariant subspaces.
For any polynomial $p$ the kernel of $p(T)$ is an invariant subspace for $T$
since $p(T)v = 0$ implies $p(T)Tv = Tp(T) = 0$.
If $λ\in σ(T)$ we can find a polynomial $p_λ$ with $p_λ(λ) = 1$ and $p = 0$ on the other points in the spectrum.
If ...

If $V$ has a norm we can use that to define a norm on operators $\|T\| = \sup_{\|v\| = 1}\|Tv\|$.

If $T$ is bounded then so is $σ(T)$ since $(T - λ I)^{-1} = \sum_{n\ge0} T^n/λ^{n+1}$
converges if $λ > \|T\|$. Since $λ\mapsto (T - λ I)^{-1}$ is continuous the complement
of the spectrum is an open set.

Let _little ell two_ be the vector space of square-summable sequences
$\ell^2 = \{(z_n):\sum_n |z_n|^2 < \infty\}$ where $z_n\in\CC$ are complex numbers.
This is a Hilbert space with inner product $z·w = \sum_n z_n\overline{w_n}$.
Define the _right shift operator_ $S\colon\ell^2\to\ell^2$ by
$S(z_0, z_1, \ldots) = (0, z_0, z_1,\ldots)$.

__Exercise__. _Show the right shift operator does not have any eigenvectors_.

_Hint_: If $Sz = λz$ then $0 = λz_0$, $z_1 = λz_0$, $\ldots$.

The _adjoint_ of the right shift operator is the _left shift operator_
$S^*(z_0, z_1, \ldots) = (z_1, z_2,\ldots)$. It has lots of eigenvectors.
If $z = (λ^n)$ then $S^*z = λz$ and $z\in\ell^2$ if $|λ| < 1$.


The polynomial functional calculus gives us a subspace for each point in the spectrum.

__Lemma__. (Spectral mapping theorem) _If $p$ is a polynomial then $p(σ(T)) = σ(p(T))$_.
