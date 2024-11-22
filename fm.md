---
title: Financial Modeling
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
---

\renewcommand\o[1]{\overline{#1}}
\renewcommand\AA{\mathcal{A}}


In "A Simple Approach to the Valuation of Risky Streams"
Stephen Ross[@Ros1978] showed

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator, $L$_.

As shown in [Unified Model](https://keithalewis.github.io/math/um1.html),
Ross's linear valuation operators correspond to _deflators_: adapted,
positive, finitely-additive measures indexed by trading time.  A model
of (vector-valued) prices $(X_t)$ and cash flows $(C_t)$, depending only
on information available at time $t$, $\AA_t$, is arbitrage free
if and only if there exists a deflator with

$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u}C_s D_s)|_{\AA_t}
$$
where $|$ indicates restriction of measure. Recall a function
times a measure is a measure and the conditional expectation
${Y = E[X|\AA]}$ if and only if
$Y(P|_{\AA}) = (XP)|_{\AA}$,
where $P$ is a probability measure.

If $(M_t)$ is s vector-valued martingale measure then
$$
	X_t D_t = M_t - \sum_{s\le t}C_s D_s
$$
is an arbitrage-free model of prices and cash flows.  For example,
the Black-Scholes/Merton model with no dividends corresponds to $X_t =
(r\exp(\rho t), s\exp(\rho t + \sigma B_t - \sigma^2 t/2))$, $C_t =
(0, 0)$ and ${D_t = \exp(-\rho t)P|_{\AA_t}}$ where $(B_t)$
is Brownian motion, $P$ is Wiener measure, and ${\AA_t}$ is the
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
existing positions and the last trades at prevailing market prices.
A simple consequence of these definitions is
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u}A_s D_s)|_{\AA_t}
$$
Note how value $V_t$ in (2) corresponds to prices $X_t$ in (1),
likewise amount $A_t$ to cash flows $C_t$.

**Trading strategies create synthetic market instruments**.

A _derivative_ is a synthetic market instrument.
Its contract specifies a finite sequence of increasing stopping times
$\o{\tau}_j$ and amounts $\o{A}_j$ paid at these times.
A European option has a single constant stopping time $\bar{\tau}$ with payoff
${\o{A} = \phi(X_{\o{\tau}})}$ for some function $\phi$.

Suppose we could find a
a trading strategy $(\tau_j)$, $(\Gamma_j)$ with
$\sum_j \Gamma_j = 0$, $A_t = \o{A}_j$ when $t = \o{\tau}_j$
and is zero (self-financing) otherwise. The condition ${\sum_j \Gamma_j = 0}$
requires the hedge to be eventually closed.
This is a perfect hedge and the value of the derivative at time $t$
would be determined by equation (2): ${V_t D_t = (\sum_{\o{\tau}_j > t} \o{A}_j D_{\o{\tau}_j})|_{\AA_t}}$.

Perfect hedges do not exist in practice.
A fundamental (unsolved) problem in mathematical finance is how to hedge a
derivative when a perfect hedge does not exist.
A first attempt at a solution
is to assume a perfect hedge exists.
The initial hedge at $\tau_0 = 0$ can be computed from $V_0 = \Gamma_0\cdot X_0$
and ${V_0 D_0 = (\sum_{\o{\tau}_j > t} \o{A}_j D_{\o{\tau}_j})|_{\AA_0}}$.
$$
	\Gamma_0 D_0 = D_{X_0}(\sum_{\o{\tau}_j > 0} \o{A}_j D_{\o{\tau}_j})|_{\AA_0},
$$
where $D_{X_0}$ is the Fréchet derivative.
For $\tau_1 = t > 0$ we have $V_t = (\Delta_t + \Gamma_t)\cdot X_t$ so
$$
	(\Delta_t + \Gamma_t) D_t = D_{X_t}(\sum_{\o{\tau}_j > t} \o{A}_j D_{\o{\tau}_j})|_{\AA_0}.
$$
For $t > 0$ sufficiently small we have $\Delta_t = \Gamma_0$ so we can solve for $\Gamma_t$.
This procedure does not specify what value $\tau_1 = t$ to choose.

The classical Black-Scholes/Merton theory gives the ludicrous answer that 
you should trade "continuously". The Unified Model does not provide an
answer, it only puts your nose directly in the problem mathematical finance
has heretofore completely failed to answer: given an existing hedge, when
and how much do you rehedge?

## Deflators

If repurchase agreements exists then there is a canonical choice for the deflators.
A repurchase agreement with rate $f_t$, known at time $t$, has price 1 at
time $t$ and pays $\exp(f_t\,dt)$ at time $t + dt$.
For any deflator $(D_t)$ equation (1) gives
${1 D_t = (\exp(f_t\,dt)D_{t + dt})|_{\AA_t} = \exp(f_t\,dt)D_{t + dt}|_{\AA_t}}$.
For a deflator with $D_{t + dt}$ known at time $t$ we have
${D_t = \exp(f_t\,dt)D_{t + dt}}$.
The _canonical deflator_ is ${D_t = \exp(-\int_0^t f_s\,ds)D_0}$.

The repurchase rates $(f_t)$ are called the _(continuously compounded) short rate process_.
_Every_ interest rate model is just a specific parameterization of this.
The deflators determine the prices of zero coupon bonds. If $D_t(u)$ is the price of
a zero coupon bond paying 1 unit at time $u$ then equation (1) implies
${D_t(u) D_t = D_u|_{\AA_t}}$ so the price is the Radon-Nikodym derivative.

The price of zero coupon bonds determine the value of all risk-free fixed income instruments.
