---
title: Request for Design
classoption: fleqn
fleqn: true
---

\newcommand\RR{\boldsymbol{R}}
\renewcommand\AA{\mathcal{A}}

## Objective

Define a minimal rigorous mathematical model of the financial world.
It is a more ambitious and difficult project than
[Hilbert's 6th problem](https://en.wikipedia.org/wiki/Hilbert%27s_sixth_problem).

## Context

Financial companies need mathematical models that can be
implemented in software by people who do not understand
business or mathematics.
[Programming as Theory Building](https://gwern.net/doc/cs/algorithm/1985-naur.pdf)

## Model

Let $T$ be the set of trading times, $I$ the set of tradable instruments,
$\Omega$ the set of possible outcomes, and $(\AA_t)_{t\in T}$ partitions of $\Omega$
where $\AA_t$ is a partition of $\Omega$ indicating the information available at time $t\in T$.
See [#mathematical-prerequisites].

_Prices_ and _cash flows_ are functions $X_t,C_t\colon\AA_t\to\RR^I$ where
$C_t = 0$ except when there is a cash flow.

A _trading strategy_ is finite collection $(\tau_j, \Gamma_j)_{j=0}^n$ where the $\tau_j$ are increasing
stopping times and $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$ is the number of
shares of each instrument purchased at time $\tau_j$.

Shares accumulate to a position $\Delta_t = \sum_{\tau_j < t} \Gamma_j$. 
Note the strict inequality -- it takes time for a trade to settle into a position.
We write this pointwise on $\Omega$ as $\Delta_t = \sum_{s < t} \Gamma_s$ where $\Gamma_s = \Gamma_j$
when $s = \tau_j$ and is zero otherwise.

The _value_, or mark-to-market, of a trading strategy is $V_t = (\Delta_t + \Gamma_t)\cdot X_t$.
It is the amount you would make if it were possible to unwind your existing position and
trades just executed at current market prices.

The _amount_ that will show up in your brokerage account or trade blotter is
$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$ -- you get cash flows associated
with the instruments you own proportional to your existing position and have to
pay for the trades just executed.

Arbitrage exists if there is a trading strategy with $A_{\tau_0} > 0$, $A_t\ge0$ for $t>\tau_0$,
and $\sum_j\Gamma_j = 0$ -- you make money on the first trade and never lose money until
the position is closed out.

Every arbitrage-free model is parameterized by a vector-valued martingale measure $(M_t)_{t\in T}$ indexed by
instruments and positive adapted measures $(D_t)_{t\in T}$ satisfing
$$
	X_t D_t = X_0 M_t - \sum_{s\le t} C_s D_s
$$
where $M_0(\Omega) = 1$ and $D_0(\Omega) = 1$[^1].

[^1]: For example, the Black-Scholes/Merton model is $M_t = (1, e^{\sigma B_t - \sigma^2t/2})P$
and $D_t = e^{-\rho t}P$ where $P$ is Wiener measure and $B_t$ is standard Brownian motion.

An immediate consequence is
$$
	X_t D_t = (X_u D_u + \sum_{t < s le u} C_s D_s)|\AA_t
$$
Using the definition of value and amount
$$
	V_t D_t = (V_u D_u + \sum_{t < s le u} A_s D_s)|\AA_t
$$
Note how prices corresponds to value and cash flows correspond to amount.

Trading strategies are synthetic market instruments.

A (cash settled) derivative is a contract to pay amounts $(\hat{A}_j)$ at
stopping times $(\hat{\tau}_j)$, $0\le j\le n$.
A _perfect hedge_ is a trading strategy $(\tau_j,\Gamma_j)$ with $A_t = \hat{A}_j$ when $t = \hat{\tau_j}$
and is zero otherwise.

## How much and when to trade

If a perfect hedge exists (it almost never does) then 
$$
	V_t D_t = (\sum_{\hat{\tau}_j > t} \hat{A}_j D_{\hat{\tau}_j})|\AA_t
$$
Since $V_t = (\Delta_t + \Gamma_t)\cdot X_t$ its Frechet derivative is
$$
	D_{X_t} V_t = \Delta_t + \Gamma_t.
$$

## Mathematical Prerequisites

Forget what you know about sigma-algebras and Ito processes.
Computers can only represent finite data.

If $\AA$ is a finite algebra of sets on $\Omega$ then the atoms of $\AA$,
$A_\omega = \cap \{B\in\AA\mid \omega\in B\}$, form a partition of $\Omega$.

Information is modeled by a partiion of sets on the
sample space $\Omega$ of all possible outcomes.
Complete information is the partition of singletons $\{\omega\mid\omega\in\Omega\}$
No information is singlton partition $\{\Omega\}$.
Partial information is knowing which atom $\omega$ belongs to.

A function on $\Omega$ is _measurable_ with respect to a partition $\AA$ if and only
if it is constant on atoms of the partition. In this case it _is_ a function
on the atoms and we write $X\colon\AA\to\RR$.
