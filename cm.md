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
the put positions are ${f''(k)\,dk}$ for $0 \le k < a$, and the 
call positions are ${f''(k)\,dk}$ for $k > a$.

By the fundamental theorem of calculus applied twice and Fubini's theorem
$$
\begin{aligned}
	f(x) &= f(a) + \int_a^x f'(y)\,dy \\
	f(x) &= f(a) + \int_a^x (f'(a) + \int_a^y f''(k)\,dk)\,dy \\
	f(x) &= f(a) + f'(a)(x - a) + \int_a^x \int_a^y f''(k)\,dk\,dy \\
	f(x) &= f(a) + f'(a)(x - a) + \int_a^x \int_k^x f''(k)\,dy\,dk \\
	f(x) &= f(a) + f'(a)(x - a) + \int_a^x (x - k) f''(k)\,dk \\
\end{aligned}
$$
If $x > a$ then $(x - k)^+ = 0$ for $k > x$ so
$$
	\int_a^x (x - k) f''(k)\,dk = \int_a^\infty\ (x - k)+ f''(k)\,dk
$$
If $0\le x < a$ then $(k - x)^+ = 0$ for $k < x$ so
$$
\begin{aligned}
	\int_a^x (x - k) f''(k)\,dk &= \int_x^a (k - x) f''(k)\,dk \\
		&= \int_0^a (k - x)^+ f''(k)\,dk.
\end{aligned}
$$

If $f$ is piecewise linear and continuous then $f'$ is piecewise constant and $f''$
is a linear combination of delta functions. If $f(x_i) = y_i$, $0\le i\le n$
then $f'(x) = (y_{i+1} - y_i)/(x_{i + 1} - x_i) = m_i$ is the right derivative
on the interval $[x_i, x_{i+1})$, and the left derivative on $(x_i, x_{i+1}]$, $0\le i < n$.
In both cases $f'(x) = m_0$ if $x < x_0$ and $f'(x) = m_{n-1}$ if $x > x_n$.
The second derivative is $f'' = \sum_{i=1}^{n-1} (m_i - m_{i-1}) \delta_{x_i}$
where $\delta_x$ is a point mass at $x$.

For example, if $(x_0,y_0) = (0, 0)$, $(x_1,y_1) = (1,0)$, $(x_2,y_2) = (2,1)$
$(x_3,x_3) = (3,0)$ and $(x_4,y_4) = (4,0)$ then we have a butterfly spread.
In this case $m_0 = 0$, $m_1 = 1$, $m_2 = -1$ and $m_3 = 0$.
Taking $a = 0$ we have $f(a) = 0$ and $f'(a) = 0$ so there is no cash or forward position.
The Carr-Madan formula indicates to buy $m_1 - m_0 = 1$ call at strike 1,
$m_2 - m_1 = -1 - 1 = -2$ calls at strike 2, and $m_3 - m2 = 1$ call at strike 3.

