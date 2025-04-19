<!--
:!pandoc -t html5 -s --katex=https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/ --css math.css ums.md -o ums.html
:!pandoc -V fontsize=12pt ums.md -o ums.pdf
-->
---
title: Valuation of Risky Streams of Cash Flows
classoption: fleqn
header-includes:
	- \usepackage{bm}
	- \usepackage{amsthm}
	- \usepackage{amssymb}
...
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\NN{\bs{N}}
\renewcommand\AA{\mathcal{A}}
\newcommand\PP{\mathcal{P}}
\newcommand\GG{\mathcal{G}}
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
equity options using a money market account to finance dynamic trading in
the underlying stock. In their model, it is possible to exactly replicate
the option payoff so the value of the option is the cost of setting
up the initial hedge.

Stephen Ross tremendously generalized the B-S/M model in
"A Simple Approach to the Valuation of Risky Streams" [@Ros1978]
by showing how to approximately value a derivative using
_any_ collection of instruments. 

He used the Hahn-Banach theorem to show

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator, $L$_.

Perhaps Ross never won a Nobel prize because his result was so audacious.
Maybe people were not ready to believe it was possible to come up
with a theory that applied to every market traded instrument, not
just a bond, stock, and option.

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
it relates to classical Black-Scholes/Merton machinery. It is especially intended
for mathematically sophisticated readers. They tend to have difficulty
shedding their hard-won knowledge and accept the fact only elementary math is needed.

The SUM does not involve probability. As Ross showed, the Fundamental Theorem
of Asset Pricing is a geometric result. We assume a sample space and filtration, but
do not require a probability measure.
There is no need for the Ito calculus or partial differential
equations. The notion of continuous time hedging is a deleterious mathematical artifact
of that model leading to incorrect results.[^2]
Every hedge in the real world consists of a finite number of trades.

[^2]: Barrier option example.

Recall the set exponential $\RR^I$ is the set of functions from $I$ to $\RR$.
The _dot product_ of $x,y\in\RR^I$ is $x\cdot y = \sum_{i\in I} x(i)y(i)$
and the _norm_ is $\|x\| = \sqrt{x\cdot x}$.
We assume $\|X\| = \sup_{\omega\in\Omega}\|X(\omega)\|$ is finite.

If an algebra $\AA$ of sets on $\Omega$ is finite then the atoms of the algebra form a
partition of $\Omega$ and a function $X\colon\Omega\to\RR$ is measurable with
respect to $\AA$ if and only if it is constant on atoms. In this case $X$ _is_
a function on the atoms and we write $X\colon\AA\to\RR$. A partition provides
partial information about outcomes. Full information is knowing which
$\omega\in\Omega$ occurred, partial information is knowing only which atom
$\omega$ belongs to. The partition of singletons represents complete information.
The partition consisting of the sample space represents no information.

The dual of bounded functions on $\Omega$, $B(\Omega)^*$, can be identified with
finitely additive measures on $\Omega$[@DunSch1958]. We write $B(\Omega,\RR^I)$
for the space of bounded vector-valued functions. Its dual is isomorphic
to the space of finitely additive vector-valued measures $ba(\Omega,\RR^I)$
A linear functional
$L\in B(\Omega)^*$ defines a measure $\lambda(A) = L1_A$ for $A\subseteq\Omega$
where $1_A(\omega) = 1$ if $\omega\in A$ and $1_A(\omega) = 0$ if $\omega\in\Omega\setminus A$.
The facts $1_\emptyset = 0$ and $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$, $A,B\subseteq\Omega$
show $\lambda$ is a measure. Its _norm_ is the supremum over all finite partitions $\{A_i\}$
of ${\sum_i |\lambda(A_i)|}$.

The integral $\int_\Omega f\,d\lambda$ is defined for _simple functions_ that are 
a finite linear sum $f = \sum_i a_i 1_{A_i}$, $A_i\subseteq\Omega$,
by $\int_\Omega f\,d\lambda = \sum_i a_i\lambda(A_i)$.
Dunford and Schwartz show this is well-defined and an isometry so it can be extended
to all of $B(\Omega)$.

Define $M_f\colon B(\Omega)\to B(\Omega)$ by $M_fg = fg$. Its adjoint
$M_f^*\colon ba(\Omega)\to ba(\Omega)$ defines multiplication of a
measure by a bounded function $f\lambda = M_f^*\lambda$.
The Radon-Nikodym derivative of $f\lambda$ with respect to $\lambda$ is $f$.

Recall if $P$ is probability
measure then conditional expectation of a random variable $X\colon\Omega\to\RR$
with respect to an algebra is defined
by $Y = E[X|\AA]$ if and only if $Y\colon\Omega\to\RR$ is $\AA$-measurable
and $\int_A Y\,dP = \int_A X\,dP$ for $A\in\AA$.
This is equivalent to $Y(P|_{\AA}) = (XP)|_{\AA}$ where the vertical bar indicates
restriction of measure. We do not use conditional
expectation in what follows, only restriction of measures to an algebra.

## One-Period Model

