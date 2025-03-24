<!--
:!pandoc -t html5 -s --katex=https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/ --css math.css ums.md -o ums.html
:!pandoc -V fontsize=12pt ums.md -o ums.pdf
-->
---
title: Simple Unified Model of Derivative Securities
classoption: fleqn
header-includes:
	- \usepackage{bm}
	- \usepackage{amsthm}
	- \usepackage{amssymb}
...
\newcommand\RR{\boldsymbol{R}}
\renewcommand\AA{\mathcal{A}}
\renewcommand\PP{\mathcal{P}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\ran}{\operatorname{ran}}
\renewcommand{\ker}{\operatorname{ker}}
\renewcommand{\qedsymbol}{\rule{1ex}{1ex}}
\newtheorem{thm}{Theorem}[section]
\newtheorem{lem}{Lemma}[section]
\newtheorem{clm}{Claim}[section]
\newtheorem{exa}{Example}[section]


Fischer Black, Myron Scholes [@BlaSch1973], and Robert C. Merton III
[@Mer1973], invented a Nobel Prize winning theory showing how to value
options by dynamically trading a bond and a stock.  Stephen Ross's
paper "A Simple Approach to the Valuation of Risky Streams" [@Ros1978]
extended the B-S/M theory by showing how to value a derivative using
any collection of instruments. He used the Hahn-Banach theorem to show

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator, $L$_.

This note identifies Ross's valuation operator and suggests an improvement
by placing cash flows on equal footing with prices.  In some sense,
cash flows are more important. The Fundamental Theorem of Asset Pricing
puts geometric constraints on arbitrage-free prices given cash flows.

Trading strategies create synthetic market instruments. If
a perfect hedge for a derivative instrument exists
it is determined by the Fréchet derivative of the option
value with respect to price.  The Simple Unified Model assumes every
hedge has only a finite number of trades, as is the case in the real
world. This implies perfect hedges do not, in general, exist.

The SUM specifies a rigorous mathematical model
that can be taught at the master's level.
Work remains for future researchers to determine when and how much to 
hedge in order to better manage the risk of this market reality.

## Prologue

This section reviews the mathematics required for the SUM with a view to how
it relates to classical Black-Scholes/Merton machinery.
The SUM does not involve probability. As Ross showed, the Fundamental Theorem
of Asset Pricing is a geometric result. We assume a sample space and filtration, but
do not require a probability measure.
We do not require Brownian motion, the Ito calculus, or partial differential
equations.

If an algebra $\AA$ of sets on $\Omega$ is finite then the atoms of the algebra form a
partition of $\Omega$ and a function $X\colon\Omega\to\RR$ is measurable with
respect to $\AA$ if and only if it is constant on atoms. In this case $X$ _is_
a function on the atoms and we write $X\colon\AA\to\RR$. A partition provides
partial information about outcomes. Full information is knowing which
$\omega\in\Omega$ occurred, partial information is knowing only which atom
$\omega$ belongs to. The partition of singletons represents complete information.
The partition consisting of the sample space represents no information.

The dual of bounded functions on $\Omega$, $B(\Omega)^*$, can be identified with
finitely additive measures on $\Omega$[@DunSch1958]. A linear functional
$L\in B(\Omega)^*$ defines a measure $\lambda(E) = L1_E$ for $E\subseteq\Omega$
where $1_E(\omega) = 1$ if $\omega\in E$ and $1_E(\omega) = 0$ if $\omega\in\Omega\setminus E$.
The facts $1_\emptyset = 0$ and $1_{E\cup F} = 1_E + 1_F - 1_{E\cap F}$, $E,F\subseteq\Omega$
show $\lambda$ is a measure.

Define $M_f\colon B(\Omega)\to B(\Omega)$ by $M_fg = fg$. Its adjoint
$M_f^*\colon ba(\Omega)\to ba(\Omega)$ defines multiplication of a
measure by a bounded function $f\lambda = M_f^*\lambda$.
The Radon-Nikodym derivative of $f\lambda$ with respect to $\lambda$ is $f$.

Recall if $P$ is probability
measure then conditional expectation of a random variable $X\colon\Omega\to\RR$
with respect to an algebra is defined
by $Y = E[X|\AA]$ if and only if $Y\colon\Omega\to\RR$ is $\AA$-measurable
and $\int_A Y\,dP = \int_A X\,dP$ for $A\in\AA$.
This is equivalent to $Y(P|_\AA) = (XP)|_\AA$ where the vertical bar indicates
restriction of measure. We do not use conditional
expectation in what follows, only restriction of measures to an algebra.

