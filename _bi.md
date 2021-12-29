---
title: Binomial models
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Up, down
...

\newcommand{\RR}{\bm{R}}
\newcommand{\Var}{\operatorname{Var}}

Let $T$ be a totally ordered set and let $\Omega = \{0,1\}^T$.
Every $p\in [0,1]$ determies a probability measure $P$ on $\Omega$
by $P(\omega(t) = 1) = p$, $t\in T$.
Define $\omega_t\colon\Omega\to\RR$ by $\omega_t(\omega) = \omega(t)$.
Let $\mathcal{A}_n$ be the smallest algebra of sets on $\Omega$
for which $\{\omega_s : s\le t\}$ are measurable.

Define _random walk_ $W_t = \sum_{s\le t}\omega_s$ and $W_0 = 0$.

Note $P(W_t = k) \binom{t}{k}/2^t$, $E[W_t] = t(2p - 1)$ and $\Var(W_t) = tp$.

$P(Z = u) = p$, $P(Z = d) = 1 - p$. 

$E[Z] = up + d(1-p) = (u-d)p + d$, $E[Z] = 0$ implies $p = d/(u - d)$, $1 - p = u/(u - d)$.

$\Var(Z) = p u^2 + (1 - p)d^2 - ((u - d)p + d)^2$
= p u^2 + (1 - p)d^2 - (u - d)^2p^2 - 2(u - d)pd - d^2
= p u^2 + d^2 - pd^2 - (u - d)^2p^2 - 2(u - d)pd - d^2

$ud(u + d) = u - d$

$du^2 + (d^2 - 1)u + d = 0$

$b^2 - 4ac = (d^2 - 1)^2 - 4d^2 = -3d^2 - 2d^1 + 1 > 0$

$u = (\pm 1 - d^2 + sqrt{-3d^2 - 2d^1 + 1-3d^2 - 2d^1 + 1})/2d$

$(x - u)(x - d) = x^2 - (u + d)x + ud$
