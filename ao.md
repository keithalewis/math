---
title: American Options
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: American option pricing
...

\newcommand{\RR}{\boldsymbol{R}}
\newcommand{\ZZ}{\boldsymbol{Z}}
\renewcommand{\AA}{{\mathcal{A}}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

An American put option with strike $K$ and expiration $T$ on underlying $S_t$ pays
$\max\{K - S_t,0\}$ at a time $t\le T$ chosen by the option holder.
The sample space for the Black-Scholes/Merton model is 
$\Omega = C[0, \infty)$, the set of continuous functions on the non-negative
real numbers. The risk-neutral stock price is
$S_t = S_0\exp(\rho t + \sigma B_t - \sigma^2 t/2)$, where $\rho$ is the
risk-free rate and $\sigma$ is the B-S/M volatility.

The sample space for an American option is the cartesian product
$\Omega\times[0, T]$ where the second factor is the American exercise time.
A common assumption is the option holder exericises optimally so the
option value is
$$
	v = \max_{0\le\tau\le T} E[\max\{K - S_\tau,0\} \exp(-\rho\tau)],
$$
where $\tau\colon\Omega\to[0,T]$ is a stopping time.

While this may be plausible for American options on equities, it is untenable
for, e.g., mortgage backed securities. Their value depends on the actual
prepayments and those are never optimal in reality.
It is important models have knobs for all possible outcomes and
not make the mistake of assuming implicit optimization.

It is common to underspecify the sample space for models.
For example, the exercise time might depend
tax considerations.

## Bermudan

A Bermudan option specifies a set of times $T_0 < \cdots < T_n$ at which
the option holder can receive the payoff. Assuming the option holder
exercises optimally, the above formula for the value is restricted to
stopping times $\tau\colon\Omega\to\{T_0, \ldots, T_n\}$.
To compute this let
$$
	v_j = \max_{T_j\le\tau\le T} E[\nu(S_\tau) \exp(-\rho(\tau - T_j)|\AA_{T_j}],
$$
where $\nu$ is the payoff and $\AA_t$ is the information available at time $t$.

__Lemma__. We have $v_j\exp(-\rho T_j) = \max\{\nu(S_{t_j}), v_{j + 1}\exp(-\rho T_{j+1})\}$.
