---
title:  Stephen Ross
author: Keith A. Lewis
abstract: A Simple Approach to the Valuation of Risky Streams
classoption: fleqn
fleqn: true
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\renewcommand\AA{\mathcal{A}}

[@Ros1978] showed how to value uncertain future cash flows.
His two main results are:

1. Valuation is a purely geometric result, not probabilistic.

2. The theory applies to _any_ portfolio of instruments.

Perhaps this was too astonishing for people to appreciate at the time.
There is no need for Ito processes or partial differential equations,
much less postulating a so-called "real-world" measure that gets immediately
thrown out for a "risk-neutral" measure.
It applies to any portfolio of instruments, not just
the bond, stock, and option [@BlaSch1973] and [@Mer1973] considered.

Ross's definition of a cash flow was a jump in stock price.
Stock prices jump between close and open but there is no dividend payment involved.
Adding an explicit knob for cash flows to Ross's theory leads to
a model that adheres more closely to market realities.

If you are a familiar with the classical theory see the [Appendix](#appendix)
to scrub your brain of unnecessary mathematical accoutrements.

## Market

Every _instrument_ has bounded _price_ $X_t$ and cash flow $C_t$ at trading time $t$.
The cash flow is zero except at a finite number of times.
If $I$ is the collection of all instruments then we can model them
simultaneously if we let $X_t$ and $C_t$ be vectors indexed by $I$.

## Trading

A _trading strategy_ is a finite number of increasing stopping times[^1]
$\tau_0 < \cdots < \tau_n$ and trades $\Gamma_j$ indexed by instruments
that depend only on information available at time $\tau_j$.
Trades accumulate to _positions_ 
$$
	\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s
$$
where $\Gamma_s = \Gamma_j$ when $s = \tau_j$ and is zero otherwise.
Note the strict inequality -- trades take time to settle into
a position. A trading strategy is _closed-out_ if $\sum_j \Gamma_j = 0$.

[^1]: A stopping time depends only on the information available at time $t$.

## Accounting

Trading involves accounting. The _value_ (or mark-to-market) at time $t$ is
$$
	V_t = (\Delta_t + \Gamma_t)\cdot X_.
$$
It is the putative value
of liquidating the existing position and trades just executed
assuming that can be done at current market prices.
The trades just executed are not yet in the position, but they soon will be,
$\Delta_t + \Gamma_t = \Delta_{t+\epsilon}$.

The _amounts_ involved in trading are
$$
	A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t.
$$
Cash flows proportional to the existing position are credited to the trading account
and trades just executed are debited at the current market prices.

## Arbitrage

If there exists a trading strategy that makes money on the
first trade ($A_{\tau_0} > 0$) and never loses money until the trading strategy is closed out
($A_t \ge 0$, $t > \tau_0$) then the model admits arbitrage.
Note this definition does not involve probability.
Ross showed a model has no arbitrage if and only if
there exist _positive adapted finitely-additive measures $D_t$ with
$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}
$$
where $\AA_t$ is the partition of information[^2] available at time $t$.
We call such measures _deflators_. If repurchase agreements
are available in the market then the usual stochastic discount is
a canonical deflator.

[^2]: A partition of a set $\Omega$ is a collection of pairwise disjoint
subsets of $\Omega$ having union $\Omega$. No information corresponds
to the singleton partition $\{\Omega\}$ -- we only know the outcome
$\omega$ is a member of $\Omega$. Complete information corresponds
to the partition of singletons $\{\{\omega\}\mid\omega\in\Omega\}$
-- we know exactly which outcome occurred. Partial information corresponds
to knowing only which atom of the partition the outcome belongs to.

Ross used the Hahn-Banach theorem to prove existence but there
is no need for that. Every arbitrage-free model has a simple parameterization.

## Parameterization

Every arbitrage-free model is parameterized by a vector-valued
measure $M_t$ satisfying ${M_t = M_u|_{\AA_t}, t \le u}$ (a _martingale measure_) where
$$
\tag{2}	X_t D_t = X_0 M_t - \sum_{s\le t} C_s D_s.
$$

