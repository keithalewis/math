---
title: Why not Black-Scholes/Merton?
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand{\Var}{\operatorname{Var}}

[@Ros1978] came up with a simpler and more general theory than
[@BlaSch1973] and [@Mer1973] for valuing derivatives.  He showed their
result follows from geometry. There is no need for probability theory,
Ito processes, or partial differential equations.  All instruments
have prices and cash flows that are paid in proportion to the amount held.
Cash flows place geometric constraints on arbitrage-free prices.

Ross used the Hahn-Banach theorem to show

> If there are no arbitrage opportunities in a market, then
there must exist a (not generally unique) positive linear operator that
can be used to value all marketed assets.

Positive linear operators give rise to positive measures
that can be divided by their total mass resulting in a "risk-neutral probability measure."
They are positive measures having mass 1, but are not the probability of anything.
A better name is "risk-blind probability measure."

There is no need for a so-called real world measure that gets immediately
thrown out. Ross just gets down to the business of valuing, hedging,
and managing the risks of _any_ instrument -- not just the bond, stock,
and option B-S/M considered.

> Let us stress again the power of these results. To begin with,
expectational mechanisms to describe how we anticipate the index, $X_t$,
will behave are irrelevant. Furthermore, there is no need for $X_t$ to
follow a diffusion process to apply the usual option analysis or, for
that matter, for the stream $c$ to follow any specific process. All that
is necessary is the assumption that current asset values do not permit
arbitrage. In particular, then, we do not even have to assume that the
current index price is in equilibrium to correctly appraise the project.

Defining "equilibrium" is problematic. Ross pointed out you don't
need that for his theory. My reading of "the stream $c$"
is the stream of stock dividends. Ross was in the equity world
at the time and assumed a jump in stock prices corresponded
to a dividend payment. Replacing $c$ with
the cash flow $C_t$ received at time $t$ associated with owning an instrument leads 
to a 


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
\partial \Phi_s(x)/\partial s = \partial E[e^{sX - \kappa(s)} 1(X \le x)]/\partial x
	= E[e^{sX - \kappa(s)}(X - \kappa'(s)) 1(X \le x)]
$$
we have $\partial v/\partial s = f\partial\Phi_s(x)/\partial s$.


Delta is position, gamma is how much to trade, vega is vol sensitivity.

## References
