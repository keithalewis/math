---
title: Vector Space
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Classified by dimension
...

\newcommand\mb[1]{\mathit{#1}}
\newcommand\RR{\mb{R}}
\newcommand\FF{\mb{F}}

Let $\FF$ be a field and $I$ be a set.
The _set exponential_ $\FF^I = \{x\colon I\to\RR\}$ is a _vector space_
under pointwise addition and scalar multiplication,
$(x + y)(i) = x(i) + y(i)$ and $(ax)(i) = ax(i)$, $i\in I$, $x,y\in\FF^I$, $a\in\FF$.

The _standard basis_ is $\{\delta^i\}_{i\in I}$ where
$\delta^i\in \FF^I$ is defined by $\delta^i(j) = \delta_{ij}$, the Kronecker delta function,
for $j\in I$,

The _vector space dual_ of $\FF^I$ is $\FF_I = (\FF^I)^* = \{x^*\colon \FF^I\to\FF\}$.
The _standard dual basis_ is $\{\delta_i\}_{i\in I}$ where
$\delta_i\in \FF_I$ is defined by $\delta_i(\delta^j) = \delta_{ij}$, $j\in I$,