## One-Period Model

Let $I$ be the finite set of market instruments, $x\in\RR^I$ be their prices at the
beginning of the period, and $X\colon\Omega\to\RR^I$ be their prices at
the end of the period where $\Omega$ is the set of possible outcomes.
Recall the set exponential $\RR^I$ is the set of functions from $I$ to $\RR$.
The _dot product_ of $x,y\in\RR^I$ is $x\cdot y = \sum_{i\in I} x(i)y(i)$
and the _norm_ is $\|x\| = \sqrt{x\cdot x}$.
We assume $\|X\| = \sup_{\omega\in\Omega}\|X(\omega)\|$ is finite.

The initial cost of purchasing $\gamma$ shares of each instrument is $\gamma\cdot x$.
The proceeds from selling $\gamma$ shares
at the end of the period is $\gamma\cdot X(\omega)$ if $\omega\in\Omega$ occurs.
Arbitrage exists if there is a $\gamma\in\RR^I$ with $\gamma\cdot x < 0$
and $\gamma\cdot X\ge0$ on $\Omega$: you make money acquiring the shares and
never lose money liquidating them. Note this definition of arbitrage does
not involve probability[^1].

__Theorem__. (One-Period Fundamental Theorem of Asset Pricing)
_There is no arbitrage if and only if $x$ belongs to the smallest closed cone
containing the range of $X$. If $x^*$ is the nearest point in the
cone to $x$ then $\gamma = x^* - x$ is an arbitrage._

_Proof_.
The smallest closed cone containing the range of $X$
is ${\{\int_\Omega X\,dD\mid D\ge 0, D\in ba(\Omega)\}}$.
If $x = \int_\Omega X\,dD$ and $\gamma\cdot X\ge0$ on $\Omega$
then $\gamma\cdot x\ge 0$. This establishes the "easy" direction.

If $x$ does not belong to the smallest closed cone
containing the range of $X$ there is a unique closest point $x^*$
in the cone.
Let $\gamma = x^* - x$. We will show $\gamma\cdot x < 0$
and $\gamma\cdot y\ge0$ for every $y$ in the cone.

First we show $\gamma\cdot x < 0$.
We have ${\|x^* - x\| \le \|tx^* - x\|}$ for $t > 0$ so
${0\le (t^2 - 1)\|x^*\|^2 + 2(t - 1)x^*\cdot x}$.
The quadratic is non-negative and has a root at $t = 1$ so
its derivative there is ${0 = 2\|x^*\|^2 + 2x^*\cdot x = 2x^*\cdot(x^* - x)}$.
Since ${0 < \|x^* - x\|^2 = (x^* - x)\cdot(x^* - x) = -x\cdot(x^* - x)}$
we have ${\gamma\cdot x < 0}$.

If $y$ is in the cone then $ty + x^*$ is in the cone for $t \ge 0$ so
${\|x^* - x\|^2 \le \|ty + x^* - x\|^2}$ and
${0\le t^2\|y\|^2 + 2ty\cdot(x^* - x)}$.
Dividng by $t > 0$ and letting it go to 0 shows ${0\le y\cdot(x^* - x)}$.

Something is amiss with the one-period model. If the end of
the period is the end of trading then prices must be zero since
no future trading is possible. It also makes the assumption all shares
are liquidated at the end of the period. The final "prices"
are actually cash flows associated with holding the instruments 
and are paid in proportion to the initial position.
The multi-period model clarifies this.

## Multi-Period Model

Let $T$ be a finite totally ordered set of _trading times_,
$I$ the finite set of market _instruments_,
$\Omega$ the set of possible _outcomes_, and $(\AA_t)_{t\in T}$ 
be the _partitions_[^1] of $\Omega$ indicating the information available at time $t\in T$.

### Market

For each $t\in T$ let $X_t\colon\AA_t\to\RR^I$ be the _prices_[^2] of market instruments
and $C_t\colon\AA_t\to\RR^I$ the _cash flows_ of market instruments.
E.g., coupons, dividends, and futures margin adjustments are cash flows.
Futures have price 0.
We assume at each time $t\in T$ that prices and cash flows are bounded.

### Trading

A _trading strategy_ $(\tau_j, \Gamma_j)$ is a finite number
of strictly increasing stopping times $\tau_j$ and shares to purchase
in each instrument $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$ at $\tau_j$.

