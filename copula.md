---
title: Copulas
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Copulas are probability measures on unit cubes having uniform marginals
...

Copulas glue together marginal distributions to define joint distributions.

If the random variable $X$ has cumulative distribution function ${F(x) = P(X\le x)}$
then ${F^{-1}(X)}$ is uniformly distributed on the unit interval $[0,1]$.

In the case of two random variables the copula of $X$ and $Y$ is the
joint distribution of $F^{-1}(X)$ and $G^{-1}(Y)$ where
$F$ and $G$ are the cumulative distributions of $X$ and $Y$ respectively:
${C(u,v) = C^{X,Y}(u,v) = P(F^{-1}(X) \le u, G^{-1}(Y) \le v)}$.

__Exercise__: _Show $C(u,v) = H(F(u),G(v))$ where
and $H$ is the joint distribution of $X$ and $Y$ and $F$ and $G$ are the marginal
distributions of $X$, and $Y$ respectively_.

__Exercise__: _Show $H(x,y) = C(F^{-1}(x), G^{-1}(y))$_.

This shows how to use the copula and marginal distributions to recover the joint distribution.

An equivalent definition is a copula is a probability measure on $[0,1]^2$ with uniform
marginals. 

__Exercise__: _Prove this_.

## Fr&#233;chet-Hoeffding Inequality

If $U$ and $V$ are independent, uniformly distributed random variables on the unit interval
then $C(u,v) = P(U\le u, V\le v) = uv$. This corresponds to uniform measure
on the square $[0,1]^2$.

If $V=U$ then their joint distribution is
$$
\begin{aligned}
C(u,v) &= P(U\le u, V\le v) \\
	&= P(U\le u, U\le v) \\
	&= P(U\le \min\{u, v\}) \\
	&= \min\{u,v\} \\
	&= M(u,v)
\end{aligned}
$$
This corresponds to uniform measure on the diagonal from $(0,0)$ to $(1,1)$.

If $V=1-U$ then their joint distribution is
$$
\begin{aligned}
C(u,v) &= P(U\le u, V\le v) \\
	&= P(U\le u, 1-U\le v) \\
	&= P(1-v\le U\le u) \\
	&= \max\{u - (1 -v), 0\} \\
	&= \max\{u + v - 1, 0\} \\
	&= W(u,v)
\end{aligned}
$$
This corresponds to uniform measure on the anti-diagonal from $(0,1)$ to $(1, 0)$.

__Exercise__: (Fr&#233;chet-Hoeffding) For every copula, $C$, $W \le C \le M$.

Hint: For the upper bound use $H(x,y) \le F(x)$ and $H(x,y) \le G(y)$.
For the lower bound note $0\le C(u_1,v_1) - C(u_1, v_2) - C(u_2, v_1) + C(u_2, v_2)$
for $u_1 \ge u_2$ and $v_1 \ge v_2$.

## Examples

Random variables $X$ and $Y$ are independent if and only if their copula is uniform measure on $[0,1]^2$.
To model random variables that are independent near their means but become perfectly correlated
at extreme values we can use, e.g., uniform measure on $[a,b] \times [a,b]$, $0 < a < b < 1$,
and uniform measure the lines from $(0,0)$ to $(a,a)$ and from $(b,b)$ to $(1,1)$ with weights
$w_a$ and $w_b$ such that $w_a + (b - a)^2 + w_b = 1$. Similarly we could model perfect
anti-correlation at extreme values using uniform measure on lines from $(a,b)$ to $(0,1)$
and from $(b,a)$ to $(1, 0)$. (Draw the picture.)

An analytically tractable continuous version is provided by the Plackett copula
$$
	C(u,v;\theta) = \frac{[1 + (\theta-1)(u + v)] - \sqrt{[1 + (\theta - 1)(u + v)]^2 - 4\theta(\theta - 1)uv}}
	                     {2(\theta - 1)},
$$
$\theta > 0$, $\theta\not=1$.
As $\theta\to 1$ we have $C(u,v;\theta)\to uv$.

The partial derivatives $\partial C/\partial u$ and $\partial C/\partial v$ and be inverted in closed
form and be used to generate random variables having the Plackett distribution. [@Pla2018]

Copulas can be generalized to any number of random variables.
A wide class of $n$-dimensional copula are the Archimedean copulas
$$
	C(u_1,\ldots,u_n) = \phi^{-1}(\phi(u_1) + \cdots + \phi(u_n))
$$
where $\phi\colon [0,1]\to [0, \infty)$ is strictly decreasing, convex, with $\phi(1) = 0$.
These also have a simple simulation algorithm.

## References
