---
title: Variance Swaps
author: Keith A. Lewis
...

A variance swap pays the sum of the squares of realized return over a period.
It provides exposure to volatility no matter the level of the underlying.
Unlike a call or put option it never goes out-of-the-money.

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
$(a - b)^2 = a^2 - 2ab + b^$$.
</details>

Continuous time mathematical treatments specify the the first term of the payoff as
$(1/t)\int_0^t (d\log X_s)^2\,ds$. If $X$ is an Ito process satisfying
$dX/X = \mu\,dt + \sigma\,dB$ then $d\log X = dX/X - (1/2)(dX/X)^2 = \mu\,dt + \sigma\,dB - (1/2)\sigma^2\,dt$
so $(d\log X)^2 = \sigma^2\,dt$ and $\int_0^t (d\log X_s)^2\,d = \int_0^t \sigma^2\,ds$.
Under a risk-neutral measure $\sigma_0^2 = (1/t)E[\int_0^t (d\log X_s)^2\,ds]$.

The astounding thing about variance swaps is that valuing and hedging them do not require
any assumptions on a model for the dynamics of the underlying. They only require futures and
options at a sufficiently wide range of strikes are traded on the underlying.

The payoff of a variance swap can be approximately replicated by a _dynamic hedge_ in futures
and a _static hedge_ in a calls and puts.

$$
\begin{aligned}
f(X_n) - f(X_0) &= \sum_{0\le j < n} f(X_{j+1}) - f(X_j) \\
	&= \sum_{0\le j < n} f'(X_j)\Delta X_j + \frac{1}{2} f''(X_j) (\Delta X_j)^2 + R_2
\end{aligned}
$$
where $R_2 = (1/2)\int_{X_j}^{X_{j+1}} f'''(t) (t - X_j)\, dt$.

If $f''(x) = 2/x^2$ then $f'(x) = -2/x + c$ where $c$ is a constant, and
$f(x) = -2\log x + cx$. It is convenient to choose $c = 1/z$ for some constant $z$.
$$
\begin{aligned}
-2\log X_n + X_n/z + 2\log X_0 - X_0/z &= \sum_{0\le j < n} f(X_{j+1}) - f(X_j) \\
	&= \sum_{0\le j < n} f'(X_j)\Delta X_j + \frac{1}{2} f''(X_j) (\Delta X_j)^2 + R_2
\end{aligned}
$$
