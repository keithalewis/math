<!--
:!pandoc -t html5 -s --katex=https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/ --css math.css ums.md -o ums.html
:!pandoc -V fontsize=12pt ums.md -o ums.pdf
-->
---
title: Simple Universal Model
abstract: Arbitrage-free prices are geometrically constrained by cash flows.
classoption: fleqn
header-includes:
	- \usepackage{bm}
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

This note provides a simple and rigorous mathematical model for valuing, hedging,
and managing the risk of **all** derivative instruments. It is based on [@Ros1978]
"A Simple Approach to the Valuation of Risky Streams" where he showed

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator, $L$_.

The not generally uinque valuation operators are determined by _deflators_:
positive measures that depend only on the information available at
each trading time. Ross's theory applies to all instruments, not just a
bond, stock, and option that Black and Scholes [@BlaSch1973] and Merton
[@Mer1973] considered. His insight was to realize option valuation had
nothing to do with probability and used the Hahn-Banach theorem to show
prices are constrained by the geometry determined by cash flows.

The Achilles Heel of the Black-Scholes/Merton model is that it assumes
continuous-time trading. This leads to infeasible trading strategies
and obviously incorrect valuations.  The doubling strategy pointed
out by Harrison and Kreps [@HarKre1979] is impossible to carry out, as
[Zeno](https://plato.stanford.edu/entries/zeno-elea/) pointed out over two
millenia ago.  According to the B-S/M theory the value of a barrier option
that knocks in the $n$-th time the barrier is hit is the same for all $n$.
If Brownian motion hits $a$ at time $\tau$ then it hits $a$ infinitely
often in the interval $[\tau, \tau + \epsilon]$ for any $\epsilon > 0$
since Brownian motion has unbounded variation on any finite interval.
See [@KarShr1991] Section 3.2.

A derivative instrument is a contract. The seller is obligated to
to pay and receive cash flows specified in the contract the buyer agrees to.
The fundamental problem every sell side trader faces the first day on the job is
when and how many market instruments to buy in order to manage risk.

This note provides a simple universal model that provides
a foundation for making advances on this important and poorly understood problem.

## Model

Let $\Omega$ be a sample space representing everything that can happen.
Information at time $t$ is modeled by a partition $\AA_t$ of $\Omega$. We assume
$\AA_u$ is a refinement of $\AA_t$ whenever $u > t$.
The possible _trading times_ $T$ are a subset of the real numbers.
To avoid doubling strategies
we assume $\epsilon = \inf\{|t - u|\mid t,u\in T, t\not=u\} > 0$.
Finally, let $I$ be the set of all market instruments.

We use $B(\Omega)$ to denote the space of bounded functions on $\Omega$.
Recall its vector space dual can be identified with the space of
finitely additive measures on $\Omega$ denoted $ba(\Omega)$.
For any $f\in B(\Omega)$ define the linear operator of multiplication by $f$,
$M_f\colon B(\Omega)\to B(\Omega)$, by $M_fg = fg$.
Its adjoint is a linear operator $M_f^*\colon ba(\Omega)\to ba(\Omega)$. 
This defines multiplying a measure by a function $f\phi = M_f^*\phi$
for $f\in B(\Omega)$ and $\phi\in ba(\Omega)$.

## Market

Instruments have prices and cash flows indexed by $T$.
The _price_ at time $t\in T$ is a bounded $\RR^I$-valued function
$X_t\in B(\Omega,\RR^I)$.
The _cash flows_ that result from holding an instrument are
also bounded $\RR^I$-valued functions $C_t\in B(\Omega,\RR^I)$.
Examples of cash flows are stock dividends, bond coupons, and margin adjustments from futures.
The price of a futures contract is always zero.
Usually $C_t = 0$ for all but a finite number of times $t\in T$.

## Trading

A _trading strategy_ is a finite number of strictly increasing stopping times
$\tau_j\colon\Omega\to T$, $0\le j\le n$,
and number of shares to buy at $\tau_j$ denoted $\Gamma_j\colon\Omega\to\RR^I$ where
$\Gamma_j$ is constant on $\{\tau_j = t\}$ for all $t\in T$.
Shares accumulate to position $\Delta_t = \sum_{\tau_j < t} \Gamma_j$. Note the
strict inequality. Trades take some time to settle before becoming part of the position.
We also write this as $\Delta_t = \sum_{s < t} \Gamma_s$ where $\Gamma_s = \Gamma_j$ when $s = \tau_j$
and is zero otherwise. Note $\Delta_t + \Gamma_t = \Delta_u$ for $u > t$ when $u - t$ sufficiently small.

## Accounting

The _value_, or _mark-to-market_, of a position is how much you would make if you
liquidated at current prices, ${V_t = (\Delta_t + \Gamma_t)\cdot X_t}$. You don't own
$\Gamma_t$ at time $t$ but you will at $t + \epsilon$ and should be accounted for.
The _amount_ associated with a trading strategy at time $t$
is ${A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t}$: you receive cash flows proportional
to your position and have to pay for trades just executed.

## Arbitrage

We define arbitrage (for this model) as the existence of a trading strategy 
with $A_{\tau_0} > 0$ and $A_t\ge0$, for $t > \tau_0$: you make money on the first trade and
never lose money thereafter.
We also require the strategy to eventually closes out, $\sum_j \Gamma_j = 0$,
otherwise borrowing a dollar every day would be an arbitrage.[^1]
Note our definition of arbitrage does not involve a probability measure.

[^1]: Nick Leeson used this strategy to put 350 year old Barings out of business.

__Theorem__. (Fundamental Theorem of Asset Pricing.) _The Simple Universal Model is
arbitrage free if and only if there exist a_ deflator _, positive measures $D_t$ in $ba(\AA_t)$, $t\in T$, with_
$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}, t\le u
$$
_where $|$ indicates restriction of measure_.

