---
title: The Markowitz Tragedy
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: The dominance of unimportance.
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\Var{\operatorname{Var}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}
\newcommand\one{\boldsymbol{1}}
\newcommand\RR{\boldsymbol{R}}

The _one period model_ for a set of instruments $I$ is determined by
the vector of initial prices $x\in\RR^I$ [^1] and a vector valued
function $X\colon\Omega\to\RR^I$ where $\Omega$ is the set of possible outcomes.
The instrument prices at the end of the period are 
$X(\omega)\in\RR^I$, $\omega\in\Omega$. 
or example, we could take $\Omega = \RR^I$ and let $X$ be the identity function.
At the other extreme we could take $\Omega$ to be any one element set to get a deterministic model.
Binomial models correspond to $\Omega$ having two elements.
Note we _do not_ assume a probability measure on $\Omega$.

The _cost_ of obtaining portfolio $\xi\in\RR^I$ at the beginning of the
period is the inner product $\sum_{i\in I} \xi_i x_i = \xi\cdot x = \xi'x$. The components of
$\xi$ are the _amount_ purchased in each instrument. At the end of the
period it has _value_ $\xi'X(\omega)$ given $\omega\in\Omega$ occured.
The model has _arbitrage_ if there exists $\xi\in\RR^I$ with
$\xi'x < 0$ and $\xi'X(\omega)\ge0$ for all $\omega\in\Omega$.
If the cost is negative we make money initially and if the final value 
is always non-negative we can liquidate the position and not lose money.

The Fundamental Theorem of Asset Pricing states that a model is arbitrage
free if and only if $x$ belongs to the smallest cone containing the range of $X$.
Note this is a purely geometric condition. There is no need to
use probability to define arbitrage.

Recall a _cone_ is a subset $C\subset V$, where $V$ is a vector space,
such that $x\in C$ implies $px\in C$ for every scalar $p > 0$ and if
$x,y\in C$ then $x + y\in C$.

__Exercise__. _Show the set of arbitrage portfolios is a cone_.

<details>
<summary>Solution</summary>
Recall $\xi$ is an arbitrage portfolio if and only if $\xi'x < 0$ and $\xi'X\ge0$.
If $p > 0$ then $p\xi'x < 0$ and $p\xi'X\ge0$. If $\eta$ is another arbitrage
portfolio then $(\xi + \eta)'x = \xi'x + \eta'x < 0$ and 
(\xi + \eta)'X = \xi'X + \eta'X \ge 0$.
</details>

The _range_ of $X$ is the set $X(\Omega) = \{X(\omega)\mid \omega\in\Omega\}$.
Points of the form $x = \sum_j p_j X(\omega_j)$ where $p_j > 0$ and
$\omega_j\in\Omega$ belong the the smallest cone containing the range of $X$.

__Exercise__. _If $X\ge0$ show $\xi'x\ge0$ for all $\xi\in\RR^I$_.

_Hint_: We are assuming $x = \sum_j p_j X(\omega_j)$ where $p_j > 0$ and
$\omega_j\in\Omega$.

This (almost) proves the easy direction: if $x$ belongs to the cone determined
by the range of $X$ then there are no arbitrage portfolios.
If $x$ is not in the cone and $x^*$ is the point in the cone closest to $x$,
then $\xi = x^* - x$ is an arbitrage. However, proving that involves more machinery[^2].

### Example

A puzzle making the rounds a few years ago was given a bond with zero interest rate,
a stock with initial price 100 and possible final prices of 90, 100, and 110, what
are the allowable arbitrage-free prices of an at-the-money call? The call can
expire at either $0$ or $10$, however the
arbitrage-free price must be between 0 and 5.
The one period model for this is $x = (1, 100, c)$ where $c$ is the call value,
and $X(\omega) = (1, \omega, \max\{\omega - 100,0\})$ for $\omega\in\Omega = \{90, 100, 110\}$.
Let $A = X(90) = (1, 90, 0)$, $B = X(100) = (1, 100, 0)$,
and $C = X(110) = (1, 110, 10)$. The set of all
points in the smallest cone containg the range of $X$ is
$$
	\{aA + bB + cC\mid a,b,c \ge 0\}.
$$
Since $x = Ac/10 + B(1 - c/5) + Cc/10$ we must have $c\ge0$ and $1 - c/5\ge0$.

__Exercise__. _Assume only the stock and call are available. What is the no arbitrage
condition for $c$_?

_Hint_: It is not $0\le c\le 10$.

