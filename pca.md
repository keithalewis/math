---
title: Principal Component Analysis
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Cloud summarizing
...

\newcommand\RR{\bm{R}}

Given a cloud of vectors $S = \{x_1,\ldots,x_m\}$ in $\RR^n$ what single vector
"best" represents the location of the cloud?
If $m = 1$ then obviously $\bar{x}_1 = x_1$ is the solution to this.
If $m = 2$ then the solution $\bar{x}_1 = (x_1 + x_2)/2$ seems
to be a likely candidate.
In general we might suspect the average $\bar{x}_1 = \sum_{j=1}^m x_j/m$
is the best representation of location.

Define the _size_ of $S$ by $\|S\|^2 = \sum_i \|x_i\|^2.
Given $x\in\RR^n$ define the projection along $x$ by $P_xy = y - x\cdot y/\|x\|^2$.
Note $P_x x = 0$ and $P_x y = y$ if $x\cdot y = 0$.
The _principal component_ of $S$ is the value of $x$ that minimizes the size of $P_xS$.
The _reduction_ is $R_x = \|S\|^2 - \|P_xS\|^2.

Define $\Sigma^2 = (1/m)\sum x_j x_j^*$. Since $\Sigma^2$ is symmetric and positive,
it has a _spectral decomomposition_ $\Sigma^2 = \sum_j \sigma_j^2 e_j e_j^*$
where $(e_j)$ are orthonormal. Assume $\sigma_j$ are in non-increasing order.

What are the principle components of $\{B_t(\omega)\mid 0\le t\le 1, \omega\in C(0,1)\}$?

$\Sigma^2\colon L^2[0,1]\to L^2[0,1]$ by $\Sigma^2f(x) = \int_0^2 B_t(x)B_t(y)f(y)\,dy$.
