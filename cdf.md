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

## Cumulant

The _cumulant_ of the random variable $X$ is $\kappa_X(s) = \kappa(s) = \log E[\exp(s X)]$.

__Exercise__. _Show if $c$ is a constant then $\kappa_{c + X}(s) = cs + \kappa_X(s)$_.

__Exercise__. _Show if $c$ is a constant then $\kappa_{cX}(s) = \kappa_X(cs)$_.

__Exercise__. _Show if $X$ and $Y$ are independent then $\kappa_{X + Y}(s) = \kappa_X(s) + \kappa_Y(s)$_.

__Exercise__. _Show $\kappa_X(0) = 0$, $\kappa_X'(0) = E[X]$, and $\kappa_X''(0) = \Var(X)$_.

The _cumulants_, $(\kappa_n(X))$, are the coefficients of the Taylor series expansion of the cumulant
$\kappa(s) = \sum_{n > 0} \kappa_n s^n/n!$. Note $\kappa_n = \kappa^{(n)}(0)$ if $\kappa$ is
sufficiently differentiable.

__Exercise__. _Show $\kappa_1(c + X) = c + \kappa_1(X)$ and  $\kappa_n(c + X) = \kappa_n(X)$ if $n > 1$_.

__Exercise__. _Show $\kappa_n(cX) = c^n\kappa_n(X)$ for all $n$_.

__Exercise__. _Show if $X$ and $Y$ are independent $\kappa_n(X + Y) = \kappa_n(X) + \kappa_n(Y)$ for all $n$_.

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

The cumulants can be expressed in terms of moments by
$$
	\kappa_n = \sum_{k=0}^{n-1} (-1)^k k! B_{n,k+1}(\mu_1,\ldots,\mu_{n - k})
$$
where $(B_{n,k})$ are partial Bell polynomials satisfying the recurrence
$B_{0,0} = 1$, $B_{n,0} = 0$ for $n > 0$, $B_{0,k} = 0$ for $k > 0$ and
$$
	B_{n,k}(x_1,\ldots,x_{n - k + 1})
		= \sum_{i=1}^{n-k+1}\binom{n-1}{i - 1} B_{n-i,k-1}(x_1,\ldots,x_{n - i - k + 2})x_i
$$

### Esscher Transform

The Esscher transform of a random variable has density $f_s(x) = \exp(s x - \kappa(s))f(x)$
and we write $E_s$ for expectation under the transform.
Since $E[\exp(sX)] = \exp(\kappa(s))$ this is a probability density.
We write $X_s$ for the Esscher transform of $X$ so $F^{X_s)(x) = P(X_s\le x) = P_s(X\le X)$
and $E[g(X_s)] = E_s[g(X)]$.

