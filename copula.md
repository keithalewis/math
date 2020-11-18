---
title: Copulas
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: A copula is a probability measure on unit cubes.
...

Copulas let you glue together marginal distributions to get joint distributions.
If the random variable $X$ has cumulative distribution function $F(x) = P(X\le x)$
then $F^{-1}(X)$ is uniformly distributed on the unit interval $[0,1]$.
Given random variables $X_i$, $1\le i\le n$, with cdfs $F_i$ and a measure $C$ on the
unit cube $[0,1]^n$ the we can define a joint distribution
$P(X_1\le x_1, \ldots, X_n\le x_n) = C(F_1^{-1}(x_1), \ldots F_n^{-1}(x_n))$
where $C(u_1, \ldots, u_n)$ is the measure of $[0,u_1]\times\cdots\times [0,u_n]$.

In the case of two random variables the copula of $X$ and $Y$ is the
joint distribution of $F^{-1}(X)$ and $G^{-1}(Y)$ where
$F$ and $G$ are the cumulative distributions of $X$ and $Y$ respectively:
$C(u,v) = C^{X,Y}(u,v) = P(F^{-1}(X) \le u, G^{-1}(Y) \le v)$.

__Exercise__: _Show $C(u,v) = H(F(u),G(v))$ where
and $H$ is the joint distribution of $X$ and $Y$ and $F$ and $G$ are the marginal
distributions of $X$, and $Y$_.

__Exercise__: _Show $H(x,y) = C(F^{-1}(x), G^{-1}(y))$_.

This shows how to use the copula and marginal distributions to recover the joint distribution.

An equivalent definition is a copula is that it is a probability measure on $[0,1]^2$ with uniform
marginals. 

__Exercise__: _Prove this_.

## Fr&#233;chet-Hoeffding Inequality

If $U$ and $V$ are independent, uniformly distributed random variables on the unit interval
then $C(u,v) = uv$.

If $V=U$ then their joint distribution is
$C(u,v) = P(U\le u, V\le v) = P(U\le u, U\le v) = P(U\le \min\{u, v\}) = \min\{u,v\} = M(u,v)$.

If $V=1-U$ then their joint distribution is $C(u,v) = P(U\le u, V\le v) = P(U\le u, 1-U\le v)
= P(1-v\le U\le u) = \max\{u - (1 -v), 0\} = \max\{u + v - 1, 0\} = W(u,v)$

__Exercise__: (Fr&#233;chet-Hoeffding) For every copula, $C$, $W \le C \le M$.

Hint: For the upper bound use $H(x,y) \le F(x)$ and $H(x,y) \le G(y)$.
For the lower bound note $0\le C(u_1,v_1) - C(u_1, v_2) - C(u_2, v_1) + C(u_2, v_2)$
for $u_1 \ge u_2$ and $v_1 \ge v_2$.

