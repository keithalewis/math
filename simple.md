---
title: The Unified Model
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: |
 Every arbitrage-free pricing model is parameterized by a vector-valued
 martingale and a positive adapted process. There is no need to restrict
 models to Ito processes and use partial differential equations.  There is
 also no need for utility functions or market equilibrium assumptions.
 In fact, there is no need for probability measures. The Unified Model
 involves only geometry, as was first pointed out by Stephen Ross. We
 do need the notion of sample spaces and algebras of sets in order to
 mathematically model partial information.


 It is time to banish the mathematical fiction of continuous time trading
 and focus on problems practitioners find useful: when to re-hedge
 and how well the hedge performs.

...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\cone}{\operatorname{cone}}
\newcommand{\RR}{𝑹}
\renewcommand{\AA}{\mathcal{A}}

There is a clear trajectory in mathematical finance starting from Black,
Scholes, and Merton valuing
an option to expanding the universe of instruments, incorporate credit
and liquidity considerations, and make model assumptions explicit.
Realistic models must allow for the empirical fact that not all market participants
act optimally.

Scholes and Merton won a Nobel Prize for a new method of valuing derivative securities that
did not require estimating the return on the underlying. Under the assumption that
future stock prices could be modeled by geometric Brownian motion and it was possible
to trade in continuous time, all one needed to know was the volatility
and the risk-free funding rate.

## One-Period Model

The prices of $n$ instruments at the beginning of the period
can be represented by a vector $x\in\RR^n$. The prices at the end
of the period are $X(\omega)\in\RR^n$ if $\omega\in\Omega$ occured where
$X\colon\Omega\to\RR^n$

Arbitrage exists in a one-period model if it is possible to buy a
portfolio of instruments at negative cost and sell them at the end of the
period without losing money.  The cost of purchasing $\gamma\in\RR^n$
in each instrument at the beginning of the period is the dot product
$\gamma\cdot x$. Assuming all positions are completely unwound at the end of
the period, it will pay $\gamma\cdot X(\omega)$ if $\omega\in\Omega$ occurs.
Arbitrage exists if there is a $\gamma\in\RR^n$ with $\gamma\cdot
x < 0$ and $\gamma\cdot X(\omega)\ge0$ for all $\omega\in\Omega$.

Stephan Ross was the first to show a one-period model is _arbitrage-free_
if and only if $x$ belongs to the smallest closed cone containing the
range of $X$: $X(\Omega) = \{X(\omega)\mid\omega\in\Omega\}$.

### Examples

Even the simple one-period model can provide interesting examples.

Recall a _cone_ is a subset of a vector space that is closed under addition
and multiplication by positive scalars.

__Exercise__. _The set of arbitrage portfolios for a one-period model is a cone_.

__Exercise__. _If $\{v_j\}$ is a finite collection of vectors then $\{\sum_j p_j v_j\mid p_j \ge 0\}$
is the smallest closed cone containg the vectors_.

#### 1-2-3 Model

Consider a one-period market having a bond that doubles in value over the period,
a stock with initial price 1 that either stays the same or triples in value,
and a call option on the stock with strike 2 and price $c$.
This is modeled by $x = (1,1,c)$, $X(\omega) = (2,\omega,\max\{\omega - 2, 0\})$
where $\Omega = \{1, 3\}$. For the model to be arbitrage-free there must
exist $p,q\ge0$ with $x = X(1)p + X(3)q$ and $p,q\ge0$.
The constraint on the bond and stock give $1 = 2p + 2q$ and $1 = p + 3q$ respectively.

These equations have the unique solution $p = q = 1/4$ so $c = 0\times 1/4 + 1\times 1/4 = 1/4$.
Note $p + q = 1/2$ is the discount over the period.

#### 90-100-110 Model

Consider a one-period market having a bond with zero interest over the period,
a stock with initial price 100 that can go to 90, 100, or 110 at the end of the period,
and a call option on the stock with strike 100 and price $c$.
This is modeled by $x = (1,100,c)$, $X(\omega) = (1,\omega,\max\{\omega - 100, 0\})$
where $\Omega = \{90, 100, 110\}$. For the model to be arbitrage-free there must
exist $p,q,r\ge0$ with $x = X(90)p + X(100)q + X(110)r$.

