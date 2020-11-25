---
title: Cumulative Distribution Functions
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Facts about cumulative distribution functions
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

The _cumulative distribution function_ of a random variable $X$ is
$F^X(x) = F(x) = P(X\le x)$. It tells you everything there is to know
about the distribution of $X$.
For example $P(X\in E) = E[1_E(X)] = \int_E dF(x)$
where $1_E(x) = 1$ if $x\in E$, $1_E(x) = 0$ if $x\not\in E$ and we
use Riemann-Stieltjes integration.

Every cdf is non-decreasing, continuous from the right, has left limits, and
$\lim_{x\to-\infty}F(x) = 0$, $\lim_{x\to+\infty}F(x) = 1$.
Any function with these properties is the cdf of a random variable.

__Exercise__. _Prove right continuity using $\cap_n (-\infty, x + 1/n] = (-\infty, x]$_.

Note $\cup_n (-\infty,x - 1/n] = (-\infty,x) \not= (-\infty,x]$.
The sequence $F(x - 1/n)$ is non-decreasing so it has a limit, but not
necessarily $F(x)$.

The distribution of a _uniformly distributed_ random variable on $[0,1]$, $U$,
is $F(x) = x$ if $0\le x\le 1$, $F(x) = 0$ if $x < 0$, and $F(x) = 1$ if $x > 1$.
In this case $P(X\in(a, b]) = b - a$ for $0\le a < b\le 1$.

__Exercise__ _If $X$ has cdf $F$, show $F^{-1}(U)$ has the same distribution as $X$ and
$F(X)$ has the same distribution as $U$_.

If $F(x)$ jumps from $a$ to $b$ at $x = c$ we define $F^{-1}(u) = c$ for $a \le u < b$.

## Continuous and Discrete

A random variable is _continuously distributed_ if $F = \int F'$
and we call $f = F'$ the _probability density function_ of $X$.
If $X$ is discrete with $P(X = x_j) = p_j$ then
$F(x) = \sum_j 1(x\le x_j) p_j$ and $f(x) = \sum_j δ_{x_j} p_j$
where $δ_c$ is the _delta function_, or _point mass_, at $c$.
A delta function is not a function but we can define
$\int \delta_a(x) g(x)\dx = \int g(x) d1(x \ge a) = g(a)$ using Riemann-Stieltjes integration.

## Cumulant

The _cumulant_ of the random variable $X$ is $\kappa^X(s) = \kappa(s) = \log E[\exp(s X)]$.

__Exercise__. _Show $\kappa^{c + X}(s) = cs + \kappa^X(s)$ if $c$ is a constant_.

__Exercise__. _Show $\kappa^{cX}(s) = \kappa^X(cs)$ if $c$ is a constant_.

__Exercise__. _Show $\kappa^{X + Y}(s) = \kappa^X(s) + \kappa^Y(s)$ if $X$ and $y$ are independent_.

__Exercise__. _Show $\kappa(0) = 0$, $\kappa'(0) = E[X]$, and $\kappa''(0) = \Var(X)$_.

The _cumulants_, $(\kappa_n)$, are the coefficients of the Taylor series expansion of the cumulant
$\kappa(s) = \sum_{n > 0} \kappa_n s^n/n!$.

__Exercise__. _Show $\kappa_1^{c + X} = c + \kappa_1^X$ and  $\kappa_n^{c + X} = \kappa_n^X$ if $n > 1$_.

__Exercise__. _Show $\kappa_n^{cX} = c^n\kappa_n$ for all $n$_.

The _moments_ of $X$, $\mu_n = E[X^n]$ are related
to the cumulants via complete Bell polynomials $(B_n)$.
$$
	E[e^{sX}] = \sum_{n\ge0} \mu_n s^n/n! = e^{\kappa(s)} = e^{\sum_{n>0} \kappa_n s^n/n!}
	= \sum_{n\ge0} B_n(\kappa_1,\ldots,\kappa_n) s^n/n!
$$
Taking a derivative with respect to $s$ of the last equality gives the recurrence formula
$$
	B_0 = 1, B_{n+1}(\kappa_1,\ldots,\kappa_{n+1})
		= \sum_{k = 0}^n \binom{n}{k} B_{n - k}(\kappa_1,\ldots,\kappa_{n-k})\kappa_{k + 1}, n > 0.
$$
<!--
The cumulates can be expressed in terms of moments by
$$
	\kappa_n = \sum_{k=0}^{n-1} (-1)^k k! B_{n,k+1}(\mu_1,\ldots,\mu_{n - k})