__Exercise__. _Show equation $(2)$ implies equation $(1)$_.

_Hint_: Replace $t$ by $u$ in equation $(2)$ and plug that into the
right-hand side of equation $(1)$.

This reduces the problem to finding martingale measures that can fit
market data.

### Black-Scholes/Merton

For example, the Black-Scholes/Merton model for the bond and stock with
no dividends is parameterized by
${M_t = (1, e^{\sigma B_t - \sigma^2t/2})P}$, ${D_t = e^{-\rho t}P}$
where $P$ is Weiner measure and $B_t$ is standard Brownian motion.

__Exercise__. _Show $X_t = (R_t, S_t)$ where $R_t =  r e^{\rho t}$
and $S_t = s e^{\sigma B_t + (\rho - \sigma^2/2)t}$_.

_Hint_: Use equation $(2)$ with $C_t = (0, 0)$.

Note there is no need to introduce a so-called "real world" measure that
requires a Nobel Prize winning argument involving partial differential
equations to show it can be thrown away.

## Consequences

Equation $(1)$ and the definition of $V_t$ and $A_t$ result in
$$
\tag{3}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}.
$$
The proof starts with $V_t D_t = (\Delta_t + \Gamma_t)\cdot X_t D_t$ and
using equation $(1)$.

Note how value and amount in equation $(3)$ correspond to 
price and cash flow in equation $(1)$ then uses induction on
$X_t D_t = (\Delta_u\cdot A_u D_u + V_u D_u)|_{\AA_t}$ for
some $u > t$ sufficiently small.

__Trading strategies create synthetic market instruments__.

This is the skeleton key to valuing, hedging, and managing the
risk of derivative instruments.

### Derivatives

A (cash settled) derivative is a contract where the buyer will pay the
seller to provide amounts $\hat{A}_k$ at times $\hat\tau_k$.  The buyer
is willing to pay the seller a premium to take the risk off their hands.
This short note provides nothing to suggest a solution to the conundrum of
what premium, vigorish, or baksheesh should be charged for that service.

A perfect hedge is a closed-out trading strategy $(\tau_j, \Gamma_j)$ with
$A_{\hat\tau_k} = \hat A_{k}$ and $A_t = 0$ otherwise. The latter condition
is referred to as _self-financing_.
Unless you belong to a Pythagorean cult that believes in the mathematical
absurdity of continuous time trading, this is generally not possible.
One approach is to note
${V_t = (\Delta_t + \Gamma_t)\cdot X_t}$ and that
${V_t D_t = (\sum_{\hat\tau_k > t} \hat{A}_k D_{\hat\tau_k})|_{\AA_t}}$ can be calculated
using the contract terms $\hat\tau_k$ and $\hat{A}_k$ by equation $(3)$.

The Fréchet derivative[^3] of value $V_t$ with respect to the underlying $X_t$ is
$D_{X_t}V_t = \Delta_t + \Gamma_t$.
At time 0 the position is 0 so this gives us the initial trade $\Gamma_0$.
At any time after that we have ${\Gamma_t = D_{X_t}V_t - \Delta_t}$. The position
$\Delta_t$ is known at time $t$ so this can be used to determine
candidate trading strategies.

[^3]: If $F\colon X\to Y$ is a function between normed linear spaces the
Fréchet derivative (when it exists) is the best linear approximation
of $F$ in a neighborhood of a point
$$
	F(x + h) = F(x) + DF(x)h + o(h), x,h\in X
$$
where $DF(x)$ is a bounded linear operator from $X$ to $Y$.

What this theory does not tell us is
when to trade. We could let $\tau_j = j\Delta t$
for some time increment $\Delta t$ and this results in the usual
Black-Scholes/Merton delta hedge as the time increment goes to zero.
A smarter idea might be to set a price increment $\Delta X$ and
determine the next trading time $\tau_{j+1}$ from the last trading time $\tau_j$
by ${\tau_{j+1} = \inf \{t > \tau_j\mid \|X_t - X_{\tau_j}\|_\infty > \Delta X\}}$.

