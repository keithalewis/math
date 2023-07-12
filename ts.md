---
title: Trading Strategies
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Primative operations
...

\newcommand{\RR}{\boldsymbol{R}}
\renewcommand{\AA}{{\mathcal{A}}}

The [Unified Model](um0.html) describes prices and cash flows.

A _trading strategy_ is an increasing sequence of stopping times $τ_j$
and functions $Γ_j\colon\AA_{τ_j}\to\RR^I$.
For every $ω\in Ω$ $(τ_j(ω))$ is a finite, increasing sequence of times.
We call this a _run_.

If $t$ is a run let $\{t\} = \{t_j\}$ be the set of times in the run $t$.
If $u$ is another run let $t\sqcup u$ be the disjoint union of $\{t\}$ and
$\{u\}$. Elements of the disjoint union have the form $(i, v)$ where
$i$ is either 0 or 1. If $i = 0$ then $v\in\{t\}$ and if $i = 1$
then $v\in\{u\}. The elements $(0, v)$ and $(1, v)$ for $v\in \{t\}\cap\{u\}$
are distinct.

Define an order on the disjoint union.
by $(i, v) < (j,w)$ if and only if $v < w$ or $v = w$ and $i < j$.

Trading strategies form a vector space. If $a\in\RR$ define $a(τ, Γ) = (τ, aΓ)$
to scale all trades by $a$.