If we assume $X$ is bounded on $\Omega$ then there exists a positive measure $\pi$ on $\Omega$
with $x = \int_\Omega X\,d\pi$. The _mass_ of $\pi$ is $\|\pi\| = \int_\Omega d\pi$.
Since $Q = \pi/\|pi\|$ is a probability measure we can write this as $x = E[X]/R$ where
$R = 1/\|\pi\|$. Of course $Q$ is not the probability of anything, it is
just a positive measure with mass 1. We call $Q$ a _risk-neutral_ measure.

__Exercise__. _Show the risk-neutral measure is unique for a binomial model_.

In general, there are many risk-neutral measures for a one period model having more
than two outcomes.

Given any portfolio $\xi\in\RR^I$ define $R_\xi = \xi'X/xi'x$ to be the _realized return_
of the portfolio whenever $\xi'x\neq 0$. 

__Exercise__ _Show $R_\xi = R_{t\xi}$ for any scalar $t\in\RR$, $t\neq 0$_.

__Exercise__ _If $x = E[X]/R$ show $E[R_\xi] = R$ for all $\xi\in\RR^I$ with $\xi'x\neq 0$_.

This puts a crimp in portfolio optimization when using risk-neutral measures.

We call $\zeta\in\RR^I$ a _zero coupon bond_ if $\zeta'X(\omega) = 1$ for all $\omega\in\Omega$.
The _discount_ is $D = \zeta'x = \int_\Omega 1\,d\pi = 1/R$ so we have $x = E[X]D$.

## Optimization

The Markowitz optimization problem is to maximize $E[R_\xi] - (\tau/2)\Var(R_\xi)$ under the constraint $\xi'x = 1$,
where $\tau$ is a _risk aversion_ parameter. In general, higher returns and smaller variance are preferred.
In what follows, we assume $x = (1,\ldots,1) = \one$ by dividing the components of $X$ by corresponding
components of $x$. Note $E[R_\xi] = \xi'E[X]$ and $\Var(R_\xi) = \xi'V\xi$ where
$V = E[XX'] - E[X]E[X']$.

When $\tau = 0$, as we have seen above, $E[R_\xi]$ does not depend on $\xi$ if $x = \int_\Omega X\,d\pi$ for
some positive measure $\pi$.

__Exercise__. _In a model with arbitrage show $E[R_\xi]$, $\xi'x = 1$, is unbounded above and below_.

When $\tau > 0$ we have the optimum
$$
	\xi = (\tau V)^{-1}(E[X] - \lambda\one)
$$
where $\lambda = (\tau - B)/A$, $B = \one'V^{-1}E[X]$, and $A = \one'V^{-1}\one$.
Note every optimal portfolio belongs to the two dimensional space spanned
by $V^{-1}E[X]$ and $V^{-1}\one$. 

If $x = \one = E[X]/R$ then $B = AR$,
$\lambda = \tau/A - R$,
$E[X] - \lambda\one = R\one - (\tau/A - R)\one = (R - (\tau/A - R))\one$,

Since $V$ is positive definite the spectal theorem implies $V = \sum_i \lambda_i e_i$
where $\lambda_i > 0$ and $\{e_i\}$ are orthonormal.
Its inverse is $V^{-1} = \sum_i \lambda_i^{-1} e_i$.
It is common for the covariance matrix of a large number of instruments have most of
the eigenvalues, $\lambda_i$, be small. This implies $V^{-1}x$ is largely
determined by the eigenvectors corresponding to small eigenvalues.

Assume $X = \one + \sigma\epsilon$ where $\epsilon$ is a vector of independent standard normally
distributed random variables, so $E[X] = \one$ and $\Var(X) = \sigma^2 I$. Clearly this is not
amenable to any sort of portfolio optimization. Since $(\tau V)^{-1}E[X] = \one/\tau\sigma^2$
We have $B = n/\tau\sigma^2$. Since $\one = E[X]$, $A = B$ so 
$\lambda = (\tau/(n/\tau\sigma^2) - 1) = 1/n\sigma^2 - 1$.


## NOTES



[^1]: Recall $A^B = \{f\colon B\to A\}$ is the set of all functions from 
the set $B$ to the set $A$. We prefer the notation $x\in\RR^I$ to the 
circumloqution $x\in\RR^n$ where $I = {i_1,\ldots,i_n}$ and
$x = (x_1,\ldots,x_n)\in\RR^n$ corresponds to $x(i_j) = x_j$ in $\RR^I$.

[^2]: The machinery being the Hahn-Banach theorem or its finite dimensional
version due to Farkas.
