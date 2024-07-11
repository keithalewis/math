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
rigorous model that extends [@Ros1978] without involving the Hahn-Banach
theorem.  It also does not involve probability measures,
Brownian motion, the Ito formula, or partial differential equations.
As Ross observed, the Fundamental Theorem of Asset Pricing involves only
geometry, not probability.  The Unified Model can be used for any set
of instruments to value, hedge, and understand how poorly risk-neutral
pricing can be used for managing risk. It does not provide a solution,
only an initial framework for further research.  For proofs and more
details see [Unified Model](um.html).


## Unified Model

Let $T$ be the set of trading times, $I$ the set of all market
instruments, $\Omega$ the sample space of possible outcomes, and
$(\AA_t)_{t\in T}$ be algebras of sets on $\Omega$ indicating the
information available at each trading time.

### Preliminaries

If $\AA$ is a finite algebra of sets on $\Omega$ then
$[\omega] = \cap\{A\in\AA\mid\omega\in A\}$ is the _atom_ of $\AA$ containing ${\omega\in\Omega}$.

__Exercise__. _If $B\subseteq[\omega]$ and $B\in\AA$ then
$B = \emptyset$ or $B = [\omega]$_.

__Exercise__. _The atoms of $\AA$, $[\AA]$, form a partition of $\Omega$_.

A partition represents partial information. Complete information is knowing
$\omega\in\Omega$. Partial information is knowing only which atom of
the partition $\omega$ belongs to.

A function $X\colon\Omega\to\RR$ is $\AA$ measurable if and
only if it is constant on atoms of $\AA$
so $X\colon[\AA]\to\RR$ _is_ a function.

If $P$ is a positive measure with mass 1 on
$\Omega$ and $X\colon\Omega\to\RR$ is a random variable then conditional
expectation $Y = E[X|\AA]$ is equivalent to restriction of measure $Y(P|_\AA)
= (XP)|_\AA$.

### Market

_Price_ -- $X_t\colon[\AA_t]\to\RR^I$
market prices assuming perfect liquidity.

_Cash flow_ -- $C_t\colon[\AA_t]\to\RR^I$
dividends, coupons, margin adjustments for futures.

### Trading

_Trading Strategy_ -- $\tau_0 < \cdots < \tau_n$ stopping times
and trades $\Gamma_j\colon[\AA_{\tau_j}]\to\RR^I$

_Position_ -- $\Delta_t = \sum_{\tau_j < t}\Gamma_j = \sum_{s < t} \Gamma_s$
accumulate trades _not_ including last.

### Accounting

_Value_ -- $V_t = (\Delta_t + \Gamma_t)\cdot X_t$
mark-to-market existing positions and current trades at current prices.

_Account_ -- $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$
receive cash flows proportional to existing positions and pay for trades just executed.

### Arbitrage

_Arbitrage_ exists if there is a trading strategy
with $A_{\tau_0} > 0$, $A_t \ge 0$, $t > \tau_0$, and $\sum_j \Gamma_j = 0$.
The first trade makes money and subsequent trades never lose money.

The Fundamental Theorem of Asset Pricing states there is no arbitrage if and only
if there exist _deflators_, positive measures $D_t$ on $\AA_t$, ${t\in T}$, with
$$
\tag{1} X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}
$$
A _martingale measure_ satisfies $M_t = M_u|\AA_t$ for $t \le u$.
Note if cash flows are zero then deflated prices are a martingale measure.
If there are a finite number of cash flows then prices are
determined by deflated future cash flows.

__Lemma__. If $X_t D_t = M_t - \sum_{s\le t} C_s D_s$ where $M_t$ is a martingale measure
then there is no arbitrage.

__Lemma__. For any arbitrage free model and any trading strategy
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}
$$

Note how the value $V_t$ corresponds to price $X_t$ and account $A_t$
corresponds to $C_t$ in equations (2) and (1) respectively.
Trading strategies create synthetic market instruments.
This is the skeleton key to pricing derivative securities.

## Application

