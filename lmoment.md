---
title: L-moments
author: Keith A. Lewis
---

Everything there is to know about a random variable $X$ is
determined by the probability it is less than or equal to a given value $x$.
Its _cumulative distribution function_ is $F(x) = P(X\le x)$.
Every cdf is non-decreasing, right-continuous, has left limits, tends to 0 as $x$
goes to $-\infty$ and tends to 1 as $x$ goes to $+\infty$.
Every such function defines a cdf of a random variable.
The expected value of $X$ is the Riemann-Stieltjes integral
$E[X] = \int_{-\infty}^\infty x\,dF(x)$.
The expected value of a function of $X$ is $E[f(X)] = \int_{-\infty}^\infty f(x)\,dF(x)$

???link???

There are many possible cumulative distribution functions. To get a summary picture of
a random variable it is useful to reduces the cdf to a 
handful of numbers that measure _central tendency_ (mean),
_spread_ (standard deviation), tilt (skewness), and how peaked (kurtosis)
the distribution is.
These are defined using the _moments_ of the distribution.
The $n$-th moment is $m_n = \int_{-\infty}^\infty x^n\,dF(x)$.

__Exercise__. _Show $m_0 = 1$_.

_Hint_: Use $\int_a^b dF(x) = F(b) - F(a)$
and $\lim_{b\to\infty}F(b) - \lim_{a\to -\infty}F(a) = 1 - 0$.

The _moment generating function_ of $X$ is $E[e^{sX}]$.

__Exercise__. _Show $E[e^{sX}] = \sum_{n=0}^\infty m_n s^n/n!$ if all moments exist_.

_Hint_: Use $e^x = \sum_{n=0}^\infty x^n/n!$.

The _central moments_ of a distribution subtract the _mean_ $m_1$,
$\mu_n = \int_{-\infty}^\infty (x - m_1)^n\,dF(x)$.

__Exercise__. _Show $\mu_1 = 0$_.

__Exercise__. _Show $\mu_n = \sum_{k=0}^n \binom{n}{k} m_k m_1^{n-k}$_.

_Hint_: Use $(x - m_1)^n = \sum_{k=0}^n \binom{n}{k} x^k m_1^{n-k}$.

The _standard deviation_ is $\sigma = \sqrt{m_2 - m_1^2}$.

__Exercise__. _Show $\sigma = \sqrt{\mu_2}$_.

Every random variable with finite mean and standard deviation can
be _normalized_ to have mean 0 and standard deviation 1.

__Exercise__. _Show $(X - \mu)/\sigma$ has mean 0 and standard deviation 1_.

_Skewness_ is the third moment of a standardized random variable
$E[((X - \mu)/\sigma)^3]$.

_Kurtosis_ is the fourth standardized moment $E[((X - \mu)/\sigma)^4]$.

L-moments are similar to moments. They are more difficult to
compute but better at summarizing the shape of a distribution.
