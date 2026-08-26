---
title: Better than Black-Scholes
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\renewcommand\AA{\mathcal{A}}

There is a theory for valuing, hedging, and measuring the risk of
any collection of instruments that generalize the [@BlaSch1973] and
[@Mer1973] model. Using the Hahn-Banach theorem [@Ros1978] showed

> If there are no arbitrage opportunities in a market, then
there must exist a (not generally unique) positive linear operator that
can be used to value all marketed assets.

He used this result to establish the Modigliani-Miller theorem
and a resolution to the closed-end mutual fund paradox among
other results.

> Let us stress again the power of these results. To begin with,
expectational mechanisms to describe how we anticipate the index, $X_t$,
will behave are irrelevant. Furthermore, there is no need for $X_t$ to
follow a diffusion process to apply the usual option analysis or, for
that matter, for the stream $c$ to follow any specific process. All that
is necessary is the assumption that current asset values do not permit
arbitrage. In particular, then, we do not even have to assume that the
current index price is in equilibrium to correctly appraise the project.

Ross seemed to realize the difficulty he faced communicating this.

> I believe that most of these are well known (at least at some level of consciousness),
but the failure to understand either their universality or their applicability is endemic.

I am writing this piece to convince you the [@BlaSch1973] and [@Mer1973]
model for valuing options is untenable for describing actual trading.
Its many limitations and defects have been extensively documented but
their assumption of continuous time trading is particularly problematic.
Traders can only execute a finite number of trades to hedge an option
and want to know when, how much, and the risk involved.  B-S/M only
answers the 'how much' question.  Telling a trader the answer to 'when' is
"continuously" and then claim the risk is zero
undermines academic credibility.

The good news is that there is a simple and mathematically rigorous 
model to enable progress on these fundamental issues.

## Ross

Stephen [@Ros1978] came up with a simpler and more general theory than
B-S/M for valuing derivatives.  He showed their
result follows from geometry. There is no need for probability theory,
Itô processes, or partial differential equations.
Ross used the Hahn-Banach theorem to show

> If there are no arbitrage opportunities in a market, then
there must exist a (not generally unique) positive linear operator that
can be used to value all marketed assets.

Positive linear operators give rise to positive measures that can be
divided by their total mass resulting in a "risk-neutral probability
measure."  They are positive measures having mass 1, but are not the
probability of anything.  There is no need for a so-called real world
measure that gets immediately thrown out. 
His model works for _any_ collection of instruments,
not just the bond, stock, and option B-S/M considered.

> Let us stress again the power of these results. To begin with,
expectational mechanisms to describe how we anticipate the index, $X_t$,
will behave are irrelevant. Furthermore, there is no need for $X_t$ to
follow a diffusion process to apply the usual option analysis or, for
that matter, for the stream $c$ to follow any specific process. All that
is necessary is the assumption that current asset values do not permit
arbitrage. In particular, then, we do not even have to assume that the
current index price is in equilibrium to correctly appraise the project.

Many experts in the field seem to have trouble casting off their cognitive anchor
in the classical theory.
Ross's claims "expectational mechanisms" are "irrelevant",
"there is no need" for prices "to follow a diffusion process", "all
that is necessary is the assumption that current asset values do not
permit arbitrage", and "we do not even have to assume that the current
index price is in equilibrium" follow from simple math.

My reading of "the stream $c$" is the stream of stock dividends. Ross
was in the equity world at the time and assumed a jump in stock price
corresponded to a dividend payment. This is an untenable definition.
Stocks "jump" between market close
and market open with no associated cash flow.  Fixed income instruments
are defined by their cash flows. Futures always have price 0 and
periodic cash flows determined by the change in market quotes.

Replacing $c$ with cash flows $(C_t)$ received at time $t$ associated
with owning instruments leads to an even more powerful theory.

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
Use the martingale measure condition $M_u|\AA_t = M_t$, $u \ge t$.

If there are no cash flows then (2) can be interpreted as appropriately
discounted prices must be a martingale. This was pointed out
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

__Exercise__. _Show $R_t = e^{\rho t}$ and $S_t = S_0e^{\rho_t + \sigma B_t - \sigma^2 t/2}$
where we assume $X_0 = (1, S_0)$_.

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

The value, or mark-to-market, of a hedge at any time
is the sum of the current hedge positions times current market prices.
If the value of the option is known
as a function of hedging instrument prices then the _delta_ hedge is
the derivative of option value with respect to underlying prices.