Suppose a derivative security specifies amounts $\overline{A}_j$ be paid at times $\overline{\tau}_j$.
If there is a trading strategy $(\tau_j, \Gamma_j)$
with $A_{\overline{\tau}_j} = \overline{A}_j$ for all $j$ and $A_t = 0$ otherwise (aka self-financing) then
a "perfect hedge" exists[^1].

[^1]: Perfect hedges never exist.

Note $V_t D_t = (\sum_{\tau_j > t} \overline{A}_j D_{\overline{\tau}_j})|_{\AA_t}$
can be computed from the derivative contract specification and the deflators $D_t$.
Since we also have $V_t = (\Delta_t + \Gamma_t)\cdot X_t$,
the Frechet derivative $D_{X_t}V_t$
of option value with respect to $X_t$
is $\Delta_t + \Gamma_t$ so $\Gamma_t = D_{X_t}V_t - \Delta_t$.
Since $\Delta_t$ is known at time $t$, this gives a recipe for
computing a trading strategy.
In general this hedge will not exactly replicate the derivative contract obligation.

The Unified Model does not prescribe _when_ the hedge should be executed.
This is an important unsolved fundamental problem in the theory of Mathematical Finance.
The Black-Scholes/Merton solution is to hedge "continuously".
The notion of continuous time hedging is a mathematical myth.
Every trading strategy ever executed in the real world involves
only a finite number of trades.

Note delta hedging drops out naturally from the Unified Model, however it
does not require Ito's formula, much less a proof
involving partial differential equations and changing a measure that
is immediately discarded. One
simply writes down a martingale and deflator then uses equation (2)
to value, hedge, and manage the risk of realistic trading strategies.

### Black-Scholes/Merton

The Black-Scholes/Merton model uses ${M_t = (r, s\exp(\sigma B_t - \sigma^2t/2))P}$,
where $B_t$ is Brownian motion, $P$ is Wiener measure, and the deflator
is $D_t = \exp(-\rho t)P$.

More generally, if $X_t$ is a Levy process where $X_1$ has mean zero and variance one
then ${M_t = (r, s\exp(\sigma X_t - \kappa_t(\sigma)))P}$ is an arbitrage-free model,
where $\kappa_t(\sigma) = \log E[\exp(\sigma X_t)]$ is the cumulant.

Every positive random variable with finite mean and log variance can be
written ${F = f\exp(sX - \kappa(s))}$ where ${f = E[F]}$, ${s^2 = \Var(\log F)}$,
$X$ has mean zero and variance 1, and ${\kappa(s) = \log E[\exp(sX)]}$.

