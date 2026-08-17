---
title: Why not Black-Scholes/Merton?
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

Stephen [@Ros1978] came up with a simpler and more general theory than
[@BlaSch1973] and [@Mer1973] for valuing derivatives.  He showed their
result follows from geometry. There is no need for probability theory,
Ito processes, partial differential equations, or dicey equilibrium
fairy tales. All you need is to recognize the fact instruments
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
thrown out. Ross just gets down to the business of valuing _any_
instrument -- not just the bond, stock, and option B-S/M considered.

> Let us stress again the power of these results. To begin with,
expectational mechanisms to describe how we anticipate the index, $X_t$,
will behave are irrelevant. Furthermore, there is no need for $X_t$ to
follow a diffusion process to apply the usual option analysis or, for
that matter, for the stream $c$ to follow any specific process. All that
is necessary is the assumption that current asset values do not permit
arbitrage. In particular, then, we do not even have to assume that the
current index price is in equilibrium to correctly appraise the project.

My reading of "the stream $c$" is the stream of stock dividends. Ross
was in the equity world at the time and assumed a jump in stock price
corresponded to a dividend payment. This is an untenable definition.
Stocks "jump" by an integral multiple of tick size and from market close
to market open with no associated cash flow.  Fixed income instruments
are defined by their coupon cash flows.

Replacing $c$ with cash flows $(C_t)$ received at time $t$ associated
with owning an instrument leads to an even more powerful theory.

Every arbitrage-free model of prices $(X_t)$ and cash flows $(C_t)$ has the form
$$
	X_t D_t = X_0 M_t - \sum_{s\le t} C_s D_s
$$
where $(D_t)$ are positive (valuation) measures and $(M_t)$ is a
vector-valued martingale measure indexed by market instruments.

For example, the B-S/M model of a bond and a stock without dividends is
$D_t = e^{-\rho t}P$ and $M_t = (1, e^{\sigma B_t - \sigma^2/2})P$
where $P$ is Wiener measure and $(B_t)$ is standard Brownian motion.

B-S/M considered a dynamic hedge in the bond and stock that replicates
the option payoff.
The value of a hedge at any point in time
is equal to the current hedge position times current market prices.
If the value of the option is known
as a function of hedging instruments then the _delta_ hedge is
the derivative of option value with respect to underlying
instrument price. 

Scholes and Merton won the Sveriges Riksbank Prize in Economic Sciences
in Memory of Alfred Nobel in 1997 "for a new method to determine the value of derivatives."
They showed the value of an option is the discounted expected option payoff under
the risk-neutral measure.
Their formula gives the option value making it possible to compute the delta hedge.
The value of the option is the cost of setting up the initial hedge.

A mathematical artefact of using Ito processes and assuming continuous time
hedging is possible is that their theoretical hedge is perfect.

## Greeks

Every positive random variable with finite expected value and log-variance
can be written $F = fe^{sX - \kappa(s)}$ where $f = E[F]$, $s^2 = \Var(\log F)$,
and $\kappa(s) = \log E[e^{sX}]$ is the cumulant of the mean 0 and
variance 1 random variable $X$. We call $f$ the _forward_ and $s$ the _vol_.

The forward value of a put option having strike $k$ is
$$
\begin{aligned}
	v &= E[\max\{k - F,0\}] \\
		&= E[(k - F)1(F \le k)] \\
		&= k P(F\le k) - E[F 1(F\le k)] \\
		&= k P(F\le k) - f [(F/f) 1(F\le k)] \\
		&= k P(F\le k) - f P_s(F\le k) \\
\end{aligned}
$$
where $P_s = e^{sX - \kappa(s)}P$.

__Exercise__. _Show $P_s$ is a probability measure_.

Since $F\le k$ if and only if $X \le (\log k/f + \kappa(s))/s$
$$
	E[\max\{k - F,0\}] = k\Psi(x,0) - f\Psi(x,s)
$$
where $x = x(k, f, s) =  (\log k/f + \kappa(s))/s$ is the
_moneyness_ and $\Psi(x,s) = P_s(X\le x)$.

Option _delta_ is the derivative of value with respect to forward price
$$
\partial_f v = E[-1(F\le k)\partial_f F] = -E[1(F\le k)e^{sX - \kappa(s)}] = -\Psi(x,s).
$$

Option _gamma_ is the second derivative of value with respect to forward price
$$
\partial_f^2 v = -\partial_x\Psi(x,s)\partial_f x = \partial_x\Psi(x,s)/fs.
$$

Option _vega_ is the derivative of value with respect to $s$
$$
\partial_s v = E[-1(F\le k)\partial_s F] = -E[1(F\le k)F(X - \kappa'(s))]
$$
Since
$$
\partial_s \Phi(x,s) = \partial_s E[e^{sX - \kappa(s)} 1(X \le x)]
	= E[e^{sX - \kappa(s)}(X - \kappa'(s)) 1(X \le x)]
$$
we have $\partial_s v = f\partial_s\Phi(x,s)$.

## Black

The Fischer [@Bla1976] model uses $s = \sigma\sqrt{t}$ and $X$ standard normal.
Recall ${E[\exp(N)] = \exp(E[N] + \Var(N)/2)}$ if $N$ is normal.

__Exercise__. _Show the cumulant of a standard normal is $s^2/2$_.

Recall $E[\exp(N) f(M)] = E[\exp(N)] E[f(M + \Cov(N,M)]$
if $N$ and $M$ are jointly normal.

__Exercise__. _If $X$ is standard normal show $\Psi(x, s) = \Psi(x - s, 0)$_.

_Hint_: Use $\Psi(x, s) = E[e^{sX - s^2/2} 1(X \le x)]$.

__Exercise__. _Show the Black forward put value is ${v = k N(-d_-) - f N(-d_+)}$
where $N(x) = \Psi(x, 0)$ and ${d_\pm = (\log f/k \pm \sigma^2 t/2)/\sigma\sqrt{t}}$_.

__Exercise__. _Show the Black delta is $-N(-d_+)$_.

__Exercise__. _Show the Black gamma is $N'(d_+)/f\sigma\sqrt{t}$_.

__Exercise__. _Show the Black vega is $\partial_\sigma v = f N'(d_+)\sqrt{t}$_.

## Black-Scholes/Merton

The B-S/M model uses ${f = S_0e^{\rho t}}$ where $S_0$ is the initial stock price,
${s = \sigma\sqrt{t}}$ and the option value is discounted by ${e^{-\rho t}}$.

__Exercise__. _Derive the classical B-S/M value and greeks_.


## References

