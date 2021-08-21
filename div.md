---
title: Dividends
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Dividend paying stock
...

\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}

This note describes how to incorporate dividends into stock valuation.
Recall the [Unified Model](um.html) shows arbitrage-free models are
parameterized by a vector-valued martingale $(M_t)_{t\in T}$ and
a positive deflator $(D_t)_{t\in T}$, where $T$ is the set of trading times.
The prices $(X_t)_{t\in T}$ and discrete cash flows $(C_t)_{t\in T}$
must satisfy
$$
	X_t D_t = M_t - \sum_{s\le t} C_s D_s, s < t.
$$

The Black-Scholes/Merton model of a bond and a stock uses the martingale
$M_t = (r, se^{\sigma B_t - \sigma^2 t/2})$ and deflator $D_t = e^{-\rho t}$.
The bond is a zero coupon bond having no cash flows. If the stock pays
dividend $d_j$ per share at $t_j$ then it has cash flows of $d_j S_{t_j}$ at $t_j$.
In this case we have
$$
S_t D_t = se^{\sigma B_t - \sigma^2 t/2} - \sum_{t_j\le t} d_j S_{t_j} D_{t_j}
$$
so the price of the stock is a linear combination of lognormal random variables.
We assume, as customary, this can be approximated by a lognormal.

Recall if $N$ is normal then $E[e^N] = e^{E[N] + \Var(N)/2)}$
so $E[e^{\sigma B_t - \sigma^2 t/2}] = 1$.
Letting $F_t = S_t D_t$ we have
$$
F_t = se^{\sigma B_t - \sigma^2 t/2} - \sum_{t_j\le t} d_j F_{t_j}
$$
and setting $f_j = E[F_{t_j}]$ gives
$$
E[F_t] = s - \sum_{t_j\le t} d_j f_j.
$$
Note $f_0 = s - d_0 f_0$ so $f_0 = s/(1 + d_0)$.
Taking $t = t_k$ yields $f_k = s - \sum_{j\le k} d_j f_j = f_{k-1} - d_k f_k$
so $f_k = s/\Pi_{j=0}^k(1 + d_j)$ hence
$$
E[F_t] = s - \sum_{t_k\le t} d_k f_k = s(1 - \sum_{t_k\le t} d_k/\Pi_{j=0}^k(1 + d_j)).
$$
