---
title: Note on Optimization
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
...

\newcommand\RR{\boldsymbol{R}}


## One-Period Model

Let $I$ be a set of instruments. The one period model is a vector $x\in\RR^I$, indicating
prices at the begining of the period, and a vector-valued function $X\colon\Omega\to\RR^I$,
where $X(\omega)$ are the prices at the end of the period given $\omega\in\Omega$ occured.
A _portfolio_ is a vector $\xi\in\RR^I$. Its _realized return_ is $R_\xi = \xi'X/\xi'x$
whenever $\xi'x\neq 0$.

Arbitrage exists if there is portfolio $\xi\in\RR^I$ with $\xi'x < 0$ and $\xi'X(\omega)\ge0$
for all $\omega\in\Omega$. The FTAP states there is no arbitrage if and only if
$x$ belongs to the smallest closed cone containing the range of $X$.
If $X$ is bounded, then this is the case if and only if $x = \int_\Omega X(\omega)\,d\pi(\omega)$ for
some positive finitely-additive measure $\pi\in ba(\Omega)$.
Note $\Pi = \pi/\|\pi\|$ is a probability measure. Letting $R = 1/\|\pi\|$ we have
$x = E[X]/R$ under the measure $\Pi$. There may be many such _risk-neutral_ measures.

__Exercise__. _If $\zeta'X = 1$ for some $\zeta\in\RR^I$ then $R_\zeta = R = 1/\|\pi\|$ is constant_.

__Exercise__. _$R_\xi<0$ on $\Omega$ if and only if $\xi$ is an arbitrage portfolio._

### Binomial Model

The binomial model consists of a bond with realized return $R$ over the period and
a stock with initial price $s$ that can take the values $L$ or $H$ at the end of the period.
Let $x = (1, s)$ be the initial prices and $X(\omega) = (R, \omega)$, $\omega\in\{L, H\}$
be the final prices.

__Exercise__. _The model is arbitrage-free if and only if $L \le Rs \le H$_.

## Optimization

In order to perform optimization it is neccesary to specify a, so called, _real world_ probability
measure on $\Omega$. 

__Exercise__. _Show $\max_{\xi\in\RR^I} E[R_\xi]$ is infinity unless $x = cE[X]$ for some scalar $c$_.

If the measure is risk-neutral then every portfolio has the same realized return.

To compute $\max_{\xi\in\RR^I} E[\log R_\xi]$ we can use Lagrange multipliers and maximize
$$
F(\xi,\lambda) = E[\log \xi'X] - \lambda(\xi'x - 1).
$$
The first order condition is
$$
	0 = E[X/\xi'X] - \lambda x.
$$
Since the dimension of $x$ equals the dimension of $\xi$ this has a unique solution in general.

__Exercise__. _Find the optimum for the binomial model_.
