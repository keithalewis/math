---
title: The Unified Model
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: |
 Every arbitrage-free pricing model is parameterized by a vector-valued
 martingale and a positive adapted process.  There is no need to restrict
 models to Ito processes, use partial differential equations, or consider
 self-financing portfolios. There is also no need for utility functions or
 market equilibrium assumptions.
 In fact, there is no need for probability measures. The Unified Model involves only geometry,
 as was first pointed out by Stephen Ross. We do need the notion of algebras of sets
 in order to mathematically model partial information.
 Continuous time trading is not possible, market participants can only execute a finite number of trades.
 The Unified model focuses on problems practitioners find useful: when to rehedge
 and what are the risk tradeoffs.
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\cone}{\operatorname{cone}}
\newcommand{\RR}{𝑹}
\renewcommand{\AA}{\mathcal{A}}

There is a clear trajectory in mathematical finance starting from Black,
Scholes, and Merton valuing
an option to expand the universe of instruments, incorporate credit
and liquidity considerations, and make model assumptions explicit.
Realistic models must allow for the empirical fact that not all market participants
act optimally.

Scholes and Merton won a Nobel Prize for a new method of valuing derivative securities that
did not require estimating the return on the underlying. Under the assumption that
future stock prices could be modeled by geometric Brownian motion and it was possible
to trade in continuous time, all one needed to know was the volatility.

## One-Period

Stephen Ross expanded the theory in the one-period case to any number of instruments.
He showed the Fundamental Theorem of Asset pricing was a geometric result that
could be proved using the Hahn-Banach theorem. 
He posited that prices of $n$ instruments at the beginning of the period
can be represented as a vector $x\in\RR^n$ and the prices at the end
of the period are functions of possible outcomes $X\colon\Omega\to\RR^n$.
He showed this model is arbitrage-free if and only if $x$ belongs to
the smallest closed cone containing the range of $X$.
If $X$ is bounded this is equivalent
to
$$
	x = \int_\Omega X(\omega)\,dD(\omega)
$$
for some positive finitely additive measure $D$ on $\Omega$.
The measure is only unique in the rare case of complete markets.

Let $I$ be the set of market instruments. The prices at the beginning of the period are
a vector $x\in\RR^I$.
Recall $A^B$ is the set of all functions from the set $B$ to the set $A$.
Each $x\in\RR^I$ is a function $x\colon I\to\RR$ where
$x(i)$ is the price of instrument $i\in I$ at the beginning of the period.
Note $\RR^I$ is a vector space under pointwise addition and scalar multiplication.
If $f,g\in\RR^I$ then $f + g\in\RR^I$ is defined by $(f + g)(i) = f(i) + g(i)$
and $tf\in\RR^I$ for $t\in\RR$ is defined by $(tf)(i) = tf(i)$, $i\in I$.
This avoids the circumlocution of specifying $I = \{i_1,\ldots,i_n\}$ and
specifying $x\in\RR^n$ by $x_j = x(i_j)$, $1\le j\le n$.

Arbitrage exists in a one-period model if it is possible to buy a
portfolio of instruments at negative cost and sell them at the end of the
period without losing money.  The cost of purchasing $\gamma\in\RR^I$
in each instrument at the beginning of the period is the dot product
$\gamma\cdot x$. Assuming the position is unwound at the end of
the period, it will pay $\gamma\cdot X(\omega)$ if $\omega\in\Omega$
occurs. Arbitrage exists if there is a $\gamma\in\RR^I$ with $\gamma\cdot
x < 0$ and $\gamma\cdot X\ge0$ as a function on $\Omega$.

If $V$ is a vector space a subset $C\subseteq V$ is a _cone_ if
$tC\subseteq C$ for $t\ge0$ and $C + C\subseteq C$, where
$tC = \{tv\mid v\in C\}$ and $C + C = \{v + w\mid v,w\in C\}$.

__Exercise__ _The set of arbitrage portfolios are a cone_.

