---
title: The Unified Model
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: |
 Every arbitrage-free market model is parameterized by a vector-valued
 martingale and a positive adapted process.  There is no need to restrict
 models to Ito processes, use partial differential equations, or consider
 self-financing portfolios. There is also no need for utility functions or market equilibrium.
 In fact, there is no need for probability measures. The Unified Model involves only geometry,
 as was first pointed out by Stephen Ross. We do need the notion of algebras of sets
 in order to mathematically model partial information.
 Market participants can only execute a finite number of trades.
 It is time to banish the mathematical fiction of continuous time trading and
 focus on problems practitioners find useful: when to re-hedge
 and what are the risk trade-offs.
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\RR}{𝑹}
\renewcommand{\AA}{\mathcal{A}}

There is a clear trajectory in mathematical finance starting from Black,
Scholes, and Merton showing how to use a bond and a stock to hedge an
option. Ross showed how to extend this to any number of instruments
in the one-period case using a not quite correct application of the
Hahn-Banach theorem. This was fixed up and extended to multi-period
models. Credit and liquidity considerations were eventually added.

This note supplies a mathematically rigorous approach to extend this trajectory.
and make model assumptions explicit.
Large banks, money management firms, and hedge funds need to consider
cross market correlations. Risk management has recognized market
realities involving large positions. Models must allow for the
empirical fact that not all market participants act optimally.

Scholes and Merton won a Nobel Prize for a new method of valuing derivative securities that
did not require estimating the return on the underlying. Under the assumption that
future stock prices could be modeled by geometric Brownian motion and it was possible
to trade in continuous time, all one needed to know was the volatility.

## Ross

Stephen Ross expanded the Black, Scholes, and Merton theory to
any number of instruments in the one-period case.
His Fundamental
Theorem of Asset pricing was a geometric result that could be proved
using the Hahn-Banach theorem.  He posited that prices of $n$ instruments
at the beginning of the period can be represented as a vector $x\in\RR^n$
and the prices at the end of the period are functions of possible outcomes $\Omega$
where $X\colon\Omega\to\RR^n$ indicates prices $X(\omega)$ at the end of the
period if $\omega\in\Omega$ occurred.  He showed this model is arbitrage-free if and
only if $x$ belongs to the smallest closed cone containing the range of
$X$. This is equivalent to
$$
	x = \int_\Omega X(\omega)\,d\Pi(\omega)
$$
for some positive measure $\Pi$ on $\Omega$.

Arbitrage exists, for this model, if there is a $\gamma\in\RR^n$
with $\gamma\cdot x < 0$ and $\gamma\cdot X(\omega)\ge0$ for all
$\omega\in\Omega$.  This corresponds to a trading strategy of purchasing
$\gamma$ shares at the beginning of the period and selling $\gamma$
shares at the end of the period.  The cost of acquiring $\gamma$ shares
at the beginning of the period is $\gamma\cdot x$. If the cost is
negative the strategy generates money on the initial trades.
Selling $\gamma$ shares at the end of the period generates
$\gamma\cdot X(\omega)$ in value if $\omega\in\Omega$ occurred.
If this is non-negative then there is an arbitrage:
you make money entering the trade and do not lose money when exiting.

The notion of $\gamma\cdot x = 0$ and $\gamma\cdot X$ being positive with
some positive probability as a definition of arbitrage is ridiculous.
How positive will the profit be? What is the probability it will be
realized?
Of course any trader or risk manager would compare the initial profit
$-\gamma\cdot x$ to the amount of capital that would be involved,
$|\gamma|\cdot |x|$ before dragging in a probability measure.

A rigorous statement of Ross' theorem is that if $X$ is bounded then
there exists a finitely additive measure $\Pi$ such that
$$
	x = \int_\Omega X(\omega)\,d\Pi(\omega).
$$
If $B(\Omega)$ is the set of bounded functions on $\Omega$
then its _dual_ is $B(\Omega)^* = ba(\Omega)$, the set of
finitely additive measures on $\Omega$. Integration is
a linear function from $B(\Omega)$ to $\RR$.

