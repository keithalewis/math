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
\newcommand\NN{\bm{N}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\given}{\mid}

<blockquote>
_Probability all the things_!
</blockquote>

## Statistics

Statistics is the study of finding _estimators_ for a _statistic_.

A statistic is a function $s$ from random variables to the real numbers $\RR$.
Estimators are collection of functions $s_n\colon\RR^n\to\RR$, where $n\in\NN$
is a natural number.
Given independent $(X_1,\ldots, X_n)$ having the same law as $X$ how do we
find estimators $s_n$ such that the random variable $s_n(X_1,\ldots,X_n)$
approximates the number $s(X)$ as $n$ gets large?

For example, if $s(X) = E[X]$ is the expected value of $X$, then
the _arithmetic means_ $m_n(x_1,\ldots,x_n) = (x_1 + \cdots + x_n)/n$
are estimators. If $M_n = m_n(X_1,\ldots,X_n)$ then $E[M_n] = E[X]$
and $\Var(M_n) = \Var(X)/n\to 0$ as $n\to\infty$. We say
the random variables $S_n$ converge to the number $s$ in _mean squared_
when $\lim_{n\to\infty}E[(S_n - s)^2] = 0$.

If $s_n$ are estimators let $S_n = s_n(X_1,\ldots,X_n)$.
Estimators with the property $E[S_n] = s(X)$, $n\in\NN$, are _unbiased_.

We could also use the _geometric means_ $g_n(x_1,\ldots,x_n) =
\sqrt[n]{x_1\cdots x_n}$ as estimators for $E[X]$ if $X$ is positive.
By [Jensen's Inequality](prob.html#jensens-inequality")
$E[\sqrt[n]{X_1\cdots X_n}] \le E[X]$ so the geometric means are not unbiased.

Clearly $E[M_n\given X_1 = x_1, \ldots, X_n = x_n] = E[M_n\given M_n = m_n(x_1, \ldots, x_n)]$
since both are equal to $m_n(x_1, \ldots, x_n)$.
If $s_n$ and $t_n$ are estimators with the property $E[S_n\given X_1 = x_1, \ldots, X_n = x_n]
= E[S_n\given S_n = t_n(x_1,\ldots,x_n)]$ then $t_n$ are _sufficient_ for $s_n$.

Some statistics are better than other statistics.

### Bias

If $E[s_n(X_1,\ldots,X_n)] = \sigma$ we say $s_n$ is an _unbiased_
_estimator_ of $\sigma$. The arithmetic mean is an unbiased estimator of the mean.
Since $E[(X_1\cdots X_n)^{1/n}] \le E[X_1\cdots X_n]^{1/n} = E[X]$ the geometric
mean is biased.

### Efficient

An unbiased statistic $s_n$ is _efficient_ if it has the smallest variance
among all unbiased statistics. This leaves open the possibility of
biased statistics that have lower variance than efficient statistics.

### Complete

A statistic $s\colon\RR^n\to\RR$ is _complete_ if
$E_\theta[g(s(X_1,\ldots,X_n))] = 0$ for all $\theta$ implies $g(s(X_1,\ldots,X_n)) = 0$ a.s.

### Sufficient

A statistic $t\colon\RR^n\to\RR$ is _sufficient_ if the $n$ conditions $X_j = x_j$, $1\le j\le n$
can be replaced by one condition $t(X_1,\ldots,X_n) = t(x_1,\ldots,x_n)$, i.e.,
$E_\theta[g(X)\given X_j = x_j] = E_\theta[g(X)\given s(X_1,\ldots,X_n) = s(x_1,\ldots,x_n)]$.

## Statistic

Given two statistics $s$ and $t$ for $\sigma$ where $t$ is sufficient let $\delta(X) = E[s(X)\given t(X)]$
be the _improved estimator_. The following theorem justifies this name.

__Theorem__. (Rao–Blackwell–Kolmogorov) _$E[(\delta(X) - \sigma)^2] \le E[(s(X) - \sigma)^2]$_.

_Proof_. We have $\Var

__Theorem__. (Lehmann–Scheffé) _If ..._.

See [Lehmann–Scheffé Theorem](https://en.wikipedia.org/wiki/Lehmann%E2%80%93Scheff%C3%A9_theorem)

## Population

Sampling from a _population_ is not special. One always does this.

## Hypothesis Testing

Given random variables $X_\theta$, $\theta\in\Theta$, and a partion $\{\Theta_0,\Theta_1\}$ of
$\Theta$ how can we decide if $\theta\in\Theta_0$ (_null hypothesis_)
or $\theta\in\Theta_1$ (_alternate hypothesis_)?

This is done by designing _tests_ and collecting _data samples_.
A test is a subset $\delta_0\subseteq \RR^n$ and is called the _critical region_.
A data sample is a collection of numbers $x = (x_1,\ldots,x_n)\in\RR^n$. 
We _accept_ the null hypothesis if the sample belongs to this set.

Let $X = (X_1,\ldots,X_n)$ be iid random variables with the same law as $X_\theta$.
The _power function_ of a test $\delta_0$ is $\pi(\theta) = P(X\in\delta\given\theta)$.
If $\pi = 1_{\Theta_1}$ then the test determines whether or not $\theta\in\Theta_0$
with probability 1.

__Exercise__. _Show if $\pi = 1_{\Theta_1}$ then $x\in\delta_0$ implies $P(\theta\in\Theta_0) = 1$_.

Hint: If $x\in\delta_0$ then $

This is usually not possible so we look for tests that approximate the indicator function of $\Theta_1$.
The _size_ of a test $\delta$ is $\alpha = \sup_{\theta\in\Theta_0} \pi(\theta)$.
