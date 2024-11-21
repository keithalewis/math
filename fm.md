---
title: Financial Modelling
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
---

\newcommand\o[1]{\overline{#1}}
\newcommand\AA{\mathcal{A}}


In "A Simple Approach to the Valuation of Risky Streams"
Stephen Ross[@Ros1978] showed

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator, $L$_.

As shown in [Unified Model](https://keithalewis.github.io/math/um1.html),
Ross's linear valuaton operators correspond to _deflators_: adapted,
positive, finitely-additive measures indexed by trading time.  A model
of (vector-valued) prices $(X_t)$ and cash flows $(C_t)$, depending only
on information available at time $t$, $\AA_t$, is arbitrage free
if and only if

$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u}C_s D_s)|_{\AA_t}
$$
where $|$ indictes restriction of measure. Recall a function
times a measure is a measure and the conditional expectation
${Y = E[X\mid\AA]}$ if and only if ${Y(P|_\AA) =
(XP)|_\AA}$.

If $(M_t)$ is s vector-valued martingale measure then
$$
	X_t D_t = M_t - \sum_{s\le t}C_s D_s
$$
is an arbitrage-free model of prices and cash flows.  For example,
the Black-Scholes/Merton model with no dividends corresponds to $X_t =
(r\exp(\rho t), s\exp(\rho t + \sigma B_t - \sigma^2 t/2))$, $C_t =
(0, 0)$ and $D_t = \exp(-\rho t)P|_{\mathcal{A_t}}$ where $(B_t)$
is Brownian motion, $P$ is Weiner measure, and $\mathcal{A_t}$ is the
standard filtration.

A _trading strategy_ is a finite sequence $(\tau_j)$ of increasing
stopping times and vector-valued 
$(\Gamma_j)$, depending on information available at time $\tau_j$,
indicating the number of shares purchased at time $\tau_j$.
Let $\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s$ be the (settled) position at time $t$,
where $\Gamma_s = \Gamma_j$ if $s = \tau_j$ and is zero otherwise.

The _amounts_ $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$ show up in the
brokerage account during trading: you receive cash flows proportional to
existing positions and pay for trades just executed at the prevailing market prices.
The mark-to-market of the trading strategy at time $t$
is $V_t = (\Delta_t + \Gamma_t)\cdot X_t$. It the the _value_ of unwinding
existing positions and the last trade at prevailing market prices.
A simple consequence of these definitions is
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u}A_s D_s)|_{\AA_t}
$$
Note how the value in (2) corresponds to prices in (1), likewise amount to cash flows.

**Trading strategies create synthetic market instruments**.

A _derivative_ contract specifies a finite sequence of increasing stopping times
$\o{\tau}_j$ and amounts $\o{A}_j$ paid at these times.
Suppose we could find a
a trading strategy $(\tau_j)$, $(\Gamma_j)$ with
$\sum_j \Gamma_j = 0$, $A_t = \o{A}_j$ when $t = \o{\tau}_j$
and is zero (self-financing) otherwise. The condition ${\sum_j \Gamma_j = 0}$
requires the hedge to be eventually closed.
This is a perfect hedge and the value of the derivative at time $t$
would be determined by ${V_t D_t = (\sum_{\o{\tau}_j > t} \o{A}_j D_{\o{\tau}_j})|_{\AA_t}}$.

A fundamental (unsolved) problem in mathematical finance is how to hedge a
derivative when a perfect hedge does not exist.

There are no perfect hedges, but the initial trade is determined by
$V_0 = \Gamma_0\cdot X_0$
