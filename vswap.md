---
title: Variance Swaps
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Value, hedge, and manage risk of variance swaps.
...

\newcommand\mb[1]{\mathbf{#1}}
\newcommand\RR{\mb{R}}

A variance swap pays the sum of the squares of returns over a period.
It provides exposure to volatility no matter the level of the underlying.
Unlike a call or put option, it never goes out-of-the-money.
The most remarkable fact about variance swaps is that they do not
require a mathematical model of the underlying price, only
futures on the underlying and puts and calls that expire at the
maturity of the variance swap.

## One Period

Consider an underlying with price $x$ at the beginning of a period and price $X$
at the end of the period. Consider an option with payoff $(X - x)^2$ at the
end of the period having price $A$ and an option with payoff
$X^2 - x^2$ having price $B$. Futures pay $X - x$ and have price 0.
If there is no arbitrage then $A = B$. This follows from simple algebra:
$$
	X^2 - x^2 = 2x(X - x) + (X - x)^2.
$$
Either contract can be used to replicate the other using the zero price futures contract.

Note this is Taylor's formula for $f(x) = x^2$ since cubic and higher order terms are 0.

## Contract

Variance swap contracts are specified by an underlying instrument and observation times.
If the price of the underlying is $X_t$ at time $t$ and the observation times
are ${t_0 < t_1 < \cdots < t_n}$ then the payoff on unit notional at time $t_n$ is
the average _realized variance_ minus the _par variance_
$$
	\frac{c}{t_n - t_0}\sum_{j = 0}^{n-1} R_j^2 - \sigma_0^2,
$$
where $c$ is a constant specified in the contract that is not far from the number 1,
$R_j$ is the return over $[t_j, t_{j+1}]$, and $\sigma_0$ is the _par volatility
The par volatility is quoted to make the price of the contract at $t_0$ equal to zero.
Variance swap contracts are quoted using the par volatility.

Almost all variance swap contracts specify the return as
the _log realized return_ ${R_j = \log X_{j+1}/X_j = \Delta \log X_j}$
where $\log$ is the natural logarithm
with base $e$ approximately equal to $2.718281828$. I confess to being surprised when
I first saw this approximation in an actual contract.

The standard way of specifying return is 
$R_j = (X_{j+1} - X_j)/X_j = \Delta X_j/X_j$.[^1] It does not drag in logarithms and is simpler
to work with. By Taylor's theorem
$$
	\Delta \log X = (\Delta X/X) - (1/2)(\Delta X/X)^2 + (1/3)(\Delta X/X)^3 + O((\Delta X/X)^4).
$$
The cubic term $(\Delta X/X)^3$ explains the P&L of a variance swap hedge, as we will see later.

__Exercise__. _Show $(\Delta \log X)^2 = (\Delta X/X)^2 - (2/3)(\Delta X/X)^3 + O((\Delta X/X)^4)$_.

[^1]: Recall the _realized return_ over the interval $[t_j,t_{j+1}]$ is $X_{j+l}/X_j$.

The exercise shows the cubic term in the standard return contract is twice as sensitive
in the opposite direction to the log return contract.
When Peter Carr and I were implementing the variance swap model at Banc of America Securities
we suggested selling two log return contracts for each standard return contract to
minimize the risk of ignoring the cubic term. They (correctly) thought that clients
would get confused by having two types of contracts and only wrote log
return contracts to halve the effect of ignoring the cubic term.

Continuous time mathematical treatments assume the realized variance
is approximated by ${(1/t)\int_0^t (d\log X_s)^2\,ds}$. If $X$ is an
Ito process satisfying ${dX/X = \mu\,dt + \sigma\,dB}$ then
$$
	d\log X = dX/X - (1/2)(dX/X)^2 = \mu\,dt + \sigma\,dB - (1/2)\sigma^2\,dt
$$
so ${\int_0^t (d\log X_s)^2\,ds = \int_0^t \sigma^2\,ds}$. 
Under a risk-neutral measure the par variance is ${\sigma_0^2 = (1/t)E[\int_0^t \sigma^2\,ds]}$.

Black, Scholes, and Merton had to work harder to show the drift of the
underlying was irrelevant.  The stunning thing about variance swaps
is that valuing and hedging them do not require any assumptions on a
model for the dynamics of the underlying. They only require futures and
options traded at a sufficiently wide range of strikes on the underlying.

## Hedge

The payoff of a variance swap can be approximately replicated by a
_static hedge_ and a _dynamic hedge_.
The static hedge is a European log contract
and the dynamic hedge uses futures at each observation date except the last.
The options, futures, and variance swap expiration must be the same.

For any thrice differentiable function $f$ we use a telescoping sum and Taylor's theorem
with remainder to get
$$
\begin{aligned}
f(X_n) - f(X_0) &= \sum_{0\le j < n} f(X_{j+1}) - f(X_j) \\
	&= \sum_{0\le j < n} f'(X_j)\Delta X_j + \frac{1}{2} f''(X_j) (\Delta X_j)^2 + S_j
\end{aligned}
$$
where $S_j = (1/2)\int_{X_j}^{X_{j+1}} f'''(t) (X_{j+1} - t)^2\,dt$.
Note $f(X_n) - f(X_0)$ is a European option payoff with expiration $t_n$
and $f'(X_j) \Delta X_j$ is the cash flow
at time $t_{j+1}$ from purchasing $f'(X_j)$ futures on $X$ at time $t_j$.

The quadratic term can be used to replicate a variance swap payoff.
If $f''(x) = 2/x^2$ then $(1/2)f''(X_j)(\Delta X_j)^2 = (\Delta X_j/X_j)^2$ is
the square of the return.
We have $f'(x) = -2/x + c$ where $c$ is a constant, and
$f(x) = -2\log x + cx$. It is convenient to choose $c = 2/z$ for some constant $z$ so
$$
-2\log X_n + 2 X_n/z + 2\log X_n - 2 X_0/z
	= \sum_{0\le j < n} (-2/X_j + 2/z)\Delta X_j + (\Delta X_j/X_j)^2 + S_j
$$
Rearranging terms and simplifying gives
$$
\sum_{0\le j < n} (\Delta X_j/X_j)^2 = -2\log X_n/X_0 + 2(X_n - X_0)/z + \sum_{0\le j < n} (2/X_j - 2/z)\Delta X_j - S_j
$$
This shows a variance swap can be replicated using a static hedge and
a dynamic hedge with error $\sum -S_j$. The static hedge is a European option
that can be approximated using the Carr-Madan formula.
If $z = X_0$ then the initial dynamic futures hedge is zero.

## Static Hedge

The static hedge is $-2\log X_n/X_0 + (X_n - X_0)/z$ and can be approximately replicated
with a cash position, a forward, and a portfolio of puts and calls.
Recall the Carr-Madan formula for a twice differentiable function $f\colon [0, \infty)\to\RR$ is
$$
	f(x) = f(a) + f'(a)(x - a) + \int_0^a f''(k) (k - x)^+ \, dk + \int_a^\infty f''(k) (x - k)^+\,dk
$$
If puts with strikes $(L_j)$ and calls with strikes $(H_j)$ are available at $t_n$
then given $K$
we consider the piecewise continuous linear function $\tilde{f}$ determined by by the points
$(L_j, f(L_j))$, $L_j < K$, and $(H_j, f(H_j))$, $H_j \ge K$. We assume linear extrapolation
on the left using the two lowest put strikes and on the right by the two highest call strikes.
Typically $K$ is chosen to be close to the  forward at option expiration.

<!--
## Cubic Term

The cubic term typically describes 95% of variance swap P&L over each period.

Since $f'''(x) = -4/x^3$ the error term $R_j$ over the period $[t_j, t_{j+1}]$ is
$R_j = (1/2)\int_{X_j}^{X_{j+1}} -4/t^3 (X_{j+1} - t)^2\, dt$.
Using $t$ is between $X_j$ and $X_{j+1}$ we have
$$
\begin{aligned}
	|R_j| &\le \frac{2}{\min\{X_j, X_{j+1}\}^3} \left|\int_{X_j}^{X_{j+1}} (X_{j+1} - t)^2\, dt\right| \\
		&= \frac{2}{\min\{X_j, X_{j+1}\}^3} \frac{1}{3}|X_{j+1} - X_j|^3 \\
		&= \frac{2}{3} \frac{|\Delta X_j|^3}{\min\{X_j, X_{j+1}\}^3}
\end{aligned}
$$
-->
