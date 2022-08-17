---
title: Variance Swaps
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Value, hedge, and manage risk of variance swaps.
...

A variance swap pays the sum of the squares of realized return over a period.
It provides exposure to volatility no matter the level of the underlying.
Unlike a call or put option it never goes out-of-the-money.
The most remarkable fact about variance swaps is that they do not
require a mathematical model of the underlying price, only
futures on the underlying and puts and calls that expire at the
maturity of the variance swap.

## One Period

Consider an underlying with price $x$ at the beginning of a period and price $X$
at the end of the period. Consider an option with payoff $(X - x)^2$ at the
end of the period having price $A$. If an option with payoff
$X^2 - x^2$ has price $B$ and the forward paying $X - x$ has price 0 then
$A = B$. This follows from the elementary formula
$$
	X^2 - x^2 = 2x(X - x) + (X - x)^2.
$$
Note this is Taylor's formula for $f(x) = x^2$ since cubic and higher order terms are 0.
Either contract can be used to replicate the other using the 0 price forward contract.
If the price of the forward is $C$ then $B = 2xC + A$.
Note this provides a perfect hedge no matter the value of $X$.

A more realistic one period model has payoff $(\log X/x)^2$, the square of the
realized return. Recall Taylor's formula with remainder for sufficiently differentiable $f$ is
$$
	f(x) = \sum_{k=0}^n f^{(k)}(a) (x-a)^k/k! + \int_a^x f^{(n+1)}(t) (x - t)^n/n!\,dt
$$
If $f(x) = \log x$ then $f'(x) = 1/x$, $f''(x) = -1/x^2$, $f'''(x) = 2/x^3$ so
$$
	\log X/x = \log X - \log x = (1/x)(X - x) - (1/x^2)(X - x)^2/2 + \int_x^X 2/t^3(X - t)^2/2\,dt
$$

## Contract

Contracts are specified by an underlying instrument and observation times.
If the level of the underlying is $X_t$ at time $t$ and the observation times
are $(t_j)_{0\le j\le n}$ then the payoff on unit notional at time $t_n$ is
$$
	\frac{c}{t_n - t_0}\sum_{0\le j < n} R_j^2 - \sigma_0^2
$$
where $R_j$ is the realized return over $[t_j, t_{j+1}]$, $\sigma_0$ is the _par volatility_,
and $c$ is a constant specified in the contract that is not far from the number 1.
The par volatility makes the price of the contract at $t_0$ equal to zero.

The realized return is $R_j = \log X_{j+1}/X_j = \log X_{j+1} - \log X_j =
\Delta \log X_j$ where $\log$ is the natuaral logarithm
with base $e \approx 2.718281828$. Variance swap contracts actually specify this
approximation. I have no idea why realized return is not specified
as $R_j = (X_{j+1} - X_j)/X_j = \Delta X_j/X_j$. It does not drag in logarithms and is simpler
to work with. 

__Exercise__. _Show $\Delta \log X = (\Delta X/X) - (1/2)(\Delta X/X)^2 + O((\Delta X/X)^3)$_.

<details>
<summary>Solution</summary>
Taylor's formula.
</details>

The cubic term $(\Delta X/X)^3$ explains the P&L of a variance swap hedge, as we will see later.

__Exercise__. _Show $(\Delta \log X)^2 = (\Delta X/X)^2 - (\Delta X/X)^3 + O((\Delta X/X)^4)$_.

<details>
<summary>Solution</summary>
$(a - b)^2 = a^2 - 2ab + b^2$.
</details>

Continuous time mathematical treatments specify the the first term of the payoff as
$(1/t)\int_0^t (d\log X_s)^2\,ds$. If $X$ is an Ito process satisfying
$dX/X = \mu\,dt + \sigma\,dB$ then $d\log X = dX/X - (1/2)(dX/X)^2 = \mu\,dt + \sigma\,dB - (1/2)\sigma^2\,dt$
so $(d\log X)^2 = \sigma^2\,dt$ and $\int_0^t (d\log X_s)^2\,d = \int_0^t \sigma^2\,ds$.
Under a risk-neutral measure the par variance is $\sigma_0^2 = (1/t)E[\int_0^t \sigma^2\,ds]$.

The astounding thing about variance swaps is that valuing and hedging them do not require
any assumptions on a model for the dynamics of the underlying. They only require futures and
options traded at a sufficiently wide range of strikes on the underlying.

The payoff of a variance swap can be approximately replicated by a _dynamic hedge_ in futures
and a _static hedge_ in a calls and puts.

For any thrice differentiable function $f$ we use a telescoping sum and Taylor's theorem
with remainder to get
$$
\begin{aligned}
f(X_n) - f(X_0) &= \sum_{0\le j < n} f(X_{j+1}) - f(X_j) \\
	&= \sum_{0\le j < n} f'(X_j)\Delta X_j + \frac{1}{2} f''(X_j) (\Delta X_j)^2 + R_j
\end{aligned}
$$
where $R_j = (1/2)\int_{X_j}^{X_{j+1}} f'''(t) (X_{j+1} - t)^2\, dt$.
Note $f(X_n) - f(X_0)$ is a European option payoff and $f'(X_j) \Delta X_j$ is the cash flow
at time $t_{j+1}$ from purchasing $f'(X_j)$ futures on $X$ at time $t_j$.
The quadratic term can be used to replicate a variance swap payoff.

If $f''(x) = 2/x^2$ then $(1/2)f''(X_j)(\Delta X_j)^2 = (\Delta X_j/X_j)^2$ is
the square of the realized return.
We have $f'(x) = -2/x + c$ where $c$ is a constant, and
$f(x) = -2\log x + cx$. It is convenient to choose $c = 1/z$ for some constant $z$ so
$$
-2\log X_n + X_n/z + 2\log X_0 - X_0/z
	= \sum_{0\le j < n} (-2/X_j + 2/z)\Delta X_j + (\Delta X_j/X_j)^2 + R_j
$$
Rearranging terms and simplifying gives
$$
\sum_{0\le j < n} (\Delta X_j/X_j)^2 = -2\log X_n/X_0 + (X_n - X_0)/z + \sum_{0\le j < n} (2/X_j - 2/z)\Delta X_j - R_j
$$
This shows a variance swap can be replicated using a static hedge and
a dynamic hedge using futures with error $R_j$. The static hedge can be
approximated with puts and calls using the Carr-Madan formula. If $z =
X_0$ then the initial furtures hedge is zero.

## Static Hedge

The static hedge is $-2\log X_n/X_0 + (X_n - X_0)/z$ can be approximately replicated
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
Typically $K$ is chosen to be close to the at-the-money forward at option expiration.

the Carr-Madan formula is
$$
	-2\log K/X_0 + (K - X_0)/z + (2/K - 2/z)(K - X_0)
$$

## Dynamic Hedge

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