What this theory does allow us to do is rigorously analyze any trading strategy.
For instance, the above strategy could be implemented using limit orders. At
time $\tau_j$ place limit orders at $X_{\tau_j} \pm \Delta X$ of size
$\Gamma_{j+1}$. We do not know $\Gamma_{j+1}$ at time $\tau_j$ since it
depends on $\tau_{j+1}$ and $X_{\tau_{j+1}}$. Limit orders
cost nothing to put on and take off so we can keep adjusting their size
as $t\to\tau_{j+1}$.

## Application

This sections shows how to use the SUM to value various instruments
via cash flows that determine price dynamics.

### Zero Coupon Bond

A zero coupon bond $D(u)$ pays 1 unit at maturity $u$. Its price
${X^{D(u)}_t = D_t(u)}$ at time $t \le u$ is determined by
${D_t(u)D_t = D_u|_{\AA_t}}$ so the price is the Radon-Nikodym derivative
${D_t(u) = d(D_u|_{\AA_t})/dD_t}$. Deflators determine the dynamics
of zero coupon bond prices.

Note $D_0(t)D_0 = D_t|_{\AA_0}$. If $\AA_0$ is $\{\Omega\}$ then
$D_0(t) = D_t(\Omega)/D_0(\Omega) = D_t(\Omega)$ since we can and do assume
$D_0(\Omega) = 1$. We write[^6] $D(t) = D_0(t)$ for the current discount.
If $D_t = D(t)P$ for some measure $P$ where $D(t)$ is a function of $t$
then $D_t(u) = D(u)/D(t)$.

[^6]: This uses the helpfully confusing notation $D(t)$ for both the
zero coupon instrument and its discount.

The _spot rate_ $r(t)$ is determined by $D(t) = e^{-tr(t)}$ and the
_forward rate_ $f(t)$ by ${D(t) = e^{-\int_0^t f(s)\,ds}}$. Note
the spot rate $r(t) = (1/t)\int_0^t f(s)\,ds$ is the average of the 
forward rate. The forward rate $f(t) = r(t) + tr'(t)$ involves the
derivative of the spot rate.

In computer implementations it is preferred to use
the forward rate to define the discount and spot rate since
averaging smooths the data, whereas the derivative of a
nearly constant spot rate can be arbitrarily large.

### Canonical Deflator

Repurchase agreements determine a _canonical deflator_.
A repurchase agreement over the interval from $t$ to $t + \Delta t$ is specified
by a rate $f(t)$ known at time $t$. The price at $t$ is $1$ and
has a cash flow of ${\exp(f(t)\Delta t)\approx 1 + f(t)\Delta t}$ at time $t + \Delta t$.

