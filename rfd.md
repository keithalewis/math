---
title: Request for Design
classoption: fleqn
fleqn: true
---

\newcommand\RR{\boldsymbol{R}}
\renewcommand\AA{\mathcal{A}}

## Objective

Define a simple mathematical model of the financial world
that can be implemented with existing technology to provide
real-time valuation, hedging, and risk management tools
that financial firms find useful.

## Context

Historically, companies set up departments for each
instrument class: equities, fixed income, foreign exchange, commodities, etc.
Ad hoc approaches have had limited success in modeling the joint distributions between these.

New tools for addressing this problem are now available.

The video game market made it profitable to manufacture chips specialized for
rendering pixels on a screen. Eventually people figured out how to use them
for cheap compute power if their problem was similar to rendering pixels.

LLM dead end

CCA

World Model.

Financial companies need mathematical models that can be
implemented in software by people who do not understand
business or mathematics.
[Programming as Theory Building](https://gwern.net/doc/cs/algorithm/1985-naur.pdf)

## Initial Goal

Replace the Black-Scholes/Merton model with a modern version of the Ross model.
Ross extended their theory from a bond, stock, and option to any collection of
instruments and that instrument valuation involves only geometry. 
There is no need for probability, much less Ito's lemma involving partial differential equations.
The B-S/M model is a special case.

He defined a cash flow as a jump in stock price. Adding a knob for cash
flows 


## Model

Let $T$ be the set of trading times, $I$ the set of tradeable instruments,
$\Omega$ the set of possible outcomes, and $(\AA_t)_{t\in T}$ partitions of $\Omega$
where $\AA_t$ is a partition of $\Omega$ indicating the information available at time $t\in T$.
See [Mathematical Prerequisites](#mathematical-prerequisites).

_Prices_ and _cash flows_ are bounded functions $X_t,C_t\colon\AA_t\to\RR^I$ where
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
instruments and positive adapted measures (_deflators_) $(D_t)_{t\in T}$ satisfying
$$
	X_t D_t = X_0 M_t - \sum_{s\le t} C_s D_s
$$
where $M_0(\Omega) = 1$ and $D_0(\Omega) = 1$[^1].
If the model includes repurchase agreements then deflators are the stochastic discount.

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
Note how prices corresponds t value and cash flows correspond to amount.

> Trading strategies are synthetic market instruments.

A (cash settled) derivative is a contract to pay amounts $(\hat{A}_j)$ at
stopping times $(\hat{\tau}_j)$, $0\le j\le n$.
A _perfect hedge_ is a trading strategy $(\tau_j,\Gamma_j)$ with $A_t = \hat{A}_j$ when $t = \hat{\tau_j}$
and is zero otherwise.

[^2]
[^2]:

## How much and when to trade

If a perfect hedge exists (it almost never does) then 
$$
	V_t D_t = (\sum_{\hat{\tau}_j > t} \hat{A}_j D_{\hat{\tau}_j})|\AA_t
$$
Note the right-hand side depends only on the contract specifications
and $(D_t)$.

Since $V_t = (\Delta_t + \Gamma_t)\cdot X_t$ its Fréchet derivative is
$$
	D_{X_t} V_t = \Delta_t + \Gamma_t.
$$
There is no position at $\tau_0 = 0$ so $\Gamma_0 = D_{X_{\tau_0}} V_{\tau_0}$
is a candidate for the initial hedge.

Given $\tau_1 > \tau_0$ we have
$\Gamma_1 = D_{X_{\tau_1}} V_{\tau_1} - \Gamma_0$ since $\Delta_{\tau_1} = \Gamma_0$.
This can be repeated with successive increasing stopping times.

There is no canonical way of choosing trading times.

## Instruments

In this section we identify instruments with prices and cash flows.

### Zero Coupon Bond

The _zero coupon bond_ $D(u)$ pays a unit cash flow at maturity $u$.
Given deflators $(D_t)$ it satisfies
$$
	X^{D(u)}_t D_t = (D_u|\AA_t), $u > t$.
$$
Writing $X^{D(u)}_t = D_t(u)$ we have $D_t(u)D_t = D_u|\AA_t$.

### Risky Bond

Suppose a bond can default at stopping time $\rho$ and has recovery $\rho$ as a fraction
of the value at default.

## Mathematical Prerequisites

We assume all sets are finite. Continuous time results can be recovered by taking limits.

Every finite dimensional vector space is isomorphic to $\RR^n$ but it is useful to 
keep track of where they come from. If $S$ is finite and $B(S)$ are (necessarily) bounded functions
from $S$ to $\RR$ then $n$ is the cardinality of $S$. The space of (finitely-additive)
measures $ba(S)$ on $S$ is isomorphic under the same condition.

Recall the dual of $B(S)$ is isometrically isomorphic to $ba(S)$ for any set $S$.
If $L\in B(S)^*$ define $\lambda\in ba(S)$ by $\lambda(A) = L(1_A)$ for $A\subseteq S$
where $1_A(s) = 1$ if $s\in A$ and $1_A(s) = 0$ if $s\not\in A$.
It is a measure since ${\lambda(A\cup B) = \lambda(A) + \lambda(B) - \lambda(A\cap B)}$
follows from $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$
and $\lambda(\emptyset) = 0$ since $1_\emptyset = 0$.
See [@DunSch1958] for the proof it is an isometery.


### Partition

If $\AA$ is a finite algebra of sets on $\Omega$ then the atoms of $\AA$
form a partition of $\Omega$ and the algebra is generated by the partition
of its atoms.

Information is modeled by a partition of sets on the
sample space $\Omega$ of all possible outcomes.
Complete information is the partition of singletons $\{\{\omega\}\mid\omega\in\Omega\}$
No information is singleton partition $\{\Omega\}$.
Partial information is knowing which atom $\omega$ belongs to.

A function on $\Omega$ is _measurable_ with respect to an algebra $\AA$ if and only
if it is constant on atoms of the partition. In this case it _is_ a function
on the atoms and we write $X\colon\AA\to\RR$.

### Fréchet Derivative

If $F\colon X\to Y$ is a function between normed linear spaces the Frechet derivative
$DF\colon X\to\mathcal{L}(X,Y)$ is defined by
$$
	F(x + h) = F(x) + DF(x)h + o(h), x,h\in X
$$
when it exists.


## References