__Lemma__. _Using the above definitions_
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}, t\le u.
$$

**Trading strategies create synthetic instruments where price corresponds
to value and cash flow corresponds to amount.**

_Proof_: We have ${X_t D_t = (X_u D_u + C_u D_u)|_{\AA_t}}$ and
${\Delta_t + \Gamma_t = \Delta_u}$ for some $u\in T$ 
with ${u - t \ge \epsilon}$ sufficiently small.  It follows
$$
\begin{aligned}
V_t D_t &= (\Delta_t + \Gamma_t)\cdot X_t D_t \\
	&= (\Delta_u\cdot X_u D_u + \Delta_u C_u D_u)|_{\AA_t} \\
	&= (\Delta_u\cdot X_u + (\Gamma_u\cdot X_u + A_u)D_u|_{\AA_t} \\
	&= (\Delta_u + \Gamma_u)\cdot X_u + A_u)D_u|_{\AA_t} \\
	&= (V_u + A_u)D_u|_{\AA_t} \\
\end{aligned}
$$
The lemma is established by finite induction since $\epsilon > 0$.

We say $(M_t)_{t\in T}$ is a martingale measure if $M_t\in ba(\AA_t)$
and $M_t = M_u|_{\AA_t}$ for $u > t$.

__Lemma__. _If $(M_t)_{t\in T}$ is an $\RR^I$-valued martingale
measure and $D_t\in ba(\AA_t)$ are positive then_
$$
	X_t D_t = M_t - \sum_{s\le t} C_s D_s
$$
_is an arbitrage-free model of prices and cash flows_.

_Proof_: Since ${V_{\tau_0} = (\sum_{u > \tau_0} A_u D_u)|_{\AA_t}}$ and
if $A_t \ge 0$ for $t > \tau_0$ then $V_{\tau_0} \ge 0$.
Since $\Delta_{\tau_0} = 0$ we have ${V_{\tau_0} = \Gamma_{\tau_0}\cdot X_{\tau_0}}$
and ${A_{\tau_0} = -\Gamma_{\tau_0}\cdot X_{\tau_0}}$ so ${A_{\tau_0} = -V_{\tau_0} \le 0}$.
This shows the model is arbitrage-free and proves the "easy" direction of the FTAP.

The proof of the contrapositive involves the Hahn-Banach theorem, but
there is no need for that. Every arbitrage-free model used in practice has the above parameterization.

## Derivative

A (cash settled) derivative contract is specified by stopping times ${\hat{\tau}_j}$ and cash
flows $\hat{A}_j$.  If there exists a trading strategy
$(\tau_j,\Gamma_j)$ with ${\sum_j \Gamma_j = 0}$, ${A_{\hat{\tau}_j} = \hat{A}_j}$
and ${A_t = 0}$ (self-financing) otherwise, then a perfect hedge exists.
The value of the derivative instrument is determined by
$$
\tag{3}	V_t D_t = (\sum_{\hat{\tau}_j > t} \hat{A}_j D_{\hat{\tau}_j})|_{\AA_t}.
$$
Note the right hand side is determined by the contract specifications and deflator.
Assuming $\tau_0 = 0$, $V_0 = \Gamma_0\cdot X_0$ so the initial hedge $\Gamma_0$ is the Fréchet 
derivative $D_{X_0}V_0$ with respect to $X_0$.
Since $V_t = (\Gamma_t + \Delta_t)\cdot X_t$ we have
$\Gamma_t = D_{X_t}V_t - \Delta_t$. Note $\Delta_t$ is settled prior to time $t$.

