---
title: Cumulative Distribution Functions
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Facts about cumulative distribution functions
...

\newcommand{\RR}{\bold{R}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\erf}{\operatorname{erf}}
\newcommand{\erfc}{\operatorname{erfc}}

We collect some facts about [_random variables_](prob.html#random-variable),
their [_cumulants_](prob.html#cumulant), and deriatives that
that are useful for [option pricing](op.html).

## Esscher

Recall the moment generating function of a random variable $X$ is
$M(s) = E[e^{sX}]$ and its cumulant is $κ(s) = \log M(s)$.
Let $M(s, x) = E[1(X\le x) e^{sX}]$ be the _incomplete moment
generating function_.

The Esscher transform of the random variable $X$ with parameter $s$ has cumulative
distribution function $F_s(x) = M(s, x)/M(s) = E[1(X\le x) e^{s X - κ(s)}]$.
Let $ε_s(x) = e^{s x - κ(s)}$ and note $E[ε_s(X)] = 1$ so $F_s$
is a cdf.

Write $E_s$ for the Esscher transformed measure so for any reasonable
function $g$ we have $E[g(X)ε_s(X)] = E_s[g(X)]$ so
$∂_s E[g(X) ε_s(X)] = E[g(X) ε_s(X) (X - κ'(s))] = E_s[g(X) (X - κ'(s))]$ and
$$
	∂_s F_s(x) = E[1(X\le x) ε_s(X) (X - κ'(s))] = E_s[1(X\le x) (X - κ'(s))].
$$

## Distributions

We gather some facts about the distributions and cumulants of particular random variables.

### Discrete

A discrete random variable is defined by the values it can have, $\{x_j\}$, and
the probability it takes on those values, $P(X = x_j) = p_j$,
where $p_j > 0$ and $\sum_j p_j = 1$.
It has cdf $F(x) = \sum_j 1(x\le x_j) p_j$ and density $f(x) = \sum_j δ_{x_j}(x) p_j$
where $δ_a$ is the _delta function_, or _point mass_, at $a$.
The Esscher transform of a discrete random variable takes the same values with $P(X_s = x_j) ε_s(x_j) p_j$.

### Normal

The standard normal random variable $X$ has density $φ(x) = \exp(-x^2/2)/\sqrt{2\pi}$,
$-\infty < x < \infty$. The cdf can be expressed in terms of _error functions_
as $Φ(x) = (1 + \erf(x/\sqrt{2}))/2 = 1 - \erfc(x/\sqrt{2})/2$.

The derivatives of the density are $φ^{(n)}(x) = (-1)^nφ(x)H_n(x)$ where $H_n$ are the
Hermite polynomials. They satisfy the recurrence $H_0(x) = 1$, $H_1(x) = x$ and
$H_{n+1}(x) = x H_n(x) - n H_{n-1}(x)$, $n\ge 1$.

Some useful properties are 
$$
\begin{aligned}
E[e^{\mu + \sigma X}] &= \int_{-\infty}^\infty e^{\mu + \sigma x} e^{-x^2/2}\, dx/\sqrt{2\pi} \\
	&= \int_{-\infty}^\infty e^{\mu + \sigma^2/2} e^{-(x - \sigma)^2/2}\, dx/\sqrt{2\pi} \\
	&= e^{\mu + \sigma^2/2} \\
\end{aligned}
$$
so $E[\exp(N)] = \exp(E[N] + \Var(N)/2)$ for any normally distributed random variable $N$.

Also
$$
\begin{aligned}
E[g(X) e^{sX}] &= \int_{-\infty}^\infty g(x) e^{sx} e^{-x^2/2}\, dx/\sqrt{2\pi} \\
	&= \int_{-\infty}^\infty g(x) e^{s^2/2} e^{-(x - s)^2/2}\, dx/\sqrt{2\pi} \\
	&= E[e^{sX}] E(g(X + s)]. \\
\end{aligned}
$$
More generally, if $N$, $N_1, \ldots$ are jointly normal then
$$
E[\exp(N)g(N_1,\ldots)] = E[\exp(N)] E[g(N_1 + \Cov(N, N_1), \ldots)].
$$
This is an elementary form of Girsanov's Theorem.

__Exercise__. _Prove this_.

Hint: $N, N_1, \ldots$ are jointly normal if and only if 
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
so $E[X g(X)] = E[g'(X)]$ when $s = 0$ \cite{Stein}.

The incomplete moment generating function is $M(s,x) = E[e^{sX}1(X\le x)]
= e^{s^2/2} P(X + s\le x) = e^{s^2/2} Φ(x - s)$.

The transformed cdf is
$Φ_s(x) = P_s(X\le x) = E[1(X\le x) e^{sX - s^2/2}] = P(X + s\le x) = Φ(x - s)$
so 
$$
∂_s Φ_s(x) = E[1(X\le x) e^{sX - s^2/2}(X - s)] = -φ(x - s).
$$

### Poisson

The Poisson distribution with parameter $λ$ has density
$P(X = n) = e^{-λ}λ^n/n!$, $n\ge 0$ and moment generating function
$M(s) = E[e^{s X}] = \exp(λ(e^s - 1))$, $s < λ$.

The Esscher transform of a Poisson distribution with parameter $λ$
is Poisson with parameter $λe^s$ since
$$
\begin{aligned}
	E[e^{sX} g(X)] &= \sum_{n\ge0} g(n)e^{sn - λ(e^s - 1)}e^{-λ}λ^n/n! \\
	&= \sum_{n\ge0} g(n)e^{-λ e^s} (λ e^s)^n/n! \\
\end{aligned}
$$
Taking a derivative with respect to $s$ we have
$∂_s E_s[g(X_λ)]] = λ e^s E[g(X_{λ e^s} + 1) - g(X_{λ e^s})]$ so
$$
∂_s E_s[1(X_λ \le x)] = λ e^s e^{-λ e^s} (λe^s)^n/n!
$$
where $λ e^s < n \le λ e^s + 1$.
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

### Exponential

The density of an exponential with parameter $λ$ is $f(x) = λ\exp(-λ x)$, $x\ge 0$.
The moment generating function is
$M(s) = E[\exp sX] = \int_0^\infty \exp(sx)  λ\exp(-λ x)\,dx = λ/(λ - s)$, $s < λ$.
The Esscher transformed density is also a
an exponential distribution with parameter $λ$
with parameter $λ - s$.

### Generalized Logistic

A generalized logistic random variate has probability density function
$f(α,b;x) = c e^{-βx}/(1 + e^{-x})^{α + β}$, $-\infty < x < \infty$,
where $c = 1/B(α,β)$ is the beta function. If $α = 1$ and $β = 1$
this is the standard logistic function.  The Esscher transformed density
is also a generalized logistic with parameters $α + s$, $β - s$.

Using $u = 1/(1 + e^{-x})$, so $e^x = u/(1 - u)$ and $dx = du/u(1-u)$ the
moment generating function is
$$
\begin{aligned}
E[e^{sX}] &= c \int_{-\infty}^\infty e^{sx} e^{-βx}/(1 + e^{-x})^{α + β}\,dx \\
    &= c \int_0^1 (u/(1 - u))^{s-β} u^{α + β}\,du/u(1 - u) \\
    &= c \int_0^1 u^{α + s - 1} (1 - u)^{β - s - 1}\,du \\
    &= c B(α + s, β - s)\\
\end{aligned}
$$
where $B(α,β)$ is the Beta function. Since $1 = cB(α, β)$
$$
	M(s) = B(α + s, β - s)/B(α, β).
$$
A similar calculation shows the incomplete moment generating function is
$$
	M(s,x) = B(α + s, β - s; u)/B(α, β) = I_u(α + s, β - s)
$$
where $u = 1/(1 + e^{-x})$, $B(α, β; u)$ is the incomplete beta function,
and $I_u(α, β)$ is the regularized incomplete Beta function.

The Esscher transformed cumulative distribution function is
$$
	F_s(x) = B(α + s, β - s; u)/B(α + s, β - s) = I_u(α + s, β - s).
$$

Next we show $∂_x^n e^{-β x}(1 + e^{-x})^{- α - β} = \sum_{k=0}^n A_{n,k} (e^{-x})^{β + k}(1 + e^{-x})^{- α - β - k}$
for coefficients $A_{n,k}$, $0\le k\le n$, not depending on $x$.
Clearly $A_{0,0} = 1$.
$$
\begin{aligned}
∂_x^n e^{-β x}(1 + e^{-x})^{- α - β} &= ∂_x\sum_{k=0}^{n-1} A_{n-1,k} (e^{-x})^{β + k}(1 + e^{-x})^{- α - β - k} \\
	&= \sum_{k=0}^{n-1} A_{n-1,k} \left((β + k)(e^{-x})^{β + k - 1}(-e^{-x})(1 + e^{-x})^{- α - β - k} 
	   + (e^{-x})^{β + k}(- α - β - k)(1 + e^{-x})^{- α - β - k - 1} (-e^{-x})\right)\\
	&= \sum_{k=0}^{n-1} A_{n-1,k} \left(-(β + k)(e^{-x})^{β + k}(1 + e^{-x})^{- α - β - k} 
	   + (α + β + k) (e^{-x})^{β + k + 1}(1 + e^{-x})^{- α - β - k - 1}\right)\\
	&= \sum_{k=0}^{n-1} A_{n-1,k} (-(β + k))(e^{-x})^{β + k}(1 + e^{-x})^{- α - β - k} 
	   + \sum_{k=1}^n A_{n-1,k-1} (α + β + k - 1) (e^{-x})^{β + k}(1 + e^{-x})^{- α - β - k}\\
	&= A_{n-1,0} (-β)(e^{-x})^β(1 + e^{-x})^{- α - β}
		+ \sum_{k=1}^{n-1}
			A_{n-1,k} (-(β + k)) + A_{n-1,k-1}(α + β + k - 1)) (e^{-x})^{β + k}(1 + e^{-x})^{- α - β - k} 
	   + A_{n-1, n-1} (α + β + n - 1) (e^{-x})^{β + n}(1 + e^{-x})^{- α - β - n}\\
\end{aligned}
$$
so $A_{n,0} = (-b)^n A_{n-1,0}$,
$A_{n,k} = -(β + k)A_{n-1,k} + (α + β + k - 1) A_{n-1,k-1}$, $0 < k < n$,
and $A_{n,n} = (α + β + n - 1) A_{n-1, n-1}$. If we define $A_{n,-1} = 0 = A_{n,n+1}$
$$
	A_{n,k} = -(β + k)A_{n-1,k} + (α + β + k - 1) A_{n-1,k-1}
$$
for $n > 0$ and $A_{0,0} = 1$.

The cumulant of the generalized logistic is $κ(s) = \log B(α + s, β - s)/B(α, β)
= \log Γ(α + s) - \log Γ(α) + \log Γ(β - s) - \log Γ(β)$.

Recall the _digamma_ function $ψ(s) = Γ'(s)/Γ(s)$ is the derivative of the log of the Gamma function
so $κ^{(n+1)}(s) = ψ^{(n)}(α + s) - (-1)^n ψ^{(n)}(β - s)$ for $n\ge 0$.
In particular the mean is $κ'(0) = ψ(α) - ψ(β)$ and variance is
$κ''(0) =  ψ'(α) + ψ'(β)$.

Let $B_1 = ∂_α B$ and $B_2 = ∂_β B$ be partial derivatives with respect to the first
and second parameter respectively. Recall
$$
	B_1(α,β;u) = (\log u - ψ(α) + ψ(α + β))B(α,β;u)
$$
so $B_1(u)/B(u) - B_1/B = \log u$.

Using $B(α,β;u) = 1 - B(β,α;1 - u)$ we have
$$
	B_2(α,β;u) = -(\log (1 - u) - ψ(β) + ψ(β + α))B(β, α;1 - u)
$$
so $B_2(u)/B(u) - B_2/B = -\log (1 - u)$.
Since $F_s(x) = B(α + s, β - s; u)/B(α + s, β - s) = B(u)/B$
$$
\begin{aligned}
	∂_s F_s(x) &= \frac{B (B_1(u) - B_2(u)) - B(u)(B_1 - B_2)}{B^2} \\
		&= \frac{B(u)}{B}\left[\left(\frac{B_1(u)}{B(u)} - \frac{B_1}{B}\right)
			- \left(\frac{B_2(u)}{B(u)} - \frac{B_2}{B}\right)\right] \\
		&= F_s(x) (\log u + \log (1 - u)).
\end{aligned}
$$

Recall
$$
	B(α,β;u) = \frac{u^α}{α}\,_2F_1(α, 1 - β, α + 1;u).
$$
where $\,_2F_1(a,b;c;x) = \sum_{n=0}^\infty\frac{(a)_n (b)_n}{(c)_n} x^n/n!$
is the hypergeometric function.

The derivatives of the hypergeometic function are
$$
	∂_x^n\,_2F_1(a, b; c; x) = \frac{(a)_n (b)_n}{(c)_n}\,_2F_1(a + n, b + n; c + n;x).
$$

## Acknowledgements

The author thanks Peter Carr and Bill Goff for their helpful comments and insightful suggestions. 
Any errors or omissions are due to the author.
