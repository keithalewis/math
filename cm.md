---
title: Carr-Madan Formula
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Payoffs can be replicated with cash, a forward, and a portfolio of puts, and calls
...

\newcommand\RR{\mathbf{R}}

The Carr-Madan formula is
$$
	f(x) = f(a) + f'(a)(x - a) + \int_{-\infty}^a (k - x)^+ f''(k)\,dk
	+ \int_a^\infty (x - k)^+ f''(k)\,dk,
$$
if $f\colon\RR\to\RR$ is twice differentiable.
The import is any sufficiently smooth payoff can be replicated with cash, a forward, and
a portfolio of puts and calls.

This follows from applying the fundamental theorem of calculus twice
$$
\begin{aligned}
	f(x) &= f(a) + \int_a^x f'(y)\,dy \\
	f(x) &= f(a) + \int_a^x (f'(a) + \int_a^y f''(z)\,dz)\,dy \\
	f(x) &= f(a) + f'(a)(x - a) + \int_a^x \int_a^y f''(z)\,dz\,dy \\
	f(x) &= f(a) + f'(a)(x - a) + \int_a^x \int_z^x f''(z)\,dy\,dz \\
	f(x) &= f(a) + f'(a)(x - a) + \int_a^x (x - z) f''(z)\,dz \\
\end{aligned}
$$

If $x > a$ then $\int_a^x (x - z) f''(z)\,dz = \int_a^\infty (x - z)^+ f''(z)\,dz$.

If $x < a$ then
$\int_a^x (x - z) f''(z)\,dz
= -\int_x^a (x - z) f''(z)\,dz
= \int_x^a (z - x) f''(z)\,dz
= \int_{-\infty}^a (z - x)^+ f''(z)\,dz$


If $x > a$ then $(z - x)^+ = 0$ for $z < a$ and if $x < a$ then $(x - z)^+ = 0$ for $z > a$, hence
$$
	\int_a^x (z - x) f''(z)\,dz = \int_{-\infty}^a (z - x)^+ f''(z)\,dz + \int_a^\infty (x - z)^+ f''(z)\,dz.
$$