If we choose $T = \epsilon\NN$ then as $\epsilon$ goes to zero this recovers the classical B-S/M model
where $\Delta$ is delta and $\Gamma$ is gamma.

The interesting open problem is ...
This does not determine the trading times $\tau_j$.

Static hedging (Nazir, Peter)


## Examples

### Canonical Deflator

If repurchase agreements are available they determine a _canonical deflator_.
A repurchase agreement over the interval $[t_j, t_{j+1}]$ is specified
by a rate $f_j$ known at time $t_j$. The price at $t_j$ is $1$ and it
has a cash flow of ${\exp(f_j\Delta t_j)\approx 1 + f_j\Delta t_j}$ at time $t_{j+1}$
where $\Delta t_j = t_{j+1} - t_j$.

By equation (1) we have ${D_j = \exp(f_j\Delta t_j)D_{j+1}|_{\AA_j}}$.
If $D_{j+1}$ is known at time $t_j$ then ${D_{j+1} = \exp(-f_j\Delta t_j)D_j}$ and
${D_n = \exp(-\sum_{j < n} f_j\Delta t_j) D_{t_0}}$ is the canonical deflator
at time $t_n$.

The continuous time analog is $D_t = \exp(-\int_0^t f_s\,ds)D_0$ where
$f$ is the continuously compounded instantaneous forward rate.
This is commonly referred to as the _stochastic discount_
and the reciprocal $R_t = 1/D_t$ is called the _money market account_.
It is convenient to assume there is an instrument with price $R_t$
and no cash flows exists in order to finance trading strategies.

It is rare for market participants to use repos to finance their trading.
Traders working for large banks have access to a funding desk that
charges them the repo rate plus a few basis points. Day traders
using a credit card to fund trading get charged at a much higher rate.


<!--
but every big bank has a repo desk of traders working
diligently every day to provide this simplifying illusion.