Let $I$ be the finite set of market instruments, $x\in\RR^I$ be their prices at the
beginning of the period, and $X\colon\Omega\to\RR^I$ be their prices at
the end of the period where $\Omega$ is the set of possible outcomes.

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

For each $t\in T$ let $X_t\colon\AA_t\to\RR^I$ be the _prices_[^3] of market instruments
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

The _Fundamental Theorem of Asset Pricing_ states there is no arbitrage if there exist _deflators_,
positive finitely additive measures $D_t$ on $\AA_t$, $t\in T$, with
$\sum_{t\in T} \|D_t\| < \infty$ and
$$
\tag{1}	X_t D_t = \sum_{u >} C_s D_s)|_{\AA_t}, t\le u.
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

__Example__. (Black-Scholes/Merton)
$M_t = (r, se^{\sigma B_t - \sigma^2t/2})P$, $C_t = (0,0)$,
$D_t = e^{-\rho t}P$ where $(B_t)$ is standard Brownian motion and $P$ is Wiener measure.

__Lemma__. _Assuming $(1)$ and the definitions of value and amount_
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}, t\le u.
$$

_Proof_.
Substitute $V_t$ by its definition on the left side of $(2)$ and
use $X_t D_t$ from $(1)$. Note ${\Delta_t + \Gamma_t = \Delta_{t+\epsilon}}$
for ${\epsilon > 0}$ sufficiently small. In this case
${V_t D_t = (V_u D_u + A_u D_u)|_{\AA_t}}$ for ${u = t+\epsilon}$.
The result follows by induction.

**Trading strategies create synthetic instruments where price corresponds
to value and cash flow corresponds to amount.**

A (cash settled) derivative contract is specified by stopping times ${\hat{\tau}_j}$ and cash
flows $\hat{A}_j$.  If there exists a trading strategy
$(\tau_j,\Gamma_j)$ with ${\sum_j \Gamma_j = 0}$, ${A_{\hat{\tau}_j} = \hat{A}_j}$
and ${A_t = 0}$ (self-financing) otherwise, then a perfect hedge exists[^3].
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
    \partial_s p &= \partial_s E[\max\{k - F, 0\}] \\
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
This corresponds to a cash flow $C_{\tau_L} = (-L, 1)$ where $\tau_L$
is the first time level $L$ is reached and the components correspond
to the currency used for the underlying quote and the underlying.

## Doob's Upcrossing Lemma

## Fundamental Theorem of Asset Pricing

In this section we prove the FTAP for multi-period models. 
We start with a proof for the one-period model that can be generalized.

For the one-period model consider the amount operator ${A\colon\RR^I\to\RR\oplus^\infty B(\Omega)}$
defined by ${A\gamma = -\gamma\cdot x \oplus^\infty \gamma\cdot X}$.
The norm on the range is $\|p\oplus^\infty P\|_\infty = \max\{|p|,\|P\|\}$ for $p\in\RR$, $P\in B(\Omega)$.
The first component is the amount made purchasing $\gamma$ shares and the
second is the amount made when closing the postion at current market prices.
Arbitrage exists if there is a $\gamma\in\RR^I$ with 
$A\gamma$ in the cone ${\PP = \{p\oplus P\mid p > 0, P\ge0\}\subseteq \RR\oplus^\infty B(\Omega)}$

The adjoint $A^*\colon\RR\oplus^1 ba(\Omega)\to\RR^I$ is $A^*(\pi\oplus^1 \Pi) = -x\pi + \langle X,\Pi\rangle$
where we identify $(\RR^I)^*$ with $\RR^I$ by $x\in\RR^I$ corresponds to
$x^*\in(\RR^I)^*$ using $\langle y, x^*\rangle = y\cdot x$, $y\in\RR^I$.
The norm on the domain is $\|\pi\oplus^1 P\|_1 = |\pi| + \|\Pi\|$.
The calculation
$$
\begin{aligned}
\langle \gamma, A^*(\pi\oplus^1 \Pi) \rangle
&= \langle A\gamma, \pi\oplus^1 \Pi \rangle \\
&= \langle -\gamma\cdot x\oplus^\infty \gamma\cdot X, \pi\oplus^1 \Pi \rangle \\
&= \langle -\gamma\cdot x, \pi\rangle + \langle \gamma\cdot X, \Pi \rangle \\
&= \langle \gamma, -x\pi + \langle X,\Pi\rangle \rangle \\
\end{aligned}
$$
shows $A^*(\pi\oplus^1 \Pi) = -x\pi + \langle X,\Pi\rangle\in\RR^I$.

The range of $A$ is closed, since it is finite dimensional, and $\PP$ has an interior point
so by the Hahn-Banach theorem there exists a hyperplane $H\supseteq\ran A$ that does not meet $\PP$.
Every hyperplane is the preanhiliator of an element of the dual, say $d\oplus^1 D\in\RR\oplus ba(\Omega)$,
so ${H = {}^\perp\{d\oplus^1 D\} = \{p\oplus^\infty P\mid \langle p\oplus^\infty P, d\oplus^1 D\rangle = 0\}}$.
Since $\ran A = {}^\perp(\ker A^*)\subseteq H$ we have $d\oplus^1 D\in\ker A^*$
so $0 = -xd + \langle X,D\rangle$. We now show $d$ and $D$ are positive.

