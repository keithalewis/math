---
title: One-Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: The simplest formal model of a financial market.
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\ZZ{\boldsymbol{Z}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\co{\operatorname{co}}
\newcommand\sgn{\operatorname{sgn}}
\newcommand\Alg{\operatorname{Alg}}
\newcommand\cone{\operatorname{cone}}
\newcommand\BB{\mathcal{B}}
\newcommand\GG{\mathcal{G}}
\newcommand\PP{\mathcal{P}}

The _one-period model_ is specified by the vector of initial prices
indexed by market instruments $I$, $x\in\RR^I$, and their final prices
$X\colon\Omega\to\RR^I$ where $\Omega$ is the set of possible outcomes
over the period.
A fundamental problem in finance is to specify a
probability measure on $\Omega$ that can be used to make decisions about
an investment $\xi\in\RR^I$ that results in $\xi\cdot X(\omega)$
when marked-to-market or liquidated at the end of the period.

Models allowing arbitrage are not useful. Every arbitrage-free model has
(generally non-unique) risk-neutral "Q" pricing measures but they are blind
to the trade-off between risk and return. It is a mistake to assume
they are real-world "P" probabilities that traders and portfolio managers care about.

We review well-known results about the one-period Fundamental Theory of Asset Pricing
and historical attempts to limit candidate real-world "P" measures
that are amenable to estimation by historical and current market information.

## Arbitrage

Arbitrage exists if there is a position ${\xi\in\RR^I}$ with
${\xi\cdot x < 0}$ and ${\xi\cdot X(\omega)\ge0}$ for all ${\omega\in\Omega}$:
you make money putting on the position and never lose money unwinding it at the end.
Note this definition does not involve probability.

It is not a definition traders and portfolio managers find acceptable.
If $|\xi\cdot x|$ is much smaller than $|\xi|\cdot|x|$ they would have
to tie up a lot of capital over the period to enter the arbitrage.
It makes no sense to use $1MM just to make one buck.

__Exercise__: _Show if $\xi$ is an arbitrage so is $t\xi$ for $t > 0$_.

While this is mathematically true, it eventually fails for large $t$.
At some point you will run out of intruments to purchase.

__Exercise__: _Show if $\xi$ and $\nu$ are arbitrages so is $\xi + \nu$_.

The exercises show the set of arbitrages are a _cone_: a subset of
a vector space that is closed under multiplication by positive
scalars and addition.

__Exercise__: _Show cones are convex_.

_Hint_: A subset of a vector space is convex if and only if the points on line between
any two points in the set also belong to the set. If $x$ and $y$ are in the
set then so is $(1 - t)x + ty$ is for $0 < t < 1$.

__Exercise__: _If $C$ is a convex subset then $\cup_{t > 0} tC$ is a cone_.

_Hint_: Note $tC = \{tv\mid v\in C\}$

The Fundamental Theorem of Asset Pricing for the one-period model
is (assuming $X$ is bounded, as it is in the real world) there is no
arbitrage if and only if there exists a finitely-additive positive measure
$D$ on $\Omega$ with $x = \int_\Omega X\,dD$. Such measures are called
_risk-neutral valuation measure_.
It is not unique except for unrealistic toy models.

The $Q$-measure $D/D(\omega)$ is called a _risk-neutral probability measure_
but it is a mistake to assume it is the probability of anything.
Its existence is equivalent to the geometric fact
$x$ belongs to the smallest closed cone containing the range of $X$.

The _realized return_ on a portfolio $\xi\in\RR^I$
is $R_\xi = \xi\cdot X/\xi\cdot x$: investing 1 unit at the beginning
of the period results in a payoff of $R_\xi$.

__Exercise__: _Show for any risk-neutral probability measure
$E_Q[R_\xi] = 1/D(\Omega)$_.

This shows risk-neutral measures are risk-blind:
every portfolio has the same realized return.
They cannot be used to evaluate the risk versus return
of a portfolio.

## Estimation

$$
\min_{\xi\in(\RR^I)^*} \frac{1}{2}\Var(\xi^*X) - \lambda(\xi^* x - 1)
$$
The minium satsifies
$$
    0 = \xi^* V - \lambda x^*
$$
where $V = E[XX^*] - E[X]E[X]^*$. 

There is a long history of parametrizing real-world $P$-measures on $\Omega$
that can be estimated using available information.
Historical market prices were originally used for this. 
As futures and option markets developed they were incorporated
to peek into future instrument prices. Recently, more information
such as social media and prediction markets are being used.

[@Mar1952] limited candidate measures to jointly normal prices.  Classical
statistics could then be applied to historical data to estimate the mean
and covariance matrix assuming stationary, independent, and normally
distributed price increments.

## Appendix

Let $B(S)$ be the vector space of all bounded functions on the set $S$.
Its dual can be identified with the vector space of finitely additive measures
on $S$. A bounded linear functional $L\colon B(S)\to\RR$ gives rise to a
measure $\lambda\in ba(S)$ with $\lambda(E) = L(1_E)$.

__Exerecise__: _Use $1_{E\cup F} = 1_E + 1_F - 1_{E\cap F}$ and $1_\emptyset = \zero$
to show $lambda$ is a measure_.

_Hint_: Show $\lambda(E\cup F) = \lambda(E) + \lambda(F) - \lambda(E\cap F)$
and $\lambda(\emptyset) = 0$.

Given a measure $\lambda\in ba(S)$ define
$$
\int_S \sum_i a_i 1_{A_i} = \sum_i a_i \lambda(A_i)
$$
for finite linear combinations of indicator functions.

__Exercise__: _Show this is well defined_.

_Hint_: For any sets $E$ and $F$ we can write $E\cup F$ as the disjoint
union $(E\setminus F)\cup(E\cap F)\cup F\setminus E$.

## References
