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

If an option pays off in shares of $F$ then 
$E[F\nu(F)] = fE[ e^{sX - \kappa(s)}\nu(F)] = fE_s[\nu(F)]$
where $E_s$ is the _share measure_.
Since $F > 0$ and $E[e^{sX - \kappa(s)}] = 1$, share measure is a probability measure
that we denote by $P_s$.

## Greeks

The _delta_ of an option is the derivative of its value with respect to the forward,
$$
	\partial_f v = E[\nu'(F)\partial_f F] = E[\nu'(F)e^{sX - \kappa(s)}] = E_s[\nu'(F)].
$$
The _gamma_ of an option is the second derivative of its value with respect to the forward,
The _vega_ of an option is the derivative of its value with respect to the vol,
$$
	\partial_s v = E[\nu'(F) F (X - \kappa'(s))] = f E_s[\nu'(F) (X - \kappa'(s))].
$$

## Put

A _put_ with strike $k$ pays $\nu(F) = \max\{k - F, 0\} = (k - F)^+ = (k - F)1(F\ge k)$ at expiration.
Note $F\le k$ is equivalent to $X\le (\log k/f + \kappa(s))/s$.
The _moneyness_ of a put with strike $k$ is ${m(k; f, s) = (\log k/f + \kappa(s))/s}$
so $f = ke^{sm(k;f,s) - \kappa(s)}$

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

Let $\Psi(x) = P(X\le x)$ be the _cumulative distribution function_ of $X$
and ${\Psi_s(x) = E[e^{sX - \kappa(s)} 1(X\le x)]}$
the cumulative share distribution.
Note $\psi_s(x) = \Psi_s'(x) = e^{sx - \kappa(s)}\psi(x)$.

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

The second derivative with respect to forward is
$$
	\partial_f^2 p = -\Psi_s'(x)\partial_f x = -\psi_s(x)/fs
$$

__Exercise__. _Show $\partial_f x = 1/fs$_.

_Hint_. Show $\partial_x f = fs$.

### Vega

The derivative with respect to vol is
$\partial_s E[(k - F)^+] = -E[1(F\le k)F(X - \kappa'(s))]$.
Since ${\partial_s \Psi(x, s) = E[e^{sX - \kappa(s)}(X - \kappa'(s))1(X\le x)]}$
we have
$$
	\partial_s p = -f\partial_s\Psi(x, s).
$$

## Call
