
---
title: Simple Unified Model
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Value, hedge, and manage the risk of any instruments
...

\newcommand{\RR}{\boldsymbol{R}}
\newcommand{\NN}{\boldsymbol{N}}
\renewcommand{\AA}{{\mathcal{A}}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

[@Ros1978] demonstrated how to replace
the probabilistic theory of [@BlaSch1973] and [@Mer1973]
with a much simpler geometric theory.

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator_.

Ross showed there is no need for Ito processes or partial differential
equations and generalized from a bond, stock, and option to
any collection of instruments.

Ross made the deleterious assumptions that continuous time trading is possible and
conflated cash flows with jumps in stock price.
Assuming only a finite number of trades are possible and introducing
an explicit variable for cash flows leads to an even simpler theory.

Every arbitrage free model can be parameterized by a vector-valued
martingale measure and a positive adapted measure.

## Math

The vector space of bounded functions on the set $S$ is
$B(S) = \{f\colon S\to\RR\mid \|f\| = \sup_{s\in S} |f(s)| < \infty\}$.
The dual of $B(S)$ can be identified with $ba(S)$,
the set of finitely additive measures on $S$.
For bounded $L\colon B(S)\to\RR$ define $\lambda(A) = L(1_A)$ for $A\subseteq S$ where
$1_A(s) = 1$ if $s\in A$ and $1_A(s) = 0$ otherwise.
Since $\lambda(A\cup B) = L(1_{A\cup B}) = L(1_A + 1_B - 1_{A\cap b}
= \lambda(A) + \lambda(B) - \lambda(A\cap B)$ and
$\lamba(\emptyset) = L(1_\emptyset) = L(0) = 0$ we have $\lambda$
is a finitely additive measure.

For $f\in B(S)$ define $M_f\colon B(S)\to B(S)$ by $M_fg = fg$
to be the linear operator of multiplication by $f$. Its
adjoint $M_f^*\colon ba(S)\to ba(S)$ defines how to multiply
a finitely additive measure by a bounded function.

An algebra of sets on a set $S$ is a collection of
subsets closed under union and complement.
If the algebra is finite then its atoms form a partition.
Conditional expectation can be defined by restriction of measure.
Given a set $\Omega$, an algebra $\AA$ of sets on $\Omega$, and
a probability measure $P$ on $\AA$.
If $Y = E[X\mid\AA]$ is the conditional expectation of $X$,
then $Y(P|_\AA) = (XP)|_\AA$ where the vertical bar indicates restriction.



## Simple Unified Model

Let $I$ be the set of tradeable instruments and
$T\subset [0,\infty)$ be possible trading times.



## References