Trades accumulate to a _position_
$\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s$ where
${\Gamma_s = \Gamma_j 1_{\{\tau_j = s\}}}$. Note the strict inequality.
It takes time for a trade to settle and become a part of the position.

### Accounting

The _value_, or _mark-to-market_, of a trading strategy
is ${V_t = (\Delta_t + \Gamma_t)\cdot X_t}$ and represents
how much liquidating the current position and trades yet
to settle at current market prices would yield.
Trading strategies incur cash flow _amounts_ in the trading account
of ${A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t}$: you receive cash flows
proportional to existing positions and pay the current market price for trades just executed.

The one-period model
corresponds to a trading strategy $(t_0, \Gamma_0)$, $(t_1, -\Gamma_0)$.
At $t_0$ the trading account is charged $A_{t_0} = -\Gamma_0\cdot X_{t_0}$
and has value $V_{t_0} = \Gamma_0\cdot X_{t_0}$.
This makes the unrealistic assumption it is possible to
instantly buy and sell with no transaction costs.  If there are
no intermediate cash flows and then $A_t = 0$ for $t_0 < t < t_1$.
Unwinding at $t_1$ results in
${A_{t_1} = \Gamma_0 C_{t_1} + \Gamma_0\cdot X_{t_1}}$.
You get the cash flow at $t_1$ proportional to the position
put on at $t_0$ and close the position $\Gamma_0$ at the current price.

## Simple Unified Model

Arbitrage exists if there is a trading strategy with $A_{\tau_0} > 0$, $A_t \ge0$, $t > \tau_0$, and
$\sum_j \Gamma_j = 0$. You make money on the first trade and never lose money until
the position is closed.

Define $A\colon \oplus_t B(\AA_t, \RR^I)\to \oplus_t B(\AA_t)$
by ${A(\oplus_t \Delta_t) = \oplus_t (\Delta_t\cdot C_t - \Gamma_t\cdot X_t)}$.

The _Fundamental Theorem of Asset Pricing_ states there is no arbitrage if there exist _deflators_,
positive finitely additive measures $D_t$ on $\AA_t$, $t\in T$, with
$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}, t\le u.
$$
Deflators are the (not generally unique) valuation operator Ross identified.
We will see later that if repurchase agreements are available in
the market there is a canonical deflator that corresponds
to the stochastic discount.
A _money market account_ corresponds to reinvesting at the repo rate.
Its reciprocal is the _stochastic discount_.

__Claim__. _If $M_t = M_u|_{\AA_t}$, $t\le u$, is a $\RR^I$-valued martingale measure and
$D_t\in ba(A_t)$ are positive measures then
${X_t D_t = M_t - \sum_{s\le t} C_s D_s}$ is arbitrage-free_.

_Proof_. Substitute $X_u D_u$ by this formula in $(1)$ and cancel terms in the sums.

Every arbitrage-free model is a special case of this.

__Lemma__. _Assuming $(1)$ and the definitions of value and amount_
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}, t\le u.
$$

_Proof_.
Substitute $V_t$ by its definition on the left side of $(2)$ and
use $X_t D_t$ from $(1)$. Note $\Delta_t + \Gamma_t = \Delta_{t+\epsilon}$
for $\epsilon > 0$ sufficiently small. In this case
$V_t D_t = (V_u D_u + A_u D_u)|_{\AA_t}$ for $u = {t+\epsilon}$.
The result follows from induction.
__Example__. (Black-Scholes/Merton)
$M_t = (r, se^{\sigma B_t - \sigma^2t/2})P$, $C_t = (0,0)$,
$D_t = e^{-\rho t}P$ where $(B_t)$ is standard Brownian motion and $P$ is Wiener measure.

**Trading strategies create synthetic instruments where price corresponds
to value and cash flow corresponds to amount.**

A (cash settled) derivative contract is specified by stopping times ${\hat{\tau}_j}$ and cash
flows $\hat{A}_j$.  If there exists a trading strategy
$(\tau_j,\Gamma_j)$ with ${\sum_j \Gamma_j = 0}$, ${A_{\hat{\tau}_j} = \hat{A}_j}$
and ${A_t = 0}$ (self-financing) otherwise, then a perfect hedge exists[^2].
The value of the derivative instrument is determined by
$$
\tag{3}	V_t D_t = (\sum_{\hat{\tau}_j > t} \hat{A}_j D_{\hat{\tau}_j})|_{\AA_t}.
$$
Note the right hand side is determined by the contract specifications and deflator.
Assuming $\tau_0 = 0$, $V_0 = \Gamma_0\cdot X_0$ so the initial hedge $\Gamma_0$ is the Fréchet 
derivative $D_{X_0}V_0$ with respect to $X_0$.
Since $V_t = (\Gamma_t + \Delta_t)\cdot X_t$ we have
$\Gamma_t = D_{X_t}V_t - \Delta_t$. Note $\Delta_t$ is settled prior to time $t$.
This does not specify trading times $\tau_j > 0$.

