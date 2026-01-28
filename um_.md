
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

[@ros1978] demonstrated how to replace
the probabilistic theory of [@BlaMer1973] and [@Sch1973]
with a much simpler geometric theory.

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator_.

Ross made the assumptions continuous time trading is possible and
conflated cash flows with jumps in stock price.  e a finite number of
trades are possible and introduce an explicit variable for cash flows

## Math

The _set exponential_ $B^A = \{f\colon A\to B\}$ is the set of
all functions from $A$ to $B$.

If $B(S) = \{f\colon S\to\RR\mid \sup_{s\in S} |f(s)| < \infty\}$ is
the set of all bounded functions on $S$ then the dual of $B(S)$
can be identified with $ba(S)$, the set of finitely additive measures on $S$.

Conditional expectation can be replaced by restriction of measure.

Let $\Omega$ is a set, $P$ a probability measure on $\Omega$ and
$\AA$ is an algebra of sets on $\Omega$ and
$Y = E[X\mid\AA]$ is the conditional expectation of $X$,
then $Y(P|_\AA) = (XP)|_\AA$.

# References
