---
title: Why not Black-Scholes/Merton?
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand{\Var}{\operatorname{Var}}

Many people seem to be incognizant of the simpler and more general
instrument valuation theory developed by [@Ros1978]. He showed their result
follows from geometry and there is no need
for Ito processes or partial differential equations.

Ross showed "If there are no arbitrage opportunities in a market, then
there must exist a (not generally unique) positive linear operator that
can be used to value all marketed assets."
Positive linear operators give rise to positive measures
that can be divided by their total mass to give a "probability measue."
The is referred to as a risk-neutral measure, but it is not the probability of anything.
There is no need to taking a detour through a feckless real-world measure
that gets immediately thrown out.

Every positive random variable with finite expected value and log-variance
can be written $F = fe^{sX - \kappa(s)}$ where $f = E[F]$, $s^2 = \Var(\log F)$,
and $\kappa(s) = \log E[e^{sX}]$ is the cumulant of the mean 0 and
variance 1 random variable $X$.

The forward value of a put option having strike $k$ is
$$
\begin{aligned}
	E[\max\{k - F,0\}] &= E[(k - F)1(F \le k)] \\
		&= kP(F\le k) - E[F 1(F\le k)] \\
		&= kP(F\le k) - E[F]E[F/E[F] 1(F\le k)] \\
		&= kP(F\le k) - fP^s(F\le k) \\
\end{aligned}
$$
where $P^s = e^{sX - \kappa(s)}P$.

Since $F\le k$ if and only if $x \le (\log k/f + \kappa(s))/s$
$$
	E[\max\{k - F,0\}] = k\Psi(x) - f\Phi^s(x)
$$
where $\Psi(x) = P(X\le x)$ and $\Psi^s(x) = P^s(X\le x)$.


