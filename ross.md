---
title:  Stephen Ross
author: Keith A. Lewis
abstract: Risky Streams of Cash Flows
classoption: fleqn
fleqn: true
---
\newcommand\RR{\bs{R}}
\renewcommand\AA{\mathcal{A}}

[@Ros1978] showed how to value uncertain future cash flows.
His two main results are:

1. Valuation is a geometric result.

2. The theory applies to _any_ portfolio of instruments.

Perhaps this was too astonishing for people to appreciate at the time.
There is no need for Brownian motion or Ito processes,
much less partial differential equations.
It applies to any portfolio of instruments, not just
the bond, stock, and option [@BlaSch1973] and [@Mer1973] considered.

Ross's definition of a cash flow was a jump in stock price.
Stock prices jump between close and open but there is no dividend payment involved.
Adding an explicit knob for cash flows to Ross's theory leads to
a model that maps more closely to practical implementation. 

## Market

Every _instrument_ has bounded _price_ $X_t$ and cash flow $C_t$ at trading time $t$.
The cash flow is zero except for a finite number of times.
If $I$ is the collection of all instruments then we can model them
simultaneously if we let $X_t$ and $C_t$ be vectors indexed by $I$.

## Arbitrage

Ross showed if there is no trading strategy that makes money on the
first trade and never loses money until the trading strategy is closed out
then there exist positive adapted measures $D_t$ with
$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}
$$
where $\AA_t$ is the partition of information[^1] available at time $t$.

[^1]: A partition of a set $\Omega$ is a collection of pairwise disjoint
subsets of $\Omega$ having union $\Omega$. No information corresponds
to the singleton partition $\{\Omega\}$ -- we only know the outcome
$\omega$ is a member of $\Omega$. Complete information corresponds
to the partition of singletons $\{\{\omega\}\mid\omega\in\Omega\}$
-- know exactly which outcome occurred. Partial information corresponds
to knowing which element of the partition the outcome belongs to.

Ross used the Hahn-Banach theorem to prove their existence but there
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

This reduces the problem to coming up with 
martingale measures that can fit market data.

### Black-Scholes/Merton

The Black-Scholes/Merton model for the bond and stock is parameterized by
${M_t = (1, e^{\sigma B_t - \sigma^2t/2})P}$, ${D_t = e^{-\rho t}P}$
where $P$ is Weiner measure and $B_t$ is standard Brownian motion.

__Exercise__. _Show $X_t = (R_t, S_t)$ where $R_t =  r e^{\rho t}$
and $S_t = s e^{\sigma B_t + (\rho - \sigma^2/2)t}$_.

_Hint_: Use equation $(2)$ with $C_t = (0, 0)$.

Note there is no need to introduce a so-called "real world" measure that
requires a Nobel Prize winning argument to show it can be thrown away.

### Lévy

Another source of ready-made martingales are Lévy processes[^2].
If $(X_t)$ is a Lévy process then $M_t e^{sX_t - t\kappa(s)}$ is a
martingale where $\kappa$ is the cumulant $\kappa(s) = \log E[e^{s X_1}]$.

Merton's jump diffusion model is a special case of this.

[^2]: A Lévy process is a stochastic process that has stationary, independent increments,
and is continuous in probability.
Lévy processes are completely determined by their value at time 1.

### Dividends

A fixed dividend is a fixed cash flow $d_t$ at a dividend date $t$.
A proportional dividend $p$ is a cash flow $p_t S_t$ at dividend date $t$.
Many companies announce projected dividends several months in advance.
Future dividends are assumed to be proportional to the stock price.
Specifying a function $X$ that is one at zero and decreases to zero at infinity
can be used to blend these two models using cash flows $X(t)d_t + (1 - X(t))p_t S_t$.

## Trading

A _trading strategy_ is a finite number of increasing stopping times[^3]
$\tau_0 < \cdots < \tau_n$ and trades $\Gamma_j$ indexed by instruments
that depend only on information available at time $\tau_j$.
Trades accumulate to _positions_ 
$$
	\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s
$$
where $\Gamma_s = \Gamma_j$ when $s = \tau_j$ and is zero otherwise.
Note the strict inequality -- trades take time to settle into
a position. A trading strategy is _closed out_ if $\sum_j \Gamma_j = 0$.

[^3]: The sets $\{\tau_t = t\}$ are a union of atoms of $\AA_t$.

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

## Consequences

Equation $(1)$ and the definition of $V_t$ and $A_t$ result in
$$
\tag{3}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}.
$$
The proof starts with $V_t D_t = (\Delta_t + \Gamma_t)\cdot X_t D_t$ and
using equation $(1)$.

Note how value and amount in equation $(3)$ correspond to 
price and cash flow in equation $(1)$.

__Trading strategies create synthetic market instruments__.

This is the skeleton key to valuing, hedging, and managing the
risk of derivative instruments.

### Derivatives

A (cash settled) derivative is a contract where the buyer will pay the
seller to cover amounts $\hat{A}_k$ at times $\hat{\tau}_k$.  The buyer
is willing to pay the seller a premium to take the risk off their hands.
This short note provides nothing to suggest a solution to the conundrum of
what premium, vigorish, or baksheesh should be charged for that service.

The job of a quant is to find a trading strategy $(\tau_j, \Gamma_j)$ with
$A_{\hat{\tau}_k} = \hat{A}_{k}$ and $A_t = 0$ otherwise. The latter condition
is referred to as _self-financing_.
Unless you belong to a Pythagorean cult that believes in the mathematical
absurdity of continuous time trading, this is generally not possible.
A start at solving this difficult and not well-understood problem is to note
$V_t = (\Delta_t + \Gamma_t)\cdot X_t$ and $V_t$ can be calculated
using the contract terms $\hat{A}_t$ by equation $(3)$.

