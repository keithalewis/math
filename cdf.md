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

We collect some facts about [_random variables_](prob.html#random-variable),
their [_cumulants_](prob.html#cumulant), and deriatives associated with these.
These are used for [option pricing](op.html).

## Esscher

The Esscher transform $X_s$, $s\in\RR$, of a random variable $X$
has cdf $F_s(x) = E[1(X\le x)ε_s(X)]$, where $ε_s(x) = e^{s x - κ(s)}$
and $κ(s) = \log E[e^{sX}]$ is the cumulant of $X$.
Note $E[ε_s(X)] = 1$ so $F_s$ is a cdf and $X_0$ and $X$ have the same law.

We write $P_s(X\in A) = E[1_A(X)ε_s(X)] = E_s[1_A(X)]$.
For any function $g$ we have $E_s[g(X)] = E[g(X)ε_s(X)]$.

The transformed density is $F'_s(x) = f_s(x) = f(x)ε_s(x)$.
By Leibniz rule $(∂/∂x)^n f_s(x) = ε_s(x) \sum_{k=0}^n \binom{n}{k} f^{(n - k)}(x) s^k$
since $(∂/∂x)^n ε_s(x) = ε_s(x) s^n$.

Note $(∂/∂s)E[g(X) ε_s(X)] = E[g(X) ε_s(X) (X - κ'(s))] = E_s[g(X) (X - κ'(s))]$ so
$$
	\frac{∂F_s(x)}{∂s} = E[1(X\le x) ε_s(X) (X - κ'(s))] = E_s[1(X\le x) (X - κ'(s))].
$$

## Distributions

We gather some facts about the distributions and cumulants of particular random variables.

### Discrete

A discrete random variable is defined by the values it can have, $\{x_j\}$, and
the probability it takes on those values, $P(X = x_j) = p_j$,
where $p_j > 0$ and $\sum_j p_j = 1$.

It has cdf $F(x) = \sum_j 1(x\le x_j) p_j$ and density $f(x) = \sum_j δ_{x_j}(x) p_j$
where $δ_a$ is the _delta function_, or _point mass_, at $a$.
In general, $F^{(n)}(x) = \sum_j δ_{x_j}^{(n-1)}(x) p_j$ where $\int_{\RR} g(x) δ_{a}^{(k)}\,dx = g^{(k)}(a)$.

The cumulant is $κ(s) = \log E[\sum_j \exp(sx_j) p_j]$.

### Normal

The standard normal random variable $X$ has density $φ(x) = \exp(-x^2/2)/\sqrt{2\pi}$,
$-\infty < x < \infty$.

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
cumulants are zero. We also have
$$
	E[\exp(s X - s^2/2)g(X)] = E[g(X + s)].
$$
Taking derivatives with respect to $s$ shows
$$
	E[\exp(s X - s^2/2)(X - s)g(X)] = E[g'(X + s)].
$$
so $E[X g(X)] = E[g'(X)]$ when $s = 0$.

The transformed cdf is
$Φ_s(x) = P_s(X\le x) = E[1(X\le x) e^{sX - s^2/2}] = P(X + s\le x) = Φ(x - s)$
so 
$$
∂Φ_s(x)/∂s = E[1(X\le x) e^{sX - s^2/2}(X - s)] = -φ(x - s).
$$

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
	E_s[g(X_λ)] &= E[g(X_λ)e^{s X - κ(s)}] \\
	&= \sum_{n\ge0} g(n)e^{sn - λ(e^s - 1)}e^{-λ}λ^n/n! \\
	&= \sum_{n\ge0} g(n)e^{-λ e^s} (λ e^s)^n/n! \\
	&= E[g(X_{λ e^s})]. \\
\end{aligned}
$$
Taking a derivative with respect to $s$ we have
$(∂/∂s)E_s[g(X_λ)]] = λ e^s E[g(X_{λ e^s} + 1) - g(X_{λ e^s})]$ so
<!--
$$
\begin{aligned}
	\frac{d}{ds} E_s[g(X_λ)] &= \frac{d}{ds} E[g(X_λ)e^{s X - κ(s)}] \\
	&= \sum_{n\ge0} g(n)\frac{d}{ds}\bigl(e^{s n - λ(e^s - 1)}\bigr)e^{-λ}λ^n/n! \\
	&= \sum_{n\ge0} g(n)\bigl(e^{s n - λ(e^s - 1)}(n -  λe^s)\bigr)e^{-λ}λ^n/n! \\
	&= \sum_{n\ge0} g(n)\bigl(e^{s n - λe^s}(n -  λe^s)\bigr) λ^n/n! \\
	&= \sum_{n\ge0} g(n) \bigl(e^{s n}(n -  λe^s)\bigr) e^{-λ e^s} λ^n/n! \\
	&= \sum_{n\ge0} g(n) e^{s n} (n - λe^s) e^{-λ e^s} λ^n/n!) \\
	&= \sum_{n\ge0} g(n) (n - λe^s) e^{-λ e^s} (λe^s)^n/n!) \\
	&= \sum_{n\ge0} g(n) n e^{-λ e^s} (λe^s)^n/n! - λe^s  e^{-λ e^s} (λe^s)^n/n! \\
	&= \sum_{n\ge0} g(n) λe^s e^{-λ e^s} (λe^s)^{n-1}/(n-1)! - λe^s  e^{-λ e^s} (λe^s)^n/n! \\
	&= \sum_{n\ge0} g(n+1) λe^s e^{-λ e^s} (λe^s)^n/n! - \sum_{n\ge0} g(n) λe^s  e^{-λ e^s} (λe^s)^n/n! \\
	&= λ e^s E[g(X_{λ e^s} + 1) - g(X_{λ e^s})] \\
\end{aligned}
$$
-->
so 
$$
(∂/∂s)E_s[1(X_λ \le x)] = λ e^s e^{-λ e^s} (λe^s)^n/n!
$$
where $λ e^s < n \le λ e^s + 1$.

### Exponential

The density of an exponential with parameter $λ$ is $f(x) = λ\exp(-λ x)$, $x\ge 0$.
Since $E[\exp sX] = \int_0^\infty \exp(sx)  λ\exp(-λ x)\,dx = λ/(λ - s)$
The cumulant is $κ(s) = -\log(1 - s/λ)$ so $κ'(s) = (1 - s/λ)^{-1}$
and $κ^{(n)}(s) = (1 - s/λ)^{-n}(n - 1)!/λ^{n-1}$

### Logistic

A logistic random variate has cumulative distribution $F(x) = 1/(1 + e^{-x})$, $-\infty < x < \infty$.
Its quantile function is $Q(u) = F^{-1}(u) = \log u/(1-u)$.

The derivatives of the cdf are
$$
	\left(\frac{∂}{∂x}\right)^n \frac{1}{1 + e^{-x}} = \sum_{k=1}^n A_{n,k}\frac{e^{-kx}}{(1 + e^{-x})^{k + 1}}
$$
where $A_{n,k} = k(A_{n-1,k-1} - A_{n-1,k})$ and $A_{1,1} = 1$,
assuming $A_{n,k} = 0$ if $k > n$.

<!--
Aside: $f(x) = \int_0^\infty e^{-x} e^{-α e^{-x}} e^{-α}\,dα$.
-->

Using $u = F(x) = 1/(1 + e^{-x})$, so $e^x = u/(1 - u)$
$$
\begin{aligned}
E[e^{sX}] &= \int_{-\infty}^\infty e^{sx}\, d(1/(1 + e^{-x})) \\
    &= \int_0^1 (u/(1 - u))^{s}\,du \\
    &= \int_0^1 u^s(1 - u)^{-s}\,du \\
    &= B(1 + s, 1 - s) \\
\end{aligned}
$$
where $B(α,β)$ is the Beta function.

The cumulant of the logistic is $κ(s) = \log B(1 + s, 1 - s)$.
Since $B(α,β) = Γ(α)Γ(β)/Γ(α + β)$ and $Γ(2) = 1$
we have $κ(s) = \log Γ(1 + s) + \log Γ(1 - s)$.
The _digamma_ function is the derivative of the log of the Gamma function
$\psi(s) = Γ'(s)/Γ(s)$. Its Taylor series at $1$ is
$\psi(1 + s) = -γ - \sum_{n\ge 1} ζ(n+1) (-s)^n$ where
$γ$ is the Euler-Mascheroni constant and $ζ(s) = \sum_{n\ge 1} n^{-s}$
is the zeta function.

The first derivative of the cumulant is $κ'(s) = \psi(1 + s) - \psi(1 - s)
= -\sum_{n\ge 1} ζ(n+1)((-s)^n - s^n)$
so $κ_n = 0$ if $n$ is odd and $κ_n = 2ζ(n)(n-1)!$ if $n$ is even;
In particular, the variance of the logistic is $κ_2 = 2ζ(2) = \pi^2/3$.

The Esscher transformed cumulative distribution is
$$
\begin{aligned}
F_s(x) &= \int_{-\infty}^x e^{s\xi - κ(s)}\,d(1/(1 + e^{-\xi}))\,d\xi \\
    &= \int_0^{F(x)} u^s(1 - u)^{-s}\,du/e^{κ(s)} \\
    &= B(F(x); 1 + s, 1 - s)/B(1 + s, 1 - s) \\
    &= I_{F(x)}(1 + s, 1 - s) \\
\end{aligned}
$$
where $I_u(α,β)$ is the regularized incomplete Beta function.

Recall
$$
\frac{∂}{∂α} I_u(α,β) = (\log u - \psi(α) + \psi(α + β))I_u(α,β)
$$
so using $I_u(α,β) = 1 - I_{1 - u}(β,α)$
$$
\frac{∂}{∂β} I_u(α,β) = -(\log (1 - u) - \psi(β) + \psi(β + α))I_{1 - u}(β, α)
$$
and we have
$$
\begin{aligned}
\frac{∂}{∂s} I_u(1 + s,1 - s) &=  (\log u - \psi(1 + s) + \psi(2))I_u(1 + s, 1 - s) \\
	 &\ -(\log (1 - u) - \psi(1 - s) + \psi(2))I_{1 - u}(1 - s, 1 + s) \\
	&=  (\log u - \psi(1 + s) + \psi(2))I_u(1 + s, 1 - s) \\
	 &\ -(\log (1 - u) - \psi(1 - s) + \psi(2))\bigl(1 - I_u(1 + s, 1 - s)\bigr) \\
	&=  (\log u(1 - u) - \psi(1 + s) - \psi(1 - s) + 2(1 - \gamma))I_u(1 + s, 1 - s) \\
	 &\ -(\log (1 - u) - \psi(1 - s) + 1 - \gamma) \\
\end{aligned}
$$


Using
$$
I_u(α,β) = \frac{u^α}{α B(α,β)}\,_2F_1(α, 1 - β, α + 1;x).
$$
where $\,_2F_1(a,b;c;x) = \sum_{n=0}^\infty\frac{(a)_n (b)_n}{(c)_n} x^n/n!$
and
$$
I_u(a,b) (\psi ^{(0)}(a+b)-\psi^{(0)}(a)+\log (u))
	-\frac{u^a \Gamma (a)^2 _3\tilde{F}_2(a,a,1-b;a+1,a+1;u)}{B(a,b)}
$$
is the Gaussian hypergeometric function gives
$$
F_s(x) = \frac{u^{s + 1}}{(s + 1) B(s + 1, 1 - s)}\,_2F_1(s + 1, s, s + 2;x).
$$

The derivatives of the hypergeometic function are
$$
\frac{d^n}{dx^n}\,_2F_1(a, b; c; x) = \frac{(a)_n (b)_n}{(c)_n}\,_2F_1(a + n, b + n; c + n;x).
$$
so
$$
\begin{aligned}
F_s^{(n)}(x)
	&= \frac{u^{s + 1}}{(s + 1) B(s + 1, 1 - s)}\frac{(s + 1)_n (s)_n}{(s + 2)_n}
	\,_2F_1(s + 1 + n, s + n, s + 2 + n;x) \\
	&= \frac{u^{s + 1}}{(s + 1) B(s + 1, 1 - s)}\frac{(s + 1)(s)_n}{s + 1 + n}
	\,_2F_1(s + 1 + n, s + n, s + 2 + n;x) \\
	&= \frac{u^{s + 1} (s)_n}{s + 1 + n} B(s + 1, 1 - s)
	\,_2F_1(s + 1 + n, s + n, s + 2 + n;x) \\
\end{aligned}
$$


The Esscher density is
$$
\begin{aligned}
\frac{∂}{∂ s}F_s(x) = &-\frac{
	u^{s+1} \Gamma (s+1)^2 \left(\frac{_2\tilde{F}_1(s,s+1;s+2;u)}{\Gamma (s+1)}-s 
	    _3\tilde{F}_2(s+1,s+1,s+1;s+2,s+2;u)\right)}{B(s+1,1-s)} \\
	&-\frac{(1-u)^{1-s} \Gamma (1-s)^2 \left(s \, _3\tilde{F}_2(1-s,1-s,1-s;2-s,2-s;1-u)+\frac{
		_2\tilde{F}_1(1-s,-s;2-s;1-u)}{\Gamma (1-s)}\right)+B_{1-u}(1-s,s+1) (\psi
		^{(0)}(1-s)-\log (1-u)+\gamma -1)}{B(s+1,1-s)} \\
	&+I_u(s+1,1-s) (-\psi^{(0)}(s+1)+\log (u)-\gamma +1)
\end{aligned}
$$
<!--

$$
-->

<!--
The Esscher transformed cumulative distribution is
$$
	F_s(u) = \int_{-\infty}^u e^{sx - κ(s)} dF(x)
	= \frac{e^{u(1 + s)}\bigl(1 + s - s(1 + e^u)\,_2F_1(1, 1 + s; 2 + s; -e^u)\bigr)}
	{Γ(1 + s)Γ(1 - s)(1 + e^u)(1 + s)}, s > -1.
$$
where $\,_2F_1(a,b;c;x) = \sum_{n=0}^\infty\frac{(a)_n (b)_n}{(c)_n} x^n/n!$
is the Gaussian hypergeometric function.

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

## Acknowledgements

The author thanks Peter Carr and Bill Goff for their helpful comments and insightful suggestions. 
Any errors or omissions are due to the author.
