---
title: L-moments
author: Keith A. Lewis
classoption: fleqn
fleqn: true
header-includes:
	- \usepackage{bm}
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{{R}}}

Everything there is to know about a random variable $X$ is
determined by the probability it is less than or equal to a given value $x$.
Its _cumulative distribution function_ is $F(x) = P(X\le x)$.
Two random variables have the same _law_ if they have the same cdf.
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

## L-moments

L-moments are similar to moments but are defined for any distribution with finite mean.
They are more difficult to compute but better at summarizing the shape of a distribution.
When given samples of a random variable they provide a robust way
of estimating its distribution.

The first L-moment of a random variable $X$ is the mean $\lambda_1 = E[X]$.

The second L-moment is $\lambda_2 = (1/2)E[|X_2 - X_1|]$ where $X_1$ and $X_2$ are independent
and have the same distribution as $X$. It is a measure of spread even
when standard deviation is not finite. It measures the distance between two independent random
samples of $X$.

__Exercise__ _Show $\lambda_2 = (1/2)E[\max\{X_1,X_2\} - \min\{X_1,X_2\}]$_.

_Hint_: $|x| = \max\{x,-x\}$.

Higher order L-moments are defined using _order statistics_.  They do
a better job of estimating the distribution of a random variable
given independent sample values.  Given independent random variables
$X_1,\ldots,X_n$ having the same law as $X$ define $X_{1:n}\le\ldots\le
X_{n:n}$ by sorting pointwise.  Independent samples of a random
variable are functions on the product space $X_i\colon\Omega^n\to\RR$
where $X_i(\omega_1,\ldots,\omega_n) = \omega_i$ equipped with the
product measure $F_n(x_1,\ldots,x_n) = P(X_1\le x_1,\ldots,X_n\le x_n)
= P(X_1\le x_1)\cdots F(X_n\le x_n)$.  The numbers $X_1(\omega), \dots,
X_n(\omega)$ can be sorted pointwise to define the order statistics
$X_{1:n}(\omega),\ldots,X_{n:n}(\omega)$

__Exercise__. _Show $\lambda_2 = (1/2)E[X_{2:2} - X_{1:2}]$_.

The third L-moment is
${\lambda_3 = (1/3)E[(X_{3:3} - X_{3:2}) - (X_{3:2} - X_{3:1})] = E[X_{3:3} - 2X_{3:2} + X_{3:1}]}$.
If you sample $X$ three
times this measures the difference between the high and mid and the
difference between the mid and the low. This is a measure of skewness. If
it is positive then the distribution has more mass toward the right.
If it is negative then the distribution has more mass toward the left.

The fourth L-moment is
$\lambda_3 =
(1/4)E[(X_{4:4} - X_{4:3}) - (X_{4:3} - X_{4:2})
- ((X_{4:3} - X_{4:2}) - (X_{4:2} - X_{4:1}))]
= (1/4)E[X_{4:4} - 3X_{4:3} + 3X_{4:2} - X_{4:1}]$.


The general theme of L-moments is to consider $\Delta X_{n:j} = X_{n:j+1} - X_{n:j}$.
The second L-moment is $E[\Delta X_{2:1}]$. The third
L-moment is $E[\Delta\Delta X_{3:1}]$ the $n$-th L-moment
is $E[\Delta^{n-1}X_{n:1}]$.