Suppose there exists $\zeta\in\RR^n$ with $\zeta\cdot X = 1$.
The market model has a zero coupon bond paying 1 unit at the end of the period.
It costs $\zeta\cdot x$ at the beginning of the period
to get a certain cash flow of $1$ at the end of the period.
The _discount_ over the period is
$$
	D = \zeta\cdot x = \int_\Omega \zeta\cdot X\,d\Pi = \int_\Omega d\Pi = \|\Pi\|,
$$
where $\|\Pi\|$ is the total mass of $\Pi$ since $\Pi$ is positive.
It is true that $P = \Pi/\|\Pi\|$ is a positive measure
with mass 1. Technically, it is a probability measure. But that does not
mean it represents the probability of any particular event occurring.
It is called the _risk neutral measure_, but a more accurate name
is _risk blind_ measure. It provides no insight into real-world probabilities.

We can write $x = \int X\,d\Pi = \int X\,d(\Pi/\|\Pi\|) \|\Pi\| = E[XD]$
under the risk neutral measure. The price at the beginning of the
period is the expected value of the discounted price at the end of he period.

Note that in any arbitrage-free model we have $x_i = E[X_iD]$, $1\le i\le n$.
Every instrument has the same expected return

## Unified Model

Let $T$ be the set of times trading can occur. 
In the Black-Scholes/Merton model $T = [0,\infty)$ is
the set of non-negative real numbers.
In the real world, trades can only occur when markets are open.
In mathematical finance the usual assumption is that a model
is only being considered at an _epoch_.

Let $I$ be the set of market instruments: bonds, stocks, convertible
bonds.


Assume $\Omega$ is the sample space of possible outcomes, $P$ is a probability measure
on $\Omega$, and $\AA_t$ are algebras of sets
indicating the information available at each trading time $t\in T$.
As you might suspect by now, we don't need an a priori probability
measure. We just use it as a convenience for now.
We do need algebras of sets to model partial information.
Keep an open mind about $\Omega$, people seem to underestimate
how important it is to include every possibilty.

### Market

A _market model_  for a set $I$ of _instruments_ is specified by
stochastic processes for _prices_ $X_t\colon\AA_t\to\RR^I$
and _cash flows_ $C_t\colon\AA_t\to\RR^I$, $t\in T$. [^1]

