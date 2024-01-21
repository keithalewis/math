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
If $F$ is the price at expiration and $\nu$ is a function
then its Black forward _value_ is $v = E[\nu(F)]$.

If $F$ is positive and $\log F$ has finite mean and variance then
$F = fe^{sX - \kappa(s)}$ for some $X$ with mean zero and variance one
where $\kappa(s) = \log E[\exp(sX)]$ is the _cumulant_ of $X$.
We call $f = E[F]$ the _forward_ and $s = \Var(\log F)$ the _vol_.
Note ${\partial_f F = \partial F/\partial f = e^{sX - \kappa(s)}}$
and ${\partial_s F = F (X - \kappa'(s))}$.

If an option pays off in shares of $F$ then 
$E[F\nu(F)] = fE[ e^{sX - \kappa(s)}\nu(F)] = fE_s[\nu(F)]$
where $E_s$ is the _share measure_.
Since $F > 0$ and $E[e^{sX - \kappa(s)}] = 1$ share measure is a probability measure
that we denote by $P_s$.

## Greeks

The _delta_ of an option is the derivative of its value with respect to the forward,
${\partial_f v f = E[\nu'(F)\partial_f F] = E[\nu'(F)e^{sX - \kappa(s)}] = E_s[\nu'(F)]}$.
The _gamma_ of an option is the second derivative of its value with respect to the forward,
${\partial_f^2 v f = E[\nu''(F)e^{2sX - 2\kappa(s)}]}$.
The _vega_ of an option is the derivative of its value with respect to the vol,
$\partial_s v = E[\nu'(F) F (X - \kappa'(s))] = f E_s[\nu'(F) (X - \kappa'(s))]$.

## Put

A _put_ with strike $k$ pays $\nu(F) = \max\{k - F, 0\} = (k - F)^+ = (k - F)1(F\ge k)$ at expiration.
Note $F\le k$ is equavalent to $X\le (\log k/f + \kappa(s))/s$.
The _moneyness_ is ${x = x(k; f, s) = (\log k/f + \kappa(s))/s}$
so $f = ke^{sx(k;f,s) - \kappa(s)}$

Note $\partial_x f = fs$ so $\partial_f x = 1/fs$
and $\partial_s f = f(x - \kappa'(s))$.

### Value

The forward value of a put is

$$
\begin{aligned}
E[(k - F)^+] &= E[(k - F)1(F\le k)] \\
	&= kE[1(F \le k)] - E[F1(F\le k)] \\
	&= kP(X \le x) - fP_s(X\le x). \\

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

Let $\Psi(x) = P(X\le x)$ and $\Psi_s(x) = E[e^{sX - \kappa(s)} 1(X\le x)$.
Note $\Psi_s'(x) = e^{sx - \kappa(s)}\psi(x)$ where $\psi(x) = \Phi'(x)$.

We can write the put value as
$$
	p = k\Psi(x) - f\Phi_s(x),
$$
where $x = (\log k/f + \kappa(s))/s$ is the moneyness.

### Delta

Since $\partial_f (k - f)^+ = -1(f \le k)$ the put delta is
$$
	\partial_f p = E[-1(F \le k)e^{sX - \kappa(s)}] = -P_s(F\le k) = -\Psi_s(x).
$$

### Gamma

Te second derivative with respect to forward is
$$
	\partial_f^2 p = -\Psi_s'(x)\partial_f x = -\psi_s(x)/fs
$$

### Vega

$$
	\partial_s E[(k - F)^+]
	= E[-1(F\le k)F(X - \kappa'(s))]
$$

$$
\partial_s \Psi_s(x) = \partial_s E[F/f 1(F\le k)] 
$$

$\Psi_s(x) = P_s(X\le x) = E[e^{sX - \kappa(s)}1(X \le x)]$

$\partial_s\Psi_s(x) = E[e^{sX - \kappa(s)}(X - \kappa'(s))\delta_x(X)]$

$v = k \Phi(x) - f \Phi_s(x)$.

$\partial_s v =  k \partial_s\Phi(x) - f \partial_s\Phi_s(x)$

$\partial_s\Psi(x) = \psi(x)\partial_s x$

$\partial_s x = \partial_s (\log k/f + \kappa(s))/s$

$\partial_s (\log k/f + \kappa(s))/s = (s\kappa'(s) - (\log k/f + \kappa(s)))/s^2$

$\partial_s x = \kappa'(s) - x$

The put vega is
$$
\begin{aligned}
\partial_s v &= k\partial_s P(F\le k) - f\partial_s P_s(F\le k) \\
	&= (k - f)P(F\le k) - \Cov(F,1(F\le k)). \\
\end{aligned}
$$
