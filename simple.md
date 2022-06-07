---
title: The Unified Model
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: 
Every arbitrage-free pricing model is parameterized by a vector-valued
martingale and a positive adapted process.  There is no need to restrict
models to Ito processes, use partial differential equations, or consider
self-financing portfolios. There is also no need for utility functions or market equilibrium.
Market participants can only execute a finite number of trades.
It is time to banish the mathematical fiction of continuous time trading and
focus on problems practicioners find useful: when to rehedge
and what are the risk tradeoffs.
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\RR}{𝑹}
\newcommand{\AA}{\mathcal{A}}

There is a clear trajectory in mathematical finance starting from Black,
Scholes, and Merton showing how to use a bond and a stock to hedge an
option to expand the universe of instruments, incorporate credit and
liquidity considerations, and make model assumptions explicit.
Large banks, money management firms, and hedge funds need to consider
cross market correlations. Risk management has recognized market
realities involving large positions. Models must allow for the
empirical fact that not all market participants act optimally.

Scholes and Merton won a Nobel Prize for a new method of valuing derivative securities that
did not require estimating the return on the underlying. Under the assumption that
future stock prices could be modelled by geometric Brownian motion and it was possible
to trade in continuous time, all one needed to know was the volatiliy.

Stephen Ross expandend the theory in the one-period case to any number of instruments.
He showed the Fundamental Theorem of Asset pricing was a geometric result that
could be proved using the Hahn-Banach theorem. 
He posited that prices of $n$ instruments at the begining of the period
can be represented as a vector $x\in\RR^n$ and the prices at the end
of the period are functions of possible outcomes $X\colon\Omega\to\RR^n$.
He showed this model is arbitrage-free if and only if $x$ belongs to
the smallest closed cone containing the range of $X$. This is equivalent
to
$$
	x = \int_\Omega X(\omega)\,d\Pi(\omega)
$$
for some positive measure $\Pi$ on $\Omega$.

Subsequent models extended this to the multi-period case and incorporated
the fact instruments can have cash flows.


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

__Lemma__. _Using $V_t = (\Delta_t + \Gamma_t)\cdot X_t$ and $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$ we have_
$$
	V_t D_t = E[V_u D_u + \sum_{t < s \le u} A_s D_s\mid\AA_t]
$$

Note this shows every trading strategy produces a synthetic instrument with "prices" $V_t$ and
"cash flows" $A_t$.

_Proof_. Note $V_t = (\Delta_t + \Gamma_t)\cdot X_t = \Delta_u\cdot X_t$ 
and $
and $V_t D_t = \Delta_u\cdot X_t D_t = E_t[X_u D_u + C_u D_u]$ for some $u > t$.
Since $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$ we have

$$
\begin{aligned}
V_t D_t &= E_t[X_u D_u + C_u D_u]\\
\end{aligned}
$$

__Theorem__. _Every model of the form $X_t D_t = M_t - \sum_{s\le t}C_s D_s$ where $M_t$ is
a martingale and $D_t$ is positive and adapted is arbitrage free_.

_Proof_. If $(\tau_j, \Gamma_j)$ is a closed out trading strategy with $A_t\ge0$ for $t > \tau_0$
then $V_{\tau_0} = E[ \sum_{t < s \le u} A_s D_s\mid\AA_{\tau_0}] \ge 0$.
Since $V_{\tau_0} = \Gamma_0\cdot X_{\tau_0} = -A_{\tau_0}$ and $D_t$ is positive we have
$A_{\tau_0} \le 0$ so there is no arbitrage.