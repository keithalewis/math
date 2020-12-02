---
title: Statistics
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
fleqn: true
abstract: Properties of random variables
...

\newcommand\RR{\bm{R}}
\newcommand{\Var}{\operatorname{Var}}

Statistics is the study of finding estimates for properties of random variables.

A _property_ is a function $\sigma\colon \mathcal{X}\to\RR$
where $\mathcal{X}$ is a set of random variables.
A _statistic_ is a function $s_n\colon\RR^n\RR$.
Given a random variable $X\in\mathcal{X}$ and independent $(X_n)$ having the same law
as $X$ how do we find statistics $(s_n)$ such that
$s_n(X_1,\ldots,X_n)$ converge to $\sigma(X)$ in some sense?

For example, if $\sigma(X) = E[X]$ then the _arithmetic mean_
$m_n(x_1,\ldots,x_n) = (x_1 + \cdots + x_n)/n$ is a statistic with $M_n =
m_n(X_1,\ldots,X_n)$ that converges to $\sigma(X)$ in the sense $E[M_n] =
\sigma(X)$ and $\Var(M_n)\to 0$.  We could also use the _geometric mean_
$g_n(x_1,\ldots,x_n) = \sqrt[n]{x_1\cdots x_n}$ or the _harmonic mean_
$h_n(x_1,\ldots,x_n) = (n/x_1 + \cdots + n/x_n)^{-1}$.

## Bias

If $E[s_n(X_1,\ldots,X_n)] = \sigma(X)$ for all $n$ we say $s_n$ is an _unbiased_
_estimator_ of $\sigma$. The arithmetic mean is an unbiased estimator of the mean.
Since E[(X_1\cdots X_n)^{1/n}] \ge E[X_1\cdots X_n]^{1/n} = E[X]$ the geometric
mean is biased.

## Efficient

## Power

## Sufficient

## Jensen's Inequality

A function $\phi\colon\RR\to\RR$ is _convex_ if $\phi(x) = \sup_{\lambda\le\phi} \lambda(x)$
where $\lambda$ is linear.

__Theorem__. _If $\phi$ is convex then $E[\phi(X)] \ge \phi(E[X])$_.

For $\lambda\le\phi$ linear we have $E[\phi(X)] \ge E[\lambda(X)] = \lambda(E[X})$.
