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
processes, but are not necessarily an expert.  We provide a mathematically
rigorous model that extends [@Ros1978] without involving the Hahn-Banack theorem.
The Unified Model can be used on any set of instruments to value,
hedge, and understand how poorly risk-neutral pricing can be used for
managing risk. It does not provide a solution, only an initial
framework for further research. 

## Unified Model

Let $T$ be the set of trading times, $I$ the set of all market
instruments, $\Omega$ the sample space of possible outcomes, and
$(\AA_t)_{t\in T}$ be algebras of sets on $\Omega$ indicating the
information available at each trading time.

If $\AA$ is a finite algebra of sets on $\Omega$ then
the _atoms_ of $\AA$, $\underline{\AA}$, form a partition of $\Omega$.
A function $X\colon\Omega\to\RR$ is $\AA$ measurable if and
only if it is constant on atoms of $\AA$
so $X\colon\underline{\AA}\to\RR$ _is_ a function.

If $P$ is a probability measure on $\Omega$ and
$X\colon\Omega\to\RR$ is a random variable then
conditional expectation $Y = E[X|\AA]$ is equivalent
to restriction of measure $Y(P|A) = (XP)|\AA$.

### Market

_Price_ -- market price assuming perfect liquidity
: $X_t\colon\underline{\AA}_t\to\RR^I$

_Cash flow_ -- dividends, coupons, margin adjustments for futures
: $C_t\colon\underline{\AA}_t\to\RR^I$

### Trading

_Trading Strategy_ -- finite number increasing stopping times
: $\tau_0 < \cdots < \tau_n$ and trades $\Gamma_j\colon\underline{\AA}_{\tau_j}\to\RR^I$

_Position_ -- accumulate trades _not_ including last trade
: $\Delta_t = \sum_{\tau_j < t}\Gamma_j = \sum_{s < t} \Gamma_s$,

where $\Gamma_s = \Gamma_j 1(s = \tau_j)$.


### Valuation

_Value_ -- liquidate existing position and trades not yet settled at current market prices
: $V_t = (\Delta_t + \Gamma_t)\cdot X_t$

_Account_ -- cash flows proportional to position and pay for current trades
: $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$

### Arbitrage

_Arbitrage_ exists if there is a trading strategy
with $A_{\tau_0} > 0$, $A_t \ge 0$, $t > \tau_0$, and $\sum_{j} \Gamma_j = 0$.
The first trade makes money and subsequent trades never lose money.

The Fundamental Theorem of Asset Pricing states there is no arbitrage if and only
if there exist _deflators_, positive measures $D_t$ on $\AA_t$, ${t\in T}$, with
$$
\tag{1} X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|{\AA_t}
$$
A _martingale measure_ satisfies $M_t = M_u|\AA_t$ for $t \le u$.
Note if cash flows are zero then deflated prices are a martingale measure.
If $X_u D_u$ goes to zero as $u$ goes to infinity then prices are
determined by deflated future cash flows.

__Lemma__. If $X_t D_t = M_t - \sum_{s\le t} C_s D_s$ where $M_t$ is a martingale measue
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
can be computed from the derivative contract specification and the deflators $D_t$.
Since we also have $V_t = (\Delta_t + \Gamma_t)\cdot X_t$
the Frechet derivative $D_{X_t}V_t$
of option value with respect to $X_t$
is $\Delta_t + \Gamma_t$.

If time $T = \{t_j\}$ is discrete we can compute a possible hedge at each time,
$\Gamma_j = D_{X_j}V_j - \Delta_j$, since $\Delta_j$ is known at $t_{j-1}$.
In general this hedge will not exactly replicate the derivative contract obligation.

Note the Unified Model does not require Ito's formula, much less a proof involving
partial differential equations. One simply writes down a martingale and
deflator then uses equation (2) to value, hedge, and manage
the risk of realistic trading strategies.
The notion of "continuous time" hedging is a mathematical myth.

### Black-Scholes/Merton