The equation for the bond, stock, and option are $1 = p + q + r$, $100 = 90p + 100q + 110r$,
and $c = 10r$.
The first two equations can be written in matrix notation as
$$
\begin{bmatrix}
1 \\
100 \\
\end{bmatrix}
=
\begin{bmatrix}
1 & 1 \\
90 & 100 \\
\end{bmatrix}
\begin{bmatrix}
p \\
q \\
\end{bmatrix}
+
\begin{bmatrix}
r \\
110r \\
\end{bmatrix}.
$$
Solving for $p$ and $q$ gives
$$
\begin{bmatrix}
p \\
q \\
\end{bmatrix}
=
\begin{bmatrix}
r \\
1 - 2r \\
\end{bmatrix}
$$
The conditions $p,q\ge0$ imply $r\ge0$ and $1-2r\ge0$ so $0\le r\le 1/2$.
Since $c = 10r$ we have $0\le c\le 5$ if the model is arbitrage-free.

Note the option price is not unique in this example. This is the case
for any realisitic model of what can occur in the market.

__Exercise__. _If $x = (100, c)$ and $X(\omega) = (\omega, \max\{\omega - 100\})$
for $\omega\in\{90,100,110\}$ show
the model is arbitrage-free if and only if $0\le c\le 100/11$_.

If the bond is not available for trading the option price must be
strictly less than 10 in an arbitrage-free model.

#### Binomial Model

The binomial model is where a bond has realized return $R$ and the stock has
initial price $s$ and ends at either a low price $L$ or high price $H$,
$x = (1, s)$, $X(\omega) = (R, \omega)$ where $\omega\in\Omega = \{L,H\}$.
The no arbitrage condition is $x = X(L)p + X(H)q$ for some $p,q\ge0$.
This has a unique solution.

__Exercise__. _Show $p = (H - Rs)/R(H - L)$ and $q = (Rs - L)/R(H - L)$_.

<details>
<summary>Solution</summary>
The bond satifies $1 = Rp + Rq$ and the stock satisfies $s = Lp + Hq$.
This can be written in matrix notation as
$$
\begin{bmatrix}
1 \\
s \\
\end{bmatrix}
=
\begin{bmatrix}
R & R \\
L & H \\
\end{bmatrix}
\begin{bmatrix}
p \\
q \\
\end{bmatrix}
$$
so
$$
\begin{bmatrix}
p \\
q \\
\end{bmatrix}
=
\begin{bmatrix}
R & R \\
L & H \\
\end{bmatrix}^{-1}
\begin{bmatrix}
1 \\
s \\
\end{bmatrix}
=
\frac{1}{RH - LR}
\begin{bmatrix}
H & -R \\
-L & R \\
\end{bmatrix}
\begin{bmatrix}
1 \\
s \\
\end{bmatrix}
=
\frac{1}{R(H - L)}
\begin{bmatrix}
H - Rs \\
-L + Rs \\
\end{bmatrix}
$$
</details>

__Exercise__. _Show the conditions $p,q\ge0$ imply $L \le Rs \le H$_.

If an option pays $\phi(\omega)$ then it pays either $\phi(L)$ or
$\phi(H)$ at expiration.  Every European option in a binomial model
is a linear function and its arbitrage-free price is determined by the no
arbitrage condition the bond and stock satisfy.

__Exercise__. _If $x = (1, s, c)$ and $X(\omega) = (R, \omega, \max\{\omega - K, 0\})$
where $\omega\in [L, H]$ what are the no-arbitrage constraints on $c$_?

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

We do not assume there is a money market account available to finance
trading or require a strategy to be self-financing.

The _value_, or _mark-to-market_ of a trading strategy is
$$
	V_t = (\Delta_t + \Gamma_t)\cdot X_t.
$$
It the the amount
generated by unwinding the existing position and trades just executed at
the prevailing market price, assuming that is possible.

Trading strategies involve cash flows to the trading _account_ 
$$
	A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t.
$$
At time $t$ all cash flows are received in proportion to the existing position and
the trades just executed are debited from the trading account.

### Arbitrage