By equation (1) we have ${D_t = \exp(f(t)D_{t + \Delta t}|_{\AA_t}}$.
The canonical deflator specifies $D_{t + \Delta t}$ is known
at time $t$ so ${D_t = \exp(-f(t))D_{t + \Delta t}}$.
Given back-to-back repos at times $t_j$ having rates $f_j$
we have $D_j = \exp(-f_j\Delta t_j)D_{j+1}$ so
${D_n = \exp(-\sum_{j < n} f_j\Delta t_j) D_0}$ is the canonical deflator at time $t_n$.

The continuous time analog is $D_t = \exp(-\int_0^t f_s\,ds)D_0$ where
$f$ is the continuously compounded instantaneous forward rate.
This is commonly referred to as the _stochastic discount_
and the reciprocal $R_t = 1/D_t$ is called a _money market account_.
It is convenient to assume there is an instrument with price $R_t$
having no cash flows in order to finance trading strategies.

It is rare for market participants to directly use repos to finance their trading.
Traders working for large banks have access to a funding desk that
charges them the repo rate plus a few basis points. Day traders
using a credit card to fund trading get charged at the APR they qualify for.
The value of an instrument depends on the credit quality of the hedger.

The SUM model does not assume a risk-free rate exists. If a funding
instrument is being used then it, or all the instruments used to mimic it,
should be added to the set of instruments $I$.

### Forward Rate Agreement

A forward rate agreement pays $-1$ at _effective date_ $u$ and
$1 + f\delta(u,v)$ at _termination date_ $v > u$ where $f$ is
the forward rate agreement coupon, $\delta$
is the _day count basis_, and $\delta(u, v)$ is the _day count fraction_
approximately equal to the time in years from $u$ to $v$.
For example, the Actual/360 day count is the number of days from $u$ to $v$
divided by $360$.

The _par forward_ $F^\delta(u,v)$ is the coupon making the initial price equal to zero.
Since $0 = (-D_u + (1 + F^\delta(u,v))D_v)|_{\AA_0}$ we have
${F^\delta(u,v) = (D(v)/D(u) - 1)/\delta(u,v)}$.

__Exercise__. _Show the par coupon at time $t\le u$ is
${F^\delta_t(u,v) = (D_t(v)/D_t(u) - 1)/\delta(u,v)}$_.

### Fixed Income

A fixed income bond is just a finite portfolio of zero coupon bonds
with cash flow $c_j$ at maturity $u_j$.
Its _present value_ at time $t$ is ${P_t = \sum_{u_j > t} c_j D_t(u_j)}$.
The _continuously compounded yield_ $y_t$ at time $t$ is defined by
${P_t = \sum_{u_j > t} c_j e^{-(u_j - t) y_t}}$.
The _duration_ of a bond is the first derivative with respect to yield
$dP_t/dy_t$ and the _convexity_ is the second derivative $d^2P_t/dy_t^2$.

### Dividends

A _fixed dividend_ on a stock is a fixed cash flow $d_t$ per share at a dividend date $t$.
A _proportional dividend_ $p_t$ gives cash flow $p_t S_t$ at dividend date $t$.
Many companies announce projected dividends several months in advance.
Future dividends after that are usually assumed to be proportional to the stock price.
Specifying a function $X$ that is one at zero and decreases to zero at infinity
can be used to blend these two models using cash flows $X(t)d_t + (1 - X(t))p_t S_t$.

Note that stock price jumping down by dividend value at dividend dates is not
a consequence of a no-arbitrage strategy. If follows directly from the parameterization
of equation $(2)$.


### Lévy

Another source of ready-made martingales are Lévy processes[^4].
If $(X_t)$ is a Lévy process then $M_t = e^{s X_t - t\kappa(s)}$ is a
martingale where $\kappa$ is the cumulant $\kappa(s) = \log E[e^{s X_1}]$.

[^4]: A Lévy process is a stochastic process that has stationary, independent increments,
and is continuous in probability.
Lévy processes are completely determined by their value at time 1.

The [@Mer1976] jump diffusion model[^5] is a special case of this.
Since $X_1 = X_0 + (X_{1/n} - X_0) + \cdots + (X_1 - X_{1 - 1/n})$
we have $X_1$ is infinitely divisible since the terms in the sum are independent
and have the same law as $X_{1/n}$ by stationarity. If $X_1$ has finite variance
then a theorem of Kolmogorov states their exists
a number $\gamma$ and a non-decreasing bounded function $G$ with
$$
\kappa(s) = \log E e^{sX_1} = \gamma s + \int_{-\infty}^\infty K_s(x)\,dG(x),
$$
where ${K_s(x) = (e^{sx} - 1 - sx)/x^2 = \sum_{n=2}^\infty x^{n-2}s^n/n!}$.
Note if $X_1$ has mean 0 and $G(x) = 1_{[0, \infty)}$ then $\kappa(s) = K_s(0) = s^2/2$
so the random variable is normal. If $G(x) = 1_[a,\infty)$ for $a\not=0$ then
${\kappa(s) = K_s(a) = (e^{sa} - 1 - sa)/a^2}$ so the random variable is Poisson.

[^5]: This provides another example of why Ross's definition of
a cash flow as a jump in stock prices is not valid.

This theorem shows every infinitely divisible random variable can be
approximated by a normal plus a linear combination of independent Poisson
random variables, the case considered in Merton's jump diffusion model.
Merton showed perfect replication is not possible even assuming
continuous time hedging.
### Futures

A futures contract on underlying $S$ is specified by mark-to-market
dates $t_0 < \cdots < t_n$. Its price is always zero and its _quote_
at _expiration_ $t_n$ is $\Phi_{t_n} = S_{t_n}$. Prior to expiration the
quotes $\Phi_{t_j}$, $j < n$ are determined by the market. Futures pay
cash flows $C_{t_j} = \Phi_{t_j} - \Phi_{t_{j-1}}$.

### Put-Call Parity

A (European) put option with strike $k$ expiring at $u$ on underlying $S$
pays $\max\{k - S_u, 0\}$ at $u$. A call option pays
$\max\{S_u - k, 0\}$ at $t$. 
Since $\max\{S_u - k, 0\} - \max\{k - S_u,0\} = S_u - k$ the
call and put price satisfy $c - p = S_0 - k D(t)$.

### Cost of Carry

A forward contract with strike $k$ expiring at $u$ on underlying $S$
pays exactly one cash flow $S_t - k$ at $u$. It price $F_t$
at time $t$ satisfies $F_t D_t = ((S_u - k)D_u)|_{\AA_t}$.
In an arbitrage-free model the price of the underlying satisfies
${S_t D_t = (S_u D_u)|_{\AA_t}}$ assuming it pays no cash flows.
Hence $F_t D_t = S_t D_t - k D_t(u)D_t$
and $F_t = S_t - k D_t(u)$. The value of $k$ making $F_0 = 0$
is called the at-the-money, or par, forward and is denoted $f(u)$.
This implies cost-of-carry formula $S_0 = f(u) D(u)$ showing
the relationship between spot and par forward values.

The usual way of deriving this involves considering a trading
strategy in a bond and stock to replicate the forward contract. 

## Remarks

This model ignores many salient features of how markets actually work.

Transactions have a bid/ask spread that tends to increase with the size of the trade.

Prices are not real numbers -- they are integral multiples of minimum trading increment, or tick size.
Likewise for trading trading sizes. They are also bounded integral multiples -- at some point
no more instruments are available for trading. This is an actual problem for some
large hedge funds such as Citadel.

The definition of arbitrage as $A_0 > 0$ and $A_j\ge 0$ thereafter is insufficient.
Traders and risk managers will consider ${\|A_0\| = \|-\Gamma_0\cdot X_0\| \le \|\Gamma_0\|\|X_0\|}$.
The "arbitrage" will not be considered if the left-hand side gain is small compared
the the right-hand side cost of setting up the initial hedge.

We completely ignore the entities involved in trading. Different counterparties may have to
pay different prices or additional side fees for the same instrument depending on their credit worthiness.
They might even be unable to buy an instrument due to regulatory requirements.
In the not too distant past banks were forbidden to purchase stocks.

The largest lacuna, by far, in this theory is tax considerations.
When you are in a 40\% tax bracket adding the fifth decimal point of precision
to your valuation routines is not your biggest problem.

This short note does not take default risk into consideration, but it can be used for that.
For example a zero coupon bond $D(u)$ has a cash flow of $1$ at maturity $u$. It's price
$X^{D(u)}_t = D_t(u)$ at time $t$ is $D_t(u) = D_u|_{\AA_t}$, $t\le u$. If it defaults
at random time $T$ and pays fixed recovery $R$ at that time then it has a cash flow
$R$ at $T$ if $T\le u$ or a cash flow $1$ at $u$ if $T > u$. Its price satisfies
${D_t(u,T,R) = (R 1(T \le u)D_T + (1(T > u)D_u)|_{\AA_t}}$.

If $T$ is exponentially distributed
with $P(T > t) = e^{-\lambda t}$ and $D_t = D(t)$ is not stochastic then
$$
	D_t(u,T,R) = R(1 - e^{-\lambda t})D(t) + e^{-\lambda t}D(t) = [R + (1 - R)e^{-\lambda t}]D(t).
$$
If $R = 1$ or $\lambda = 0$ this is just $D(t)$.

For small $\lambda$ we have
${D_t(u,T,R) \approx e^{(1 - R)\lambda t}D(t)}$ yielding a simple
back-of-the-envelope approximation for the credit spread $s = (1 - R)\lambda$.
If $R = 1$ or $\lambda = 0$ then $s = 0$.

This sweeps under the rug the fact we must extend our sample space to
include default and recovery.  We should augment the sample space by
the product $[0,\infty)\times\{R\}$ and define information available
at time $t$ for the default time $T\in[0,\infty)$. A natural choice for
that is the partition ${\AA_t = \{\{s\}\mid s < t\}\cup\{[t, \infty)\}}$
-- if default occurs prior to $t$ we know exactly when it happened,
otherwise we only know $T\in[t,\infty)$.

This is not a realistic model. For example, we may want to update the
default rate $\lambda$ as more information becomes available.
We also make the customary drunk-stumbling-under-the-streetlight assumption
of an independent default time and constant recovery.
A more accurate model should allow random recovery $R\in[0,1]$ and
specify joint distributions for all the random variables involved.
One possible approach would be to specify $R$ to have a beta distribution
and define appropriate copulae for the joint distributions.
This would completely define the value of a risky zero coupon bond.
The software implementation and fitting market data to model parameters
would be challenging, to say the least.

The trajectory of mathematical finance is to develop mathematical models
that can more accurately describe the realities of trading. Advances
in compute power, memory, and AI are in their early stages of
application.

This short note provides a rigorous mathematical
foundation to keep moving in that direction.
For full details see the
[Simple Unified Model](https://keithalewis.github.io/math/sum.html).

## Appendix

We use only basic facts about finitely additive measure theory.
The Banach space of bounded function on set $S$ is
$$
	B(S) = \{f\colon S\to\RR\mid \|f\| =  \sup_{s\in S} |f(s)| < \infty\}
$$
Its continuous vector space dual can be identified with $ba(S)$, the Banach space
of finitely additive measures on $S$. Given a bounded linear functional
$L\colon B(S)\to\RR$ define $\lambda(A) = L1_A$, where $1_A(s) = 1$ if $s\in A$
and $1_A(s) = 0$ if $s\not\in A$ is the characteristic function of $A\subseteq S$.
This is an isometric isomorphism from $B(S)^*$ to $ba(S)$.
See [@DunSch1958] Volume I, Chapter IV.

Finitely additive measures can be multiplied by bounded functions.
Define $M_g\colon B(S)\to B(S)$ for $g\in B(S)$ by $M_gf = fg$.
Its adjoint $M_g^*\colon ba(S)\to ba(S)$ satisfies
$\langle M_g f,\lambda\rangle = \langle f, M_g^*\lambda\rangle$.
We write $g\lambda$ for $M_g^*\lambda$.

If $\AA$ is a finite algebra of sets on $S$ then its atoms form a partition of $S$.
A function $f\colon S\to\RR$ is $\AA$-measurable if and only if it is constant
on atoms. In this case $f\colon\AA\to\RR$ _is_ a function on atoms.
This simplifies computer implementations.

The _conditional expectation_ of a random variable $X$ given an algebra $\AA$ is defined by
${Y = E[X\mid\AA]}$ if and only if $Y$ is $\AA$-measurable and ${\int_A Y\,dP = \int_A X\,dP}$
for all $A\in\AA$.
This is equivalent to ${Y(P|_\AA) = (XP)|_\AA}$ where the vertical bar indicates restiction.
This also simplifies computer implementations.

## References