The Black-Scholes/Merton model uses $M_t = (r, s\exp(\sigma B_t - \sigma^2t/2)P$,
where $B_t$ is Brownian motion, $P$ is Wiener measure, and the deflator
is $D_t = \exp(-\rho t)P$.

### Deflator

If repurchase agreements are available then a _canonical deflator_ exists.
A repurchase agreement over the interval $[t_j, t_{j+1}]$ is specified
by a rate $f_j$ known at time $t_j$. The price at $t_j$ is $1$ and it
has a cash flow of ${\exp(f_j(t_{j+1} - t_j))}$ at time $t_{j+1}$.
By equation (1) we have ${D_j = \exp(f_j\Delta t_j)D_{j+1}|\AA_j}$.
If $D_{j+1}$ is known at time $t_j$ then ${D_{j+1}/D_j = \exp(-f_j\Delta t_j)}$ and
${D_j = \exp(-\sum_{i < j}f_i\Delta t_i)}$ is the canonical deflator.

The continuous time analog is $D_t = \exp(-\int_0^t f(s)\,ds)$ where
$f$ is the continuously compounded instantaneous forward rate.

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
having day count convention $\delta$[^3] has two cash flows: $-1$ at time $t$
and $1 + f\delta(u,v)$ at time $u$. The _par forward coupon_ at time
$t$, $F_t^\delta(u,v)$ is the coupon for which the price is 0 at time $t$.
By equation (1) we have
$0 = (-D_u + (1 + F_t^\delta(u,v))D_v|\AA_t$ so
$$
	F_t^\delta(u,v) = \frac{1}{\delta(u,v)}\bigl(\frac{D_t(u)}{D_t(v)} - 1\bigr).
$$

A _swap_ is a collection of back-to-back forward rate agreements involving times $(t_j)$.
The _swap par coupon_ makes the price 0 at time $t$ so
$$
	F_t^\delta(t_0,\dots,t_n) = \frac{D_t(t_0) - D_t(t_n)}{\sum_{j=1}^n\delta(t_{j-1},t_j)D_t(t_j)}.
$$

[^3]: The _day count fraction_ $\delta(u, v)$ is approximately $v - u$ in years.

### Risky Bonds

Companies can default and may pay only a fraction of the notional owed on bonds they issued.
A simple model[^2] for this is to assume the time of default $T$ and recover $R$ are random variables.
The sample space for the default time is $[0,\infty)$ indicating the time of default.
The information available at time $t$ is the partition consisting of singletons
$\{s\}$, $s < t$ and the set $[t, \infty)$. If default occurs prior to $t$ then
we know exactly when it happened. If default has not occurred by time $t$ then
we only know it can occur any time after that.

[^2]: This is a very simplified model.

The cash flows for a risky bond $D^{T,R}(u)$ are 1 at time $u$ if $T > t$
and $RD(T)$ at time $T$ if $T \le t$. For the model to be arbitrage-free we must have
${D_t^{R,T}(u) D_t = \bigl(1(T > u)D_u + 1(T\le u)R D_T\bigr)|\AA_t}$
If the deflators are independent of the stopping time and recovery is $RD(T,u)$ at $T\le u$
for some constant $R$ then
using $D_T(u)D_T = D_u|\AA_t$ for $T \le u$ we have
$$
	D_t^{T,R}(u) D_t P(T > t) = \bigl(P(T > u) + R P(t < T \le u)\bigr)D_u|\AA_t.
$$
The _credit spread_ $\lambda_t^{T,R}(u)$ is defined by
${D_t^{T,R}(u) = D_t(u)\exp(-\lambda_t^{T,R}(u) (u - t))}$.
Note if $T = \infty$ or $R = 1$ then the credit spread is zero.




<!--
### Binomial Model

Let $W_n$ be (symmetric) random walk. The model for bond and stock is
the martingale $M_n = (R_n, S_n)$ where $R_n = r$ and $S_n = s\exp(\sigma W_n)/\cosh^n(\sigma))$
and the deflator $D_n = 1$ assumes zero interest rate.

$V_0 = E[\nu(S_n)]$

$\Gamma = (M, N)$.
-->



