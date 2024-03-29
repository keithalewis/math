---
title: One-Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Buy now, sell later.
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\ran{\operatorname{ran}}

Let $I$ be the set of _instruments_ available at the beginning and end of a time period
and $\Omega$ be the set of possible outcomes over the period.
The _prices_ at the beginning of the period are a
vector ${x\in\RR^I = \{x\colon I\to\RR\}}$, the set of
functions from $I$ to $\RR$.
The initial price of instrument $i\in I$ is $x(i)$, which
we also write as $x_i$.
The prices at the end of the period are a function $X\colon\Omega\to
\RR^I$ where $X(\omega)\in\RR^I$ are the final instrument prices
if $\omega\in\Omega$ occurred.

Define $e_i\in\RR^I$ by $e_i(j) = 1$ if $i = j$ and is zero otherwise, $i,j\in I$.
The set $\{e_i\}_{i\in I}$ is the _standard basis_ of the vector space $\RR^I$.

__Exercise__. _For $x\in\RR^I$ show $x = \sum_{i\in I}x(i) e_i$_.

A _portfolio_ is a linear functional $\xi^*\colon\RR^I\to\RR$ where
$\xi^*(x) = \xi^*x$ is the _cost_ of acquiring the portfolio.
We can identify $\xi^*$ with a vector $\xi\in\RR^I$ where
$\xi^*x = \xi\cdot x = \sum_{i\in I}\xi_i x_i$.

__Exercise__. _Show $\xi(i) = \xi^*(e_i)$_.

_Arbitrage_ exists if there is a portfolio $\xi^*$ with $\xi^*x < 0$
and $\xi^*X(\omega)\ge0$ for $\omega\in\Omega$.
You make money setting up the porfolio and never lose when it is
unwound at the end of the period.
Note this definiton of arbitrage does not depend on a measure.

Even though you make a positive amount with certainty this definition
is not good enough for real world applicaton.
A measure of the amount of capital involved is $|\xi|\cdot |x|$.
If $\xi\cdot x$ is small relative to this then the return on investment
is less attractive.

If $\omega_j\in\Omega$, $D_j > 0$ and $x = \sum_j X(\omega_j) D_j$
then $\xi^*x = \sum_j \xi^* X(\omega_j) D_j \ge 0$ if $\xi^*X\ge0$.
This shows arbitrage does not exist if
$x$ is in the smallest cone containing the range of $X$.

The Fundamental Theorem of Asset Pricing states there is no arbitrage if and only if
$x$ belongs to the smallest closed cone containing the range of $X$.
This is equivalent to saying $x = \int_\Omega X\,dD$ for some positive measure $D$.
We call such a measure $D$ a _numeraire_ for the model.

If the market is incomplete then the _numeraire_ $D$ is not unique.
If $x$ does not belong to the smallest closed cone containing the range of $X$
and $y$ is the closest point in the cone then $\xi = y - x$ is an arbitrage.

If a derivative pays $\phi(X)$ at the end of the period, where $\phi\colon\RR^I\to\RR$
is the payof function, then the value $v$ of the derivative is constrained
by $(x,v)$ must belong to the smallest closed cone containing the range
of $(X,\phi(X))$ so ${v = \int_\Omega \phi(X)\,dD}$ for some numeraire $D$.

If $\Omega = \{\omega_0, \omega_1\}$ has two points and
$I$ has two (independent) intruments then
$x = X(\omega_0) D_0 + X(\omega_1) D_1$ for some $D_0, D_1\in\RR$.
This is called the _binomial model_ and the value of any option is
${v = \phi(X_{i_0}(\omega_0)) D_0 + \phi(X_{i_1}(\omega_1)) D_1}$. Every payoff is
equivalent to a linear payoff in a binomial model.

__Exercise__. _If the model is arbitrage free then $D_0,D_1 \ge 0$_.

If$X_{i_0}, X_{i_1}\in\RR^\Omega$ are
independent for some $i_0,i_1\in I$ then those determine $D_0$ and $D_1$

## Examples

Let $x = (1, s)$ and $X(\omega) = (R, \omega)$ for $\omega\in\Omega = \{L, H\}$.
Solving $x = X(L) D_L + X(H) D_H$ for $D_L,D_H\in\RR$ gives
1 = R D_L + R D_H
s = L D_L + H D_H

H -R
-L R

$D_L = 