The Secured Overnight Financing Rate
([SOFR](https://www.newyorkfed.org/markets/reference-rates/sofr))
is a broad measure of the cost of borrowing cash overnight collateralized by Treasury securities.

Investors hedging derivatives must use their available funding rate.
-->

### Zero Coupon Bond

A _zero coupon bond_ maturing at time $u$ has a single unit cash flow at $u$,
$C_u^{D(u)} = 1$ and $C_t^{D(u)} = 0$ for $t\not=u$.
In an arbitrage free model its price at time $t\le u$, $X_t^{D(u)} = D_t(u)$,
satisfies $D_t(u) D_t = D_u|_{\AA_t}$ so
$D_t(u)$ is the Radon-Nikodym derivative of $D_u|_{\AA_t}$ with respect to $D_t$.

Zero coupon bond prices are determined by the deflators.
The Brace-Gatarek-Musiela Market model[@BraGatMus1997] corresponds to using the canonical deflator
built from forward rate agreements instead of repos.
The Heath-Jarrow-Morton model[HeaJarMor1992] corresponds to using
the continuous time stochastic discount.

### Fixed Income

_Fixed income_ instruments pay fixed cash flows $c_j$ at times $t_j$.
From equation (2), the value of a fixed income instrument at time $t$ is determined by
$$
	V_t D_t  = (\sum_{t_j > t} c_j D_{t_j})|_{\AA_t}
$$
so $V_t = \sum_{t_j > t} c_j D_t(t_j)$.

### Risky Bonds

Bonds can default and the holder recovers only a fraction of the remaining value.
Let $\tau$ be the time the bond defaults and $\rho$ be the fraction of the value recovered.
These are both random variables but it is customary to assume $\rho$ is a given constant.
The original sample space must be augmented by the cartesion product with $[0,\infty)$
indicating the default time. At time $t$ the information we have
about the default time is either $\tau < t$ and we know exactly when default happened,
otherwise we only know $\tau\in[t,\infty)$. This corresponds to the
partition of $[0,\infty)$ consisting of singletons $\{s\}$, $s < t$, and
the atom $[t,\infty)$. We assume if default occurs at time $t$ then we
learn about it later.

A risky zero coupon bond maturing at $u$ pays in full at $u$ if $\tau > u$
and $\rho D_\tau(u)$ at $\tau$ if $\tau\le u$. By equation (2) its value satisfies
$$
	V_t D_t = (\rho D_\tau(u)1(\tau\le u) D_\tau + 1(\tau >u)D_u)|_{\AA_t}.
$$
If rates are zero then $D_t(u) = 1$. Writing $V_t$ as $D_t^{\tau,\rho}(u)$ we have
$$
	D_t^{\tau,\rho}(u) = (\rho 1(\tau\le u) + 1(\tau >u))|_{\AA_t}
$$



### Black-Scholes/Merton

The Black-Scholes[@BlaSch1973] and Merton[@Mer1973] model has
$\Omega = C[0,\infty)$, $T = [0,\infty)$ with
instruments a bond and a stock having no associated cash flows.
Our martingale measure
is $M_t = (r, se^{\sigma B_t - \sigma^2t/2})P$ where $(B_t)$ is
Brownian motion and $P$ is Wiener measure. The deflator is $D_t = e^{-\rho t}P$.

We can generalize this to any Levy process $(X_t)$ with $X_1$ having mean
zero and variance one. In this case
$M_t = (r, se^{\sigma X_t - t\kappa(\sigma)})P$ where $\kappa(\sigma)
= \log E[\exp(\sigma X_1)]$ is the _cumulant_ of $X_1$.
Independence and stationarity imply the cumulant of $X_t$ is $t\kappa(\sigma)$

### European Option

A _European option_ on underlying $S$ pays $\nu(S_t)$ for some function $\nu$ at _expiration_ $t$.
For a _put_ $\nu(x) = \max\{k - x, 0\}$ and for a _call_ $\nu(x) = \max\{x - k, 0\}$
where $k$ is the _strike_. Given a model of prices $X_t = (R_t, S_t)$ and no cash flows,
where $R$ is a money market instrument, we can hedge using a trading strategy
$(\tau_j, \Gamma_j)$ where $\Gamma_j = (M_j, N_j)$.

The _self-financing_ condition is $A_s = 0$ for $0 < s < t$
so we require $0 = -\Gamma_s\cdot X_s = -M_s R_s - N_s S_s$.
Given $N_s$ we need to trade $M_s = -N_s S_s/R_s$ in the money market instrument.

If $p(k) = E[\max\{k - F, 0\}]$ then $dp/dk = E[1(F\le k)] = P(k)$

Given $p(k_j) = p_j$ convolve with gaussian like kernel $\sum_j w_j \phi_{\sigma_k}$

$E[F\nu(F)] = E[F] E^*[\nu(F)]$ where $dP^*/dP = F/E[F]$ is share measure.

## Notes

The set exponential $B^A$ is the set of all functions from $A$ to $B$.
For any set $I$, $\RR^I$ is a vector space with scalar multiplication
and vector addition defined pointwise:
$(ax)(i) = ax(i)$ and $(x + y)(i) = x(i) + y(i)$, $a\in\RR$, $x,y\in\RR^I$.

A _real valued function_ takes an element of a set to a real number.
A _real valued measure_ takes a subset of a set to a real number. Measures
do not count things twice and the measure of nothing is zero.
If $B(S)$ is the normed vector space of bounded functions on $S$
where the norm of $f\in B(S)$ is $\|f\| = \sup\{|f(s)|\mid s\in S\}$
then its dual $B(S)^*$ can be identified with the normed vector
space of bounded finitely additive measures on $S$, $ba(S)$.

If $L\colon B(S)\to\RR$ is linear define $\lambda(E) = L1_E$ where
$1_E(s) = 1$ if $s\in E$ and $1_E(s) = 0$ if $s\not\in S$.
Since $1_{E\cup F} = 1_E + 1_F - 1_{E\cap F}$ we have
$\lambda(E\cup F) = \lambda(E) + \lambda(F) - \lambda(E\cap F)$.
Measures do not count things twice. Since $1_\emptyset = 0$,
$\lambda(1_\emptyset) = 0$.


If $\AA$ is a sigma algebra on $\Omega$ then it is an algebra. If it is finite
then the atoms of $\AA$ form a partition of $\Omega$. An _atom_ $B\in\AA$
satisfyies $A\subseteq B$ and $A\in\AA$ implies $A=\emptyset$ or $A = B$.
In this case
a bounded function $X\colon\Omega\to\RR$ is $\AA$-measurable if and only if
$X$ is constant on atoms of $\AA$. That makes it a bounded function on
the atoms of $\AA$ so it belongs to $B(\AA)$.

Our definition of arbitrage is not sufficient. Recall $A_0 = -\Gamma_0\cdot X_0$.
Even if this is strictly positive traders and risk managers will compare it
to $|\Gamma_0|\cdot|X_0|$ as a measure of how much capital will be tied up
in the trading strategy. 
