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
a vector of initial prices $x\in\RR^I$ [^1] and a vector-valued
function $X\colon\Omega\to\RR^I$ where $\Omega$ is the set of possible outcomes.
The instrument prices at the end of the period are 
$X(\omega)\in\RR^I$ if $\omega\in\Omega$ occurred. 
For example, we could take $\Omega = \RR^I$ and let $X$ be the identity function.
At the other extreme we could take $\Omega$ to be any one element set to get a deterministic model.
Binomial models correspond to $\Omega$ having two elements.
We can extend any one-period model to allow a catastrophic event $\bot$.
Let $\Omega^\bot = \Omega\cup\{\bot\}$ and define
$X^\bot(\omega) = X(\omega)$, $\omega\in\Omega$, and $X^\bot(\bot) = 0$
modeling the notion all instrument prices are 0 in the event of a catastrophe.

Note we _do not_ assume a probability measure on $\Omega$.

The _cost_ of obtaining portfolio $\gamma\in\RR^I$ at the beginning of the
period is the inner product $\sum_{i\in I} \gamma_i x_i = \gamma\cdot x = \gamma'x$. The components of
$\gamma$ are the _amount_ purchased in each instrument. At the end of the
period it has _value_ $\gamma'X(\omega)$ given $\omega\in\Omega$ occured.
The model has _arbitrage_ if there exists $\gamma\in\RR^I$ with
$\gamma'x < 0$ and $\gamma'X(\omega)\ge0$ for all $\omega\in\Omega$.
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
Recall $\gamma$ is an arbitrage portfolio if and only if $\gamma'x < 0$ and $\gamma'X\ge0$.
If $p > 0$ then $p\gamma'x < 0$ and $p\gamma'X\ge0$. If $\eta$ is another arbitrage
portfolio then $(\gamma + \eta)'x = \gamma'x + \eta'x < 0$ and 
$(\gamma + \eta)'X = \gamma'X + \eta'X \ge 0$.
</details>

The _range_ of $X$ is the set $X(\Omega) = \{X(\omega)\mid \omega\in\Omega\}$.
Points of the form $x = \sum_j p_j X(\omega_j)$ where $p_j > 0$ and
$\omega_j\in\Omega$ belong the the smallest cone containing the range of $X$.

__Exercise__. _If $X\ge0$ show $\gamma'x\ge0$ for all $\gamma\in\RR^I$_.

_Hint_: We are assuming $x = \sum_j p_j X(\omega_j)$ where $p_j > 0$ and
$\omega_j\in\Omega$.

This (almost) proves the easy direction: if $x$ belongs to the cone determined
by the range of $X$ then there are no arbitrage portfolios.
If $x$ is not in the cone and $x^*$ is the point in the cone closest to $x$,
then $\gamma = x^* - x$ is an arbitrage. However, proving that involves more machinery[^2].

### Examples

