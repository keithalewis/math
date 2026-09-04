---
title: Black to the Future
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\NN{\bs{N}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\renewcommand\AA{\mathcal{A}}

There in no question the theory developed by [@BlaSch1973] and [@Mer1973]
for valuing derivative instruments has had a profound effect in the
financial world over the past half century. Scholes and Merton won 
The Sveriges Riksbank Prize in Economic Sciences in Memory of Alfred Nobel 
for their contributions.
Their eponymous partial differential equation is required study
in every mathematical finance program.

Few traders could write it down, much less derive it,
but they fully understand how _delta_ is the position they
need for their hedge and _gamma_ is what they need to buy to adjust their
hedge. They know the definition of _vega_ as the derivative of the value
of the position with respect to the multifarious word _volatility_.

There are other _greeks_ defined as derivatives with respect to
model parameters, but trader hedging is delta hedging.  That is
what shows up in their trade blotter and determines their P\&L.
Risk managers seem to take comfort in using higher order derivatives
produced by models to empirically verify
Taylor's[^1] formula after market close.

[^1]: If $f\colon\RR^m\to\RR$ is sufficiently smooth near $x\in\RR^m$ then
$$
    f(x + h) = \sum_{n=0}^\infty \sum_{|\alpha| = n} \frac{D^\alpha f(x)}{\alpha!}h^\alpha,
$$
where $\alpha = (\alpha_1,\ldots,\alpha_m)$ with $\alpha_j\in\NN$,
$|\alpha| = \alpha_1 + \cdots + \alpha_m$,
$D^\alpha f(x) = \partial^{|\alpha|}f(x)/\partial_{x_1}^{\alpha_1}\ldots \partial_{x_m}^{\alpha_m}$,
$\alpha! = \alpha_1!\cdots\alpha_m!$, and
${h^\alpha = h_1^{\alpha_1}\cdots h_m^{\alpha_m}}$.

B-S/M used the mathematical theory of Itô processes to show a position in
a bond and a stock could perfectly hedge an option over an infinitesimal
period of time.  As a consequence, the portfolio is risk-free and must
grow at the risk-free rate[^2] if there are no arbitrage opportunities.
Earlier models assumed you needed to estimate the risk premium of the stock return.

[^2]: Actually, the funding rate available to the trader
implementing the hedge.
The funding desk at a bank charges a spread over their
cost of using repurchase agreements to provide this.
If you are a guy named Barney sitting in his underwear in
a trailer in New Mexico using your VISA card to fund
your day trading, you should use your APR.

Black, Scholes, and Merton were well aware of the shortcomings of their
model. Volatility is not constant.
Peter Carr (rightly) insisted the word "volatility" should
always be used with an adjective. The _implied volatility_ is
the constant to be plugged into B-S/M pricing formula that
recovers the option price. Traders use implied volatility as a
proxy for price.

This is a chicken and egg problem.
Traders know how to use the Black-Scholes formula to get the implied volatility
given the option price.
The question the B-S/M theory has no answer to
is how to get a price given the strike and expiration of an option.

Suppose you are a trader and your boss tells you to make a market
for a three month at-the-money call option on stock XYZ.
Further suppose the stock is very liquid but has no traded options.
Should we use historical _realized volatility_?
If there are other stocks in the same sector that have traded options
how do we incorporate that information?

This is not unlike the issue of finding the price of a bond that
is thinly traded. How do you incorporate the limited data you have to
estimate its price?

What follows is a simple and rigorous mathematical theory that
provides a framework for tackling this difficult problem.

## Ross

There is a theory for valuing, hedging, and measuring the risk of
any collection of instruments that generalizes the [@BlaSch1973] and
[@Mer1973] models. [@Ros1978] showed

> If there are no arbitrage opportunities in a market, then
there must exist a (not generally unique) positive linear operator that
can be used to value all marketed assets.

He used this to establish the Modigliani-Miller capital structure theorem
and a resolution to the closed-end mutual fund paradox, among other results.

> Let us stress again the power of these results. To begin with,
expectational mechanisms to describe how we anticipate the index, $X_t$,
will behave are irrelevant. Furthermore, there is no need for $X_t$ to
follow a diffusion process to apply the usual option analysis or, for
that matter, for the stream $c$ to follow any specific process. All that
is necessary is the assumption that current asset values do not permit
arbitrage. In particular, then, we do not even have to assume that the
current index price is in equilibrium to correctly appraise the project.

Expectation mechanisms are irrelevant? No need for prices to follow a
diffusion process? No need for equilibrium?  Experts in the academic
field seem to have trouble realizing they can cast off their cognitive
anchor in the unnecessary accoutrements of the classical Black-Scholes
and Merton theory.

If your career involves publishing papers, you may need to deal
with a referee pointing out an error that might delay publication.
If you are a quant responsible for turning mathematics into software
that will be used to run a business, there can be more serious
issues. The first time a trader shows up at your desk and says,
"The P\&L seems a little off." you better have a good explanation.
If you don't, the second visit might include the head of the trading
floor and angry questions like, "You told me this position was hedged! 
Were you lying to me then or are you lying to me now?"[^3]

[^3]: This is a verbatim transcription of what I have heard on a trading floor.
Fortunately, it was not directed at me.

There is no need to assume stocks involve a "real world" measure that
gets immediately thrown out for a "risk neutral" measure.  Ross showed
how to get the same results as B-S/M and how to generalize those from a
bond, stock, and option to any collection of instruments.  He seemed to
realize the difficulty he would face trying to communicating that.

> I believe that most of these are well known (at least at some level of
consciousness), but the failure to understand either their universality
or their applicability is endemic.

B-S/M answers the question of how much to trade but their answer to
when to trade is "continuously" and claim the hedge is riskless.
This note presents a model that does not give an obviously wrong answer
and exhorts readers to improve upon it.

We reify Ross's stream of cash flows $c$ to a stochastic process $(C_t)$
that is 0 except at a finite number of times.
This leads to a simple and mathematically
rigorous model to enable progress on the fundamental issues of when and
how much to trade, and how to manage the associated risk.

## Overview

Stephen [@Ros1978] showed there is no need for probability theory,
Itô processes, or partial differential equations.
Positive linear operators give rise to positive measures that can be
divided by their total mass resulting in a "risk-neutral probability
measure."  They are positive measures having mass 1, but are not the
probability of anything.  There is no need for a so-called real world
measure that gets immediately thrown out. 
His model works for _any_ collection of instruments,
not just the bond, stock, and option B-S/M considered.

Every arbitrage-free model of prices $(X_t)$ and cash flows $(C_t)$ has the form
$$
\tag{1}	X_t D_t = X_0 M_t - \sum_{s\le t} C_s D_s
$$
where $(D_t)$ are positive (valuation) measures and $(M_t)$ is a
vector-valued martingale measure indexed by market instruments.

__Exercise__. _Show_
$$
\tag{2}	X_t D_t = (X_u D_u + \sum_{t < s\le u} C_s D_s)|\AA_t.
$$

_Hint_: Replace $X_u D_u$ by (1) and cancel terms in the sum.
Use the martingale measure condition $M_u|\AA_t = M_t$, $u \ge t$
where the vertical bar indicates restriction of a measure.

If there are no cash flows then (2) can be interpreted as appropriately
discounted prices are a martingale. This was pointed out
by Paul [@Sam1965] prior to Black, Scholes and Merton.

If $X_u D_u$ goes to 0 as $u$ goes to infinity then (2) can be
interpreted as price is the present value of appropriately
discounted future cash flows. This was pointed out
in _Securities Analysis_ by [@GraDod1934].

For example, the B-S/M model of a bond and a stock having prices
$X_t = (R_t,S_t)$ and no dividends is
$D_t = e^{-\rho t}P$ and $M_t = (1, e^{\sigma B_t - \sigma^2/2})P$
where $P$ is Wiener measure on $\Omega = C[0,\infty)$
and $(B_t)$ is standard Brownian motion, $B_t(\omega) = \omega(t)$.

__Exercise__. _Show $R_t = e^{\rho t}$ and $S_t = S_0e^{\rho t + \sigma B_t - \sigma^2 t/2}$
where we assume initial prices ${X_0 = (1, S_0)}$_.

B-S/M considered a dynamic hedge in the bond and stock that replicates
a European option payoff. If the option pays $\nu(S_T)$
at expiration $T$ we need to find a trading strategy with value
$\nu(S_T)$ at $T$ having no intermediate cash flows.
The value of the option is the cost of setting up the initial hedge
which they show to be $E[\nu(S_T)D_T]$.
See the [B-S/M](#b-sm) appendix for the derivation.

Ross does not use probability measures.
In the Ross model $D_T$ is just a positive measure. Multiplying a
measure by a function, $\nu(S_T)D_T$, is also a measure
and he shows the option value is $\nu(S_T)D_T(\Omega)$.

Instead of conditional expectation we use the simpler notion of
restriction of measure.

__Exercise__. _Show $Y = E[X|\AA]$ if and only if ${Y(P|\AA) = (XP)|\AA}$_.

_Hint_: The definition of conditional expectation $Y = E[X|\AA]$ where
$\AA$ is an algebra of sets on $\Omega$ is
$Y$ is $\AA$-measurable and ${E[Y1_A] = E[X1_A]}$ for all $A\in\AA$.

The value, or mark-to-market, of a hedge at any time is
the amount that could potentially be obtained by liquidating
the position at current market prices.
If the value of the option is known
as a function of hedging instrument prices then the _delta_ hedge is
the mathematical derivative of option value with respect to underlying prices.
This gives an approximate hedge over
a short period of time.

## Simple Unified Model

Every model specifies a _sample space_ $\Omega$ of possible outcomes.
B-S/M use the space of continuous functions on the interval $[0, \infty)$.
Their notion of information available at time $u$ is that given a stock
trajectory $(S_t)_{t\ge0}$ you know $S_t$ exactly for $t < u$
and nothing about the value of $S_t$ if $t \ge u$.

_Partial information_ about a sample space is specified by a _partition_:
a collection of pairwise disjoint subsets having union equal to the sample space.
No information is the singleton partition $\{\Omega\}$. Complete information
is the partition of singletons ${\{\{\omega\}\mid\omega\in\Omega\}}$.
Partial information is knowing which _atom_ in the partition $\omega\in\Omega$
belongs to.

If $X\colon\Omega\to\RR$ is a function and $\AA$ is a partition
of $\Omega$ then $X$ is $\AA$-_measurable_ if and only if it is constant
on each element of the partition.

__Exercise__. _Show $X\colon\AA\to\RR$ is a well-defined function on the atoms of $\AA$_.

_Hint_: Show if $\omega$ and $\omega'$ belong to the same atom
of the partition then $X(\omega) = X(\omega')$.

### Model

Let $I$ be the set of market _instruments_ and $T$ be the set of _trading times_.
We use $\AA_t$ for the partition of $\Omega$ representing information available at time $t\in T$.
We assume $\AA_u$ is a _refinement_ of $\AA_t$ when $u > t$.
This means every $A\in\AA_t$ is the union of atoms in $\AA_u$
contained in $A$, $u > t$.
Information increases over time.

### Market

Every instrument has _prices_ and _cash flows_. We make the usual idealized
assumption that any amount
can be bought or sold at the given price and the unequivocal fact cash flows accrue
in proportion to the amount of the instrument held.

Prices and cash flows are functions $X_t,C_t\colon\AA_t\to\RR^I$ with
values indexed by the set of market instruments. We assume prices
are bounded and that cash flows are 0 except at a finite number of times,
just like in the real world.

### Trading

A _trading strategy_ is a sequence of stopping times 
$\tau_0 < \tau_1 < \cdots \tau_n$ and trading sizes
$\Gamma_j\colon\AA_{\tau_j}\colon\RR^I$.

A stopping time is a function $\tau\colon\Omega\to T$ where 
$\tau = t$ is known at time $t$, i.e.,
${\{\omega\mid\tau(\omega) = t\}}$ is a union of atoms of $\AA_t$ for all $t\in T$.
The partition corresponding to a stopping time is ${\AA_\tau = \cup\{\{\tau = t\}\mid t\in T\}}$.

__Exercise__. _Show $\AA_\tau$ is a partition of $\Omega$ for any stopping time $\tau$_.

Trading sizes accumulate to positions $\Delta_t = \sum_{\tau_j < t} \Gamma_j$.
Note the strict inequality. It takes some time for a trade executed at $t$ to settle.
To simplify formulas we write ${\Delta_t = \sum_{s < t} \Gamma_s}$ where
$\Gamma_s = \Gamma_j$ when $s = \tau_j$ and is zero otherwise.

The trading account accrues cash flows proportional to the current
position and debit the amount paid for trades just executed at
the current market price.
The _amount_ showing up in the trading account at time $t$ is
${A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t}$.

The _value_, or _mark-to-market_, is the amount that could
be putatively obtained from liquidating the existing positions and trades just done
at current market prices: ${V_t = (\Delta + \Gamma_t)\cdot X_t}$.
No actual trading is involved with calculating the value. 
Figuring out what prices to use for thinly traded instruments is problematic.

The profit and loss over a period is the difference in values.

Trading strategies create synthetic market instruments. Using the definitions
of $V_t$ and $A_t$
$$
\tag{3}	V_t D_t = (V_u D_u + \sum_{t < s\le u} A_s D_s)|\AA_t.
$$
Compare this to equation (2) and note how prices $(X_t)$ and cash flows $(C_t)$
correspond to values $(V_t)$ and amounts $(A_t)$.
This is the skeleton key to valuing derivatives.

__Exercise__. _Prove equation (3) from equation (2) using the definitions
of $V_t$ and $A_t$_.

_Hint_: Start with $V_t D_t = (\Delta_t + \Gamma_t)\cdot X_t D_t$ then equation (2)
with $u - t$ sufficiently small so $X_t D_t = (X_u D_u + C_u D_u)|\AA_t$.
Replace the $\Delta_t\cdot C_t$ term with $A_t + \Gamma_t\cdot X_t$
and use finite induction.

### Arbitrage

Arbitrage is a trading strategy that makes money on the first trade and never
loses money until it is closed out (position is zero).
Mathematically, $A_{\tau_0} > 0$, $A_t \ge0$ for $t > \tau_0$, and $\sum_{j=0}^n \Gamma_j = 0$.
Note this definition does not require probability.

If $(D_t)$ are positive measures on $\AA_t$, $t\in T$, then
$$
	V_{\tau_0} D_{\tau_0} = (\sum_{j = 1}^n A_{\tau_j} D_{\tau_j}) \mid \AA_{\tau_0}
$$



No need for Hahn-Banach.


## Greeks

Every positive random variable with finite expected value and log-variance
can be written $F = fe^{sX - \kappa(s)}$ where $f = E[F]$, $s^2 = \Var(\log F)$,
and $\kappa(s) = \log E[e^{sX}]$ is the cumulant of the mean 0 and
variance 1 random variable $X$. We call $f$ the _forward_ and $s$ the _vol_.

The forward value of a put option having strike $k$ is
$$
\begin{aligned}
	v &= E[\max\{k - F,0\}] \\
		&= E[(k - F)1(F \le k)] \\
		&= k P(F\le k) - E[F 1(F\le k)] \\
		&= k P(F\le k) - f [(F/f) 1(F\le k)] \\
		&= k P(F\le k) - f P_s(F\le k) \\
\end{aligned}
$$
where $P_s = e^{sX - \kappa(s)}P$.

__Exercise__. _Show $P_s$ is a probability measure_.

Since $F\le k$ if and only if $X \le (\log k/f + \kappa(s))/s$
$$
	E[\max\{k - F,0\}] = k\Psi(x,0) - f\Psi(x,s)
$$
where $x = x(k, f, s) =  (\log k/f + \kappa(s))/s$ is the
_moneyness_ and $\Psi(x,s) = P_s(X\le x)$.

Option _delta_ is the derivative of value with respect to forward price
$$
\partial_f v = E[-1(F\le k)\partial_f F] = -E[1(F\le k)e^{sX - \kappa(s)}] = -\Psi(x,s).
$$

Option _gamma_ is the second derivative of value with respect to forward price
$$
\partial_f^2 v = -\partial_x\Psi(x,s)\partial_f x = \partial_x\Psi(x,s)/fs.
$$

Option _vega_ is the derivative of value with respect to vol
$$
\partial_s v = E[-1(F\le k)\partial_s F] = -E[1(F\le k)F(X - \kappa'(s))]
$$
Since
$$
\partial_s \Phi(x,s) = \partial_s E[e^{sX - \kappa(s)} 1(X \le x)]
	= E[e^{sX - \kappa(s)}(X - \kappa'(s)) 1(X \le x)]
$$
we have $\partial_s v = f\partial_s\Phi(x,s)$.

## Black

The Fischer [@Bla1976] model uses $s = \sigma\sqrt{t}$ and $X$ standard normal.
Recall ${E[\exp(N)] = \exp(E[N] + \Var(N)/2)}$ if $N$ is normal.

__Exercise__. _Show the cumulant of a standard normal is $s^2/2$_.

Recall $E[\exp(N) f(M)] = E[\exp(N)] E[f(M + \Cov(N,M)]$
if $N$ and $M$ are jointly normal.

__Exercise__. _If $X$ is standard normal show $\Psi(x, s) = \Psi(x - s, 0)$_.

_Hint_: Use $\Psi(x, s) = E[e^{sX - s^2/2} 1(X \le x)]$.

__Exercise__. _Show the Black forward put value is ${v = k N(-d_-) - f N(-d_+)}$
where $N(x) = \Psi(x, 0)$ and ${d_\pm = (\log f/k \pm \sigma^2 t/2)/\sigma\sqrt{t}}$_.

__Exercise__. _Show the Black delta is $-N(-d_+)$_.

__Exercise__. _Show the Black gamma is $N'(d_+)/f\sigma\sqrt{t}$_.

__Exercise__. _Show the Black vega is $\partial_\sigma v = f N'(d_+)\sqrt{t}$_.

## Black-Scholes/Merton

The B-S/M model uses ${f = S_0e^{\rho t}}$ where $S_0$ is the initial stock price,
${s = \sigma\sqrt{t}}$ and the option value is discounted by ${e^{-\rho t}}$.

__Exercise__. _Derive the classical B-S/M value and greeks_.

## Remarks

Risk-free vs risk-neutral. Funding rate for strategies.

Commodity contracts -- storage costs

Continuous dividend rate. Hah!

## B-S/M

The original Black and Scholes paper had some mathematical mistakes
and unnecessary assumptions.
Robert Merton learned about Itô processes as a student at Caltech and
graciously waited to publish his rigorous derivation, back in the day when gentlemen scholars
respected priority.

We give a schematic review of Merton's mathematically correct
derivation of their eponymous partial differential equation
to compare with Ross's theory.

Every stochastic process $(X_t)_{t\ge0}$ is determined by its
_joint cumulative distribution function_
$F_{t_0,\ldots,t_n}(x_0,\ldots,x_n) = P(X_{t_0} \le x_0,\ldots, X_{t_n}\le t_n)$.
Given samples from a stochastic process 

A process is _stationary_ if $(X_t)$ and $X_{t + s} - X_s$ have the same 
joint cumulative distribution. The mathematical import is that you can start sampling
at any time and get the same statistics. The reality is that this is
rare in financial time series. 

A process has _independent increments_ if given $t_0 < t_1 < \cdots t_n$
then $X_{t_0}, X_{t_1} - X_{t_0}, \ldots, X_{t_n} - X_{t_{n-1}}$ are independent.

He also showed if a stochastic process is stationary with independent increments
it is completely determined by its distribution at a single time and its
distribution is infinitely divisible

A random variable $X$ is _infinitely divisible_ if for any $n\in\NN$
$X$ has the same law as $X_1 + \cdots + X_n$ where $(X_i)$ are independent have have
the same law.

Kolmogorov showed if for any $n\in\NN$ $X = X_1 + \cdots + X_n$
where $X_i$ have finite variance, have the same distribution, and are independent then
$$
	\log E[e^{sX}] = \gamma s + \int_{-\infty}^\infty K_x(s)\,dG(s)
$$
where $K_x(s) = (e^{sx} - 1 - sx)/s^2 = \sum_{k=2}^\infty s^{n-2}x^n/n!$.

They assume the bond price satisfies $dR_t/R_t = \rho\,dt$ and
stock price satisfies the stochastic differential equation
$dS_t/S_t = \mu\,dt + \sigma\,dB_t$ where $\rho$, $\mu$, and $\sigma$ are constant and
$(B_t)$ is standard Brownian motion.

Mathematically rigorous proofs require the SDE be expressed as an Itô integral.

but we will get by with
the _Itô calculus_ $(dt)^2 = 0$, $dt\,dB_t = dB_t\,dt = 0$, and $(dB_t)^2 = dt$.

Suppose $0 = t_0 < t_1 < \cdots t_n = t$. Define ${\Delta t_j = t_{j + 1} - t_j}$
and ${\Delta t = \max_{0\le j < n} \Delta t_j}$.

__Exercise__. _Show $\sum_{0\le j < n} \Delta t_j = t$_.

_Hint_: It is a telescoping sum.

__Exercise__. [$(dt)^2 = 0$] _Show $\sum_{0\le j < n} (\Delta t_j)^2$ 
goes to zero as $\Delta t$ goes to zero_.

_Hint_: Start with $\sum_{0\le j < n} (\Delta t_j)^2 \le \Delta t \sum_{0\le j < n} \Delta t_j$

__Exercise__. [$dt\,dB_t = 0$] _Show $E[\sum_{0\le j < n} \Delta t_j\,\Delta B_j] = 0$ 
and $\Var(\sum_{0\le j < n} \Delta t_j\,\Delta B_j)$
goes to zero as $\Delta t$ goes to zero_.

_Hint_: Use $\Var(\Delta B_j) = \Delta t_j$ and $(\Delta B_j)$ are independent.

__Exercise__. [$(dB_t)^2 = dt$] _Show $E[\sum_{0\le j < n} (\Delta B_j)^2] = t$ 
and $\Var(\sum_{0\le j < n} (\Delta B_j)^2)$
goes to zero as $\Delta t$ goes to zero_.

_Hint_: You will need to compute $\Var(\Delta B_t^2) = E[\Delta B_t^4] - E[\Delta B_t^2]^2$.
Use $E[e^{sX}] = e^{s^2/2}$ if $X$ is standard normal and read off the
moments using $E[e^{sX}] = \sum_{n=0}^\infty s^n E[X^n]/n!$.

We need the facts that if $X$ and $Y$ are Itô processes then
so are $aX$ for $a\in\RR$, $X + Y$, and $XY$.
Recall ${d(XY) = (X + dX)(Y + dX) - XY = X\,dY + Y\,dX + dX\,dY}$.

Itô showed that $Y_t = f(t,X_t)$ is an Itô diffusion that satisfies
$$
	dY_t = f_t(t, X_t) + f_x(t, X_t) + \frac{1}{2} f_{xx}(t, X_t)
$$
if the partial derivatives of $f$ satisfy certain technical conditions.
This can be generalized to vector valued processes $X = (X_i)$.
$$
	dY_t = f_t(t, X_t) + \sum_i f_{x_i}(t, X_t) + \sum_{i,j} \frac{1}{2} f_{x_ix_j}(t, X_t)
$$

Merton considered strategies where the position held in each instrument
depended on the time where 
$M_t = m(t, R_t, S_t)$ is the amount held in the bond and
$N_t = n(t, R_t, S_t)$ is the amount held in the stock at time $t$. The value of the
position at $t$ is $V_t = M_t R_t + N_t S_t$.

Dropping the $t$ subscript and using the Itô calculus
$$
\begin{aligned}
dV &= (M\,dR + R\,dM + dM\,dR) + (N\,dS + S\,dN + dN\,dS \\
	&= dM(R + dR) + dN(S + dS) + M\,dR + N\,dS \\
\end{aligned}
$$
The first two terms in the last equation are the cost of adjusting the
bond and stock hedge at time $t + dt$. A trading strategy is
_self-financing_ if this is 0.

Note $M\,dR = (V - NS)\rho\,dt$ since $M = (V - NS)/R$.
Using the Itô formula for $V_t = v(r, R_t, S_t)$ we have
$$
\begin{aligned}
	dV_t &= (V_t - N_t S_t)\rho\,dt + N_t\,dS_t \\
		&= V_t\,dt + v_r\,dR + v_s\,dS + \frac{1}{2}v_{ss} (dS_t)^2 \\
		&= (v_t + \rho R_t v_r + \frac{1}{2}\sigma^2 S_t^2 v_{ss})\,dt + v_s\,dS_t. \\
\end{aligned}
$$
Equating the $dS_t$ terms gives the stock hedge $N_t = v_s$ and equating the $dt$ terms gives
$$
	(v - s v_s)\rho = v_t + \rho r v_r + \frac{1}{2}\sigma^2 s^2 v_{ss}.
$$

## References