$$
where $(B_{n,k})$ are partial Bell polynomials satisfying the recurrence
$$
	B_{n,k}(x_1,\ldots,x_{n - k + 1})
		= \sum_{j=0}^{n-k}\binom{n-1}{j} B_{n-j+1,k-1}(x_1,\ldots,x_{j+1})x_{j+1}
$$
-->

## Distributions

### Normal

The standard normal random variable $Z$ has density $\phi(z) = \exp(-z^2/2)/\sqrt{2\pi}$,
$-\infty < z < \infty$,
and cumulative distribution $\Phi(z) = \int_{-\infty}^z \exp(-t^2/2)\, dt/\sqrt{2\pi}$.
Note 
$$
\begin{aligned}
E[e^{\mu + \sigma Z}] &= \int_{-\infty}^\infty e^{\mu + \sigma z} e^{-z^2/2}\, dz/\sqrt{2\pi} \\
	&= \int_{-\infty}^\infty e^{\mu + \sigma^2/2} e^{-(z - \sigma)^2/2}\, dz/\sqrt{2\pi} \\
	&= e^{\mu + \sigma^2/2} \\
\end{aligned}
$$
so $E[\exp(N)] = \exp(E[N] + \Var(N)/2)$ for any normally distributed random variable $N$,

Also
$$
\begin{aligned}
E[g(Z) e^{sZ}] &= \int_{-\infty}^\infty g(z) e^{sz} e^{-z^2/2}\, dz/\sqrt{2\pi} \\
	&= \int_{-\infty}^\infty g(z) e^{s^2/2} e^{-(z - s)^2/2}\, dz/\sqrt{2\pi} \\
	&= E[e^{sZ}] E(g(Z - s)]. \\
\end{aligned}
$$
More generally, if $N$, $N_1, \ldots$ are jointly normal then
$E[\exp(N)g(N_1,\ldots)] = E[\exp(N)] E[g(N_1 + \Cov(N, N_1), \ldots)]$.
In particular
$$
	E[\exp(s X - s^2/2)g(X)] = E[g(X + s)].
$$
Taking derivatives with respect to $s$ shows
$$
	E[\exp(s X - s^2/2)(X - s)g(X)] = E[g'(X + s)].
$$
so $E[X g(X)] = E[g'(X)]$ when $s = 0$.

This can be used to calculate the moments of $X$ by
$E[X^n] = E[X X^{n-1}] = (n - 1)E[X^{n - 2}]$ starting from $E[X^0] = 1$ and $E[X^1] = 0$.
The odd moments are zero and the even moments are $E[X^{2n}] = (2n - 1)(2n - 3)\cdots 1$.

The cumulant is $\kappa(s) = \log E[\exp(sZ)] = s^2/2$ so $\kappa_2 = 1$ and all other
cumulants are zero.

### Logistic

A logistic random variate has cumulative distribution $F(x) = 1/(1 + e^{-x})$,
$x\in\mathbf{R}$.
It's density function is $f(x) = e^{-x}/(1 + e^{-x})^2$. Note
$f(x) = \int_0^\infty e^{-x} e^{-\alpha e^{-x}} e^{-\alpha}\,d\alpha$.

The quantile function is $Q(u) = F^{-1}(u) = \log u/(1-u)$.

The moment generating function is $M_X(t) = E e^{tX}
= \Gamma(1 - t)\Gamma(1 + t)$, $-1 < t < 1$.

Using $u = F(x) = 1/(1 + e^{-x})$, so $e^x = u/(1 - u)$
$$
\begin{aligned}
E e^{tX} &= \int_{-\infty}^\infty e^{tx} e^{-x}/(1 + e^{-x})^2\,dx \\
    &= \int_0^1 u^t(1 - u)^{-t}\,du \\
    &= B(1 + t, 1 - t) \\
    &= \Gamma(1 + t)\Gamma(1 - t)/\Gamma(2) \\
    &= \Gamma(1 + t)\Gamma(1 - t)
\end{aligned}
$$

Using $u = F(x) = 1/(1 + e^{-x})$, so $e^x = u/(1 - u)$
$$
\begin{aligned}
\int_{-\infty}^a e^{tx} dF(x)
    &= \int_0^{F(a)} u^t(1 - u)^{-t}\,du \\
    &= B(F(a); 1 + t, 1 - t) \\
\end{aligned}
$$