The Black-Sholes/Merton model make the unrealistic assumption that continuous
time trading is possible. The SUM models what traders actually do, but does
not provide an answer to the question they all have, "When and how much
should I trade?" This model only provides a rigorous framework for
additional work on this fundamental question.

## Examples

### Zero Coupon Bond

A _zero coupon bond_ maturing at time $u$ has a single unit cash flow at $u$,
$C_u^{D(u)} = 1$ and $C_t^{D(u)} = 0$ for $t\not=u$.
In an arbitrage free model its price at time $t\le u$, $X_t^{D(u)} = D_t(u)$,
satisfies $D_t(u) D_t = D_u|_{\AA_t}$ so
$D_t(u)$ is the Radon-Nikodym derivative of $D_u|_{\AA_t}$ with respect to $D_t$.
If we assume $\AA_0$ is $\{\Omega\}$
and $D_0(\Omega) = 1$, then $D_0(u) = D(u) = D_u(\Omega)$.

Zero coupon bond prices are determined by the deflators.
These determine the value of any fixed income instrument.
If the instrument pays $(c_j)$ at time $(u_j)$ then
its value at time $t$ is
$$
	V_t = \sum_{u_j>t} c_j D_t(u_j)
$$

### Forward

A _forward contract_ on an underlying with price $S_t$ at $t\in T$ is specified
by a forward $f\in\RR$ and an expiration $u\in T$. It has a single cash flow
$S_u - f$ at $u$. Its value at time $t < u$
satisfies $V_t D_t = ((S_u - f)D_u)|_{\AA_t}$. If the underlying has no
cash flows then $S_t D_t$ is a martingale measure so $V_t = S_t - fD_t(u)$.
If $V_0 = 0$ then $f$ is the _at the money_ forward and the _cost of carry_ is $S_0 = fD(u)$.

### European Option

A European option expiring at time $u\in T$ has a single
cash flow $\nu(S_u)$ at $u$ where $\nu$ is the _payoff_ function.
The value of the option at time $t\in T$
satisfies ${V_t D_t = (\nu(S_u) D_u)|_{\AA_t}}$, $t\le u$.
Since $D_u(\Omega)/D(u) = 1$ we can have
$V_0 = E[\nu(S_u)]D(u)$ under this "probability" measure.

Any positive random variable $F$ with finite mean and log variance
can be written $F = fe^{sX - \kappa(s)}$ where $X$ has mean 0
and variance 1 and $\kappa(s) = \log E[e^{sX}]$ is the cumulant.
Note $E[F] = f$.

If an option pays shares of the underlying instead of cash
we need to calculate $E[F\nu(F)] = fE[e^{sX - \kappa(s)}\nu(F)] = fE^s[\nu(F)]$
where $E^s$ is the _share measure_ with $dP^*/dP = e^{sX - \kappa(s)}$.
Since $E[e^{sX - \kappa(s)}] = 1$ we have the share measure $P^s$
is a "probability" measure.

#### Put

The (forward) value of a put option with strike $k$ and underlying $F$
at expiration is
$$
\begin{aligned}
p &= E[\max\{k - F, 0\}] \\
  &= E[(k - F)1(F \le k)] \\
  &= kP(F\le k) - E[F1(F \le k)] \\
  &= kP(F\le k) - fP^s(F \le k) \\
\end{aligned}
$$
Note $F\le k$ if and only if $X \le (\log k/f + \kappa(s))/s$.
We call $x(f,k,s) = (\log k/f + \kappa(s))/s$ the _moneyness_ of the option.
Let $\Psi^s$ be the cumulative distribution function of $X$ under
the share measure. Note $\Psi^0 = \Psi$ is the  cumulative distribution function of $X$.
The put value is
$$
	p = k\Psi(x) - f\Psi^s(x)
