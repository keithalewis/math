---
title: Unified Model
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Value, hedge, and manage the risk of instruments
...

\newcommand{\RR}{\boldsymbol{R}}
\renewcommand{\AA}{{\mathcal{A}}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

This note assumes you are familiar with measure theory and stochastic
processes, but are not necesarily an expert.  We provide a mathematically
rigorous model for any set of instruments that can be used to value,
hedge, and understand how poorly risk-neutral pricing can be used for
managing risk. It does not provide a solution, only an initial
framework for for further research. 

## Unified Model

Let $T$ be the set of trading times, $I$ the set of all market
instruments, $\Omega$ the sample space of possible outcomes, and
$(\AA_t)_{t\in T}$ be algebras of sets on $\Omega$ indicating the
information available at each trading time.

If $\AA$ is a finite algebra of sets on $\Omega$ then
the _atoms_ of $\AA$, $\bar{\AA}$, form a partition of $\Omega$.
A function $X\colon\Omega\to\RR$ is $\AA$ measurable if and
only if it is constant on atoms of $\AA$
so $X\colon\bar{\AA}\to\RR$ is a function.

If $P$ is a probability measure on $\Omega$ and
$X\colon\Omega\to\RR$ is a random variable then
conditional expectation $Y = E[X|\AA]$ is equivalent
to restriction of measure $Y(P|A) = (XP)|\AA$.

### Market

_Price_ -- market price assuming perfect liquidity
: $X_t\colon\bar{\AA_t}\to\RR^I$

_Cash flow_ -- dividends, coupons, margin adjustments for futures
: $C_t\colon\bar{\AA_t}\to\RR^I$

### Trading

_Trading Strategy_ -- increasing stopping times
: $\tau_0 < \cdots < \tau_n$ and trades $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$

_Position_ -- accumulate trades not including last trade
: $\Delta_t = \sum_{\tau_j < t}\Gamma_j = \sum_{s < t} \Gamma_s$

### Valuation

_Value_ -- mark-to-market including last trade
: $V_t = (\Delta_t + \Gamma_t)\cdot X_t$

_Account_ -- trading account blotter
: $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$

### Arbitrage

_Arbitrage_ exists if there is a trading strategy
with $A_{\tau_0} > 0$, $A_t \ge 0$, $t > \tau_0$, and $\sum_{j} \Gamma_j = 0$.
The first trade makes money and subsequent trades never lose money.

The Fundamental Theorem of Asset Pricing states there is no arbitrage if and only
if there exist _deflators_, positive measures $D_t\colon\AA_t\to(0,\infty)$, ${t\in T}$ on $\Omega$, with
$$
\tag{1} X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|{\AA_t}
$$
Note if cash flows are zero then deflated prices are a martingale.
If there are a finite number of cash flows then prices are determined by deflated future cash flows.

__Lemma__. If $X_t D_t = M_t - \sum_{s\le t} C_s D_s$ where $M_t = M_u|{\AA_t}$, $t \le u$,
then there is no arbitrage.

__Lemma__. For any arbitrage free model and any trading strategy
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|{\AA_t}
$$

Note how the value $V_t$ corresponds to price $X_t$ and account $A_t$
corresponds to $C_t$ in equations (2) and (1) respectively.
Trading strategies create synthetic market instruments.
This is the skeleton key to pricing derivative securities.

## Application

Suppose a derivative security specifies amounts $\bar{A}_j$ be paid at times $\bar{\tau}_j$.
If there is a trading strategy $(\tau_j, \Gamma_j)$
with $A_{\bar{\tau}_j} = \bar{A}_j$ for all $j$ and $A_t = 0$ otherwise (aka self-financing) then
a "perfect hedge" exists[^1].

[^1]: Perfect hedges never exist.

Note $V_t D_t= (\sum_{\tau_j > t} \bar{A}_j D_{\bar{\tau_j}})|\AA_t$
can be computed from the deriviative contract specification and the deflators $D_t$.
Since $V_t = (\Delta_t + \Gamma_t)\cdot X_t$
we have $\Delta_t + \Gamma_t$, is the Frechet derivative $D_{X_t}V_t$
of option value with respect to $X_t$.

If time $T = \{t_j\}$ is discrete we can compute a possible hedge at each time,
$\Gamma_j = D_{X_j}V_j - \Delta_j$, since $\Delta_j$ is known at $t_{j-1}$.
In general this hedge will not exactly replicate the derivative contract obligation.

### Black-Scholes/Merton

The Black-Scholes/Merton model uses $M_t = (r, s\exp(\sigma B_t - \sigma^2t/2)P$,
where $B_t$ is Brownian motion and $P$
is Weiner measure The deflator is $D_t = \exp(-\rho t)$.

Note the Unified Model does not require Ito's formula and a proof involving
partial differential equations. One just writes down a martingale and
deflator then uses equation (2) to value, hedge, and manage
the risk of trading strategies that can be performed.
The notion of "continuous time" hedging is a mathematical myth.

### Deflator

If repurchase agreements are available then a _canonical deflator_ exists.
A repurchase agreement over the interval $[t_j, t_{j+}]$ is specified
by a rate $f_j$ known at time $t_j$. The price at $t_j$ is $1$ and it
has a cash flow of $\exp(f_j(t_{j+1} - t_j))$ at time $t_{j+1}$.
By equation (1) we have $D_j = \exp(f_j\Delta t_j)D_{j+1}|\AA_j$.
If $D_{j+1}$ is known at time $t_j$ then $D_{j+1}/D_j = \exp(-f_j\Delta t_j)$ and
$D_j = \exp(-\sum_{i < j}f_i\Delta t_i)$ is the canonical deflator.

The continuous time analog is $D_t = \exp(-\int_0^t f(s)\,ds)$ where
$f$ is the continuously componded instantaneous forward rate.

### Zero Coupon Bond

A _zero coupon bond_ maturing at time $u$ has a unit cash flow at $u$.
In an arbitrage free model its price at time $t\le u$, $D_t(u)$
satisfies $D_t(u) D_t = D_u|\AA_t$ so
$D_t(u)$ is the Radon-Nikodym derivative of $D_u|\AA_t$ with respect to $D_t$.

A _fixed income_ instrument is a portfolio of zero coupon bonds.
If a bond pays $c_j$ at time $t_j$ its present value at time $t$ is
$$
	P_t = \sum_{t_j > t} c_j D_t(u_j).
$$

Zero coupon bond prices are determined by the deflators.

### Forward Rate Agreement

A _forward rate agreement_ with coupon $f$ over the interval $[u,v]$
having day count convention $\delta$ has two cash flows: $-1$ at time $t$
and $1 + f\delta(u,v)$ at time $u$. The _par forward coupon_ at time
$t$, $F_t^\delta(u,v)$ is the coupon for which the price is 0 at time $t$.
By equation (1) we have
$0 = (-D_u + (1 + F_t^\delta(u,v))D_v|\AA_t$ so
$$
	F_t^\delta(u,v) = \frac{1}{\delta(u,v)}\bigl(\frac{D_t(u)}{D_t(v)} - 1\bigr).
$$

A _swap_ is a collection of back-to-back forward rate agreements.
The _swap par coupon_ makes the price 0 at time $t$ so
$$
	F_t^\delta(t_0,\dots,t_n) = \frac{D_t(t_0) - D_t(t_n)}{\sum_{j=1}^n\delta(t_{j-1},t_j)D_t(t_j)}.
$$

### Risky Bonds

Companies can default and may pay only a fraction of the notional owed on bonds they issued.
A simple model for this is to assume the time of default is a random variable $T$
and recovery $R$ is a constant fraction between 0 and 1.[^2]
The sample space for the default time is $[0,\infty)$ indicating the time of default.
The information available at time $t$ is the partition consisting of singletons
$\{s\}$, $s < t$ and the set $[t, \infty)$. If default occurs prior to $t$ then
we know exactly when it happend. If default has not occured by time $t$ then
we only know it can be any time after that.

The cash flows for a risky bond $D^{T,R}(u)$ are 1 at time $u$ if $T > t$
and $RD(T)$ at time $T$ if $T \le t$. For the model to be arbitrage-free we must have
$$
	D_t^{R,T}(u) D_t = (D_u 1(T > u) + RD_t 1(T\le u)|\AA_t.
$$
If the interest rate is 0 then $D_t = 1$ and
$D_0^{R,T} = P(T > u) + RP(T\le u)$.


We need to extend the sample space to model the default time, $\Omega' = \Omega\times [0,\infty)$.

[^2]: This is a very simplified model.


<!--
### Binomial Model

Let $W_n$ be (symmetric) random walk. The model for bond and stock is
the martingale $M_n = (R_n, S_n)$ where $R_n = r$ and $S_n = s\exp(\sigma W_n)/\cosh^n(\sigma))$
and the deflator $D_n = 1$ assumes zero interest rate.

$V_0 = E[\nu(S_n)]$

$\Gamma = (M, N)$.
-->