[^1]: If $\AA$ is an [_algebra of
sets_](https://en.wikipedia.org/wiki/Algebra_of_sets) on the set
$\Omega$ we write $X\colon\AA\to\RR$ to indicate $X\colon\Omega\to\RR$ is
$\AA$-[_measurable_](https://en.wikipedia.org/wiki/Measurable_function).
If $\AA$ is finite then the
[_atoms_](https://en.wikipedia.org/wiki/Atom_(measure_theory)) of $\AA$
form a [_partition_](https://en.wikipedia.org/wiki/Partition_of_a_set)
of $\Omega$ and $X$ is $\AA$-measurable if and only if it is constant
on atoms of $\AA$. In this case $X$ is indeed a function on the atoms.

[^2]: If $A$ and $B$ are sets then $A^B = \{f\colon B\to A\}$ is
the set of all functions from $B$ to $A$.

We assume any amount of each instrument can be bought or sold at price $X_t$ at time $t\in T$.
Cash flows are almost always 0. Stocks pay dividends on dividend dates, bonds pay 
periodic coupons, European options have a single cash flow at expiration, futures have
daily margin adjustments as cash flows. The price of a futures is always 0.

### Trading

A _trading strategy_ is a finite, increasing set of stopping times $(\tau_j)$
and how much of each instrument to trade $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$.
Trades accumulate to a _position_
$$
	\Delta_t = \sum_{\tau_j < t}\Gamma_j = \sum_{s < t} \Gamma_s
$$
where $\Gamma_s = \Gamma_j$ if $\tau_j = s$.
Note the strict inequality. This reflects the reality that it takes some time
after a trade is executed for it to settle.

The _value_, or _mark-to-market_ of a trading strategy is
$$
	V_t = (\Delta_t + \Gamma_t)\cdot X_t.
$$
It the the amount
generated by unwinding the current position and trades just executed at
the prevailing market price, assuming that is possible.

Trading strategies involve cash flow _amounts_ 
$$
	A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t.
$$
At time $t$ all cash flows are received in proportion to the existing position and
the trades just executed are debited from the trading account.

### Arbitrage

_Arbitrage_ exists for a model is there exists a trading strategy $(\tau_j, \Gamma_j)$
with $\sum_j \Gamma_j = 0$, $A_{\tau_0} > 0$, and $A_t\ge0$ for $t > \tau_0$.
The strategy must close out, make money on the first trade, and never lose money thereafter.

Arbitrage-free models are parameterized by a vector-valued martingale,
$M_t\colon\AA_t\to\RR^I$ and a positive adapted process $D_t\colon\AA_t\to (0,\infty)$:
$$
	X_t D_t = M_t - \sum_{s\le t}C_s D_s.
$$

__Lemma__. _If $X_t D_t = M_t - \sum_{s\le t}C_s D_s$ then_
$$
	X_t D_t = E[X_u D_u + \sum_{t < s \le u} C_s D_s\mid\AA_t]
$$

_Proof_. We have
$$
\begin{aligned}
	E[X_u D_u + \sum_{t < s \le u} C_s D_s\mid\AA_t]
	&= E[M_u - \sum_{s\le u}C_s D_s + \sum_{t < s \le u} C_s D_s\mid\AA_t] \\
	&= E[M_u - \sum_{s\le t}C_s D_s \mid\AA_t] \\
	&= M_t - \sum_{s\le t}C_s D_s \\
	&= X_t D_t
\end{aligned}
$$

__Lemma__. _Using $V_t = (\Delta_t + \Gamma_t)\cdot X_t$ and $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$,_
$$
	V_t D_t = E[V_u D_u + \sum_{t < s \le u} A_s D_s\mid\AA_t]
$$

This shows every trading strategy produces a synthetic instrument with "prices" $V_t$ and
"cash flows" $A_t$.

_Proof_. Note $X_t D_t = E_t[X_u D_u + C_u D_u]$ and $V_t = (\Delta_t + \Gamma_t)\cdot X_t
= \Delta_u\cdot X_t$ for $u > t$ sufficiently small.
$$
\begin{aligned}
	V_t D_t &= \Delta_u\cdot X_t D_t \\
	&= \Delta_u \cdot E_t[X_u D_u + C_u D_u] \\
	&= E_t[(\Delta_u \cdot X_u + \Delta_u \cdot C_u) D_u] \\
	&= E_t[(V_t - \Gamma_t\cdot X_t + A_t + \Gamma_t\cdot X_t) D_u] \\
	&= E_t[(V_t + A_t) D_u] \\
\end{aligned}
$$
The proof follows by induction on $u$.

__Theorem__. _Every model of the form $X_t D_t = M_t - \sum_{s\le t}C_s D_s$ where $M_t$ is
a martingale and $D_t$ is positive and adapted is arbitrage free_.

_Proof_. If $(\tau_j, \Gamma_j)$ is a closed out trading strategy with $A_t\ge0$ for $t > \tau_0$
then $V_{\tau_0} = E[ \sum_{t < s \le u} A_s D_s\mid\AA_{\tau_0}] \ge 0$.
Since $V_{\tau_0} = \Gamma_0\cdot X_{\tau_0} = -A_{\tau_0}$ and $D_t$ is positive we have
$A_{\tau_0} \le 0$ so there is no arbitrage.

## Appendix

### Algebras of Sets

Algebras of sets are used to model partial information.
If the algebra is finite then the atoms form a partition.
Complete information is knowing the element of the set,
partial information is knowing only what atom it belongs to.