If $S\subseteq V$ then the smallest cone containing $S$, $\cone S$, is
is the set of finite linear combinations $\sum t_j s_j$ where
$t_j > 0$ and $s_j\in S$.

Suppose $x = \sum_j X(\omega_j) D_j$ where $\omega_j\in\Omega$ and $D_j > 0$.
If $\gamma\in\RR^I$ and $\gamma\cdot X\ge0$ then $\gamma\cdot x\ge0$.
This shows there is no arbitrage if $x\in\cone X(\Omega)$.
Ross established the more difficlut result that the converse is true.

### Examples

Consider a one-period market with a bond who's value doubles over the period,
a stock with initial price 1 that either stays the same or triples in value,
and a call option on the stock with strike 2 and price $c$.
This is modeled by $x = (1,1,c)$, $X(\omega) = (2,\omega,\max\{\omega - 2, 0\})$
where $\Omega = \{1, 3\}$. For the model to be arbitrage-free there must
exist $p,q\ge0$ with $x = X(1)p + X(3)q$.
The constraint on the bond and stock give $1 = 2p + 2q$ and $1 = p + 3q$ respectively.
These equations have the unique solution $p = q = 1/4$ so $c = 0\times 1/4 + 1\times 1/4 = 1/4$.
Note $p + q = 1/2$ is the discount over the period.

Subsequent models extended this to the multi-period case and incorporated
the fact instruments can have cash flows.

Breeden

Interest rate models


## Unified Model

Assume $\Omega$ is the sample space of possible outcomes, $P$ is a probability measure
on $\Omega$, and $\AA_t$ are algebras of sets
indicating the information available at each trading time $t\in T$.

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

We assume any amount of each instrument can be bought or sold at price $X_t$ at time $t\in T$.
Cash flows are almost always 0. Stocks pay dividends on dividend dates, bonds pay 
periodic coupons, European options have a single cash flow at expiration, futures have
daily margin adjustments as cash flows. The price of a futures is always 0.

### Trading

A _trading strategy_ is a finite set of increasing stopping times $(\tau_j)$
and how much of each instrument to trade $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$
at each time.
Trades accumulate to a _position_
$$
	\Delta_t = \sum_{\tau_j < t}\Gamma_j = \sum_{s < t} \Gamma_s
$$
where $\Gamma_s = \Gamma_j$ if $s = \tau_j$.
Note the strict inequality. This reflects the reality that it takes some time
after a trade is executed for it to settle.

Note we do not assume there is a money market account available to finance
trading, much less that the strategy is self-financing.

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

_Arbitrage_ exists (for a market model) if there exists a trading strategy $(\tau_j, \Gamma_j)$
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

__Lemma__. _Using value $V_t = (\Delta_t + \Gamma_t)\cdot X_t$ 
and account $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$,_
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

## Examples

## Appendix

A collection of some fundamental facts everyone should be aware of.

### Algebras of Sets

Algebras of sets are used to model partial information.
If the algebra is finite then the atoms form a partition.
Complete information is knowing the element of the set,
partial information is knowing only what atom it belongs to.

A sequence of coin flips can be modeled by the sample space of real numbers
between 0 and 1, $\Omega = [0,1)$. Every number $\omega\in\Omega$ can be
written as $\omega = \sum_{j = 1}^\infty \omega_j 2^{-j}$ where $\omega_j$
is either 0 or 1. The digits in the base 2 representation can be 
interpreted as coin flips: 1 means heads and 0 means tails, or vice versa.

The first flip is determined by $\omega_1$. The partition
$\{[0, 1/2),[1/2, 1)\}$ of $\Omega$ 
represents knowing the first flip. If $\omega_1 = 0$ then $\omega\in[0,1/2)$.
If $\omega_1 =1$ then $\omega\in[1/2,1)$.
The partition $\AA_n = \{[j2^{-n}, (j+1)2^{-n})\mid 0\le j < 2^n\}$ represents
knowing the first $n$ flips.

A subsets of a sample space $\Omega$ are called _events_. 
If we want to talk about event $E$ _not_ happening or both 
event $E$ _and_ $F$ happened 
