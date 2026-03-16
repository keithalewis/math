---
title: Double Exponential Model
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\RR}{𝑹}

The _exponential random variable_ with parameter $\beta > 0$ has
density $f(x) = \beta e^{-\beta x}$, $x \ge 0$.
Since the indefinite integral of $e^{\gamma x}$ is $e^{\gamma x}/\gamma$
we have $\int_0^\infty e^{-\beta x}\,dx = e^{-\beta x}/(-\beta)|_0^\infty = 0 - 1/(-\beta) = 1/\beta$.
This shows $\int_0^\infty f(x)\,dx = 1$ so it is a density function.

Let $f(x) = \alpha e^{-\beta|x|}$, $-\infty < x < \infty$, where $\beta > 0$.
Note $|x| = x$ if $x \ge 0$ and $|x| = -x$ if $x\le 0$.

__Exercise__. _Show $\int_{-\infty}^\infty f(x)\,dx = 1$ implies $\alpha = \beta/2$_.

_Hint_: $\int_{-\infty}^0 e^{\beta x}\,dx = \int_0^\infty e^{-\beta x}\,dx$.


This shows $f(x) = e^{-\beta|x|}\beta/2$, $-\infty < x < \infty$,
is a density function for the _double exponential random variable_ $X$.

The moment generating function of $X$ is $E[e^{sX}]$.

__Exercise__. _Show $E[e^{sX}] = \beta^2/(\beta + s)(\beta - s)$, $s < \beta$_.

_Hint_: Use
$\int_{-\infty}^0 e^{sx} e^{\beta x}\,dx = 1/(\beta + s)$.
and
$\int_0^\infty e^{sx} e^{-\beta x}\,dx = 1/(\beta - s)$, $s < \beta$.


The cumulant of $X$ is the log of the moment generating function
$$
	\kappa(s) = \log E[e^{sX}] = 2\log\beta - \log (\beta + s) - \log(\beta - s).
$$

Note $\kappa(0) = 2\log\beta - \log\beta - \log\beta = 0$, as it should.

__Exercise__. _Show $\kappa'(s) = -1/(\beta + s) + 1/(\beta - s)$, $s < \beta$_.


The mean of $X$ is $\kappa'(0) = -1/\beta + 1/\beta = 0$.

The variance of $X$ is $\kappa''(0)$.

__Exercise__. _Show $\Var(X) = 2/\beta^2$, $s < \beta$_.

This shows $X$ has variance 1 if $\beta = \sqrt{2}$.


Valuing options and their greeks with underlying $F = fe^{sX - \kappa(s)}$,
where $X$ has mean 0 and variance 1, boils down to computing
$$
	\Phi(x,s) = E[e^{sX - \kappa(s)} 1(X \le x)]
$$
and its derivatives with respect to $x$ and $s$.

__Exercise__. _If $x \le 0$ then $\Phi(x, s) = (1 - s/\beta) e^{(s + \beta)x}/2$_.

_Hint_: Use $\int_{-\infty}^x e^{su} e^{\beta u}\,du = e^{(s + \beta)x}/(s + \beta)$ if $x < 0$.


Note $\Phi(0,s) = (1 - s/\beta)/2$.

If $x > 0$ then $\int_0^x e^{su} e^{-\beta u}\,du = e^{(s - \beta)x}/(s - \beta) - 1/(s - \beta)$.

__Exercise__. _If $x \ge 0$ then $\Phi(x, s) = 1 - (1 + s/\beta) e^{(s - \beta)x}/2$, $s < \beta$_.


Note $\Phi(0, s) = 1 - (1 + s/\beta)/2 = (1 - s/\beta)/2$ and  $\lim_{x\to\infty} \Phi(x,s) = 1$.