We have 
$$
\begin{aligned}
E[\max\{k - F, 0\}] &= E[(k - F)1(F \le k)] \\
	&= kP(F\le k) - E[F] E[F/E[F] 1(F\le k) \\
	&= kP(F\le k) - fP^*(F\le k) \\
\end{aligned}
$$
where $dP^*/dP = F/E[F]$.

__Exercise__. _If $X$ is standard normal show ${E[\max\{k - F, 0\}] = kN(m) - fN(m - s)}$
where $N$ is the standard normal cumulative distribution and $m = (\log(k/f) + s^2/2)/s$_.

_Hint_: Use $E[\exp(sX) g(X)] = E[\exp(sX)] E[g(X + s)]$ if $X$ is standard normal.

__Exercise__. _Show in general $E[{\max\{k - F, 0\}] = kP(X\le m) - kP^*(X\le m)}$
where ${m = (\log(k/f) + \kappa(s))/s}$_.

### Deflator

If repurchase agreements are available then a _canonical deflator_ exists.
A repurchase agreement over the interval $[t_j, t_{j+1}]$ is specified
by a rate $f_j$ known at time $t_j$. The price at $t_j$ is $1$ and it
has a cash flow of ${\exp(f_j(t_{j+1} - t_j))}$ at time $t_{j+1}$.
By equation (1) we have ${D_j = \exp(f_j\Delta t_j)D_{j+1}|_{\AA_j}}$.
If $D_{j+1}$ is known at time $t_j$ then ${D_{j+1}/D_j = \exp(-f_j\Delta t_j)}$ and
${D_j = \exp(-\sum_{i < j}f_i\Delta t_i)}$ is the canonical deflator with $D_{t_0} = 1$.

The continuous time analog is $D_t = \exp(-\int_0^t f(s)\,ds)$ where
$f$ is the continuously compounded instantaneous forward rate.

### Zero Coupon Bond

A _zero coupon bond_ maturing at time $u$ has a unit cash flow at $u$.
In an arbitrage free model its price at time $t\le u$, $D_t(u)$
satisfies $D_t(u) D_t = D_u|_{\AA_t}$ so
$D_t(u)$ is the Radon-Nikodym derivative of $D_u|_{\AA_t}$ with respect to $D_t$.
Zero coupon bond prices are determined by the deflators.

A _fixed income_ instrument is a portfolio of zero coupon bonds.
If a bond pays $c_j$ at time $t_j$ its present value at time $t$ is
$$
	P_t = \sum_{t_j > t} c_j D_t(u_j).
$$

### Forward Rate Agreement

A _forward rate agreement_ with coupon $f$ over the interval $[u,v]$
having day count convention $\delta$[^3] has two cash flows: $-1$ at time $t$
and ${1 + f\delta(u,v)}$ at time $u$. The _par forward coupon_ at time
$t$, ${F_t^\delta(u,v)}$, is the coupon for which the price is 0 at time $t$.
By equation (1) we have
${0 = (-D_u + (1 + F_t^\delta(u,v))D_v|_{\AA_t}}$ so
$$
	F_t^\delta(u,v) = \frac{1}{\delta(u,v)}\left(\frac{D_t(u)}{D_t(v)} - 1\right).
$$

A _swap_ is a collection of back-to-back forward rate agreements involving times $(t_j)$.
The _swap par coupon_ making the price 0 at time $t$ is
$$
	F_t^\delta(t_0,\dots,t_n) = \frac{D_t(t_0) - D_t(t_n)}{\sum_{j=1}^n\delta(t_{j-1},t_j)D_t(t_j)}.
$$

__Exercise__. _Show if $n = 2$ the swap par coupon is the same as the par forward coupon_.

[^3]: The _day count fraction_ $\delta(u, v)$ is approximately $v - u$ in years.

### Risky Bonds

Companies can default and may pay only a fraction of the notional owed on bonds they issued.
A simple model[^2] for this is to assume the time of default $T$ and recovery $R$ are random variables.
The sample space for the default time is $[0,\infty)$ indicating the time of default.
The information available at time $t$ is the partition consisting of singletons
$\{s\}$, $s < t$ and the set $[t, \infty)$. If default occurs prior to $t$ then
we know exactly when it happened. If default has not occurred by time $t$ then
we only know it can occur any time after that.

[^2]: This is a very simplified model.

The cash flows for a risky bond $D^{T,R}(u)$ are 1 at time $u$ if $T > t$
and $RD_T$ at time $T$ if $T \le t$. For the model to be arbitrage-free we must have
$$
	D_t^{R,T}(u) D_t = \bigl(1(T > u)D_u + 1(T\le u)R D_T\bigr)|_{\AA_t}.
$$
Note if $T = \infty$ or $R = 1$ then ${D_t^{R,T}(u) = D_t(u)}$.

If the deflators are independent of the stopping time and recovery is $RD_T(u)$ at $T\le u$
for some constant $R$ then
using $D_T(u)D_T = D_u|_{\AA_T}$ for $T \le u$ we have
$$
	D_t^{T,R}(u) D_t P(T > t) = \bigl(P(T > u) + R P(t < T \le u)\bigr)D_u|_{\AA_t}
$$
The _credit spread_ $\lambda_t^{T,R}(u)$ is defined by
${D_t^{T,R}(u) = D_t(u)\exp(-\lambda_t^{T,R}(u) (u - t))}$.
In the above case
$$
	\lambda_t^{T,R}(u) = -\frac{\log(P(T > u) + R P(t < T \le u))}{u - t}.
$$



<!--
### Binomial Model

Let $W_n$ be (symmetric) random walk. The model for bond and stock is

$V_0 = E[\nu(S_n)]$

$\Gamma = (M, N)$.
-->


## Reference
