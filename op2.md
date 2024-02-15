---
title: Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing and greeks
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\RR}{𝑹}

## Value

A _European option_ pays some function of the underlying price at expiration.
If $F$ is the price at expiration and $\nu$ is the _payoff function_
then its Black forward _value_ is ${v = E[\nu(F)]}$.

If $F$ is positive and $\log F$ has finite mean and variance then
$F = fe^{sX - \kappa(s)}$ for some $X$ with mean zero and variance one
where $\kappa(s) = \log E[\exp(sX)]$ is the _cumulant_ of $X$.
We call $f = E[F]$ the _forward_ and $s = \Var(\log F)$ the _vol_.

__Exercise__. _Prove ${X = (\log F/f + \kappa(s))/s}$ has mean 0 and variance 1_.

In the Fischer Black model $X = B_t/\sqrt{t}$, $f = f$, and $s = \sigma\sqrt{t}$
where $B_t$ is Brownian motion at time $t$.

__Exercise__. _Show $F = fe^{\sigma B_t - \sigma^2t/2}$_.

_Hint_: Use $E[\exp(N)] = \exp(E[N] + \Var(N)/2)$ if $N$ is normally distributed
and $B_t$ has mean 0, variance $t$.

If an option pays off in shares of $F$ then 
$E[F\nu(F)] = fE[ e^{sX - \kappa(s)}\nu(F)] = fE^s[\nu(F)]$
where $E^s$ is the _share measure_.
Since $E[e^{sX - \kappa(s)}] = 1$, share measure is a probability measure
that we denote by $P^s$.

## Greeks

The _delta_ of an option is the derivative of its value with respect to the forward,
$$
	\partial_f v = E[\nu'(F)\partial_f F] = E[\nu'(F)e^{sX - \kappa(s)}] = E^s[\nu'(F)].
$$
The _gamma_ of an option is the second derivative of its value with respect to the forward,
The _vega_ of an option is the derivative of its value with respect to the vol,
$$
	\partial_s v = E[\nu'(F) F (X - \kappa'(s))] = f E^s[\nu'(F) (X - \kappa'(s))].
$$

## Put

A _put_ with strike $k$ pays $\nu(F) = \max\{k - F, 0\} = (k - F)^+ = (k - F)1(F\le k)$ at expiration.
Note $F\le k$ is equivalent to $X\le (\log k/f + \kappa(s))/s$ when $s > 0$.

### Value

The forward value of a put option is

$$
\begin{aligned}
E[(k - F)^+] &= E[(k - F)1(F\le k)] \\
	&= kE[1(F \le k)] - E[F1(F\le k)] \\
	&= kP(X \le x) - fP^s(X\le x). \\
\end{aligned}
$$

We also have
$$
\begin{aligned}
E[(k - F)^+] &= E[(k - F)1(F\le k)] \\
	&= (k - f)P(F\le k) - \Cov(F,1(F\le k)). \\
\end{aligned}
$$
Note $\Cov(F,1(F\le k)) < 0$.

Let $\Psi(x) = P(X\le x)$ be the _cumulative distribution function_ of $X$
and $\psi(x) = \Psi'(x)$ be the density function if it exists.
Define the _cumulative share distribution_ by
${\Psi(x,s) = E[e^{sX - \kappa(s)} 1(X\le x)] = P^s(X\le x)}$
and $\psi(x, s) = \partial_x\Psi(x,s)$.

__Exercise__. _Show $\psi(x,s) = e^{sx - \kappa(s)}\psi(x)$_.

We can write the put value as
$$
	p = k\Psi(x) - f\Phi(x, s),
$$
where ${x = \xi(k) = \xi(k;f,s) = (\log k/f + \kappa(s))/s}$ is the moneyness.

__Exercise__. _Show $F\le k$ if and only if $X\le \xi(k)$ if $s > 0$_.

### Delta

Since $\partial_f (k - f)^+ = -1(f \le k)$ the put delta is
$$
	\partial_f p = E[-1(F \le k)e^{sX - \kappa(s)}] = -P^s(F\le k) = -\Psi(x, s).
$$

### Gamma

The second derivative with respect to forward is
$$
	\partial_f^2 p = -\partial_f\Psi(x, s)\partial_f x = -\psi(x, s)/fs
$$

__Exercise__. _Show $\partial_f x = 1/fs$_.

_Hint_: Show $\partial_x f = fs$.

### Vega

The derivative with respect to vol is
$\partial_s E[(k - F)^+] = -E[1(F\le k)F(X - \kappa'(s))]$.

Since $\partial_s P^s(X\le x) = E[e^{sX - \kappa(s)}(X - \kappa'(s)1(X\le x)]$
we have
$$
	\partial_s p = -f\Phi_s(x)
$$

Note $\partial_s \Psi_s(x) = 
$$
	\partial_s p = -f\Psi'_x(x)
$$

%Note $\psi_s(x) = \Psi_s'(x) = e^{sx - \kappa(s)}\psi(x)$.

$\partial_s \Phi_s(x) = \phi_s(x)\parial_s x$