If there exist $p_+\oplus^\infty P_+\in\PP$
and $p_-\oplus^\infty P_-\in\PP$
with ${\langle p_+\oplus^\infty P_+,d\oplus^1 D\rangle > 0}$ and
${\langle p_-\oplus^\infty P_-,d\oplus^1 D\rangle < 0}$
then there is a convex combination in $H$, which contradicts
the fact $H$ does not meet the cone $\PP$.
This shows we can assume ${\langle p\oplus^\infty P, d\oplus^1 D\rangle > 0}$
for all ${p\oplus^\infty P\in\PP}$.
It follows that $d > 0$ and $D > 0$.

This shows there is no arbitrage if and only if ${xd = \langle X,D\rangle}$
for some positive ${d\in\RR}$ and ${D\in ba(\Omega)}$.

For the multi-period model we assume discrete trading times $(t_j)_{j\in\NN}$.
Define the amount operator
$$
A\colon\oplus_{j\in\NN} B(\AA_j, \RR^I)\to\oplus_{j\in\NN} B(\AA_j)
$$
by $A(\oplus_j \Gamma_j) = \oplus_j A_j$ where $A_j = \Delta_j\cdot C_j - \Gamma_j\cdot X_j$
and ${\Delta_j = \sum_{i < j} \Gamma_j}$. Note ${\Delta_0 = 0}$ and
$\Gamma_j = \Delta_{j+1} - \Delta_j$. The direct sum uses the sup
norm $\|\oplus_j \Gamma_j\|_\infty = \sup_j \|\Gamma_j\|$.

We now compute the adjoint $A^*\colon\oplus_{j\in\NN} ba(\AA_j)\to\oplus_{j\in\NN} ba(\AA_j, \RR^I)$.
For $\oplus_j D_j\in \oplus_j ba(\AA_j)$ with sum norm $\|\oplus_j D_j\|_1 = \sum_j \|D_j\|$
$$
\begin{aligned}
\langle \oplus_j \Gamma_j, A^*(\oplus_j D_j)\rangle
&= \langle A(\oplus_j \Gamma_j), \oplus_j D_j\rangle \\
&= \sum_j \langle \Delta_j\cdot C_j - \Gamma_j\cdot X_j, D_j\rangle \\
&= \sum_j \langle (\sum_{i < j}\Gamma_i)\cdot C_j - \Gamma_j\cdot X_j, D_j\rangle \\
&= \sum_j \sum_{i < j} \langle \Gamma_i\cdot C_j, D_j\rangle - \sum_j \langle \Gamma_j\cdot X_j, D_j\rangle \\
&= \sum_i \sum_{j > i} \langle \Gamma_i\cdot C_j, D_j\rangle - \sum_j \langle \Gamma_j\cdot X_j, D_j\rangle \\
&= \sum_j \sum_{i > j} \langle \Gamma_j\cdot C_i, D_i\rangle - \sum_j \langle \Gamma_j\cdot X_j, D_j\rangle \\
&= \sum_j \langle \Gamma_j\cdot \sum_{i > j} C_i, D_i\rangle - \sum_j \langle \Gamma_j\cdot X_j, D_j\rangle \\
&= \sum_j \langle \Gamma_j, \sum_{i > j} C_i D_i\rangle - \sum_j \langle \Gamma_j, X_j D_j\rangle \\
\end{aligned}
$$

__Lemma__. _If $X\in B(\AA)$ then $\langle X, \Pi\rangle = \langle X, \Pi|_\AA\rangle$
for $\Pi\in ba(\Omega)$_.

_Proof_. This follows from $\langle 1_A,\Pi\rangle = \langle 1_A,\Pi|_\AA\rangle$
for $A\in\AA$ and every $X\in B(\AA)$ is the norm limit of simple functions.

This shows the dual of the amount operator is
${A^*(\oplus_j D_j) = \oplus_j \sum_{i > j} (C_i D_i)|_{\AA_j} - X_j D_j}$.

The subspace of closed-out trading strategies is  $\GG_0$ = $\oplus^\infty_{j\in\NN} B(\AA_j,\RR^I)$ having
a finite number of non-zero terms that sum to 0.
If $\PP = \{\oplus^1_{j\in\NN} P_j\mid P_j\in ba(\AA_j), P_0 > 0, P_j\ge 0, j>0\}$
is the cone of positive measures then
arbitrage exists if $A(\GG_0)$ meets $\PP$.


<!--
-->

## References

[^1]: This definition is not satisfactory to traders and risk managers.
They will compare the profit $\gamma\cdot x$ to $|\gamma|\cdot|x|$,
the total amount of money involved in establishing the trade.
They would probably not be willing to tie up a million dollars to make a one dollar profit.

[^3]: Perfect hedges never exist.
