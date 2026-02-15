---
title: Hypergeometric Functions
author: Keith A. Lewis
---

Fasten your seatbelt. 

By Taylor's theorem, every sufficiently well-behaved function on the real numbers
has a power series representation $f(x) = \sum_{n=0}^\infty f^{n}(0) x^n/n!$
around $x = 0$, where $f^{n}(x)$ denotes the $n$-th derivative of $f$.
Perhaps the most well-known is the exponential function
with power series representation $\exp(x) = \sum_{n=0}^\infty x^n/n!$.

The generalized hypergeometic series is
$$
	{}_pF_q(a_1,\ldots,a_p;b_1,\ldots,b_q,z)
		= \sum_{n=0}^\infty \frac{(a_1)_n \cdots (a_p)_n}{(b_1)_n \cdots (b_q)_n}\frac{x^n}{n!},
$$
where $(a)_n = a(a + 1)\cdots(a + n - 1)$ is the Pochhammer symbol.
