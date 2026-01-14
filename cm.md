---
title: Carr-Madan Formula
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option payoffs can be replicated with cash, a forward, and a portfolio of puts, and calls
...

\newcommand\RR{\mathbf{R}}

The Carr-Madan formula is
$$
	f(x) = f(a) + f'(a)(x - a) + \int_0^a (k - x)^+ f''(k)\,dk
	+ \int_a^\infty (x - k)^+ f''(k)\,dk
$$
for $f\colon[0,\infty)\to\RR$ when $f''$ is integrable and $x,a\ge0$.

A European option paying $f(x)$ when $x$ is the price of the underlying
at expiration can be replicated using cash, a forward, puts with
strikes below $a$ and calls with strikes above $a$.

The cash position is $f(a)$, the forward with strike $a$ position is $f'(a)$,
the put positions are ${f''(k)\,dk}$ for $0 <= k < a$, and the 
call positions are ${f''(k)\,dk}$ for $k > a$.

By the fundamental theorem of calculus applied twice and Fubini's theorem
$$
\begin{aligned}
	f(x) &= f(a) + \int_a^x f'(y)\,dy \\
	f(x) &= f(a) + \int_a^x (f'(a) + \int_a^y f''(z)\,dz)\,dy \\
	f(x) &= f(a) + f'(a)(x - a) + \int_a^x \int_a^y f''(z)\,dz\,dy \\
	f(x) &= f(a) + f'(a)(x - a) + \int_a^x \int_z^x f''(z)\,dy\,dz \\
	f(x) &= f(a) + f'(a)(x - a) + \int_a^x (x - z) f''(z)\,dz. \\
\end{aligned}
$$
If $x > a$ then $1(z > a)(x - z) = \max\{x - z, 0\}$

If $0\le x < a$ then $x - z = \min\{


$\int_a^x (x - z) f''(z)\,dz = \int_a^\infty (x - z)^+ f''(z)\,dz$.



If $x > a$ then $(z - x)^+ = 0$ for $z < a$ and if $x < a$ then $(x - z)^+ = 0$ for $z > a$, hence
$$
	\int_a^x (z - x) f''(z)\,dz = \int_{-\infty}^a (z - x)^+ f''(z)\,dz + \int_a^\infty (x - z)^+ f''(z)\,dz.
$$

If $f$ is piecewise linear and continuous then $f'$ is piecewise constant and $f''$
is a linear combination of delta functions.

