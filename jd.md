---
title: Johnson Distribution
author: Keith A. Lewis
---
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}

N. L. Johnson considered how to apply classical statistical techniques involving
normal distributions to almost normal distributions.
Given an almost normal distribution $X$ he looked for transformations of the
form $\gamma + \delta f((X - \xi)/\lambda)$ that would result in a normal distribution,
where $\gamma$, $delta > 0$, $xi$, $\lambda > 0$ are real numbers
and $f$ is function.

If $N = \gamma + \delta f((X - \xi)/\lambda)$ is normal
then we can adjust $\gamma$ and $\delta$ to make it standard normal.

__Exercise__. _If $\mu = E[N]$ and $\sigma^2 = \Var(N)$
then $\gamma' + \delta' f((X -\xi)/\lambda)$ is standard normal
if $\gamma' = (\gamma - \mu)/\sigma$ and $\delta' = \delta/\sigma$_.

We will use $Z = \gamma + \delta f((X - \xi)/\lambda)$ where $Z$ is
standard normal in what follows. If $f$ is invertable then
$X = \xi + \lambda f^{-1}(Z - \gamma)/\delta$.

To compare with the lognormal model we want to match the first two moments
of $X$ and $F = f\exp(sZ - s^2/2)$. We have $E[F] = f$
and $E[F^2] = f^2\exp(s^2)$. If the first two moments are $m_1$
and $m_2$ then $f = m_1$ and $s^2 = \log(m_2/m_1^2)$.

Johnson's $S_U$ (unbounded) system is ${f(y) = \sinh^{-1}(y) = \log(y + \sqrt{1 + y^2})}$
so ${X = \xi + \lambda \sinh((Z - \gamma)/\delta)}$.
Let ${U = (Z - \gamma)/\delta}$ so ${m = E[U] = - \gamma/\delta}$
and ${s^2 = \Var(U) = 1/\delta^2}$.

We have
$$
\begin{aligned}
E[X] &= E[\xi + \lambda \sinh((Z - \gamma)/\delta)] \\
	&= \xi + \lambda E[\sinh(U)] \\
	&= \xi + \lambda E[\frac{e^U - e^{-U}}{2}] \\
	&= \xi + \lambda \frac{e^{m + s^2/2} - e^{-m + s^2/2}}{2} \\
	&= \xi + \lambda e^{1/2\delta^2} \sinh(- \gamma/\delta) \\
\end{aligned}
$$

For small $\gamma$ and $\delta$ near 1 we have $E[X] \approx \xi - \sqrt{e}\lambda\gamma/\delta$.

Clearly $X\le x$ is equivalent to $Z \le z$ where $z = \gamma + \delta \sinh^{-1}((x - \xi)/\lambda)$.
We have ${P(X\le x) = \Phi(z)}$ where $\Phi$ is the cumulative distribution
of the standard normal.

For share measure we calculate
$$
\begin{aligned}
E[X 1(X\le x)] &= E[(\xi + \lambda \sinh((Z - \gamma)/\delta)) 1(Z\le z)]\\
	&= \xi P(Z\le z) + \lambda E[\sinh(U) 1(Z\le z)]\\
	&= \xi P(Z\le z) + \lambda E[\frac{e^U - e^{-U}}{2} 1(Z\le z)]\\
	&= \xi P(Z\le z) + \frac{\lambda}{2} (E[e^U] P(Z + \Cov(U,Z)\le z) - E[e^{-U}] P(Z - \Cov(U,Z)\le z]))\\
\end{aligned}
$$
Note ${E[e^U] = e^{- \gamma/\delta + 1/2\delta^2}}$,
${E[e^{-U}] = e^{ \gamma)/\delta + 1/2\delta^2}}$,
and ${\Cov(U, Z) = 1/\delta}$.
Letting $z = - \gamma/\delta$ and $s^2 = 1/\delta^2$ we have
$$
E[X 1(X\le x)] = \xi P(Z\le z) + \frac{\lambda e^{s^2/2}}{2}
\left(e^{z}P(Z \le z - s^2\delta) - e^{-z}P(Z \le z + s^2\delta)\right)
$$

Note put forward value is $E[(k - X)^+] = kP(X\le k) - E[X 1(X\le k)]$
so we have a closed form solution for put values using the Johnson distribution.