The Fréchet derivative[^4] of value $V_t$ with respect to the underlying $X_t$ is
$D_{X_t}V_t = \Delta_t + \Gamma_t$.
At time 0 the position is 0 so this gives us the initial trade $\Gamma_0$.
At any time after that we have $\Gamma_t = D_{X_t}V_t - \Delta_t$. The position
$\Delta_t$ is known at time $t$ so this can be used to come up with
candidate trading strategies.

[^4]: If $F\colon X\to Y$ is a function on normed linear spaces the
Fréchet derivative (when it exists) is the best linear approximation
of $F$ in a neighborhood of a point
$$
	F(x + h) = F(x) + DF(x)h + o(h), x,h\in X
$$
where $DF(x)$ is a bounded linear operator from $X$ to $Y$.

What this theory does not tell you is
when you should trade. If you let $\tau_j = j\Delta t$
for some time increment $\Delta t$ then this results in the usual
Black-Scholes/Merton delta hedge as the time increment goes to zero.
A smarter idea might be to set a price increment $\Delta X$ and
determine the next trading time $\tau_{j+1}$ from the last trading time $\tau_j$
by $\|X_{\tau_{j+1}} - X_{\tau_j}\| > \Delta X$.

What this theory does allow you to do is rigorously analyze any trading strategy.
For instance, the above strategy could be implemented using limit orders. At
time $\tau_j$ place limit orders at $X_{\tau_j} \pm \Delta X$.
If they are executed you get a cash flow of $\pm\Delta X$.

## Application

This sections shows how to use equation $(3)$ to value various instruments
via cash flows that determine price dynamics.

### Zero Coupon Bond

A zero coupon bond $D(u)$ pays 1 unit at maturity $u$. Its price
$X^{D(u)}_t = D_t(u)$
at time $t \le u$ is determined by ${D_t(u)D_t = D_u|_{\AA_t}}$	
so the price is the Radon-Nikodym derivative $D_t(u) = d(D_u|_{\AA_t})/dD_t$.

Note $D_0(t)D_0 = D_t|_{\AA_0}$. If $\AA_0$ is $\{\Omega\}$ then
$D_0(t) = D_t(\Omega)/D_0(\Omega) = D_t(\Omega)$ since we can and do assume
$D_0(\Omega) = 1$. We write $D(t) = D_0(t)$ for the discount.
If $D_t = D(t)P$ for some measure $P$ where $D(t)$ is a function of $t$
then $D_t(u) = D(u)/D(t)$.

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

<!--
### Put-Call Parity

A put option with strike $k$ expiring at $u$ on underlying $S$
pays $\max\{k - S_u, 0\}$ at $u$. A call option pays
$\max\{S_u - k, 0\}$ at $t$. The value of the options
are $p D_0 = 
Since
$\max\{S_u - k, 0\} - \max\{k - S_u,0\} = S_u - k$ we
-->

## Remarks

This model ignores many salient features of how markets actually work.

Transactions have a bid/ask spread that tends to increase with the size of the trade.

Prices are not real numbers -- they are integral multiples of minimum trading increment, or tick size.
Likewise for trading trading sizes. They are also bounded integral multiples -- at some point
no more instruments are available for trading. This is an actual problem for some
large hedge funds such as Citadel.

The definition of arbitrage as $A_0 > 0$ and $A_j\ge 0$ thereafter is insufficient.
Traders and risk managers will consider ${\|A_0\| = |-\Gamma_0\cdot X_0| \le \|\Gamma_0\|\|X_0\|}$.
If the left-hand side is small compared to the right-hand side then the "arbitrage" will
not be considered. It makes no business sense to tie up $1MM over a period of time just to make $1 now.

We completely ignore the entities involved in trading. Different counterparties may have to
pay different prices or additional side fees for the same instrument depending on their credit worthiness.
They might even be unable to buy an instrument due to regulatory requirements.
In the not too distant past banks were forbidden to purchase stocks.

The largest lacuna, by far, in this theory is tax considerations.
When you are in a 40\% tax bracket adding the fifth decimal point of precision
to your valuation routines is not your biggest problem.

This short note does not take default risk into consideration, but it can be used for that.
For example a zero coupon bond $D(u)$ has a cash flow of $1$ at maturity $u$. It's price
$X^{D(u)}_t = D^u_t$ at time $t$ is $D^u_t = D_u|_{\AA_t}$, $t\le u$. If it defaults
at random time $T$ and pays fixed recovery $R$ at that time then it pays $R$ at $T$ if $T\le u$
and $1$ at $u$ if $T > u$. This theory shows its price satisfies
${D^{u,T,R}_t = (R 1(T \le u)D_T + (1(T > u)D_u)|_{\AA_t}}$.

If $T$ is exponentially distributed
with $P(T > t) = e^{-\lambda t}$ and $D_t = D(t)$ is not stochastic then
$$
	D^{u,T,R}_t = R(1 - e^{-\lambda t})D(t) + e^{-\lambda t}D(t) = [R + (1 - R)e^{-\lambda t}]D(t).
$$
If $R = 1$ or $\lambda = 0$ this is just $D(t)$.

For small $\lambda$ we have
${D^{u,T,R}_t \approx e^{(1 - R)\lambda t}D(t)}$ yielding a simple
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
and define associated copulae for the joint distributions.
This would completely define the value of a risky zero coupon bond.
Of course the software implementation and fitting market data to model parameters
would be challenging, to say the least.

The trajectory of mathematical finance is to develop mathematical models
that can more accurately describe the realities of trading. Advances
in compute power, memory, and AI are in their early stages of
application.

This short note provides a rigorous mathematical
foundation to keep moving in that direction.
For full details see the
[Simple Unified Model](https://keithalewis.github.io/math/sum.html).

## References
