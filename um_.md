
---
title: Simple Unified Model
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Value, hedge, and manage the risk of any instruments
...

\newcommand{\RR}{\boldsymbol{R}}
\newcommand{\NN}{\boldsymbol{N}}
\renewcommand{\AA}{{\mathcal{A}}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

Let's start with a brief description of the Simple Unified Model.
It will probably not make much sense on first reading.
If you read to the end and come back again it will make
complete sense and seem perfectly obvious, if I did my job right.

Let $T$ be the set of possible trading times and $I$ be the set of tradeable market instruments.
For $t\in T$ let $X_t$ be the vector of prices indexed by $I$,
$C_t$ be the vector of cash flows indexed by $I$. You can buy or sell
instruments at prices $X_t$ and receive cash flows $C_t$ proportional
to your position in each instrument at time $t$.

A trading strategy is a finite number of times
$\tau_0 < \cdots < \tau_n$ depending on information available and trading sizes $\Gamma_j$ at
time $\tau_j$. These are vectors indexed by $I$ indicating how much you bought or
sold in each available instrument. Trades accumulate into positions
$\Delta_t = \sum_{\tau_j < t} \Gamma_j$.

The value (mark-to-market) of your position at time $t$ is
$V_t = (\Delta_t + \Gamma_t)\cdot X_t$.
The amount showing up in your brokerage account at time
$t$ is $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$.

Arbitrage is a trading strategy with $\sum_j \Gamma_j = 0$ where $A_{\tau_0} > 0$ and
$A_t \ge 0$ for $t > \tau_0$. You make money on the first
trade and never loose money until the position is closed.

Every arbitrage-free model of prices and cash flows has the form
$$
	X_t D_t = M_t - \sum_{s\le t} C_s D_s
$$
where $D_t$ are positive measures depending only on information
available at time $t$ and $(M_t)_{t\in T}$ is a vector-valued martingale measure
indexed by $I$.

It is trivial to show
$$
	X_t D_t = (X_u D_u + \sum_{s\in (t, u]} C_s D_s)|_{A_t}
$$
where $|_{A_t}$ means given information at time $t$.
It is less trivial to show
$$
	V_t D_t = (V_u D_u + \sum_{s\in (t, u]} A_s D_s)|_{A_t}
$$
but this is the skeleton key to pricing derivative instruments.
Note how prices $X_t$ correspond to values $V_t$ and cash flows $C_s$ correspond
to amounts $A_s$.

**Every trading strategy creates a synthetic market instrument.**

Derivative instruments are specified by a contract. The buyer wants
amounts $\hat{A}_j$ at times $\hat{\tau}_j$. The seller quotes a price
and is obligated to use that to trade available market instruments to
satisfy the contract.

The seller needs to find a trading strategy $(\tau_j, \Gamma_j)$
with $A_{\hat{\tau}_j} = \hat{A}_j$ and $A_t = 0$ otherwise.

The SUM provides an answer for the first trade.
Since $V_0 = \Gamma_0\cdot X_0$ the derivative
with respect to initial prices $X_0$ is $\Gamma_0$.
It only provide a rigorous mathematical model for reasoning
about the yet unsolved problem of what subsequent trades
you can plausible suggest to traders and risk managers
to convince them you are adding value to their business.

## History

[@Ros1978] demonstrated how to replace
the untenable probabilistic theory of [@BlaSch1973] and [@Mer1973]
with a much simpler and more general geometric theory.

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator_.

Ross showed there is no need for Ito processes or partial differential
equations and also generalized from a bond, stock, and option to
any collection of instruments. There is no need to require
a so-called "real world" probability measure, only to get immediately
thrown out for a "risk neutral" probability measure that is
not the probability of anything. All he needed was the
Hahn-Banach theorem: if a point is not in a convex set then there
exists a hyperplane with the point on one side and the convex set on the other.

Ross made the deleterious assumptions that continuous time trading is possible and
conflated cash flows with jumps in stock price.
Assuming only a finite number of trades are possible, as is the case
in our actual real world, and introducing
an explicit variable for cash flows leads to an even simpler theory.

Every arbitrage free model can be parameterized by a vector-valued
martingale measure and positive adapted measures.
These are what Ross called valuation operator. We call them deflators.
If the model has repurchase agreements then the deflator
is the stochastic discount.

## Math

The vector space of bounded functions on the set $S$ is
$B(S) = \{f\colon S\to\RR\mid \|f\| = \sup_{s\in S} |f(s)| < \infty\}$.
The dual of $B(S)$ can be identified with $ba(S)$,
the set of finitely additive measures on $S$.
For bounded $L\colon B(S)\to\RR$ define $\lambda(A) = L(1_A)$ for $A\subseteq S$ where
$1_A(s) = 1$ if $s\in A$ and $1_A(s) = 0$ otherwise.
Since $\lambda(A\cup B) = L(1_{A\cup B}) = L(1_A + 1_B - 1_{A\cap b}
= \lambda(A) + \lambda(B) - \lambda(A\cap B)$ and
$\lamba(\emptyset) = L(1_\emptyset) = L(0) = 0$ we have $\lambda$
is a finitely additive measure.

For $f\in B(S)$ define $M_f\colon B(S)\to B(S)$ by $M_fg = fg$
to be the linear operator of multiplication by $f$. Its
adjoint $M_f^*\colon ba(S)\to ba(S)$ defines how to multiply
a finitely additive measure by a bounded function.

An algebra of sets on a set $S$ is a collection of
subsets closed under union and complement.
If the algebra is finite then its atoms form a partition.
Conditional expectation can be defined by restriction of measure.
Given a set $\Omega$, an algebra $\AA$ of sets on $\Omega$, and
a probability measure $P$ on $\AA$.
If $Y = E[X\mid\AA]$ is the conditional expectation of $X$,
then $Y(P|_\AA) = (XP)|_\AA$ where the vertical bar indicates restriction.



## Simple Unified Model

Let $I$ be the set of tradable instruments and
$T\subset [0,\infty)$ be possible trading times.



## References
