<!--
:!pandoc -t html5 -s --katex=https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/ --css math.css ums.md -o ums.html
:!pandoc -V fontsize=12pt ums.md -o ums.pdf
-->
---
title: Simple Unified Model of Derivative Securities
classoption: fleqn
...
\newcommand\RR{\boldsymbol{R}}
\renewcommand\AA{\mathcal{A}}

Fischer Black, Myron Scholes [@BlaSch1973], and Robert C. Merton III
[@Mer1973], invented a Nobel Prize winning theory showing how to value
options by dynamically trading a bond and a stock.

This note suggests improvements to Stephen Ross's paper "A Simple
Approach to the Valuation of Risky Streams" [@Ros1978]. Ross expanded
on the Nobel Prize winning theory developed by Fischer Black, Myron Scholes
[@BlaSch1973], and Robert C. Merton [@Mer1973], which originally focused
on valuing options through dynamic trading of a bond and a stock. Ross
greatly expanded this by showing how to value derivatives using
any collection of instruments.

We place cash flows on equal footing with prices and show trading
strategies create synthetic market instruments.
If a perfect hedge exists, it is determined by the Fréchet derivative of the option value with respect to price.
The Simple Unified Model assumes every hedge has only a finite number of trades, as is the
case in the real world. This implies perfect hedges do not, in general, exist.

## Preamble

The SUM does not involve probability measures. As Ross showed, the Fundamental Theorem
of Asset Pricing is a geometric result. We assume a sample space and filtration, but
do not require a probability measure.

If an algebra $\AA$ of sets on $\Omega$ is finite then the atoms of the algebra form a
partition of $\Omega$ and a function $X\colon\Omega\to\RR$ is measurable with
respect to $\AA$ if and only if it is constant on atoms. In this case $X$ is
a function on the atoms and we write $X\colon\AA\to\RR$.

The dual of bounded functions on $\Omega$, $B(\Omega)^*$, can be identified with
finitely additive measures on $\Omega$[@DunSch1958]. Recall if $P$ is probability
measure then conditional expectation with respect to an algebra is defined
by $Y = E[X\mid\AA]$ if and only if $Y$ is $\AA$-measurable
and $\int_A Y\,dP = \int_A X\,dP$ for $A\in\AA$.
This is equivalent to $Y(P|_\AA) = (XP)|_\AA$. We do not use conditional
expectation in what follows, only restriction of measures to an algebra.

$T$ — totally ordered set of _trading times_.

$I$ — market _instruments_.

$\Omega$ — possible _outcomes_.

$(\AA_t)_{t\in T}$ — _partitions_[^1] of $\Omega$ indicating the information available at time $t\in T$.

$X_t\colon\AA_t\to\RR^I$ — bounded _prices_[^2] at times $t\in T$ of market instruments.

$C_t\colon\AA_t\to\RR^I$ — bounded _cash flows_ at times $t\in T$ of market instruments.

E.g., coupons, dividends, and futures margin adjustments are cash flows.
Futures have price 0.

$(\tau_j, \Gamma_j)$ — _trading strategy_ of strictly increasing stopping
times $\tau_j$ and shares $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$ purchased at $\tau_j$.

The _position_ resulting from a trading strategy is
$\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s$ where
${\Gamma_s = \Gamma_j 1(\tau_j = s)}$. Note the strict inequality.
It takes time for a trade to settle and become a part of the position.

$V_t = (\Delta_t + \Gamma_t)\cdot X_t$ — the _value_, or _mark-to-market_, of the strategy.

$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$ — the _amount_ showing up in the trading account.

Arbitrage exists if there is a trading strategy with $A_{\tau_0} > 0$, $A_t \ge0$, $t > \tau_0$, and
$\sum_j \Gamma_j = 0$. You make money on the first trade and never lose money until
the position is closed.

__Theorem__ (Fundamental Theorem of Asset Pricing) _There is no arbitrage if there exist _deflators_, positive
finitely additive measures[^3] $D_t$ on $\AA_t$, $t\in T$, with_
$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}, t\le u.
$$

__Claim__. _If $M_t = M_u|_{\AA_t}$, $t\le u$, is a $\RR^I$-valued_ martingale measure _and
$D_t\in ba(A_t)$ are positive measures then
${X_t D_t = M_t - \sum_{s\le t} C_s D_s}$ is arbitrage-free_.

_Proof_: Substitute $X_u D_u$ by this formula in $(1)$ and cancel terms in the sums.

__Example__. (Black-Scholes/Merton) $M_t = (r, se^{\sigma B_t - \sigma^2t/2})P$, $C_t = (0,0)$,
$D_t = e^{-\rho t}P$ where $(B_t)$ is standard Brownian motion and $P$ is Wiener measure.

__Lemma__. _With the above notation_
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}, t\le u.
$$

_Proof_: Substitute $V_t$ by its definition on the left side of $(2)$ and
use $X_t D_t$ from $(1)$. Note $\Delta_t + \Gamma_t = \Delta_{t+\epsilon}$
for $\epsilon > 0$ sufficiently small. In this case
$V_t D_t = (V_u D_u + A_u D_u)|_{\AA_t}$ for $u = {t+\epsilon}$.
Since the stopping times are strictly increasing, induction can be applied.

