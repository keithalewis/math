---
title: Unified Model
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Value, hedge, and manage the risk of instruments
...

\newcommand{\RR}{\boldsymbol{R}}
\renewcommand{\AA}{{\mathcal{A}}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

A mathematical model for any set of instruments that can be used to value,
hedge, and understand how poorly risk-neutral pricing can be used for
managing risk.

Stephen Ross...

## Unified Model

Let $T$ be the set of trading times, $I$ the set of all market
instruments, $\Omega$ the sample space of possible outcomes, and
$(\AA_t)_{t\in T}$ be algebras of sets on $\Omega$ indicating the
information available at each trading time.

If $\AA$ is a finite algebra of sets on $\Omega$ then
the _atoms_ of $\AA$, $\bar{\AA}$, form a partition of $\Omega$.
A function $X\colon\Omega\to\RR$ is $\AA$ measurable if and
only if it is constant on atoms of $\AA$
so $X\colon\bar{\AA}\to\RR$ is a function.

### Market

_Price_ - market price assuming perfect liquidity
: $X_t\colon\bar{\AA_t}\to\RR^I$

_Cash flow_ - dividends, coupons, margin adjustments for futures
: $C_t\colon\bar{\AA_t}\to\RR^I$

### Trading

_Trading Strategy_ - increasing stopping times
: $\tau_0 < \cdots < \tau_n$ and trades $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$

_Position_ - accumulate trades not including last trade
: $\Delta_t = \sum_{\tau_j < t}\Gamma_j = \sum_{s < t} \Gamma_s$

### Valuation

_Value_ - mark-to-market including last trade
: $V_t = (\Delta_t + \Gamma_t)\cdot X_t$

_Account_ - trading account blotter
: $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$

### Arbitrage

_Arbitrage_ exists if there is a trading strategy
with $A_{\tau_0} > 0$, $A_t \ge 0$, $t > \tau_0$, and $\sum_{j} \Gamma_j = 0$.

The Fundamental Theorem of Asset Pricing states there is no arbitrage if and only
if there exist _deflators_, positive measures $D_t\colon\AA_t\to(0,\infty)$, ${t\in T}$ on $\Omega$, with
$$
\tag{1} X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|{\AA_t}
$$
where $|$ indicates restriction of measure to a subalgebra of sets.

__Lemma__. If $X_t D_t = M_t - \sum_{s\le t} C_s D_s$ where $M_t = M_u|{\AA_t}$, $t \le u$,
then there is no arbitrage.

__Lemma__. For any arbitrage free model and any trading strategy
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|{\AA_t}
$$

Note how the value $V_t$ corresponds to price $X_t$ and account $A_t$
corresponds to $C_t$ in equations (2) and (1) respectively.
Trading strategies create synthetic market instruments.
This is the skeleton key to pricing derivative securities.

## Application

Suppose a derivative security specifies amounts $\bar{A}_j$ be paid at times $\bar{\tau}_j$.
If there is a trading strategy $(\tau_j, \Gamma_j)$
with $A_{\bar{\tau}_j} = \bar{A}_j$ for all $j$ and $A_t = 0$ otherwise (aka self-financing) then
a "perfect hedge" exists[^1].
The value of the derivative is the cost of setting up the initial hedge.

Note $V_t D_t= (\sum_{\tau_j > t} \bar{A}_j D_{\bar{\tau_j}})|\AA_t$
can be computed from the deriviative contract specification and the deflators $D_t$.
Since $V_t = (\Delta_t + \Gamma_t)\cdot X_t$
we have $\Delta_t + \Gamma_t$, is the Frechet derivative $D_{X_t}V_t$
of option value with respect to $X_t$.

If time $T = \{t_j\}$ is discrete we can compute a possible hedge at each time,
$\Gamma_j = D_{X_j}V_j - \Delta_j$, since $\Delta_j$ is known at $t_{j-1}$.
In general this hedge will not exactly replicate the derivative contract obligations.

[^1]: Perfect hedges never exist.

### Deflator

If repurchase agreements are available then a _canonical deflator_ exists.
A repurchase agreement over the interval $[t_j, t_{j+}]$ is specified
by a rate $f_j$ known at time $t_j$. The price at $t_j$ is $1$ and it
has a cash flow of $\exp(f_j(t_{j+1} - t_j))$ at time $t_{j+1}$.
By equation (1) we have $D_j = \exp(f_j\Delta t_j)D_{j+1}|\AA_j$.
If $D_{j+1}$ is known at time $t_j$ then $D_{j+1}/D_j = \exp(-f_j\Delta t_j)$ and
$D_j = \exp(-\sum_{i < j}f_i\Delta t_i)$ is the canonical deflator.

### Binomial Model



