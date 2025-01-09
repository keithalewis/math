---
title: Simple Unified Model
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: A mathematically rigorous framework for valuing, hedging, and managing the risk of derivative instruments.
...

\newcommand\RR{\boldsymbol{R}}
\newcommand{\ZZ}{\boldsymbol{Z}}
\renewcommand{\AA}{{\mathcal{A}}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\Alg}{\operatorname{Alg}}
\renewcommand\o[1]{\hat{#1}}

This note proposes improvements to [Stephen Ross's][@Ros1978]
paper "A Simple Approach to the Valuation of Risky Streams".
Ross extended the theory invented by Fischer Black, Myron Scholes
[@BlaSch1973] and Robert C. Merton III [@Mer1973] for valuing an option
by dynamic trading of a bond and stock to valuing any derivative using
any collection of instruments (risky streams).

Perhaps at the time, over half a century ago, people were not prepared
for such an audatious expansion of the B-S/M theory.
Ross conflated cash flows with instantaneous changes in the price of the underlying.
We put the cash flows associated with owning financial instruments on
ShengQuan Zhouan equal footing with prices. B-S/M and Ross assumed continuous time trading is possible.
This is a mathematical artifact of using Ito processes to model trading strategies
that leads to untenable results[^1].
Every trading strategy involves only a finite number of transactions
based on available information.  The Simple Unified Model does not solve
the crucial problem of when to hedge, how much to buy, or how good the
hedge is; it only provides a rigorous mathematical framework for future
researchers to address limitations of existing theory.

### Synopsis

The Simple Unified Model does not involve so-called real-world probability
measures that are immediately replaced by risk-neutral probability
measures.  It does not involve stochastic processes, the Ito formula,
partial differential equations,
the Hahn-Banach theorem or, much less, weak-$*$ topologies.
It does not even involve probability.  As Ross
showed, the lack of arbitrage places geometric constraints on price dynamics.
Positive measures having mass one show up, but they are not the probability of anything.

Ross's valuation operator corresponds to a _deflator_ ${(D_t)_{t\in T}}$: positive measures
on an algebras of sets $(\AA_t)_{t\in T}$ representing available information.
If repurchase agreements are available then the canonical deflator is the stochastic
discount: the reciprocal of the return from rolling over one unit
invested at prevailing repo rates.
Market instruments have prices $(X_t)$ and associated cash flows $(C_t)$.
Trading involves buying and selling instruments $(\Gamma_j)$ 
at a finite number of increasing stopping times $(\tau_j)$.
Trades accumulate to positions ${\Delta_t = \sum_{\tau_j < t} \Gamma_j
= \sum_{s < t}\Gamma_s}$, where $\Gamma_s = \Gamma_j$ if $s = \tau_j$ and
is zero otherwise.
Prices, cash flows, and trades determine the
value, or mark-to-market, ${V_t = (\Delta_t + \Gamma_t)\cdot X_t}$ of the strategy
and the amounts ${A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t}$ showing up in
the trading account.

Arbitrage exists if there is a trading strategy $(\tau_j, \Gamma_j)$ with
$A_{\tau_0} > 0$, $A_t\ge0$ for $t > \tau_0$, and $\sum_j \Gamma_j = 0$.
There is no arbitrage if there exist positive measures $D_t$ on
$\AA_t$ with
$$
	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}.
$$
A direct consequence using the definitions of value and amount is
$$
	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}.
$$
If a derivative instrument pays $\o{A}_k$ at $\o{\tau}_k$ and there
exists a trading strategy $(\tau_j, \Gamma_j)$ with
$A_t = \o{A}_k$ when $t = \o{\tau}_k$, $A_t = 0$ otherwise, and
$\sum_j \Gamma_j = 0$ then the value of the hedge at time $t$ satisfies
$$
	V_t D_t = (\sum_{\o{\tau}_k > t} \o{A}_k D_{\o{\tau}_k})|_{\AA_t}.
$$
This formula show how to value hedgeable derivative instruments based
on their payoffs, deflator, and available information.

The Black-Scholes/Merton model for the price of a bond and a stock is
${X_t = (r\exp(\rho t), s\exp(\rho t + \sigma B_t - \sigma^2t/2))P}$,
where $B_t$ is Brownian motion and the cash flows are zero, $C_t = (0, 0)$.
The deflator is $D_t = \exp(-\rho t)P$ where $P$ is Wiener measure.
For a call option paying $\o{A}_T = \max\{S_T - k, 0\}$ at time $\o{\tau} = T$ the above
formula at $t = 0$ yields $V_0 = E[\max\{S_T - k, 0\}\exp(-\rho T)]$.

## Simple Unified Model

The Simple Unified Model is an extension of Stephen Ross's [@Ros1978] "A Simple
Approach to the Valuation of Risky Streams". According to Ross

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator, $L$_.

He used the Hahn-Banach theorem to show the existence of $L$ and
observed it is not unique if the market is not complete.
Ross generalized the B-S/M model of a bond, stock, and option
to any collection of instruments (risky-streams).
He identified cash flows as a derivative of a price process.
We put cash flows on the first class footing they deserve.
He assumed, as did B-S/M, that continuous time trading was
possible. Every trading strategy in the real world involves
only a finite number of trades.

We assume you are familiar with measure theory and stochastic
processes, but are not necessarily an expert. See the [Appendix](#appendix)
for details.  Let $\Omega$ be the set of all possible market outcomes.

In the Black-Scholes/Merton theory $\Omega = C[0,\infty)$ is the set
of all continuous functions from $[0,\infty)$ to the real numbers.
They model possible stock prices as $S_t(\omega) = s\exp(\mu t + \sigma \omega(t) - \omega(t)^2/2)$
for $\omega\in\Omega$. This vastly underestimates set of all possible market outcomes.

Partial information is modeled by a _partition_ of $\Omega$.
Elements of the partition are _atoms_.
The model specifies partitions $\AA_t$
representing available information at each trading time $t\in T$.

Let $\bar{\AA}$ denote the smallest _algebra of sets_ generated by a finite partition $\AA$ of $\Omega$.
Every function $D\colon\AA\to\RR$ can be extended to a measure
on $\bar{\AA}$ by ${\o{D}(B) = \sum\{D(A)\mid A\subseteq B, A\in\AA\}}$, $B\in\bar{\AA}$.

Information increases over time so $\bar{\AA_t}\subseteq\bar{\AA_u}$ if $t < u$.

then we can de
a function $X\colon\Omega\to\RR$ is $\o{\AA}$ _measurable_ if and only if
$X$ is constant on each atom of $\AA$. 
This allows us to write $X\colon\AA\to\RR$ as a function on atoms and
relegate the words 'algebra' and 'measurable' to the (Appendix)[#appendix].

### Market

Let $I$ be the collection of all market _instruments_. 
Instruments can be bought or sold at _price_ $X_t\colon\AA_t\to\RR^I$
at any trading time $t\in T$. We assume, as is customary,
that market prices are perfectly liquid and divisible.

Instruments have _cash flows_ $C_t\colon\AA_t\to\RR^I$
associated with their ownership.
Stocks have dividends, bonds have periodic coupons and principal at maturity,
futures have daily margin adjustments. The price of a futures is always
zero in an arbitrage-free model. Money market accounts have zero cash flows.

### Trading

Traders buy and sell instruments over time based on information available
at the time of the trade. A _trading strategy_ is a finite sequence
$\tau_0 < \cdots < \tau_n$ of increasing stopping times and trades
$\Gamma_j\colon\AA_{\tau_j}\to\RR^I$.
Trades accumulate to the _position_ $\Delta_t = \sum_{\tau_j < t}\Gamma_j$ at time $t$.
We also write $\Delta_t = \sum_{s < t} \Gamma_s$ where $\Gamma_s = \Gamma_j$
when $s = \tau_j$.
Note the position _does not_ include the trades $\Gamma_t$ at time $t$. This
corresponds to the fact that it takes time after a trade
is executed for it to settle.

### Accounting

The _value_, or _mark-to-market_, of a trading strategy
is $V_t = (\Delta_t + \Gamma_t)\cdot X_t$ and represents
how much liquidating the current position and trades yet
to settle at current market prices would yield.

Trading strategies incur cash flows in the trading _account_ $A_t
= \Delta_t\cdot C_t - \Gamma_t\cdot X_t$: you receive cash flows
proportional to existing positions and pay the current market price for trades just executed.

### Arbitrage

_Arbitrage_ exists if there is a trading strategy
with $A_{\tau_0} > 0$, $A_t \ge 0$, $t > \tau_0$, and $\sum_j \Gamma_j = 0$.
The first trade makes money and subsequent trades never lose money.
Eventually the position must close out, otherwise you could simply
borrow a dollar every day.

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

_Proof_: Replace $X_u D_u$ by $M_u - \sum_{s\le u} C_s D_s$ in equation (1).

__Lemma__. For any arbitrage free model and any trading strategy
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}
$$

_Proof_. Use $\Delta_t + \Gamma_t = \Delta_{t + \epsilon}$ if $\epsilon > 0$
is sufficiently small.

Note how the value $V_t$ corresponds to price $X_t$ and account $A_t$
corresponds to $C_t$ in equations (2) and (1) respectively.
Trading strategies create synthetic market instruments.

__Equations (1) and (2) are the skeleton keys to pricing derivative securities__.

## Application

Suppose a cash settled derivative security specifies amounts $\o{A}_j$
be paid at times $\o{\tau}_j$.  If there is a trading strategy $(\tau_j,
\Gamma_j)$ with $A_{\o{\tau}_j} = \o{A}_j$ for all $j$ and $A_t = 0$
otherwise (aka self-financing) then a "perfect hedge" exists[^2].

[^2]: Perfect hedges never exist.

Equation (2) yields
$$
\tag{3}	V_t D_t = (\sum_{\tau_j > t} \o{A}_j D_{\o{\tau}_j})|_{\AA_t}
$$
which can be computed from the derivative contract term sheet and the deflators $(D_t)$.
Since $V_t = (\Delta_t + \Gamma_t)\cdot X_t$,
the Fréchet derivative $D_{X_t}V_t$
of option value with respect to $X_t$
is $\Delta_t + \Gamma_t$ so $\Gamma_t = D_{X_t}V_t - \Delta_t$.
Since $\Delta_t$ is known at time $t$, this gives a recipe for
computing a trading strategy where $\Delta$ is delta and $\Gamma$ is gamma
in the customary sense used by traders.
In general this hedge will not exactly replicate the derivative contract obligation.

The Simple Unified Model does not prescribe _when_ the hedge should be executed.
The untenable Black-Scholes/Merton solution is to hedge "continuously".
Every trading strategy executed in the real world involves
only a finite number of trades.

Various authors have considered replication error.

[@Der1999]

[@DerTal2005]

One simply writes down a martingale measure indexed by market instruments and deflator,
then use equation (3) to value derivative securities.
There is still work to be done on when and how much to hedge, and measure how well a hedge performs.

### European

A European option has a single payoff $\hat{A}_T$ at expiration $T$. 
In this case, equation (3) for the value of the option
is ${V_t D_t = (\hat{A}_TD_T)|_{\AA_t}}$.

#### Forward

A _forward_ on an instrument with price process $(S_t)$ is determined by a _strike_ $K$ and _expiration $T$.
A forward has a single cash flow $C_T = S_T - K$.

$$
	V_t D_t = ((S_T - K)D_T)|_{\AA_t}
$$

#### Black-Scholes/Merton

The Black-Scholes/Merton model uses the martingale measure ${M_t = (r,
p(\sigma B_t - \sigma^2t/2))P}$, where $B_t$ is Brownian motion
and $P$ is Wiener measure. The deflator is ${D_t = \exp(-\rho t)P}$,
where $\rho$ is the constant interest rate.  From equation (3) the
model of prices is $X_t  = (R_t, S_t)$ where the bond price is
${R_t = r\exp(\rho t)}$ and the stock price is
${S_t = s\exp(\rho t + \sigma B_t - \sigma^2t/2) - \sum_{s\le t} C_s\exp(\rho(t - s))}$
where $C_t$ is the stock dividend at time $t$. 
The current value of a European call with payoff $\nu(S_T)$ at time $T$ is
$V_0 D_0|_{\AA_0} = (\nu(S_T) D_T)|_{\AA_0}$ so $V_0 = E[\nu(S_T) D_t)]$.

If there are fixed dividends $d_j$ at $t_j$ then $C_{t_j} = d_j$.
If there are proportional dividends $p_j$ at $t_j$ then $C_{t_j} = p_j S_{t_j}$.
Since divideds are usually announced less than a year in advance a more realistic
model might specify a function $x(t)$ that is 1 over the announcement period 
that tends to zero and assume dividends are mixture
{$C_t = x(t_j)d_j + (1 - x(t_j)p_j S_{t_j}$.

More generally, if $B_t$ is a Levy process where $B_1$ has mean zero and variance one
then ${M_t = (r, \sigma\exp(s B_t - t\kappa(\sigma))P}$ is an arbitrage-free model,
where $\kappa(\sigma) = \log E[\exp(\sigma X_1)]$ 
and $\log E[e^{B_t}] = t \log E[e^{B_1}]$.

???ref???

Merton's jump diffusion model is a special case. (ref???)

#### General Option

Every positive random variable with finite mean and log variance can be
written ${F = f\exp(sX - \kappa(s))}$ where ${f = E[F]}$, ${s^2 = \Var(\log F)}$,
$X$ has mean zero and variance 1, and ${\kappa(s) = \log E[\exp(sX)]}$.
The _vol_ $s$ is related to $\sigma$ by $s = \sigma\sqrt{t}$.

We have 
$$
\begin{aligned}
E[\max\{k - F, 0\}] &= E[(k - F)1(F \le k)] \\
	&= kP(F\le k) - E[F 1(F\le k)] \\
	&= kP(F\le k) - E[F] E[F/E[F] 1(F\le k)] \\
	&= kP(F\le k) - fP^*(F\le k) \\
\end{aligned}
$$
where $dP^*/dP = F/E[F]$. Since $F > 0$ and $E[F/E[F]] = 1$, $P^*$ is a positive measure with mass 1.

__Exercise__. _If $X$ is standard normal show ${E[\max\{k - F, 0\}] = kN(m) - fN(m - s)}$
where $N$ is the standard normal cumulative distribution and ${m = (\log(k/f) + s^2/2)/s}$_.

_Hint_: Use $E[\exp(N)] = \exp(E[N] + \Var(N)/2)$ if $N$ is normal and
$E[\exp(N) g(M)] = E[\exp(N)] E[g(M + \Cov(M,N))]$ if $N$ and $M$
are jointly normal.

__Exercise__. _Show if $F > 0$ that $E[{\max\{k - F, 0\}] = kP(X\le m) - fP^*(X\le m)}$
where ${m = (\log(k/f) + \kappa(s))/s}$
and $dP^*/dP = \exp(sX - \kappa(s))$_.

_Delta_ is the derivative of value $v = E[\max\{k - F, 0\}]$ with respect to initial price $f$.
$$
\begin{aligned}
	\partial v/\partial f &= E[-1(F \le k)\partial F/\partial f] \\
		&= -E[1(F \le k)\exp(sX - \kappa(s))] \\
		&= -P^*(F \le k) \\
\end{aligned}
$$

_Gamma_ is the second derivative of value $v = E[\max\{k - F, 0\}]$ with respect to initial price $f$.
$$
\begin{aligned}
    \partial_f^2 v &= -\partial_f P^*(F \le k) \\
    &= -\partial_f P^*(X \le m) \\
    &= -\partial_m P^*(X \le m)\partial_f x \\
    &= -\partial_m P^*(X \le m)/\partial_x f \\
    &= \partial_m P^*(X \le m)/f s\\
\end{aligned}
$$

_Vega_ is the derivative of option value with respect to volatility.
The vega of a put option is
$$
\begin{aligned}
    \partial_s v &= \partial_s E[\max\{k - F, 0\}] \\
        &= E[-1(F \le k)\partial_s F] \\
        &= -E[1(F \le k)F(X - κ'(s))] \\
        &= -\partial_s P_s(X \le x)f \\
\end{aligned}
$$

__Exercise__. _Show $\partial_s P_s(X\le x) = E[1(X \le x)F(X - κ'(s))]/f$_.

<details>
<summary>Solution</summary>
$$
\begin{aligned}
\partial_s P_s(X\le m) &= \partial_s E[1(X\le m) e^{sX - κ(s)}] \\
    &= E[1(X\le m) e^{sX - κ(s)}(X - κ'(s))] \\
    &= E[1(X\le m) fe^{sX - κ(s)}(X - κ'(s))]/f \\
    &= E[1(X\le m) F(X - κ'(s)]/f \\
\end{aligned}
$$
</details>

__Exercise__. _If $X$ is standard normal show $P^*(F \le k) = N(-d_2)$ where ${d_2 = (\log f/k - s^2/2)/s}$_.

### Fixed Income

_Fixed income_ instruments pay cash flows $c_j$ at times $t_j$.
From equation (1), the value of a fixed income instrument at time $t$ is determined by
$$
	V_t D_t  = (\sum_{t_j > t} c_j D_{t_j})|_{\AA_t}.
$$

#### Repurchase Agreements

A _repurchase agreement_ $R(f,t,\Delta t)$ has price $X_t^{R(f,t,\Delta t)} = 1$
at time $t$ and a single cash flow $C_{t+\Delta t} = \exp(f\Delta t)$ at
time $t + \Delta t$.
In practice, the forward rate $r$ is quoted using a _day count basis_ and the cash flow
is $1 + r\delta$ where $\delta$ is the _day count fraction_.
Typically, the day count fraction is the number of days from $t$ to $t + \Delta t$
divided by 360 or 365. These are the Actual/360 and Actual/365
day count basis respectively.

#### Deflator

If repurchase agreements are available then a _canonical deflator_ exists.
A repurchase agreement over the interval $[t_j, t_{j+1}]$ is specified
by a rate $f_j$ known at time $t_j$. The price at $t_j$ is $1$ and it
has a cash flow of ${\exp(f_j(\Delta t_j))}$ at time $t_{j+1}$
where $\Delta t_j = t_{j+1} - t_j$.
By equation (1) we have ${D_j = \exp(f_j\Delta t_j)D_{j+1}|_{\AA_j}}$.
If $D_{j+1}$ is known at time $t_j$ then ${D_{j+1} = \exp(-f_j\Delta t_j)D_j}$ and
${D_n = \exp(-\sum_{j < n} f_j\Delta t_j) D_{t_0}}$ is the canonical deflator
at time $t_n$.

The continuous time analog is $D_t = \exp(-\int_0^t f(s)\,ds)D_0$ where
$f$ is the continuously compounded instantaneous forward rate.

#### Zero Coupon Bond

A _zero coupon bond_ maturing at time $u$ has a single unit cash flow at $u$,
$C_u^{D(u)} = 1$ and $C_t^{D(u)} = 0$ for $t\not=u$.
In an arbitrage free model its price at time $t\le u$, $X_t^{D(u)} = D_t(u)$,
satisfies $D_t(u) D_t = D_u|_{\AA_t}$ so
$D_t(u)$ is the Radon-Nikodym derivative of $D_u|_{\AA_t}$ with respect to $D_t$.
Zero coupon bond prices are determined by the deflators.

#### Forward Rate Agreement

A _forward rate agreement_ with coupon $f$ over the interval $[u,v]$
having day count convention $\delta$[^4] has two cash flows: $-1$ at time $t$
and ${1 + f\delta(u,v)}$ at time $u$. The _par forward coupon_ at time
$t$, ${F_t^\delta(u,v)}$, is the coupon for which the price is 0 at time $t$.
By equation (1) we have
${0 = (-D_u + (1 + F_t^\delta(u,v))D_v|_{\AA_t}}$ so
$$
	F_t^\delta(u,v) = \frac{1}{\delta(u,v)}\left(\frac{D_t(u)}{D_t(v)} - 1\right).
$$

#### Swap

A _swap_ is a collection of back-to-back forward rate agreements involving times $(t_j)$.
The _swap par coupon_ making the price 0 at time $t$ is
$$
	F_t^\delta(t_0,\dots,t_n) = \frac{D_t(t_0) - D_t(t_n)}{\sum_{j=1}^n\delta(t_{j-1},t_j)D_t(t_j)}.
$$

__Exercise__. _Show if $n = 2$ the swap par coupon is the same as the par forward coupon_.

Some swaps involve an exchange of notional amounts. If a swap has cash flows $-1$
at $t_0$, $f\delta(t_{i-1},t_i)$ at $t_i$ for $1 < i < n$,
and $1 + f\delta(t_{n-1},t_n)$ at $t_n$ then the value of $f$ making the price
zero at time $t$ is equal to the swap par coupon.

__Exercise__. _Show $f = F_t^\delta(t_0,\dots,t_n)$ makes the price zero_.

Exposure...


[^4]: The _day count fraction_ $\delta(u, v)$ is approximately $v - u$ in years.

#### Risky Bonds

Companies can default and may pay only a fraction of the notional owed on bonds they issued.
A simple model[^3] for this is to assume the time of default $T$ and recovery $R$ are random variables.
The sample space for the default time is $[0,\infty)$ indicating the time of default.
The information available at time $t$ is the partition consisting of singletons
$\{s\}$, $s < t$ and the set $[t, \infty)$. If default occurs prior to $t$ then
we know exactly when it happened. If default has not occurred by time $t$ then
we only know it can occur any time after that.

[^3]: This is a very simplified model.

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

#### Limit Orders

A limit order is a contract to buy or sell an instrument at a given level.
We assume a money market instrument with price $R_t$ exists and the
price of the underlying instrument is $S_t$.
A limit _buy order_ has price 0 and and each contract has a single cash flow of $C_\tau = (-L, 1)$
in the money market and instrument where $\tau$ is the first time
the price of the instrument hits level $L$. This effectively purchases one share of
stock for price $L$ at time $\tau$.

<!--
### Binomial Model

Let $W_n$ be (symmetric) random walk. The model for bond and stock is

$V_0 = E[\nu(S_n)]$

$\Gamma = (M, N)$.
-->
## Review

This note provides a replacement for the Black, Scholes [@BlaSch1973]
and Merton [@Mer1973] theory of option valuation. Scholes and Merton won
a Nobel Prize in Economics for showing how to value a derivative instrument
using dynamic hedging: the value is the cost of setting
up the initial hedge.
The Achilles heel of their model is their assumption of continuous time trading.
This leads to untenable results[^1], something [Zeno](https://iep.utm.edu/zenos-paradoxes/)
pointed out 2,500 years ago.

[^1]: Merton provided a closed form solution for valuing
barrier options based on the reflection principal of Brownian motion
in Section 9 of [@Mer1973]. The classical theory implies the
value of a barrier option that knocks in or out the second
time the barrier is hit has the same value.
It also implies the value of a barrier option that knocks in
or out the millionth time it hits the barrier has exactly
the same value. 

Continuous time trading is a mathematical artifact of the theory of Ito processes
and duped many academics into believing complete markets and
perfect hedges exist. Every trader and risk manager knows this does not
correspond to reality after a few days on the job.
Trades occur at discrete times based on available information.
The primary unsolved problem in mathematical finance is how
to advise traders when and how much to hedge. There is still
work to be done on how well hedges work once you accept
the fact markets are not complete.

One benefit of working as a quant during the heyday of derivatives
was having a front row seat to how the software
implementations of the theory performed. 
When the hedges provided by your
implementation of a model started losing money, or even gaining money,
you would get a visit from someone paying your salary expecting
an explanation. I quickly learned the importance of gamma
profiles. We can do better than the trader aphorism, "Hedge
when you can, not when you have to."

When a theory in physics does not agree with observation, it is time to
come up with a new theory. The tenor of the time at the end of the 19th
century was that Newton's theory of gravitation and Maxwell's theory
of electromagnetism had been successfully carried out.  Lord Kelvin
proclaimed "It is just a matter of adding decimal points to physical
constants."

The Achilles's heel of classical theory at the time was its
prediction of black body radiation. Experiment did not
agree with observation.

> _Für die Richtung des dabeieinzuschlagenden Gedankenganges giebt der
  Hinblick auf dieUnhaltbarkeit der früher gemachten Voraussetzung einen
  Finger-zeig_. -- Max Planck

> _The untenability of the assumption made earlier provides an indication
  of the direction of the line of thought to be taken_.

Max Planck came up with a simple
solution to fit the data: assume photons were emitted in integer
multiples of of the _Planck constant_.
Instrument prices are integer multiples of a minimum trading unit,
not real numbers. This fact is relevant for accurate valuation
of 0-day options.

The untenable assumption of the Black-Scholes/Merton theory is that
continuous time trading is possible. The indicated direction is
to provide a theory reflecting the fact traders decide at
discrete times based on available information what to trade.


## Appendix

<details><summary>Details</summary>

Let $\Omega$ be a set of possible outcomes. _Partial information_ is modeled
by a partition of $\Omega$. A collection of subsets of $\Omega$, $\{A_j\}$,
is a _partition_ if they are pairwise disjoint and their union is $\Omega$.
Full information is knowing $\omega\in\Omega$. Partial information is
knowing only to which atom $\omega$ belongs.
No information is modeled by the singleton partition $\{\Omega\}$.

An _algebras of sets_ is a collection of sets
closed under union and complement.

__Exercise__. _Show algebras of sets are closed under intersection_.

_Hint_: Let $A' = \Omega\setminus A = \{\omega\in\Omega\mid \omega\not\in A\}$
be the set complement of $A$ in $\Omega$.
Use De Morgan's Law $(A\cap B)' = A'\cup B'$.

We can identify a set $A$ with its _indicator function_ $1_A\colon\Omega\to\RR$
defined by $1_A(\omega) = 1$ if $\omega\in A$ and $1_A(\omega) = 0$ if $\omega\not\in A$.
Note $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$, $1_{A'} = 1 - 1_A$, and
$1_{A\cap B} = 1_A 1_B$,

__Exercise__. _Prove De Morgan's Law_.

_Hint_: Start from $1_{A'\cup B'} = 1_{A'} + 1_{B'} - 1_{A'\cap B'}$.

Calculations on algebras of sets is algebra.

If $\AA$ is a finite algebra of sets on $\Omega$ then
$[\omega] = \cap\{A\in\AA\mid\omega\in A\}$ is the _atom_ of $\AA$ containing ${\omega\in\Omega}$.

__Exercise__. _If $B\subseteq[\omega]$ and $B\in\AA$ then
$B = \emptyset$ or $B = [\omega]$_.

__Exercise__. _The atoms of $\AA$, $[\AA]$, form a partition of $\Omega$_.

This shows we can identify a finite algebra of sets with its atoms.

A function $X\colon\Omega\to\RR$ is $\AA$-_measurable_
for an algebra of sets $\AA$
if $\{\omega\in\Omega\mid X(\omega) \le x\}$ belongs to $\AA$
for all $x\in\RR$.

__Exercise__. _If $\AA$ is finite, show $X$ is $\AA$-measurable
if and if and only if it is constant on atoms of $\AA$_.

This shows $X\colon[\AA]\to\RR$ _is_ a function.
We jettison the word 'measurable' and say $X$ _is known given_ $\AA$.

### Integration

Integration is a _linear functional_: it assigns a function to a number
where a constant times a function is assigned to the constant
times the integral and the integral of the sum of two functions
is the sum of the integrals. Integration involves _measures_.
A finitely-additive measure is a _set function_ $\lambda\colon\AA\to\RR$ satisfying
$\lambda(A\cup B) = \lambda(A) + \lambda(B) - \lambda(A\cap B)$
and $\lambda(\emptyset) = 0$. Measures don't count things
twice and the measure of the empty set is 0.

If $S$ is a set and $f\colon S\to\RR$ is a function on $S$ define
its _norm_ $\|f\| = \sup_{s\in S} |f(s)|$.
Let $B(S) = \{f\colon S\to\RR\mid \|f\| < \infty\}$ be the
_normed linear space_ of bounded functions on $S$.
The _dual_ of $B(S)$, $B(S)^*$, is the set of all
_bounded linear functionals_ $L\colon B(S)\to\RR$.
A linear functional is bounded if there exists a constant $M\in\RR$
with $|Lf| \le M\|f\|$ for all $f\in B(S)$.
The least such constant is the _norm_ of $L$, $\|L\|$.

Every bounded linear functional gives rise to a finitely-additive
measure $\lambda$ on $S$ by $\lambda(A) = L1_A$.
Let $ba(S)$ denote all finitely-additive measures on $S$.  We now show
how to identify $B(S)^*$ with $ba(S)$.

__Exercise__: _Show $\lambda$ is a measure_.

Every finitely-additive measure gives rise to a linear functional.
We say $f$ is _simple_ if it is a finite linear combination
of indicator functions $f = \sum_j a_j 1_{A_j}$.
Given a measure $\lambda$ define $Lf = \sum_j a_j \lambda(A_j)$.

__Exercise__. _If $\{A_j\}$ are pairwise disjoint show $Lf = 0$
implies $f = 0$_.

__Exercise__. _Show for any collection $\{B_i\}$ we have $\sum_i b_i 1_{B_i} = \sum_j a_j 1_{A_j}$
where $\{A_j\}$ are pairwise disjoint_.

_Hint_: Use $1_{E\cup F} = 1_{E\setminus F} + 1_{F\setminus E} - 1_{E\cap F}$
and induction.

This shows $L$ is _well-defined_ for simple functions.

__Exercise__. _Given any bounded function $g$ and $\epsilon > 0$ there
exists an simple function $f$ with $\|g - f\| < \epsilon$_.

_Hint_: Let $a_n = f(n\epsilon)$ and $A_n = f^{-1}([n\epsilon, (n + 1)\epsilon))$.

This shows the set of simple functions is _dense_ in $B(S)$.
We can extend the definition from simple
functions to all of $B(S)$ since $L$ is bounded

__Exercise__: _If $f\in B(S)$ and $\lim_n f_n = f$
then $\lim_n Lf_n = Lf$_.

_Hint_ Use $L$ is bounded.

This defines the _integral_ $Lf = \int_S f\,d\lambda$.

We can define a norm on $ba(S)$ by $\|\lambda\| = \sup_{\{A_j\}} |\lambda(A_j)|$
where the supremum is over all pairwise disjoint subsets of $S$.

__Exercise__. _Show $\|\lambda\| = \|L\|$_.

If $S$ is finite then $B(S)$ can be identified with $\RR^S = \{f\colon S\to\RR\}$
where $s\mapsto  f(s)$.
Similarly, $ba(S)$ can be identified with $\RR^S = \{\lambda\colon S\to\RR\}$
where $\{s\}\mapsto \lambda(\{s\})$.
This is good news when it comes to computer implementation,
everything is just a finite vector of numbers.

### Probability

The Simple Unified Model does not involve probability, however as an
aid to those schooled in the classical theory we will reconnoiter
some elementary facts.

A _probability measure_ is a positive measure with mass 1.
If $P$ is a probability measure on $\Omega$
then any function $X\colon\Omega\to\RR$ is a _random variable_.
The _expected value_ of $X$ is $E[X] = \int_\Omega X\,dP$.

The _conditional probability_ of $B$ given $A$ is
$P(B\mid A) = P(B\cap A)/P(A)$ for $B,A\subseteq\Omega$.

__Exercise__. _Show $B\mapsto P(B\mid A)$ is a probability measure on $A$_.

This can be generalized to the conditional expectation of a random
variable given an algebra of sets. We say $Y = E[X\mid\AA]$ if
$Y$ is known given $\AA$ and $\int_A Y\,dP = \int_A X\,dP$ for
all $A\in\AA$.

If $X$ is a random variable and $P$ is a measure we can define the
measure $XP$ by $(XP)(A) = \int_A X\,dP$.

__Exercise__. _Show $XP$ is a measure_.

__Exercise__ _Show if $X\ge 0$ and $E[X] = 1$ then $XP$ is a probability measure_.

_Hint_: Show $XP$ is positive and $(XP)(\Omega) = 1$.

__Exercise__. _Show $Y = E[X|\AA]$ if and only if $Y(P|_\AA) = (XP)|_\AA$_.

_Hint_: If $P$ is a measure on $\Omega$ then $P|_\AA$ is the restriction
of the measure to $\AA$.

__Exercise__. _Show if $A$ is an atom of $\AA$ then $E[X\mid\AA](A) = \int_A X\,dP/P(A)$_.

Conditional expectation is the average over each atom.

</details>

Let $T$ be the set of trading times, $I$ the set of all market
instruments, $\Omega$ the sample space of possible outcomes, and
$(\AA_t)_{t\in T}$ the algebras of sets on $\Omega$ indicating the
information available at each trading time.

### TODO

y. Garman (1977) and Cox and Ross (1976b), for
 example, have shown that if diffusions are used then the operator L will
 take the form of the Ito parabolic differential operator, and this integra
 tion of the operator and the continuous time approaches should lead to
 new results. Nevertheless, it is surprising how much of what is central
 to modern finance is based solely on the arbitrage principles embodied
 in the basic valuation theorem


## Reference

