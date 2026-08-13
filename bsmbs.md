---
title: Why not Black-Scholes/Merton?
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand{\Var}{\operatorname{Var}}

Many people are incognizant of the simpler and more general
instrument valuation theory developed by [@Ros1978]. He showed the
Black-Scholes/Merton result follows from geometry without using Ito
processes or partial differential equations.

Ross showed "If there are no arbitrage opportunities in a market, then
there must exist a (not generally unique) positive linear operator that
can be used to value all marketed assets."
Positive linear operators give rise to positive measures
that can be divided by their total mass to give a "probability measure."
The is referred to as a risk-neutral measure, but it is not the probability of anything.
There is no need for a useless real-world measure that is immediately thrown out.

Every positive random variable with finite expected value and log-variance
can be written $F = fe^{sX - \kappa(s)}$ where $f = E[F]$, $s^2 = \Var(\log F)$,
and $\kappa(s) = \log E[e^{sX}]$ is the cumulant of the mean 0 and
variance 1 random variable $X$.

The forward value of a put option having strike $k$ is
$$
\begin{aligned}
	v &= E[\max\{k - F,0\}] \\
		&= E[(k - F)1(F \le k)] \\
		&= kP(F\le k) - E[F 1(F\le k)] \\
		&= kP(F\le k) - E[F]E[F/E[F] 1(F\le k)] \\
		&= kP(F\le k) - fP_s(F\le k) \\
\end{aligned}
$$
where $P_s = e^{sX - \kappa(s)}P$.

Since $F\le k$ if and only if $X \le (\log k/f + \kappa(s))/s$
$$
	E[\max\{k - F,0\}] = k\Psi(x) - f\Psi_s(x)
$$
where $\Psi(x) = P(X\le x)$ and $\Psi_s(x) = P_s(X\le x)$.
The _moneyness_ is $x = x(k, f, s) =  (\log k/f + \kappa(s))/s$.

Option _delta_ is the derivative of value with respect to forward price
$$
\frac{\partial v}{\partial f} = E[-1(F\le k)\partial F/\partial f] = -E[1(F\le k)e^{sX - \kappa(s)}] = -\Psi_s(x).
$$

Option _gamma_ is the second derivative of value with respect to forward price
$$
\frac{\partial^2 v}{\partial f^2} = -\Psi_s'(x)\partial x/\partial f = \psi_s(x)/fs.
$$

Option _vega_ is the second derivative of value with respect to $s$
$$
\frac{\partial v}{\partial s} = E[-1(F\le k)\partial F/\partial s] = -E[1(F\le k)F(X - \kappa'(s))]
$$
Since
$$
\partial \Phi_s(x)/\partial s = \partial E[e^{sX - \kappa(s)} 1(X \le x)
	= E[e^{sX - \kappa(s)}(X - \kappa'(s)) 1(X \le x)]
$$
we have $\partial v/\partial x = -f$.

