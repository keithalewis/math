---
title: Interpolation
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\FF{\mathcal{F}}

Given points $x_i\in X$ and $y_i\in\RR$ find a function
constrained to a subset $\FF\subseteq \{f\colon X\to\RR\}$
with $f(x_i) = y_i$ for all $i\in I$.
If this is not possible, or computationally inconvenient, then
find an approximation $f(x_i)\approx y_i$.

The approximation can be specified by a metric $L_n$ on $Y^n$ and
the problem becomes
$$
	\min_{f\in\FF} L_n((f(x_i) - y_i))}
$$

Two examples: Lagrange polynomial, Gauss least squares.


