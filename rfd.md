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
across all asset classes.

## Context

Historically, companies set up departments for each
instrument class: equities, fixed income, foreign exchange, commodities, etc.
Ad hoc approaches have had limited success in modeling the joint distributions between these.
We describe a systematic approach amenable to machine learning.

Financial companies need mathematical models that can be
implemented in software by people who are not experts in
business or mathematics.
See [Programming as Theory Building](https://gwern.net/doc/cs/algorithm/1985-naur.pdf)

## Initial Goal

Replace the [@BlaSch1973] and [@Mer1973] model with a modern version of the [@Ros1978] model.
Ross extended their theory from a bond, stock, and option to any collection of
instruments and showed instrument valuation involves only geometry. 
There is no need for probability, much less Ito's lemma or partial differential equations.
The B-S/M model is a special case of Ross's model.

Ross defined a cash flow as a jump in stock price. Adding explicit notation for cash
flows results in a more expressive and simpler theory.

## Model

Let $T$ be a set of totally ordered trading times, $I$ the set of tradeable instruments,
$\Omega$ the set of possible outcomes, and $(\AA_t)_{t\in T}$ 
partitions of $\Omega$ indicating the information available at time $t\in T$.
See [Mathematical Prerequisites](#mathematical-prerequisites).

_Prices_ and _cash flows_ are bounded functions $X_t,C_t\colon\AA_t\to\RR^I$ where
$C_t = 0$ except when there is a cash flow.

A _trading strategy_ is finite collection increasing stopping times $(\tau_j)_{j=0}^n$
and trading amounts $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$ of the number of 
shares of each instrument purchased at time $\tau_j$.

Shares accumulate to a position $\Delta_t = \sum_{\tau_j < t} \Gamma_j$. 
Note the strict inequality -- it takes time for a trade to settle into a position.
We write this pointwise on $\Omega$ as $\Delta_t = \sum_{s < t} \Gamma_s$ where $\Gamma_s = \Gamma_j$
when $s = \tau_j$ and is zero otherwise.

The _value_, or mark-to-market, of a trading strategy is $V_t = (\Delta_t + \Gamma_t)\cdot X_t$.
It is the amount you would make if it were possible to unwind your existing position and
trades just executed at current market prices.

The _amount_ that shows up in your brokerage account or trade blotter is
$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$ -- you get cash flows associated
with the instruments you own proportional to your existing position and have to
pay for the trades just executed.

Arbitrage exists if there is a trading strategy with $A_{\tau_0} > 0$, $A_t\ge0$ for $t>\tau_0$,
and $\sum_j\Gamma_j = 0$ -- you make money on the first trade and never lose money until
the position is closed out.

Every arbitrage-free model is parameterized by
positive adapted measures, _deflators_, $(D_t)_{t\in T}$
and a vector-valued measure $M$ on $\Omega$ indexed by
instruments satisfying
$$
\tag{1}	X_t D_t = X_0 M_t - \sum_{s\le t} C_s D_s
$$
where $M_t = M|\AA_t$.
For example, the Black-Scholes/Merton model (with no dividends) is
${D_t = e^{-\rho t}P}$ and ${M_t = (1, e^{\sigma B_t - \sigma^2t/2})P}$ and
where $P$ is Wiener measure and $B_t$ is standard Brownian motion.

A _martingale measure_ $(M_t)$ satisfies $M_t = M_u|\AA_t$ if $t \le u$.
If $M$ is a measure on $\Omega$ then $M_t = M|\AA_t$ is a martingale measure.

If the model includes repurchase agreements then deflators are the stochastic discount.

An immediate consequence is
$$
\tag{2}	X_t D_t = (X_u D_u + \sum_{t < s\le u} C_s D_s)|\AA_t
$$
Using the definition of value and amount
$$
\tag{3}	V_t D_t = (V_u D_u + \sum_{t < s\le u} A_s D_s)|\AA_t
	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|\AA_t
$$
Using the definition of value and amount
$$
	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|\AA_t
$$
Note how prices corresponds to value and cash flows correspond to amount.

> Trading strategies create synthetic market instruments.

## Derivative

A (cash settled) derivative is a contract to pay amounts $(\hat{A}_j)$ at
stopping times $(\hat{\tau}_j)$, $0\le j\le n$.
A _perfect hedge_ is a trading strategy $(\tau_j,\Gamma_j)$ with $A_t = \hat{A}_j$ when $t = \hat{\tau_j}$
and is zero otherwise.

## Trading

If a perfect hedge exists (it almost never does) then by $(3)$
$$
	V_t D_t = (\sum_{\hat{\tau}_j > t} \hat{A}_j D_{\hat{\tau}_j})|\AA_t
$$
Note the right-hand side depends only on the contract specifications
and deflator $(D_t)$.

Since $V_t = (\Delta_t + \Gamma_t)\cdot X_t$ its Fréchet derivative is
$$
	D_{X_t} V_t = \Delta_t + \Gamma_t.
$$
There is no position at $\tau_0 = 0$ so $\Gamma_0 = D_{X_{\tau_0}} V_{\tau_0}$
is a candidate for the initial hedge.

Given $\tau_1 > \tau_0$ we have
$\Gamma_1 = D_{X_{\tau_1}} V_{\tau_1} - \Gamma_0$.
This can be repeated with successive increasing stopping times.

There is no canonical way of choosing trading times.
Choosing $\tau_j = j\Delta t$ and letting $\Delta t$ go to zero
results in the B-S/M model.

A better approach might be to choose $\Delta X$ and only trade when
the underlying moves by $\Delta X$. This can be efficiently implemented is futures exist.

A topic for future research is to find a trading strategy making $A_t - \hat{A}_t$
white noise with minimum variance a la [@Mar1952].

If you choose $\tau_j = j\Delta t$ and let $\Delta t$ go to zero then
you get the B-S/M model.

A better choice might be to specify a $\Delta X$ and only trade when
the underlying moves by that amount. If futures are available on $X$
this can reduce transaction costs.

Going back to [@Mar1952] and [@Roy1952] one might want to find
a trading strategy making $A_t$ white noise with minimum variance.

## Instruments

In this section we identify instruments by their prices and cash flows.

### Repurchase Agreement

A _repurchase agreement_, or _repo_, is specified by and effective date $t$,
a time interval $\Delta t$, and a rate $f$. Its price at time $t$ is 1
and has cash flow of $e^{f\Delta t} \approx 1 + f\Delta t$ at time $t + \Delta t$.
By (2) we have
$$
	1D_t = e^{f\Delta t}D_{t + \Delta t}|\AA_t
$$
If we assume $D_{t + \Delta t}$ is known at time $t$ then $D_t = e^{f\Delta t}D_{t + \Delta t}$.

Given increasing times $(t_j)$ and repo rates $(f_j)$ known at time $t_j$ we have
$$
D_{t_0} = e^{f_0 \Delta t_0}D_{t_1} = \cdots = e^{\sum_{0 \le j < k} f_j \Delta t_j}D_{t_k}
$$
where $\Delta t_j = t_{j+1} - t_j$. This provides the _canonical deflator_
${D_{t_k} = e^{-\sum_{0 \le j < k} f_j \Delta t_j}D_{t_0}}$.
The continuous time version of this is the usual _stochastic discount_ ${D_t = e^{-\int_0^t f_s\,ds}D_0}$
where $f_t$ is the continuously compounded instantaneous forward rate
at time $t$.

### Zero Coupon Bond

The _zero coupon bond_ $D(u)$ pays a unit cash flow at maturity $u$.
Given deflators $(D_t)$ it satisfies
$$
	X^{D(u)}_t D_t = D_u|\AA_t, u \ge t.
$$
Writing $X^{D(u)}_t = D_t(u)$ we have the price of a zero coupon bond at 
time $t$ maturing at $u$ is the Radon-Nykodym derivative $D_t(u) = d(D_u|\AA_t)/dD_t$,

### Risky Bond

Suppose a bond can default at stopping time $\rho$ and has recovery $\rho$ as a fraction
of the value at default.

### Stock with Dividends

### American Option

## Implementation


## Mathematical Prerequisites

We assume all sets are finite since every computer implementation is finite.
Continuous time results can be recovered by taking appropriate limits.

Every finite dimensional vector space is isomorphic to $\RR^n$ for some positive
integer $n$ but it is useful to keep track of where they come from.
If $S$ is finite and $B(S)$ are (necessarily) bounded functions
from $S$ and is isomorphic to $\RR^n$ where $n$ is the cardinality of $S$.
The space of (finitely-additive) measures $ba(S)$ on $S$ is also isomorphic 
to $\\R^n$ where $n$ is the cardinality of $S$.

Recall the vector space dual of $B(S)$ is isometrically isomorphic to
$ba(S)$ for any set $S$. 
These are distict mathematical types even though both are isomorphic to $\RR^n$.
If $L\in B(S)^*$ is a linear functional define the measure $\lambda\in ba(S)$
by $\lambda(A) = L(1_A)$ for $A\subseteq S$
where $1_A(s) = 1$ if $s\in A$ and $1_A(s) = 0$ if $s\not\in A$. 
It is a measure since ${\lambda(A\cup B) = \lambda(A) + \lambda(B) - \lambda(A\cap B)}$
follows from $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$ and $\lambda(\emptyset) = 0$
since $1_\emptyset = 0$.  See [@DunSch1958] for the details.

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


A _stopping time_ is a function $\tau\colon\Omega\to T$ where
$\{\omega\mid\tau(\omega) = t\}$ is in the algebra of sets generated by $\AA_t$
for all $t\in T$.

### Fréchet Derivative

If $F\colon X\to Y$ is a function between normed linear spaces the Frechet derivative
$DF\colon X\to\mathcal{L}(X,Y)$ is defined by
$$
	F(x + h) = F(x) + DF(x)h + o(h), x,h\in X
$$
when it exists.

## References
