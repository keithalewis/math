---
title: e
author: Keith A. Lewis
---

The number $e$ is the unique number $a > 0$ satisfying $1 + x \le a^x$ for all $x$.

If $y = a^x$ for some $a > 0$ then its graph meets the line $y = 1 + x$
exactly once if and only if $a = e$.

We can show $e\in[2,3]$ with simple calculations.

__Exercise__. _Show $2^{1/2} > 1 + 1/2$_.

Since $1 + x \le e^x$ we have $1 - x \le e^x$ so
$1+x \le e^x \le 1/(1 - x)$ when $1 - x > 0$.

__Exercise__. _Show $(1 + x/n)^n \le e^x$ for all $x$ and
$e^x \le (1 - x/n)^{-n}$ if $x < 1$_.

Newton's binomial formula is
$$
\begin{aligned}
	(1 + x)^a &= 1 + ax + a(a - 1) x^2/2 + \dots \\
		&= \sum_{k = 0}^\infty (a)_n x^n/n! \\
\end{aligned}
$$
when $|x| < 1$ and $(a)_n = a(a - 1)\cdots(a - n + 1)$
is the (decreasing) Pochhammer symbol.

__Exercise__. _Show $(n)_n = n!$.

__Exercise__. _Show $(m)_n = 0 if $m > n$_.

This gives a lower bound for computing $e^x$:
$$
\begin{aligned}
	e^x &\ge \sum_{k=0}^n n(n - 1)\cdots(n - k + 1)x^k/k! \\
		&= \sum_{k=0}^n C(n,k) x^k
\end{aligned}
$$
where $C(n,k) = n!/(n - k)!k!$ is the number of ways to choose $k$
items from a collection of $n$ items.
