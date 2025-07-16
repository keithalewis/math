---
title: VIX
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---

A variance swap contract specifies observation times $t_0 < t_1 < \ldots < t_n$
and an underlying $X$ with price/quote $X_t$ at time $t$.
Let ${\Delta X_j = X_{j+1} - X_j}$ where ${X_j = X_{t_j}}$.
At time $t_n$ the variance swap pays the average realized variance minus the par variance
${1/(t_n - t_0) \sum_{j=0}^{n-1} (\Delta X_j/X_j)^2 - \sigma^2}$
where $\sigma$ is agreed on at $t_0$ so the contract has price 0.

Actual contracts use days per year divided by $n - b$, where $b$ is a small integer,
instead of ${1/(t_n - t_0)}$.
As OTC contracts near closing the days per year and $b$
tend to get played with by sell-side firms hoping their buy-side client won't notice. 

Every variance swap contract I've seen specifies realized return
as $\log_e X_{j+1}/X_j$ where $e$ is approximately $2.718281828...$
instead of $\Delta X_j/X_j$.  It is true that if you make the mistake of
assuming $X_t$ is an Ito process then ${(d\log X_t)^2 = (dX_t/X_t)^2}$.
Since ${\Delta \log X_j = \Delta X_j/X_j - (1/2)(\Delta X_j/X_j)^2 +
O((\Delta X_j/X_j)^3)}$ we have
$$
(\Delta \log X_j)^2 = (\Delta X_j/X_j)^2 - (\Delta X_j/X_j)^3 + O((\Delta X_j/X_j)^4).
$$

Let's used the idealized payoff and deal with details later.

If the Taylor series for $f$ converges then
$$
\begin{aligned}
f(X_n) - f(X_0) &= \sum_{j=0}^{n-1} f(X_{j+1}) - f(X_j) \\
	&= \sum_{j=0}^{n-1} \sum_{k=1}^\infty f^{(k)}(X_j) (\Delta X_j)^k/k! \\
\end{aligned}
$$

Let $f''(x) = 2/x^2$ so $f'(x) = -2/x + 2/z$ for some constant $z$ and $f(x) = -2\log x + 2x/z$.
Usually $z$ is taken to be $X_0$ so the initial futures hedge is 0.
Solving for the quadradic term gives

$$
\sum_{j=0}^{n-1} (\Delta X_j/X_j)^2 = f(X_n) - f(X_0)
- \sum_{j=0}^{n-1} f'(X_j)\Delta X_j + O(((\Delta X_j/X_j)^3)
$$
The first two terms on the right hand side are the payoff of a European option,
the _static hedge_.
The terms in the summation are the payoffs of $2(1/X_j - 1/z)$ futures contracts
on $X$ entered into at time $t_j$, the _dynamic hedge_.

Since $f'''(x) = -4/x^3$ the third order term is $(2/3)(\Delta X_j/X_j)^3$.

The Carr-Madan formula is
$$
f(x) = f(z) + f'(z)(x - z) + \int_0^z f''(k) p(k)\,dk + \int_z^\infty f''(k) c(k)\,dk
$$
where $p(k) = \max\{k - x,0\}$ and $c(k) = \max\{x - k,0\}$.

Given strikes ${k_0,\ldots,k_n}$ we replace $f$ by a piece-wise linear and continuous
function $\bar{f}$ determined by the points $(k_j, f(k_j))_{j=0}^n$.
To replicate the static hedge a portfolio of a cash position, a forward at $z$,
puts with strikes less than $z$, and calls with strikes greater than $z$ is used.
Note we do not need a put at strike $k_0$ or a call at strike $k_n$ to do this.

A possible improvement might be to find $\bar{f}_j\approx f(k_j)$ that minimizes
the $L^\infty$ norm of $f - \bar{f}$ over $[k0, k_n]$. Attention must
also be paid to to the extrapolated slopes ${(\bar{f}_1 - \bar{f}_0)/(k_1 - k0)}$
and ${(\bar{f}_n - \bar{f}_{n-1})/(k_n - k_{n-1})}$.

For $0 \le j < n$ we have $\bar{f}'(x) = m_j = (\bar{f}_{j+1} - \bar{f}_j)/(k_{j+1} - k_j)$
on $(k_j, k_{j+1})$.

For $1\le j < n$ we have ${\bar{f}''(k_j) = \bar{f}''_j = (m_j - m_{j-1})\delta_{k_j}}$.
Note $\bar{f}''(k_0) = 0 = \bar{f}''(k_n)$.

The Carr-Madan formula for the piecewise-linear approximation is
$$
\bar{f}(x) = \bar{f}(z) + \bar{f}'(z)(x - z)
	+ \sum_{k_j < z} \bar{f}''_j (k_j - x)^+
	+ \sum_{k_j > z} \bar{f}''_j (x - k_j)^+
$$

The formula for par variance is
$$
\sigma^2 = \bar{f}(z) + \bar{f}'(E[X] - z) 
	+ \sum_{k_j < z} \bar{f}''_j p(k_j)
	+ \sum_{k_j > z} \bar{f}''_j c(k_j)
$$
where $p(k)$ is the put price at $k$ and $c(k)$ is the call price at $k$.



Out-of-the-money puts on equity indices tend to be expensive. In practice,
traders load up on the lowest strike put they beleive is affordable. If the
index stays above this strike then the static hedge replicates the payoff.
If the index goes below this strike then traders sell off some of the
loaded up put and purchase lower strike puts to replicate the payoff.

