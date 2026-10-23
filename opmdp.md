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
over the period.  A fundamental problem in finance is to specify a
probability measure on $\Omega$ that can be used to make decisions about
an investment $\xi\in\RR^I$ that results in a payoff $\xi\cdot X(\omega)$
when liquidated at the end of the period.

Models allowing arbitrage are not useful. Every arbitrage-free model has
(generally non-unique) risk-neutral "Q" pricing measures but they are blind
to the trade-off between risk and return. They have nothing to say about
the real-world probabilities traders and portfolio managers care about.

We review well-known results about the one-period Fundamental Theory of Asset Pricing
and historical attempts to limit candidate real-world "P" measures
that are amenable to estimation by historical and current market prices.

## Arbitrage

Arbitrage exists if there is a position ${\xi\in\RR^I}$ with
${\xi\cdot x < 0}$ and ${\xi\cdot X(\omega)\ge0}$ for all ${\omega\in\Omega}$:
you make money putting on the position and never lose money unwinding it at the end.
Note this definition does not involve probability.

It is not a definition traders and portfolio managers find acceptable.
If $|\xi\cdot x|$ is much smaller than $|\xi|\cdot|x|$ they would have
to tie up a lot of capital over the period to enter the arbitrage.

__Exercise__: _Show if $\xi$ is an arbitrage so is $t\xi$ for $t > 0$_.

The Fundamental Theorem of Asset Pricing for the one-period model
is (assuming $X$ is bounded, as it is in the real world) there is no
arbitrage if and only if there exists a finitely-additive positive measure
$D$ on $\Omega$ with $x = \int_\Omega X\,dD$. Such measures are called
_risk-neutral_.  It is not unique except for unrealistic toy models.

The $Q$-measure $D/D(\omega)$ is called a _risk-neutral probability measure_
but it is a mistake to assume it is the probability of anything.
Its existence is equivalent to the geometric fact
$x$ belongs to the smallest closed cone containing the range of $X$.

The _realized return_ on $\xi\in\RR^I$
is $R_\xi = \xi\cdot X/\xi\dot x$: investing 1 unit at the beginning
of the period results in a payoff of $R_\xi$.

__Exercise__: _Show for any risk-neutral probability measure
$E_Q[R_\xi] = 1/D(\Omega)$_.

This shows risk-neutral measures are risk-blind:
every portfolio has the same realized return.
They cannot be used to evaluate the risk versus return
of a portfolio.

There is a long history of parametrizing realistic (P-)measures on $\Omega$
that can be estimated using historical data.

[@Mar1952] limited candidate measures to jointly normal prices.  Classical
statistics could then be applied to historical data to estimate the mean
and covariance matrix assuming stationary, independent, and normally
distributed price increments.
