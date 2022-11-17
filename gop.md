---
title: General Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing and greeks
thanks: Thank you Peter Carr and Bill Goff for your valuable feedback.
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\RR}{𝑹}

<!--
> _Besides it is an error to believe that rigour is the enemy of simplicity. 
> On the contrary we find it confirmed by numerous examples that the rigorous 
> method is at the same time the simpler and the more easily comprehended. 
> The very effort for rigor forces us to find out simpler methods of proof. 
> &mdash; David Hilbert_
-->

European _option valuation_ involves calculating the expected value of
the _option payoff_ using the _underlying_ at _expiration_.
_Greeks_ are derivatives of the option value with respect to _model parameters_.
This short note derives formulas for these that can be used for any underlying.

Let $F$ have mean $f$ and variance $f^2s^2$. We can write $F = f(1 + s X)$
where $X$ has mean 0 and variance 1. If $X$ is standard normal we have the
Bachelier model. Let $\Phi$ be the cdf of $X$.

Note $F\le k$ iff $X \le (k - f)/fs = x(k)$. $k(x) = f(1 + s x)$.

$dx(k)/df = 1/fs$.

$v = E[\nu(F)]$.

$dv/df = E[\nu'(F)(1 + sX)]$.

$d^nv/df^n = E[\nu''(F)(1 + sX)^n]$.

$dv/ds = E[\nu'(F)fX]$.

Let $\Phi(x, n) = E[X^n 1(X\le x)]$ be the _partial moments_.

By Carr-Madan $f(x) = f(a) + f'(a)x + \int_{-\infty}^a f''(k)(k - x)^+\,dk + \int_a^{\infty} f''(k)(x - k)^+\,dk$.

$E[\delta_a(g(X))] = E[\delta_a(Y)]$, $Y = g(X)$.

$\Psi(y) = P(Y\le y) = P(g(X)\le y) = P(X\le g^{-1}(y)) = \Phi(g^{-1}(y))$

$\psi(y) = \Phi'(y) = \phi(g^{-1}(y))dg^{-1}(y)/dy = \phi(g^{-1}(y))/g'(g^{-1}(y))$.

## Bachelier

$F = f(1 + sX)$, $g(x) = f(1 + sx)$.

Let $f(x) = (x - a)^2/2 1(x \le a)$

$f'(x) = -(x - a)^2/2 \delta_a(x) + (x - a) 1(x \le a)$

$f''(x) = -(x - a)^2/2 \delta'_a(x) - 2(x - a) \delta_a(x) + 1(x \le a)$.

$E[(k - F)^+] = E[(k - F)1(F \le k)] = k\Phi(x(k)) - E[F1(X \le x(k))]$.

$E[F1(X \le x)] = E[f(1 + s X)1(X\le x)]
 fP(X\le x) + fs E[X 1(X\le x)]$

$p = E[(k - F)^+] = (k - f)\Phi(x(k)) + fs\Phi(x(k), 1)$

$dp/df = E[-(F/f)1(F\le k)] = E[-(1 + s X)1(F\le k)]
	= -\Phi(x(k)) - s \Phi(x(k), 1)$.

$d^2p/df^2 =  $

$d/df E[1(F\le k)] = 

$dp/ds = E[-X1(F\le k)] = - \Phi(x(k), 1)$.

$1 + s X = e^{sZ - s^2/2}$, $X = (e^{sZ - s^2/2} - 1)/s$

$s^2 = (e^{s^2} - 1)$, $s^2 = \log(s^2 + 1)$.