By the definition of derivative, this gives an approximate hedge over
a short period of time. Traders only care about delta hedges. Their
P\&L is the difference between the model value and the actual value
produced by their hedge. Risk managers use higher order derivatives
to empirically verify Taylor's formula.

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

If $X\colon\Omega\to\RR$ is a function and If $\AA$ is a partition
of $\Omega$ then $X$ is $\AA$-_measurable_ if and only if it is constant
on each element of the partition.

__Exercise__. _Show $X\colon\AA\to\RR$ is a well-defined function_.

_Hint_: Show if $\omega$ and $\omega'$ belong to the same atom
of the partition then $X(\omega) = X(\omega')$.

Instead of using conditional expectation as in the classical theory
we use the much simple concept of restriction of measure.

__Exercise__. _Show $Y = E[X|\AA]$ if and only if $Y(P|\AA) = (XP)|\AA$_.

_Hint_: Recall $Y = E[X|\AA]$ if and only if $Y$ is $\AA$-measurable and
$E[Y1_A] = E[X1_A]$ for all $A\in\AA$.

### Model

Let $I$ be the set of market _instruments_ and $T$ be the set of _trading times_.
We use $\AA_t$ for the partition of $\Omega$ representing information available at time $t\in T$.
We assume $\AA_u$ is a _refinement_ of $\AA_t$ when $u > t$.
This means every $A\in\AA_t$ is the union of atoms in $\AA_u$
contained in $A$, $u > t$.
Information increases over time.

### Market

Every instrument has _prices_ and _cash flows_. We assume any amount
can be bought or sold at the given price and cash flows accrue
in proportion to the amount of the instrument held.

Prices and cash flows are functions $X_t,C_t\colon\AA_t\to\RR^I$ with
values indexed by the set of market instruments. We assume prices
are bounded and that cash flows are 0 except at a finite number of times,
just like in the real world.

### Trading

A _trading strategy_ is a sequence of stopping times 
$\tau_0 < \tau_1 < \cdots \tau_n$ and trading sizes
$\Gamma_j\colon\AA_{\tau_j}\colon\RR^I$.
A stopping time is a function $\tau\colon\Omega\to T$ satisfying
${\{\omega\mid\tau(\omega) = t\}}$ is a union of atoms of $\AA_t$ for all $t\in T$.
Stopping at time $t$ depends only on the information available at time $t$.
The partition corresponding to a stopping time is ${\AA_\tau = \cup\{\{\tau = t\}\mid t\in T\}}$.

__Exercise__. _Show $\AA_\tau$ is a partition of $\Omega$ for any stopping time $\tau$_.

Trading sizes accumulate to positions $\Delta_t = \sum_{\tau_j < t} \Gamma_j$.
Note the strict inequality. It takes some time for a trade executed at $t$ to settle.
To simplify formulas we write ${\Delta_t = \sum_{s < t} \Gamma_s}$ where
$\Gamma_s = \Gamma_j$ when $s = \tau_j$ and is zero otherwise.

The trading account accrues cash flows proportional to the current
position and debit the amount paid for trades just executed.
The _amount_ showing up in the trading account at time $t$ is
${A_t = \Delta_t\cdot X_t - \Gamma_t\cdot X_t}$.

The _value_, or _mark-to-market_, is the amount that could
be obtained from liquidating the existing positions and trades just done
at current market prices: ${V_t = (\Delta + \Gamma_t)\cdot X_t}$.
No actual trading is involved with calculating the value. 
The profit and loss over a period is the diffenence in values.

### Arbitrage

Arbitrage is a trading strategy the makes money on the first trade and never
loses money until it is closed out (position is zero).
This means $A_{\tau_0} > 0$, $A_t \ge0$ for $t > \tau_0$, and $\sum_{j=0}^n \Gamma_j = 0$.

If $(D_t)$ are positive measures on $\AA_t$, $t\in T$, then


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

Commodity contracts -- storage costs

## B-S/M

The original Black and Scholes paper had some mathematical mistakes
and unnecessary assumptions.
Robert Merton learned about Itô processes as a student at Caltech and
graciously waited to publish, back in the day when gentlemen scholars
respected priority.

We give a schematic review of Merton's mathematically correct
derivation of their eponymous partial differential equation.

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

