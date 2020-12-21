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

## Estimation

_Estimation_ is the study of finding estimates for properties of random variables.

A _property_ is a function $\sigma\colon \mathcal{X}\to\RR$
where $\mathcal{X}$ is a set of random variables.
A _statistic_ is a function $s_n\colon\RR^n\to\RR$.
Given a random variable $X\in\mathcal{X}$ and independent $(X_j)$ having the same law
as $X$ how do we find statistics $s_n$ such that
$s_n(X_1,\ldots,X_n)$ [converge](prob.html#convergence) to $\sigma(X)$ in some sense?

For example, if $\sigma(X) = E[X]$ then the _arithmetic mean_
$m_n(x_1,\ldots,x_n) = (x_1 + \cdots + x_n)/n$ is a statistic where $M_n =
m_n(X_1,\ldots,X_n)$ converges to $\sigma(X)$ in the sense $E[M_n] =
\sigma(X)$ and $\Var(M_n)\to 0$.  We could also use the _geometric mean_
$g_n(x_1,\ldots,x_n) = \sqrt[n]{x_1\cdots x_n}$ or the _harmonic mean_
$h_n(x_1,\ldots,x_n) = (n/x_1 + \cdots + n/x_n)^{-1}$.
Some statistics are better than other statistics.

### Bias

If $E[s(X_1,\ldots,X_n)] = \sigma(X)$ we say $s$ is an _unbiased_
_estimator_ of $\sigma$. The arithmetic mean is an unbiased estimator of the mean.
Since $E[(X_1\cdots X_n)^{1/n}] \le E[X_1\cdots X_n]^{1/n} = E[X]$ the geometric
mean is biased.

### Efficient

An unbiased statistic $s$ is _efficient_ if it has the smallest variance
among all unbiased statistics.

### Complete

A statistic $s\colon\RR^n\to\RR$ is _complete_ if
$E_\theta[g(s(X_1,\ldots,X_n))] = 0$ for all $\theta$ implies $g(s(X_1,\ldots,X_n)) = 0$ a.s.

### Sufficient

A statistic $s\colon\RR^n\to\RR$ is _sufficient_ if the $n$ conditions $X_j = x_j$, $1\le j\le n$
can be replaced by one condition $s(X_1,\ldots,X_n) = s(x_1,\ldots,x_n)$, i.e.,
$E_\theta[g(X)\mid X_j = x_j] = E_\theta[g(X)\mid s(X_1,\ldots,X_n) = s(x_1,\ldots,x_n)]$.

https://en.wikipedia.org/wiki/Lehmann%E2%80%93Scheff%C3%A9_theorem

## Hypothesis Testing

Given random variables $X_\theta$, $\theta\in\Theta$, and a partion $\{\Theta_0,\Theta_1\}$ of
$\Theta$ how can we decide if $\theta\in\Theta_0$ (_null hypothesis_)
or $\theta\in\Theta_1$ (_alternate hypothesis_)?

This is done by designing _tests_ and collecting _data samples_.
A test is a subset $\delta_0\subseteq \RR^n$ and is called the _critical region_.
A data sample is a collection of numbers $x = (x_1,\ldots,x_n)\in\RR^n$. 
We _accept_ the null hypothesis if the sample belongs to this set.

Let $X = (X_1,\ldots,X_n)$ be iid random variables with the same law as $X_\theta$.
The _power function_ of a test $\delta_0$ is $\pi(\theta) = P(X\in\delta\mid\theta)$.
If $\pi = 1_{\Theta_1}$ then the test determines whether or not $\theta\in\Theta_0$
with probability 1.

__Exercise__. _Show if $\pi = 1_{\Theta_1}$ then $x\in\delta_0$ implies $P(\theta\in\Theta_0) = 1$_.

Hint: If $x\in\delta_0$ then $

This is usually not possible so we look for tests that approximate the indicator function of $\Theta_1$.
The _size_ of a test $\delta$ is $\alpha = \sup_{\theta\in\Theta_0} \pi(\theta)$.
