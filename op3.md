---
title: Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing and greeks
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\RR}{𝑹}

A cash settled European option on underlying $F$ pays $\nu(F)$
at expiration for some function $\nu\colon\RR\to\RR$.
Its forward value is $E[\nu(F)]$.

If the option pays off in shares its forward value
is $E[F\nu(F)] =fE[(F/f) \nu(F)] = fE^*[\nu(F)]$ where $f = E[F]$ and
the corresponding probablility measures have Radon-Nikodym
derivative $dP^*/dP = F/f$. If $F > 0$ then
$P^*$ is a probability measure since $E[F/f] = 1$.
We call $P^*$ the _share measure_.

A put with strike $k$ has payoff $\nu(F) = \max\{k - F, 0\} = (k - F)1(F\le k)$
where $1(F\le k) = 1$ if $F\le k$ and $1(F\le k) = 0$ if $F > k$.
Its forward value is
$$
\begin{aligned}
p &= E[(k - F)^+] \\
	&= E[(k - F) 1(F\le k)] \\
	&= kP(F\le k) - fE[F/f 1(F\le k)] \\
	&= kP(F\le k) - fP^*(F\le k) \\
\end{aligned}
$$

__Exercise__. Show $p =  (k - f)P(F\le k) + f(P(F\le k) - P^*(F\le k))$_.

_Hint_: $-P(F\le k) + P(F\le k) = 0$

__Exercise__. Show $p = (k - f)P(F\le k) + \Cov(F,1(F\le k))$_.

_Hint_: $\Cov(a + X, Y) = \Cov(X,Y) = E[XY] - E[X]E[Y]$ if $a is constant.

Note $\Cov(X, f(X)) < 0$ if $f$ is decreasing.

Suppose the underlying $F$ can only take on values $k_j$ with risk-neutral
probabilities $P(F = k_j) = q_j$ and put prices are available
$p_j = E[(k_j - F)1(F\le k_j)] = \sum_{i\le j} (k_j - k_i)q_i$.

We have 
$$
\begin{aligned}
p_{j+1} - p_j &= \sum_{i\le j+1} (k_{j+1} - k_i)q_i - \sum_{i\le j} (k_j - k_i)q_i \\
	&= 0 + \sum_{i\le j} (k_{j+1} - k_i)q_i - (k_j - k_i)q_i \\
	&= \sum_{i\le j} (k_{j+1} - k_j)q_i \\
	&= (k_{j+1} - k_j) \sum_{i\le j} q_i \\
\end{aligned}
$$
so $p'_j = \Delta p_j/\Delta k_j = \sum_{i\le j} q_i$ and
$p'_j - p'_{j-1} = q_j$.

Suppose the underlying $F$ can only take on values $k_j$ with risk-neutral
probabilities $P(F = k_j) = q_j$ and call prices are available
$x_j = E[(F - k_j1(F\ge k_j)] = \sum_{i\le j} (k_j - k_i)q_i$.

We have 
$$
\begin{aligned}
p_{j+1} - p_j &= \sum_{i\le j+1} (k_{j+1} - k_i)q_i - \sum_{i\le j} (k_j - k_i)q_i \\
	&= 0 + \sum_{i\le j} (k_{j+1} - k_i)q_i - (k_j - k_i)q_i \\
	&= \sum_{i\le j} (k_{j+1} - k_j)q_i \\
	&= (k_{j+1} - k_j) \sum_{i\le j} q_i \\
\end{aligned}
$$
so $p'_j = \Delta p_j/\Delta k_j = \sum_{i\le j} q_i$ and
$p'_j - p'_{j-1} = q_j$.
