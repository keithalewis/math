---
title: Why not Black-Scholes/Merton?
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\AA{\mathcal{A}}

I am writing this piece to convince you the [@BlaSch1973] and [@Mer1973]
model for valuing options is untenable for describing actual trading.
Its many limitations and defects have been extensively documented but
their assumption of continuous time trading is particularly problematic.
Traders can only execute a finite number of trades to hedge an option
and want to know when, how much, and the risk involved.  B-S/M only
answers the how much question.  Telling a trader the answer to when is
"continuously" and then claim the risk is zero
undermines academic credibility.

Stephen [@Ros1978] came up with a simpler and more general theory than
B-S/M for valuing derivatives.  He showed their
result follows from geometry. There is no need for probability theory,
Ito processes, or partial differential equations.
Ross used the Hahn-Banach theorem to show

> If there are no arbitrage opportunities in a market, then
there must exist a (not generally unique) positive linear operator that
can be used to value all marketed assets.

Positive linear operators give rise to positive measures that can be
divided by their total mass resulting in a "risk-neutral probability
measure."  They are positive measures having mass 1, but are not the
probability of anything.  There is no need for a so-called real world
measure that gets immediately thrown out. Ross just gets down to the
business of valuing, hedging, and managing the risk of _any_ instrument,
not just the bond, stock, and option B-S/M considered.

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
Stocks "jump" between market close
and market open with no associated cash flow.  Fixed income instruments
are defined by their coupon cash flows.

Replacing $c$ with cash flows $(C_t)$ received at time $t$ associated
with owning instruments leads to an even more powerful theory.

Every arbitrage-free model of prices $(X_t)$ and cash flows $(C_t)$ has the form
$$
	X_t D_t = X_0 M_t - \sum_{s\le t} C_s D_s
$$
where $(D_t)$ are positive (valuation) measures and $(M_t)$ is a
vector-valued martingale measure indexed by market instruments.

If there are no cash flows then this can be interpreted as appropriately
discounted prices must be a martingale. This was pointed out
by Paul [@Sam1965] prior to Black, Scholes and Merton.

For example, the B-S/M model of a bond and a stock with no dividends is
$D_t = e^{-\rho t}P$ and $M_t = (1, e^{\sigma B_t - \sigma^2/2})P$
where $P$ is Wiener measure and $(B_t)$ is standard Brownian motion.

Every model specifies a _sample space_ $\Omega$ of possible outcomes.
B-S/M use the space of continuous functions on the interval $[0, \infty)$.
Their notion of information available at time $u$ is that given a stock
trajectory $(S_t)_{t\ge0}$ you know $S_t$ exactly for $t < u$
and nothing about the value of $S_t$ if $t \ge u$.

_Partial information_ about a sample space is specified by a _partition_:
a collection of pairwise disjoint subsets having union equal to the sample space.
No information is the singleton partition $\{\Omega\}$. Complete information
is the partition of singletons ${\{\{\omega\}\mid\omega\in\Omega\}}$.
Partial information is knowing which _atom_ in the partition $\omega\in\Omega$
belongs to.

If $X\colon\Omega\to\RR$ is a function and If $\AA$ is a partition
of$\Omega$ then $X$ is $\AA$-_measurable_ if and only if it is constant
on each element of the partition.

__Exercise__. _Show $X\colon\AA\to\RR$ is a well-defined function_.

_Hint_: Show if $\omega$ and $\omega'$ belong to the same atom
of the partition then $X(\omega) = X(\omega')$.

B-S/M considered a dynamic hedge in the bond and stock that replicates
an option payoff. The value, or mark-to-market, of a hedge at any time
is the sum of the current hedge positions times current market prices.
If the value of the option is known
as a function of hedging instrument prices then the _delta_ hedge is
the derivative of option value with respect to underlying prices.

Scholes and Merton won the Sveriges Riksbank Prize in Economic Sciences
in Memory of Alfred Nobel in 1997 "for a new method to determine the value of derivatives."
They showed the value of an option is the discounted expected option payoff under
the risk-neutral measure.
Their formula gives the option value making it possible to compute the delta hedge.
The value of the option is the cost of setting up the initial hedge, assuming
perfect replicaton.

Ross showed ...
<!--
## B-S/M

In this section we give a schematic review of Merton's mathematically correct
derivation of their eponymous partial differential equation.

They assume the bond price satisfies $dR_t/R_t = \rho\,dt$ and
stock price satisifes the stochastic differential equation
$dS_t/S_t = \mu\,dt + \sigma\,dB_t$ where
$(B_t)$ is standard Brownian motion. Mathematical proofs require the
SDE be expressed as an Ito integral but we will get by with
the _Ito calculus_ $(dt)^2 = 0$, $dt\,dB_t = dB_t\,dt = 0$, and $(dB_t)^2 = dt$.

Suppose $0 = t_0 < t_1 < \cdots t_n = t$. Define ${\Delta t_j = t_{j + 1} - t_j}$
and ${\Delta t = \max_{0\le j < n} \Delta t_j}$.

__Exercise__. _Show $\sum_{0\le j < n} \Delta t_j = t$_.

_Hint_: It is a telescoping sum.

__Exercise__. [$(dt)^2 = 0$] _Show $\sum_{0\le j < n} (\Delta t_j)^2$ 
goes to zero as $\Delta t$ goes to zero_.

_Hint_: Start with $\sum_{0\le j < n} (\Delta t_j)^2 \le \Delta t \sum_{0\le j < n} \Delta t_j$

__Exercise__. [$dt\,dB_t = 0$] _Show $E[\sum_{0\le j < n} \Delta t_j\,\Delta B_j] = 0$ 
and $\Var(\sum_{0\le j < n} \Delta t_j\,\Delta B_j)$
goes to zero as $\Delta t$ goes to zero_.

_Hint_: Use $\Var(\Delta B_j) = \Delta t_j$ and $(\Delta B_j)$ are independent.

__Exercise__. [$(dB_t)^2 = dt$] _Show $E[\sum_{0\le j < n} (\Delta B_j)^2] = t$ 
and $\Var(\sum_{0\le j < n} (\Delta B_j)^2)$
goes to zero as $\Delta t$ goes to zero_.

_Hint_: You will need to compute $\Var(\Delta B_t^2) = E[\Delta B_t^4] - E[\Delta B_t^2]^2$.
Use $E[e^{sX}] = e^{s^2/2}$ if $X$ is standard normal and read off the
moments using $E[e^{sX}] = \sum_0^\infty s^n E[X^n]/n!$.

We need the facts that if $X$ and $Y$ are Ito processes then
so are $aX$ for $a\in\RR$, $X + Y$, and $XY$.
Recall ${d(XY) = (X + dX)(Y + dX) - XY = X\,dY + Y\,dX + dX\,dY}$.

Ito showed that $Y_t = f(t,X_t)$ is also an Ito process that satisfies
$$
	dY_t = \partial_t f(t, X_t) + \partial_x f(t, X_t) + \frac{1}{2} \partial_x^2 f(t, X_t)
$$
if the partial derivatives of $f$ satisfy certain technical conditions.

Merton considered strategies where the position held in each instrument
depended on the time where 
$M_t = m(t, R_t, S_t)$ is the amount held in the bond and
$N_t = n(t, R_t, S_t)$ is the amount held in the stock at time $t$. The value of the
position at $t$ is $V_t = M_t R_t + N_t S_t$.

Dropping the $t$ subscript and using the Ito calculus
$$
\begin{aligned}
$dV &= (M\,dR + R\,dM + dM\,dR) + (N\,dS + S\,dN + dN\,dS \\
\end{aligned}
$$
-->

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