**Trading strategies create synthetic instruments where price corresponds
to value and cash flow corresponds to account.**

A (cash settled) derivative contract is specified by stopping times ${\hat{\tau}_j}$ and cash
flows $\hat{A}_j$.  If there exists a trading strategy
$(\tau_j,\Gamma_j)$ with ${\sum_j \Gamma_j = 0}$, ${A_{\hat{\tau}_j} = \hat{A}_j}$
and ${A_t = 0}$ (self-financing) otherwise, then a perfect hedge exists[^4].
The value of the derivative is determined by
$$
	V_t D_t = (\sum_{\hat{\tau}_j > t} \hat{A}_j D_{\hat{\tau}_j})|_{\AA_t}.
$$
Note the right hand side is determined by the contract specifications and deflator.
Assuming $\tau_0 = 0$, $V_0 = \Gamma_0\cdot X_0$ so the initial hedge $\Gamma_0$ is the Fréchet 
derivative $D_{X_0}V_0$ with respect to $X_0$.
Since $V_t = (\Gamma_t + \Delta_t)\cdot X_t$ we have
$\Gamma_t = D_{X_t}V_t - \Delta_t$. Note $\Delta_t$ is settled prior to time $t$.
This does not specify subsequent trading times $\tau_j > 0$[^5].

## Examples

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

### Zero Coupon Bond

A _zero coupon bond_ maturing at time $u$ has a single unit cash flow at $u$,
$C_u^{D(u)} = 1$ and $C_t^{D(u)} = 0$ for $t\not=u$.
In an arbitrage free model its price at time $t\le u$, $X_t^{D(u)} = D_t(u)$,
satisfies $D_t(u) D_t = D_u|_{\AA_t}$ so
$D_t(u)$ is the Radon-Nikodym derivative of $D_u|_{\AA_t}$ with respect to $D_t$.
Zero coupon bond prices are determined by the deflators.

### Risky Bond

Suppose a bond defaults at a random time $\tau$ and constant fraction $R$ is recovered
at default. We augment the sample space to $\Omega\times T$ where
the element $(\omega, t)$ indicates default at $t$.
Information about default at time $t$ is represented by the
partition of $T$ consisting of singletons, $\{s\}$, ${s < t}$, and the set $\{u\ge t\}$.
If default occurs before $t$ then we know $\tau$ exactly,
otherwise we only know $\tau \ge t$. The value of a risky zero coupon at time $t$
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

### Forward

A _forward contract_ on an underlying with price $S_t$ at $t\in T$ is specified
by a forward $f\in\RR$ and an expiration $u\in T$. It has a single cash flow
$S_u - f$ at $u$. Its value at time $t < u$
satisfies $V_t D_t = ((S_u - f)D_u)|_{\AA_t}$. If the underlying has no
cash flows then $S_t D_t$ is a martingale measure so $V_t = S_t - fD_t(u)$.
If $V_0 = 0$ then $f$ is the _at the money_ forward and the _cost of carry_ is $S_0 = fD_0(u)$.

### Futures

A _futures contract_ on an underlying with price $S_t$, $t\in T$, is
specified by _quote times_ $t_0 < \cdots < t_n = u$ where $u$ is the
_futures expiration_. The futures _quote_ at expiration
is equal to the price of the underlying $\Phi_u = S_u$. The price of a futures
is always zero and has cash flows $\Phi_{t_{j+1}} - \Phi_{t_j}$ at $t_{j+1}\le u$
where the quote $\Phi_t$ is determined by the market prior to expiration.

In an arbitrage-free model $0D_{t_j} = ((\Phi_{t_{j+1}} - \Phi_{t_j})D_{t_{j+1}})|_{\AA_{t_j}}$.
Under a canonical deflator futures quotes are a martingale.

### Limit Orders

A _limit order_ is specified by a level.
It has price 0 and at most one cash flow equal to the level
at the first time the underlying crosses the level.

## References

[^1]: A partition of $\Omega$ is a collection of pairwise disjoint sets with union $\Omega$.
If $\AA$ is a finite algebra of sets on $\Omega$ then the atoms of $\AA$ form a partition
of $\Omega$. Partial information is knowing which atom $\omega\in\Omega$ belongs to.
A function $X\colon\Omega\to\RR$ is $\AA$-measurable if and only if it is constant on atoms
so $X$ _is_ a function on the atoms of $\AA$.

[^2]: Prices _are_ bounded. There is a finite amount of money in the world.
Likewise for the number of shares it is possible to trade.

[^3]: The dual of bounded functions $B(\Omega)^* \cong ba(\Omega)$ is the space
of finitely additive measures on $\Omega$. $L\in B(\Omega)^*$ corresponds to
the measure $\lambda(E) = L1_E$. If $P$ is a positive measure with mass 1 then
$Y = E[X|\AA]$ if and only if $Y(P|_\AA) = (XP)|_\AA$.

[^4]: A perfect hedge never exists.

[^5]: Continuous time trading is impossible.
