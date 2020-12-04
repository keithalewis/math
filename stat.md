---
title: Statistics
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
fleqn: true
abstract: Observations of outcomes
...

\newcommand\RR{\bm{R}}
\newcommand{\Var}{\operatorname{Var}}

Statistics is the study of finding estimates for properties of random variables.

A _property_ is a function $\sigma\colon \mathcal{X}\to\RR$
where $\mathcal{X}$ is a set of random variables.
A _statistic_ is a function $s_n\colon\RR^n\to\RR$.
Given a random variable $X\in\mathcal{X}$ and independent $(X_j)_{j=1}^\infty$ having the same law
as $X$ how do we find statistics $s_n$ such that
$s_n(X_1,\ldots,X_n)$ converge to $\sigma(X)$ in some sense?

For example, if $\sigma(X) = E[X]$ then the _arithmetic mean_
$m_n(x_1,\ldots,x_n) = (x_1 + \cdots + x_n)/n$ is a statistic with $M_n =
m_n(X_1,\ldots,X_n)$ that converges to $\sigma(X)$ in the sense $E[M_n] =
\sigma(X)$ and $\Var(M_n)\to 0$.  We could also use the _geometric mean_
$g_n(x_1,\ldots,x_n) = \sqrt[n]{x_1\cdots x_n}$ or the _harmonic mean_
$h_n(x_1,\ldots,x_n) = (n/x_1 + \cdots + n/x_n)^{-1}$.

### Convergence

Random variables $X_n$ converge to $X$ in _mean_ if
$E[|X_n - X|]$ converges to 0. They converges in _mean square_ if
$\Var(X_n - X)$ converges to 0.
They converges _in probability_ if for all $\epsilon > 0$ it is evenually
the case that $P(|X_n - X|) > \epsilon) < \epsilon$.
They converge _almost surely_ if $P(\lim_n X_n = X) = 1$.

__Lemma__. (Chebyshev) _For any non-negative random variable $X$, $P(X > \lambda) \le E[X]/\lambda$_.

_Proof_. $E[X] \ge E[X 1(X > \lambda)] \ge \lambda P(X > \lambda)$.

__Exercise__. _For any non-negative random variable $X$ and any increasing function $\phi$,
$P(X > \lambda) \le E[\phi(X)]/\phi(\lambda)$_.

__Exercise__. _If $X_n$ converges in mean square then it converges in probability_.

Hint: $\phi(x) = x^2$ is increasing for $x > 0$.

## Bias

If $E[s(X_1,\ldots,X_n)] = \sigma(X)$ we say $s$ is an _unbiased_
_estimator_ of $\sigma$. The arithmetic mean is an unbiased estimator of the mean.
Since $E[(X_1\cdots X_n)^{1/n}] \le E[X_1\cdots X_n]^{1/n} = E[X]$ the geometric
mean is biased.

## Efficient

An unbiased statistic $s$ is _efficient_ if it has the smallest variance
among all unbiased statistics.

## Complete

A statistic $s\colon\RR^n\to\RR$ is _complete_ if
$E_\theta[g(s(X_1,\ldots,X_n))] = 0$ for all $\theta$ implies $g(s(X_1,\ldots,X_n)) = 0$ a.s.

## Sufficient

A statistic $s\colon\RR^n\to\RR$ is _sufficient_ if the $n$ conditions $X_j = x_j$, $1\le j\le n$
can be replaced by one condition $s(X_1,\ldots,X_n) = s(x_1,\ldots,x_n)$, i.e.,
$E_\theta[g(X)\mid X_j = x_j] = E_\theta[g(X)\mid s(X_1,\ldots,X_n) = s(x_1,\ldots,x_n)]$.

https://en.wikipedia.org/wiki/Lehmann%E2%80%93Scheff%C3%A9_theorem

## Power

## Jensen's Inequality

A function $\phi\colon\RR\to\RR$ is _convex_ if $\phi(x) = \sup_{\lambda\le\phi} \lambda(x)$
and _concave_ if $\phi(x) = \inf_{\lambda\ge\phi} \lambda(x)$
where $\lambda$ is linear.

__Theorem__. _If $\phi$ is convex then $E[\phi(X)] \ge \phi(E[X])$_.

For $\lambda\le\phi$ linear we have $E[\phi(X)] \ge E[\lambda(X)] = \lambda(E[X])$.