Consider a bond, stock, and at-the-money call option where the bond has zero
interest rate, the stock has initial price 100 and either 90 or 110 as the final
price, and the call option has price $c$. The one-period model for this is $x = (1, 100, c)$ and
$X(\omega) = (1, \omega, \max\{\omega - 100, 0\})$ where $\omega\in\Omega = \{90, 110\}$.
The range of $X$ is $X(\omega) = \{X(90), X(110)\}$ and
the smallest cone containing the range of $X$ consists of
$\{aX(90) + bX(110)$ where $a,b\ge 0$.
Since $x = X(90)/2 + X(110)/2$ we must have $c = 0/2 + 10/2 = 5$ if the model is arbitrage-free.

__Exercise__. (Binomial model) _Show if $x = (1, s, c)$ ... then $c = ...$_.

A puzzle making the rounds a few years ago was given a bond with zero interest rate,
a stock with initial price 100 and possible final prices of 90, 100, and 110, what
are the allowable arbitrage-free prices of an at-the-money call? The call can
expire at either $0$ or $10$, however the
arbitrage-free price must be between 0 and 5.
The one period model for this is $x = (1, 100, c)$ where $c$ is the call value,
and $X(\omega) = (1, \omega, \max\{\omega - 100,0\})$ for $\omega\in\Omega = \{90, 100, 110\}$.
The set of all
points in the smallest cone containg the range of $X$ is
$$
	\{aX(90) + bX(110) + cX(110)\mid a,b,c \ge 0\}.
$$
Since $x = X(90)c/10 + X(100)(1 - c/5) + X(110)c/10$ we must have $c\ge0$ and $1 - c/5\ge0$.

__Exercise__. _Assume only the stock and call are available. What is the no arbitrage
condition for $c$_?

_Hint_: It is not $0\le c\le 10$.

If the call has strike $k$...

## General One-Period Model

If we assume $X$ is bounded on $\Omega$ then there exists a positive measure $\pi$ on $\Omega$
with $x = \int_\Omega X\,d\pi$. The _mass_ of $\pi$ is $\|\pi\| = \int_\Omega 1\, d\pi$.
Since $Q = \pi/\|pi\|$ is a probability measure we can write this as $x = E[X]/R$ where
$R = 1/\|\pi\|$. Of course $Q$ is not the probability of anything, it is
just a positive measure with mass 1. We call $Q$ a _risk-neutral_ measure.

__Exercise__. _Show the risk-neutral measure is unique for a binomial model_.

In general, there are many risk-neutral measures for a one period model having more
than two outcomes.

Given any portfolio $\gamma\in\RR^I$ define $R_\gamma = \gamma'X/\gamma'x$ to be the _realized return_
of the portfolio whenever $\gamma'x\neq 0$. 

__Exercise__ _Show $R_\gamma = R_{t\gamma}$ for any scalar $t\in\RR$, $t\neq 0$_.

__Exercise__ _If $x = E[X]/R$ show $E[R_\gamma] = R$ for all $\gamma\in\RR^I$ with $\gamma'x\neq 0$_.

This puts a crimp in portfolio optimization when using risk-neutral measures.

We call $\zeta\in\RR^I$ a _zero coupon bond_ if $\zeta'X(\omega) = 1$ for all $\omega\in\Omega$.
The _discount_ is $D = \zeta'x = \int_\Omega 1\,d\pi = 1/R$ so we have $x = E[X]D$.

## Multi-Period Model

An $n$-period model specifies trading times $t_0 < t_1 < \cdots < t_n$. 

A _partition_ $\mathcal{A}$ of a set $\Omega$ is used to represent partial information...

The _multi-period model_ for a set of instruments $i$ is determined by
vector-valued functions for _price_ and _cash flows_, $X_t,C_t\colon\mathcal{A}_t\to\RR^I$.

Prices...

Cash flows...

A _trading strategy_ consists of vector-valued functions 
$\Gamma_t\colon\mathcal{A}_t\to\RR^I$ indicating how many shares of
each instrument are traded at time $t$. A strategy is _closed out_ if
$\sum_t \Gamma_t = 0$.
The _position_ at time $t$ is $\Delta_t = \sum_{s < t} \Gamma_j$. Note the strict inequality...

Value $V_t = (\Delta_t + \Gamma_t)\cdot X_t$...

Account $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$...

The set of all trading strategies is 
$\mathcal{G} = \{(\Gamma_t)_{t\in T}\mid \Gamma_t\colon\mathcal{A}_t\to\RR^I\}$.
Let $\mathcal{G}_0$ be the collection of closed out trading strategies.
Arbitrage exists if there is a closed out trading strategy $(\Gamma_t)_{t\in T}$
with $A_{t_0} > 0$ and $A_{t_j}\ge0$ for $j > 0$.

### One-Period Model

For a one-period model $\mathcal{G}_0 = \{(\gamma,-\gamma)\mid \gamma\in\RR^I\}$. 
In this case $A_0 = -\gamma\cdot X_0$ and $A_1 = \gamma\cdot C_1 + \gamma\cdot X_1$.
As a warm-up for the proof of the multi-period case define
$A\colon\RR^I\to\RR^I\oplus B(\Omega)$ by
$A\gamma = (A_0, A_1)$. The no arbitrage condition is
the range of the operator $A$ does not intersect the cone
$\mathcal{P} = \{(p, P)\mid p > 0, P\ge 0\}$

### FTAP

## Optimization

The Markowitz optimization problem is to maximize $E[R_\gamma] - (\tau/2)\Var(R_\gamma)$ under the constraint $\gamma'x = 1$,
where $\tau$ is a _risk aversion_ parameter. In general, higher returns and smaller variance are preferred.
In what follows, we assume $x = (1,\ldots,1) = \one$ by dividing the components of $X$ by corresponding
components of $x$. Note $E[R_\gamma] = \gamma'E[X]$ and $\Var(R_\gamma) = \gamma'V\gamma$ where
$V = E[XX'] - E[X]E[X']$.

When $\tau = 0$, as we have seen above, $E[R_\gamma]$ does not depend on $\gamma$ if $x = \int_\Omega X\,d\pi$ for
some positive measure $\pi$.

__Exercise__. _In a model with arbitrage show $E[R_\gamma]$, $\gamma'x = 1$, is unbounded above and below_.

When $\tau > 0$ we have the optimum
$$
	\gamma = (\tau V)^{-1}(E[X] - \lambda\one)
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
