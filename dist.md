---
title: Some Distributions
---

Let $X$ have mean 0 and variance 1. Define $\Psi(x,s) = E[e^{sX - \kappa(s)}1(X \le x)]$

If $X$ is normal then $\Psi(x, s) = P(X\le x - s)$.

Let $Y$ be exponential with $P(X > x) = e^{-\lambda x}$.

Since $\int_0^\infty e^{-ax}\,dx = -e^{-ax}/a|_0^\infty = 1/a$
its moment generating function is
$$
\kappa(s) = E[e^{sX}] = \frac{\lambda}{x - \lambda} = (1 - s/\lambda) = \sum_0^\infty (s/\lambda)^n
$$

$\Psi(x, s) = E[e^{sX} 1(X\le x)] = \lambda \int_0^x e^{st} e^{-\lambda t}\,dt$
