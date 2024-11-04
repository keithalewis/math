---
title: Unwind Value
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
---

Let $S_t = S_0\exp(\mu t + \sigma B_t - \sigma^2t/2)$ be geometric Brownian motion
and $\overline{S}_t = \max_{0\le u\le t} S_u$ be its running maximum.

Let $t_0,\ldots,t_n$ be permitted _unwind_ times, $T$ a _horizon_ time, and $L$ a draw-down limit.
Define the unwind (stopping) time $\tau = \min\{t_j\mid \overline{S}_{t_j} - S_{t_j} > L\}$
and $\tau\wedge T = \min\{\tau, T\}$.

Calculate $P(\tau < T)$ (unwind before horizon), $fE[e^{-r(\tau\wedge T)}(\tau\wedge T)]$
(expected discounted time to the earlier of unwind or horizon) where $f$ is a fee and $r$ is the risk-free rate.

Input variables: $S_0$, $r$, $\sigma$, $(t_j)$, $T$, $L$, $IR$ (information ratio)

Dependent variables: $\mu = IR \sigma$.

Typically the $t_j$ are end of month dates and $T$ is 1 or 2 years.

Create a table for $IR\in\{0.5, 1, 1.5\}$ and $L = \{5, 7.5, 10\}$ with $S_0 = 100$,
$\sigma = 5\%$, $r = 4.5\%$, and $f = 1\%$.