$$
where $x = x(f,k,s)$.
If $X$ is standard normal then $\kappa(s) = s^2/2$ and this reduces to the Black[@Bla1976] formula.

_Delta_ is the derivative of option value with respect to $f$
$$
\begin{aligned}
\partial_f p &= \partial_f E[\max\{k - F, 0\}] \\
  &= E[-1(F \le k)\partial_f F] \\
  &= E[-1(F \le k)e^{sX - \kappa(s)}] \\
  &= -P^s(F \le k) \\
  &= -\Psi^s(x) \\
\end{aligned}
$$

_Gamma_ is the second derivative of option value with respect to $f$
$$
\begin{aligned}
    \partial_f^2 p &= -\partial_f \Psi^s(x) \\
    &= -\partial_x \Psi^s(x)\partial_f x \\
    &= -\partial_x \Psi^s(x)/\partial_x f \\
    &= \partial_x \Psi^s(x)/f s\\
\end{aligned}
$$

_Vega_ is the derivative of option value with respect to $s$.
The vega of a put option is
$$
\begin{aligned}
    \partial_s v &= \partial_s E[\max\{k - F, 0\}] \\
        &= E[-1(F \le k)\partial_s F] \\
        &= -E[1(X\le x)F(X - \kappa'(s))] \\
        &= -f\partial_s \Psi^s(x) \\
\end{aligned}
$$
The last equality follows from $\partial_s E^s[1(X\le x)] = E[1(X \le x)e^{sX - \kappa(s)}(X - \kappa'(s))]$.

This shows put option value and greeks can be computed from the
share cumulative distribution $\Psi^s(x)$ and its derivatives with
respect to $x$ and $s$. This is the case if $\Psi$ is a
[generalized hypergeometic function](https://en.wikipedia.org/wiki/Generalized_hypergeometric_function).
For example,
$$
\Phi^s(x) = \frac{1}{2} + \frac{x-s}{\sqrt{2\pi}} \, _1F_1\left(\frac{1}{2}, \frac{3}{2}, -\frac{(x-s)^2}{2}\right)
$$
where $\Phi$ is the standard normal cumulative distribution.

### Canonical Deflator

If repurchase agreements are available then a _canonical deflator_ exists.
A repurchase agreement over the interval $[t_j, t_{j+1}]$ is specified
by a rate $f_j$ known at time $t_j$. The price at $t_j$ is $1$ and it
has a cash flow of ${\exp(f_j\Delta t_j)}$ at time $t_{j+1}$
where $\Delta t_j = t_{j+1} - t_j$.
By equation (1) we have ${D_j = \exp(f_j\Delta t_j)D_{j+1}|_{\AA_j}}$.
If $D_{j+1}$ is known at time $t_j$ then ${D_{j+1} = \exp(-f_j\Delta t_j)D_j}$ and
${D_n = \exp(-\sum_{j < n} f_j\Delta t_j) D_{t_0}}$ is the canonical deflator
at time $t_n$.

The continuous time analog is $D_t = \exp(-\int_0^t f(s)\,ds)D_0$ where
$f$ is the continuously compounded instantaneous forward rate.
This is commonly referred to as the _stochastic discount_.

### Risky Bond

Suppose a bond defaults at a random time $\tau$ and fraction $\rho$ is recovered
at default. We augment the sample space to $\Omega\times T\times [0,1]$ where
the element $(\omega, t, r)$ indicates default at $t$ with recovery $r$.
Information about default at time $t$ is represented by the
partition of $T$ consisting of singletons, $\{s\}$, ${s < t}$, and the set $\{u\ge t\}$.
If default occurs before $t$ then we know $\tau$ exactly,
otherwise we only know $\tau \ge t$. It is customary to assume $\rho$ is a constant.
The value of a risky zero coupon at time $t$
is determined by
$$
	D^{\tau,R}_t(u)D_t = (RD_\tau 1(t \le \tau \le u) + D_u 1(\tau > u))|_{\AA_t}, t > \tau.
$$
<!--
If rates are zero this implies $D^{\tau,R}_t(u) = 
If recovery is $RD_\tau(u)$ instead of $R$ and $\tau$ is independent of $(D_t)_{t\in T}$
then
$$
	D^{\tau,R}_t(u)D_t = D_t(u) \bigl(RP(t < \tau \le u) + P(\tau > u)\bigr)
$$
when $t > \tau$.
-->
### Futures

A _futures contract_ on an underlying with price $S_t$, $t\in T$, is
specified by _quote times_ $t_0 < \cdots < t_n = u$ where $u$ is the
_futures expiration_. The futures _quote_ at expiration
is equal to the price of the underlying $\Phi_u = S_u$. The price of a futures
is always zero and has cash flows $\Phi_{t_{j+1}} - \Phi_{t_j}$ at $t_{j+1}\le u$
where the quote $\Phi_t$ is determined by the market prior to expiration.

In an arbitrage-free model $0D_{t_j} = ((\Phi_{t_{j+1}} - \Phi_{t_j})D_{t_{j+1}})|_{\AA_{t_j}}$.
Under the canonical deflator futures quotes are a martingale.

### Limit Orders

A _limit order_ is specified by a level. When the underlying reaches
the level the holder receives one share of stock by paying the level.

## Fundamental Theorem of Asset Pricing

For the one-period model consider the operator $A\colon\RR^I\to\RR\oplus B(\Omega)$
defined by $A\gamma = -\gamma\cdot x \oplus \gamma\cdot X$.
The first component is the amount made purchasing $\gamma$ shares and the
second is the amount made when closing the postion at current market prices.
Arbitrage exists if there is a $\gamma\in\RR^I$ with 
$A\gamma$ in the positive cone ${\PP = \{p\oplus P\mid p > 0, P\ge0\}\subseteq \RR\oplus B(\Omega)}$.

The adjoint of $A^*\colon\RR^*\oplus ba(\Omega)\to(\RR^I)^*$ is $A^*(d\oplus D) = -xd + XD$
where we identify $(\RR^I)^*$ with $\RR^I$. Every $x\in\RR^I$ corresponds to
the linear functional $x^*\colon\RR^I\to\RR$ defined by $x^*y = x\cdot y$, $y\in\RR^I$.
Since
$$
\begin{aligned}
\langle \gamma, A^*(d\oplus D) \rangle
&= \langle A\gamma, d\oplus D \rangle \\
&= \langle -\gamma\cdot x\oplus \gamma\cdot X, d\oplus D \rangle \\
&= \langle \gamma, -xd + XD \rangle \\
\end{aligned}
$$
this shows $A^*(d\oplus D) = -xd + XD$.

Assume trading times $t_0 < \cdots < t_n$.
Define the amount operator
$$
{A\colon\oplus_{j=1}^n B(\AA_j, \RR^I)\to\oplus_{j=0}^n B(\AA_j)}
$$
by $A(\oplus_j \Delta_j) = \oplus_j \Delta_j\cdot C_j - \Gamma_j\cdot X_j$.
Recall ${\Delta_j = \sum_{i < j} \Gamma_j}$ so $\Delta_0 = 0$
and ${\Gamma_j = \Delta_{j+1} - \Delta_j}$, $0\le j < n$.

We now compute the adjoint $A^*\colon\oplus_j ba(\AA_j)\to\plus_j ba(\AA_j, \RR^I)$
$$
\begin{aligned}
\langle \oplus_j \Delta_j, A^*(\oplus_j D_j))\rangle &=
\langle A(\oplus \Delta_j), \oplus_j D_j)\rangle \\
&= \sum_{j=0}^n \langle \Delta_j\cdot C_j - \Gamma_j\cdot X_j, D_j\rangle \\
&= \sum_{j=0}^n \langle \Delta_j\cdot C_j - (\Delta_{j+1} - \Delta_j)\cdot X_j, D_j\rangle \\
&= \sum_{j=0}^n \langle \Delta_j\cdot C_j + \Delta_j\cdot X_j, D_j\rangle
 -  \sum_j \langle \Delta_j\cdot X_{j-1}, D_{j-1}\rangle \\
&= \sum_{j=0}^n \langle \Delta_j, C_j D_j + X_j D_j - X_{j-1} D_{j-1} \rangle \\
&= \langle\oplus_j \Delta_j,\oplus_j C_j D_j + X_j D_j - X_{j-1} D_{j-1} \rangle \\
\end{aligned}
$$
This shows $A^*(\oplus_j D_j) = \oplus_j \oplus_j C_j D_j + X_j D_j - X_{j-1} D_{j-1}$.


<!--
-->

## References

[^1]: This definition is not satisfactory to traders and risk managers.
They will compare the profit $\gamma\cdot x$ to $|\gamma|\cdot|x|$,
the total amount of money involved in establishing the trade.
They would probably not be willing to tie up a million dollars to make a one dollar profit.

[^2]: Perfect hedges never exist.