_Arbitrage_ exists for a model if there exists a trading strategy $(\tau_j, \Gamma_j)$
with $\sum_j \Gamma_j = 0$, $A_{\tau_0} > 0$, and $A_t\ge0$ for $t > \tau_0$.
The strategy must close out, make money on the first trade, and never lose money thereafter.

Arbitrage-free models are parameterized by a vector-valued martingale,
$M_t\colon\AA_t\to\RR^I$ and a positive adapted process $D_t\colon\AA_t\to (0,\infty)$:
$$
	X_t D_t = M_t - \sum_{s\le t}C_s D_s.\tag{1}
$$

We call $D_t$ the _deflator_.

__Lemma__. _If $X_t D_t = M_t - \sum_{s\le t}C_s D_s$ then_
$$
	X_t D_t = E[X_u D_u + \sum_{t < s \le u} C_s D_s\mid\AA_t].\tag{2}
$$

<details>
<summary>_Proof_.</summary>

We have
$$
\begin{aligned}
	E[X_u D_u + \sum_{t < s \le u} C_s D_s\mid\AA_t]
	&= E[M_u - \sum_{s\le u}C_s D_s + \sum_{t < s \le u} C_s D_s\mid\AA_t] \\
	&= E[M_u - \sum_{s\le t}C_s D_s \mid\AA_t] \\
	&= M_t - \sum_{s\le t}C_s D_s \\
	&= X_t D_t
\end{aligned}
$$
</details>

__Lemma__. _Using value $V_t = (\Delta_t + \Gamma_t)\cdot X_t$ 
and account $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$,_
$$
	V_t D_t = E[V_u D_u + \sum_{t < s \le u} A_s D_s\mid\AA_t].\tag{3}
$$

<details>
<summary>_Proof_.</summary>

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
</details>

Note the similarity between equation (2) and (3). Price and cash flow in (2)
correspond to value and account in (3).
Every trading strategy produces a synthetic derivative instrument.

__Theorem__. (Fundamental Theorem of Asset Pricing)
_Every model parameterized by a vector-valued martingale
$(M_t)_{t\in T}$ and a positive, adapted function $(D_t)_{t\in T}$
where $X_t D_t = M_t - \sum_{s\le t}C_s D_s$ is arbitrage-free_.

_Proof_. If $(\tau_j, \Gamma_j)$ is a closed out trading strategy with $A_t\ge0$ for $t > \tau_0$
then $V_{\tau_0} = E[ \sum_{t < s \le u} A_s D_s\mid\AA_{\tau_0}] \ge 0$.
Since $V_{\tau_0} = \Gamma_0\cdot X_{\tau_0} = -A_{\tau_0}$ and $D_t$ is positive we have
$A_{\tau_0} \le 0$ so there is no arbitrage.

## Money Market Account

If a money market account is available with return $R_t$, then $D_t = 1/R_t$.
In this case we call $D_t$ the _stochastic discount_ instead of deflator.
A money market account can be used to fund trading strategies to make them
self-financing.

## Examples

### Black-Scholes/Merton

Let $M_t = se^{\sigma B_t - \sigma^2t/2}$ and $D_t = e^{-\rho t}$.
Since $S_tD_t = se^{\sigma B_t - \sigma^2t/2}$ we have
$$
	S_t = se^{\rho t + \sigma B_t - \sigma^2t/2}.
$$

There is no need to restrict models to Ito processes, use partial
differential equations, or consider self-financing portfolios.

We can allow $\sigma$ to be a function of time and use the
martingale $e^{\int_0^t \sigma(s)\,dB - (1/2)\int_0^t \sigma^2(s)\,ds}$.

If the stock pays dividends $d_j$ at times $t_j$ then these are cash flows
and equation (1) gives
$$
	S_t = se^{\rho t + \sigma B_t - \sigma^2t/2} - \sum_{t_j\le t} d_j e^{\rho(t - t_j)}.
$$
It is valid for any dividends $d_j$ that depend only on the information available at
time $t_j$. For discrete dividends $d_j$ is constant. For proportional dividend
$d_j = p_j S_{t_j}$. 

### Zero Coupon Bonds

$D_t(u)D_t = E_t[D_u]$

### Risky Zero Coupon Bonds

$D^{T,R}_t(u)D_t = E_t[R1(t < T \le u)D_T + 1(T > u)D_u]$
