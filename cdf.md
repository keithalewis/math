---
title: Cumulative Distribution Functions
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Facts about cumulative distribution functions
...

\newcommand{\RR}{\bm{R}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

The _cumulative distribution function_ of a random variable $X$ is
the probability that the random variable is less than or equal to $x$
&ndash; $F^X(x) = F(x) = P(X\le x)$. It tells you everything there is
to know about the random variable. 
For example, $P(a < X \le b) = F(b) - F(a)$. 
Although $F$ is a function it is more accurate to think of it
as a function on sets &ndash;
$P(X\in (a, b]) = \int_a^b dF = F(b) - F(a)$ using Riemann-Stieltjes integration.

More generally for $E\subseteq\RR$, $P(X\in E) = E[1_E(X)] = \int 1_E(x) dF(x)$
where $1_E(x) = 1$ if $x\in E$, $1_E(x) = 0$ if $x\not\in E$.

Every cdf is non-decreasing, continuous from the right, has left limits, and
$\lim_{x\to-\infty}F(x) = 0$, $\lim_{x\to+\infty}F(x) = 1$.
Any function with these properties is the cdf of a random variable.

__Exercise__. _Prove right continuity using $\cap_n (-\infty, x + 1/n] = (-\infty, x]$_.

Note $\cup_n (-\infty,x - 1/n] = (-\infty,x) \not= (-\infty,x]$.
The sequence $F(x - 1/n)$ is non-decreasing and bounded by $F(x)$ so it
has a limit, but not necessarily $F(x)$.

The distribution of a _uniformly distributed_ random variable on $[0,1]$, $U$,
is $F(x) = x$ if $0\le x\le 1$, $F(x) = 0$ if $x < 0$, and $F(x) = 1$ if $x > 1$.
In this case $P(X\in(a, b]) = b - a$ for $0\le a < b\le 1$.

__Exercise__ _If $X$ has cdf $F$, show $F^{-1}(U)$ has the same distribution as $X$ and
$F(X)$ has the same distribution as $U$_.

If $F(x)$ jumps from $a$ to $b$ at $x = c$ we define $F^{-1}(u) = c$ for $a \le u < b$.

## Cumulant

The _cumulant_ of the random variable $X$ is $κ_X(s) = κ(s) = \log E[\exp(s X)]$.
The Esscher transform $X_s$, $s\in\RR$, of a random variable $X$
with density $f$ has density $f_s(x) = f(x)e^{s x - κ(s)}$
and we write $E_s$ for expectation using density $f_s$.
Since $E[\exp(sX)] = \exp(κ(s))$ this is a probability density.

Note $(d/ds)E[g(X)e^{s X - κ(s)}] = E[g(X)e^{s X - κ(s)}(X - κ'(s))]$ so
$$
	\frac{d}{ds}E_s[g(X)] = E_s[g(X)(X - κ'(s))].
$$
The cdf of $X_s$ is $F_s(x) = P_s(X\le x) = E[1(X\le x) e^{s X - κ(s)}]$
so $dF_s(x)/ds =  E[1(X\le x) e^{s X - κ(s)}(X - κ'(s))]$.

## Distributions

We gather some facts about the distributions and cumulants of particular random variables.

### Discrete

If $X$ is discrete with $P(X = x_j) = p_j$ then
$F(x) = \sum_j 1(x\le x_j) p_j$ and $f(x) = \sum_j δ_{x_j}(x) p_j$
where $δ_a$ is the _delta function_, or _point mass_, at $a$.
In general, $F^{(n)}(x) = \sum_j δ_{x_j}^{(n-1)}(x) p_j$ where $\int_{\RR} g(x) δ_{a}^{(k)}\,dx = g^{(k)}(a)$.
A delta function is not a function but we can define
$\int_{\bm{R}} g(x) \delta_a(x) \,dx = \int_{\bm{R}} g(x) d1(x \ge a) = g(a)$ using Riemann-Stieltjes integration.

The cumulant is $κ(s) = \log E[\sum_j \exp(sx_j) p_j]$.

### Normal

The standard normal random variable $X$ has density $φ(x) = \exp(-x^2/2)/\sqrt{2\pi}$,
$-\infty < x < \infty$,
and cumulative distribution $Φ(x) = \int_{-\infty}^x \exp(-ξ^2/2)\, dξ/\sqrt{2\pi}$.

The derivatives of the density are $φ^{(n)}(x) = (-1)^nφ(x)H_n(x)$ where $H_n$ are the
Hermite polynomials. They satisfy the recurrence $H_0(x) = 1$, $H_1(x) = x$ and
$H_{n+1}(x) = x H_n(x) - n H_{n-1}(x)$, $n\ge 1$.

Some useful properties are 
$$
\begin{aligned}
E[e^{\mu + \sigma X}] &= \int_{-\infty}^\infty e^{\mu + \sigma z} e^{-z^2/2}\, dz/\sqrt{2\pi} \\
	&= \int_{-\infty}^\infty e^{\mu + \sigma^2/2} e^{-(z - \sigma)^2/2}\, dz/\sqrt{2\pi} \\
	&= e^{\mu + \sigma^2/2} \\
\end{aligned}
$$
so $E[\exp(N)] = \exp(E[N] + \Var(N)/2)$ for any normally distributed random variable $N$,

Also
$$
\begin{aligned}
E[g(X) e^{sX}] &= \int_{-\infty}^\infty g(z) e^{sz} e^{-z^2/2}\, dz/\sqrt{2\pi} \\
	&= \int_{-\infty}^\infty g(z) e^{s^2/2} e^{-(z - s)^2/2}\, dz/\sqrt{2\pi} \\
	&= E[e^{sX}] E(g(X - s)]. \\
\end{aligned}
$$
More generally, if $N$, $N_1, \ldots$ are jointly normal then
$$
E[\exp(N)g(N_1,\ldots)] = E[\exp(N)] E[g(N_1 + \Cov(N, N_1), \ldots)].
$$
This is an elementary form of Girsanov's Theorem.

__Exercise__. _Prove this_.

Hint: $N_1, \ldots$ are jointly normal if and only if 
they are linear combinations of independent standard normals.

The cumulant is $κ(s) = \log E[\exp(sX)] = s^2/2$ so $κ_2 = 1$ and all other
cumulants are zero. The transformed cdf is
$Φ_s(x) = P_s(X\le x) = E[1(X\le x) e^{sX - s^2/2}] = P(X + s\le x) = Φ(x - s)$
so $dΦ_s(x)/ds = E[1(X\le x) e^{sX - s^2/2}(X - s)] = -φ(x - s)$.

In particular
$$
	E[\exp(s X - s^2/2)g(X)] = E[g(X + s)].
$$
Taking derivatives with respect to $s$ shows
$$
	E[\exp(s X - s^2/2)(X - s)g(X)] = E[g'(X + s)].
$$
so $E[X g(X)] = E[g'(X)]$ when $s = 0$.

### Poisson

The Poisson distribution with parameter $λ$ has density
$P(X_λ = n) = e^{-λ}λ^n/n!$, $n\ge 0$.
Since $E[e^{s X}] = \sum_{n\ge 0} e^{sn} e^{-λ}λ^n/n! 
= e^{-λ}\exp(e^sλ) = \exp(λ(e^s - 1))$
we have
$$
κ(s) = λ(e^s - 1), κ_n = λ, n\ge 1.
$$

The Esscher transform a Poisson distribution with parameter $λ$
is Poisson with parameter $λe^s$.

$$
\begin{aligned}
	E[g(X_λ)e^{s X - κ(s)}]
	&= \sum_{n\ge0} g(n)e^{sn - λ(e^s - 1)}e^{-λ}λ^n/n! \\
	&= \sum_{n\ge0} g(n)e^{-λ e^s} (λ e^s)^n/n! \\
	&= E[g(X_{λ e^s})] \\
\end{aligned}
$$
so $E_s[g(X_λ)] = E[g(X_{λ e^s})]$.
Taking a derivative with respect to $s$
$$
\begin{aligned}
	\frac{d}{ds} E[g(X_λ)e^{s X - κ(s)}]
	&= \sum_{n\ge0} g(n)\frac{d}{ds}\bigl(e^{-λ e^s} (λ e^s)^n\bigr)/n! \\
	&= \sum_{n\ge0} g(n)\bigl(e^{-λ e^s} n(λ e^s)^{n-1}λ e^s - e^{-λ e^s}λ e^s (λ e^s)^n\bigr)/n! \\
	&= \sum_{n\ge0} g(n)λ e^se^{-λ e^s} \bigl((λ e^s)^{n-1}/(n-1)! - (λ e^s)^n/n!\bigr) \\
	&= λ e^s E_s[g(X_{λ e^s} + 1) - g(X_{λ e^s})] \\
\end{aligned}
$$
so $(d/ds)E_s[g(X_λ)] = λ e^s E_s[g(X_{λ e^s} + 1) - g(X_{λ e^s})]$.

### Exponential

The density of an exponential with parameter $λ$ is $f(x) = λ\exp(-λ x)$, $x\ge 0$.
Since $E[\exp sX] = \int_0^\infty \exp(sx)  λ\exp(-λ x)\,dx = λ/(λ - s)$
The cumulant is $κ(s) = -\log(1 - s/λ)$ so $κ'(s) = (1 - s/λ)^{-1}$
and $κ^{(n)}(s) = (1 - s/λ)^{-n}(n - 1)!/λ^{n-1}$

### Logistic

A logistic random variate has cumulative distribution $F(x) = 1/(1 + e^{-x})$,
$-\infty < x < \infty$ and
density function $f(x) = e^{-x}/(1 + e^{-x})^2$.
The quantile function is $Q(u) = F^{-1}(u) = \log u/(1-u)$.

Aside: $f(x) = \int_0^\infty e^{-x} e^{-\alpha e^{-x}} e^{-\alpha}\,d\alpha$.

Using $u = F(x) = 1/(1 + e^{-x})$, so $e^x = u/(1 - u)$ and
$$
\begin{aligned}
E e^{sX} &= \int_{-\infty}^\infty e^{sx} e^{-x}/(1 + e^{-x})^2\,dx \\
    &= \int_0^1 u^s(1 - u)^{-s}\,du \\
    &= B(1 + s, 1 - s) \\
    &= Γ(1 + s)Γ(1 - s)/Γ(2) \\
    &= Γ(1 + s)Γ(1 - s)
\end{aligned}
$$
we have the cumulant of the logistic is $κ(s) = \logΓ(1 + s) + \logΓ(1 - s)$.

The _digamma_ function is the derivative of the log of the Gamma function
$\psi(s) = Γ'(s)/Γ(s)$. Its Taylor series at $1$ is
$\psi(1 + s) = -\gamma - \sum_{k\ge 1} \zeta(k+1)(-s)^k$ where
$\gamma$ is the Euler-Mascheroni constant and $\zeta(s) = \sum_{k\ge 1} n^{-s}$
is the zeta function.

The first derivative of the cumulant is $κ'(s) = \psi(1 + s) - \psi(1 - s)
= 2\sum_{k\ge 1} \zeta(2k)s^{2k  - 1}$
so $κ_{2k-1} = 0$ and $κ_{2k} = 2\zeta(2k)(2k-1)!$, $k\ge1$.
In particular, the variance of the logistic is $κ_2 = 2\zeta(2) = \pi^2/3$.

The Esscher transformed cumulative distribution is
$$
	F_s(u) = \int_{-\infty}^u e^{sx - κ(s)} dF(x)
	= \frac{e^{u(1 + s)}\bigl(1 + s - s(1 + e^u)\,_2F_1(1, 1 + s; 2 + s; -e^u)\bigr)}
	{Γ(1 + s)Γ(1 - s)(1 + e^u)(1 + s)}, s > -1.
$$
where $\,_2F_1(a,b;c;x) = \sum_{n=0}^\infty\frac{(a)_n (b)_n}{(c)_n} x^n/n!$
is the Gaussian hypergeometric function.

<!--
Using
$$
\begin{aligned}
	\,_2F_1(a,b;c;x) &= (-x)^{-a}\frac{Γ(c)Γ(b - a)}{Γ(b)Γ(c - a)}\,_2F_1(a, a - c + 1; a - b + 1;1/x) \\
		&\quad + (-x)^{-b}\frac{Γ(c)Γ(a - b)}{Γ(a)Γ(c - b)}\,_2F_1(b - c + 1, b; b - a + 1;1/x)
\end{aligned}
$$
so
$$
\begin{aligned}
	\,_2F_1(1,1+s;2+s;-e^u) 
		&= e^{-au}\frac{Γ(2 + s)Γ(s)}{Γ(1 + s)Γ(1 + s)}\,_2F_1(1, -s; 1 - s;-e^{-u}) \\
		&\quad + e^{-bu}\frac{Γ(2 + s)Γ(-s)}{Γ(1 + s)Γ(1)}\,_2F_1(0, 1 + s; 1 + s;-e^{-u}) \\
		&= e^{-au}\frac{Γ(2 + s)Γ(s)}{Γ(1 + s)^2}\,_2F_1(1, -s; 1 - s;-e^{-u}) \\
		&\quad + e^{-bu}\frac{Γ(2 + s)Γ(-s)}{Γ(1 + s)}\,_2F_1(0, 1 + s; 1 + s;-e^{-u}) \\
\end{aligned}
$$

## Scratch

$E[g(X)e^{s X - κ(s)}] = E[g(h(X,s))]$ for some $h$? $h(X,s) = X + s$ if $X$ std normal.

$E[g(X)e^{s X - κ(s)}(X - κ'(s)] = E[g'(h(X,s))dh(X,s)/ds]$.

Note $E[X^ne^{sX}] = (d/ds)^s E[e^{sX}]
= e^{κ(s)}\sum_{k=0}^n B_{n,k}(κ'(s), \ldots, κ^{(n-k+1)}(s))$.

Note $E[g(X)e^{sX - κ(s)}] = E[\sum_{n\ge 0} g^{(n)}(0) X^n/n! e^{sX - κ(s)}]
= \sum_{n\ge 0} g^{(n)}(0)/n! \sum_{k=0}^n B_{n,k}(κ'(s), \ldots, κ^{(n-k+1)}(s))
= \sum_{k\ge 0} \sum_{n\ge k} D^ng(0)/n! B_{n,k}(κ'(s), \ldots, κ^{(n-k+1)}(s))$

$1 = E[e^{sX - κ(s)}]$.

$0 = E[e^{s X - κ(s)}(X - κ'(s))]$.

$e^{κ(s)} = E[e^{sX}]$.

$e^{κ(s)}κ'(s) = E[Xe^{sX}]$.

$e^{κ(s)}(κ''(s) + κ'(s)^2) = E[X^2e^{sX}]$

$e^{κ(s)}(κ'''(s) + 2κ'(s)κ''(s) + κ'(s)((κ''(x) + κ'(s)^2))
= e^{κ(s)}(κ'''(s) + 3κ''(s)κ'(s) + κ'(s)^3) = E[X^3e^{sX}]$

$\sum_{k=1}^n B_{n,k}(κ'(s), \ldots, κ^{(n-k+1)}(s)) = E[X^ne^{sX - κ(s)}]$.

$B_{n,k}(x_1,\ldots,x_{n-k+1}) = \sum_{j=0}^{n-k}\binom{n-1}{j}B_{n-j+1,k-1}(x_1,\ldots,x_{n-j+1})x_{j+1}$,
$B_{0,0} = 1$, $B_{n,0} = 0$, $B_{0,k} = 0$.

$
E[g(X) e^{sX - κ(s)}]
E[\sum_n g^{(n)}(0) X^n/n! e^{sX - κ(s)}]
= \sum_n  g^{(n)}(0)/n! \sum_{k=1}^n B_{n,k}(κ'(s), \ldots, κ^{(n-k+1)}(s))
= \sum_{k=1}^\infty \sum_{n=k}^\infty a_n t^n/n!  B_{n,k}(κ'(s), \ldots, κ^{(n-k+1)}(s))
=~ \sum_{k=1}^\infty (\sum_{m=1}^\infty κ^{(m)}(s)t^m/m!)^k
=~ \sum_{k=1}^\infty (kappa(s + t))^k
$


$E[Xe^{s X - κ(s)}(X - κ'(s))]
=E[X^2e^{s X - κ(s)} - κ'(s)Xe^{s X - κ(s)}]
=κ''(s) + κ'(s)^2 - κ'(s)κ'(s) = κ''(s) = (d/ds)κ'(s) = (d/ds)(X + κ'(s))$

$E[X^2e^{s X - κ(s)}(X - κ'(s))]
=E[X^3e^{s X - κ(s)} - κ'(s)X^2e^{s X - κ(s)}]
=κ'''(s) + 3κ''(s)κ'(s) + κ'(s)^3 - κ'(s)(κ''(s) + κ'(s)^2)
=κ'''(s) + 2κ''(s)κ'(s) - κ'(s)^3$.

-->