Note $(d/ds) E[g(X)\exp(s X - \kappa(s))] =  E[g(X)\exp(s X - \kappa(s))(X - \kappa'(s))]$
so $(d/ds)E_s[g(X)] = E_s[g(X)(X - \kappa'(s))]

## Distributions

We gather some facts about the distributions and cumulants of particular random variables.

### Discrete

If $X$ is discrete with $P(X = x_j) = p_j$ then
$F(x) = \sum_j 1(x\le x_j) p_j$ and $f(x) = \sum_j δ_{x_j} p_j$
where $δ_c$ is the _delta function_, or _point mass_, at $c$.
A delta function is not a function but we can define
$\int_{\bm{R}} g(x) \delta_a(x) \,dx = \int_{\bm{R}} g(x) d1(x \ge a) = g(a)$ using Riemann-Stieltjes integration.
The cumulant is $\kappa(s) = \log E[\sum_j \exp(sx_j) p_j]$.

### Normal

The standard normal random variable $Z$ has density $\phi(z) = \exp(-z^2/2)/\sqrt{2\pi}$,
$-\infty < z < \infty$,
and cumulative distribution $\Phi(z) = \int_{-\infty}^z \exp(-t^2/2)\, dt/\sqrt{2\pi}$.

The derivatives of $\phi$ are $\phi^{(n)}(x) = (-1)^n\phi(x)H_n(x)$ where $H_n$ are the
Hermite polynomials. They satisfy the recurrence $H_0(x) = 1$, $H_1(x) = x$ and
$H_{n+1}(x) = x H_n(x) - n H_{n-1}(x)$, $n\ge 1$.

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

The moments of $X$ can be calculated using
$E[X^n] = E[X X^{n-1}] = (n - 1)E[X^{n - 2}]$, $E[X^0] = 1$, and $E[X^1] = 0$.
The odd moments are zero and the even moments are $E[X^{2n}] = (2n - 1)(2n - 3)\cdots 1 = (2n - 1)!!$.

The cumulant is $\kappa(s) = \log E[\exp(sZ)] = s^2/2$ so $\kappa_2 = 1$ and all other
cumulants are zero.

### Poisson

The Poisson distribution with parameter $\lambda$ has density $P(X_\lambda = n) = e^{-\lambda}\lambda^n/n!$, $n\ge 0$.
Since $E[\exp(s X)] = \sum_{n\ge 0} \exp(sn) e^{-\lambda}\lambda^n/n! 
= e^{-\lambda}\exp(e^s\lambda) = \exp(\lambda(e^s - 1))$
we have $\kappa(s) = \lambda(e^s - 1)$ and $\kappa_n = \lambda$, $n\ge 1$.

$$
\begin{aligned}
	E[g(X_\lambda)\exp(s X - \kappa(s))] &= \sum_{n\ge0} g(n)\exp(sn - \lambda(e^s - 1))e^{-\lambda}\lambda^n/n! \\
	&= \exp(-\lambda e^s)\sum_{n\ge0} g(n) (\lambda e^s)^n/n! \\
	&= E[g(X_{\lambda e^s})]
\end{aligned}
$$

and $(d/ds)E[g(X_\lambda)\exp(s X - \kappa(s))] = E[h(X_{\lambda e^s})]$
where $h(n) = g(n)(n - \lambda e^s)$.

### Exponential

The density of an exponential with parameter $\lambda$ is $f(x) = \lambda\exp(-\lambda x)$, $x\ge 0$.
Since $E[\exp sX] = \int_0^\infty \exp(sx)  \lambda\exp(-\lambda x)\,dx = \lambda/(\lambda - s)$
The cumulant is $\kappa(s) = -\log(1 - s/\lambda)$ so $\kappa'(s) = (1 - s/\lambda)^{-1}$
and $\kappa^{(n)}(s) = (1 - s/\lambda)^{-n}(n - 1)!/\lambda^{n-1}$

### Logistic

A logistic random variate has cumulative distribution $F(x) = 1/(1 + e^{-x})$,
$-\infty < x < \infty$ and
density function $f(x) = e^{-x}/(1 + e^{-x})^2$.
The quantile function is $Q(u) = F^{-1}(u) = \log u/(1-u)$.

Note
$f(x) = \int_0^\infty e^{-x} e^{-\alpha e^{-x}} e^{-\alpha}\,d\alpha$.

The moment generating function is $M_X(s) = E e^{sX}
= \Gamma(1 + s)\Gamma(1 - s)$, $-1 < s < 1$
so its cumulant is $\kappa(s) = \log\Gamma(1 + s) + \log\Gamma(1 - s)$.

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

The _digamma_ function is the derivative of the log of the Gamma function
$\psi(s) = \Gamma'(s)/\Gamma(s)$. Its Taylor series at $1$ is
$\psi(s + 1) = -\gamma - \sum_{k\ge 1} \zeta(k+1)(-s)^k$ where
$\gamma$ is the Euler-Mascheroni constant and $\zeta(s) = \sum_{k\ge 1} n^{-s}$
is the zeta function.

The first derivative of the cumulant is $\kappa'(s) = \psi(1 + s) - \psi(1 - s)
= 2\sum_{k\ge 1} \zeta(2k)s^{2k - 1}$.
The variance of the logistic is $\kappa_2 = \kappa''(0) = 2\zeta(2) = \phi^2/3$.

The Esscher transformed cumulative distribution is
$$
\begin{aligned}
F_s(x) &= \int_{-\infty}^x e^{st - \kappa(s)} dF(t) \\
    &= \int_0^{F(x)} u^s(1 - u)^{-s}\,du/e^{\kappa(s)} \\
    &= B(F(x); 1 + s, 1 - s)/B(1 + s, 1 - s)\\
\end{aligned}
$$
where $B(u;\alpha,\beta) = \int_0^u t^{\alpha-1}(1 - t)^{\beta - 1}\,dt$ is
the partial beta function.

## Scratch

$E[g(X)e^{s X - \kappa(s)}] = E[g(h(X,s))]$ for some $h$? $h(X,s) = X + s$ if $X$ std normal.

$E[g(X)e^{s X - \kappa(s)}(X - \kappa'(s)] = E[g'(h(X,s))dh(X,s)/ds]$.

Note $E[X^ne^{sX}] = (d/ds)^s E[e^{sX}]
= e^{\kappa(s)}\sum_{k=0}^n B_{n,k}(\kappa'(s), \ldots, \kappa^{(n-k+1)}(s))$.

Note $E[g(X)e^{sX - \kappa(s)}] = E[\sum_{n\ge 0} g^{(n)}(0) X^n/n! e^{sX - \kappa(s)}]
= \sum_{n\ge 0} g^{(n)}(0)/n! \sum_{k=0}^n B_{n,k}(\kappa'(s), \ldots, \kappa^{(n-k+1)}(s))
= \sum_{k\ge 0} \sum_{n\ge k} D^ng(0)/n! B_{n,k}(\kappa'(s), \ldots, \kappa^{(n-k+1)}(s))$

$1 = E[e^{sX - \kappa(s)}]$.

$0 = E[e^{s X - \kappa(s)}(X - \kappa'(s))]$.

$e^{\kappa(s)} = E[e^{sX}]$.

$e^{\kappa(s)}\kappa'(s) = E[Xe^{sX}]$.

$e^{\kappa(s)}(\kappa''(s) + \kappa'(s)^2) = E[X^2e^{sX}]$

$e^{\kappa(s)}(\kappa'''(s) + 2\kappa'(s)\kappa''(s) + \kappa'(s)((\kappa''(x) + \kappa'(s)^2))
= e^{\kappa(s)}(\kappa'''(s) + 3\kappa''(s)\kappa'(s) + \kappa'(s)^3) = E[X^3e^{sX}]$

$\sum_{k=1}^n B_{n,k}(\kappa'(s), \ldots, \kappa^{(n-k+1)}(s)) = E[X^ne^{sX - \kappa(s)}]$.

$B_{n,k}(x_1,\ldots,x_{n-k+1}) = \sum_{j=0}^{n-k}\binom{n-1}{j}B_{n-j+1,k-1}(x_1,\ldots,x_{n-j+1})x_{j+1}$,
$B_{0,0} = 1$, $B_{n,0} = 0$, $B_{0,k} = 0$.

$
E[g(X) e^{sX - \kappa(s)}]
E[\sum_n g^{(n)}(0) X^n/n! e^{sX - \kappa(s)}]
= \sum_n  g^{(n)}(0)/n! \sum_{k=1}^n B_{n,k}(\kappa'(s), \ldots, \kappa^{(n-k+1)}(s))
= \sum_{k=1}^\infty \sum_{n=k}^\infty a_n t^n/n!  B_{n,k}(\kappa'(s), \ldots, \kappa^{(n-k+1)}(s))
=~ \sum_{k=1}^\infty (\sum_{m=1}^\infty \kappa^{(m)}(s)t^m/m!)^k
=~ \sum_{k=1}^\infty (kappa(s + t))^k
$


$E[Xe^{s X - \kappa(s)}(X - \kappa'(s))]
=E[X^2e^{s X - \kappa(s)} - \kappa'(s)Xe^{s X - \kappa(s)}]
=\kappa''(s) + \kappa'(s)^2 - \kappa'(s)\kappa'(s) = \kappa''(s) = (d/ds)\kappa'(s) = (d/ds)(X + \kappa'(s))$

$E[X^2e^{s X - \kappa(s)}(X - \kappa'(s))]
=E[X^3e^{s X - \kappa(s)} - \kappa'(s)X^2e^{s X - \kappa(s)}]
=\kappa'''(s) + 3\kappa''(s)\kappa'(s) + \kappa'(s)^3 - \kappa'(s)(\kappa''(s) + \kappa'(s)^2)
=\kappa'''(s) + 2\kappa''(s)\kappa'(s) - \kappa'(s)^3$.
