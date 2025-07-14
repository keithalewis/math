---
title: Johnson Distribution
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand\Var{\operatorname{Var}}
\newcommand\Cov{\operatorname{Cov}}

N. L. Johnson considered how to apply classical statistical techniques involving
normal distributions to almost normal distributions.
Given an almost normal distribution $X$ he looked for transformations of the
form $\gamma + \delta f((X - \xi)/\lambda)$ that would result in a normal distribution,
where $\gamma$, $\delta$, $\xi$, $\lambda$ are real numbers
and $f$ is function. We assume $\delta$ and $\lambda$ are positive

If $N = \gamma + \delta f((X - \xi)/\lambda)$ is normal
then we can adjust $\gamma$ and $\delta$ to make it standard normal.

__Exercise__. _If $\mu = E[N]$ and $\sigma^2 = \Var(N)$
then $\gamma' + \delta' f((X -\xi)/\lambda)$ is standard normal
if $\gamma' = (\gamma - \mu)/\sigma$ and $\delta' = \delta/\sigma$_.

We will use $Z = \gamma + \delta f((X - \xi)/\lambda)$ where $Z$ is
standard normal in what follows. If $f$ is invertable then
$X = \xi + \lambda f^{-1}((Z - \gamma)/\delta)$.

Johnson's $S_U$ (unbounded) system is ${f(y) = \sinh^{-1}(y) = \log(y + \sqrt{1 + y^2})}$
so ${X = \xi + \lambda \sinh((Z - \gamma)/\delta) = \xi + \lambda \sinh(U)]}$
where ${U = (Z - \gamma)/\delta}$.
Since $E[e^N] = e^{E[N] + \Var(N)/2}$ for any normally distributed $N$ we have
$$
E[\sinh U] = E[(e^U - e^{-U})/2] = (e^{E[U] + \Var(U)/2} - e^{-E[U] + \Var(U)/2})/2 = e^{\Var(U)/2}\sinh E[U]
$$

In terms of the Johnson parameters $E[\sinh U] = e^{1/2\delta^2}\sinh(-\gamma/\delta)$.
Note this only depends on $\gamma$ and $\delta$.

The expected value of $X$ is $E[X] = E[\xi + \lambda \sinh(U)]$.
For small $\gamma$ and $\delta$ near 1 we have $E[X] \approx \xi - \sqrt{e}\lambda\gamma$.

Clearly $X\le x$ is equivalent to $Z \le z$ where $z = \gamma + \delta \sinh^{-1}((x - \xi)/\lambda)$.
We have ${P(X\le x) = \Phi(z)}$ where $\Phi$ is the standard normal cumulative distribution.

Recall for $N$ and $M$ jointly normal we have
$E[e^N f(M)] = E[e^N] E[f(M + \Cov(M,N))]$.
For share measure we calculate

$$
\begin{aligned}
E[X 1(X\le x)] &= E[(\xi + \lambda \sinh(U) 1(Z\le z)] \\
	&= \xi P(Z\le z) + \lambda E[\sinh(U) 1(Z\le z)] \\
	&= \xi P(X\le x) + \lambda E[\frac{e^U - e^{-U}}{2} 1(Z\le z)] \\
	&= \xi P(X\le x) + \frac{\lambda}{2} (E[e^U] P(Z + \Cov(U,Z)\le z) - E[e^{-U}] P(Z - \Cov(U,Z)\le z])) \\
\end{aligned}
$$

Since ${\Cov(U, Z) = 1/\delta}$

$$
E[X 1(X\le x)] = \xi P(X\le x) + \frac{\lambda e^{\Var(U)/2}}{2}
\left(e^{E[U]}\Phi(z - 1/\delta) - e^{-E[U]}\Phi(z + 1/\delta)\right)
$$

Note the put forward value is $E[(k - X)^+] = kP(X\le k) - E[X 1(X\le k)]$
so we have a closed form solution for put values using the Johnson distribution.

To compute the second moment of $X$ we will need
$$
\begin{aligned}
E[\sinh^2(U)] &= E[((e^U - e^{-U})/2)^2] \\
	&= E[(e^{2U} - 2 + e^{-2U})]/4 \\
	&= (e^{-2\gamma/\delta + 2/\delta^2} - 2 + e^{2\gamma/\delta + 2/\delta^2})/4 \\
	&= e^{2/\delta^2}\cosh(2\gamma/\delta)/2 - 1/2 \\
\end{aligned}
$$
Note $E[\sinh^2(U)]$ does not depend on $\xi$ and $\lambda$.

The second moment of $X$ is
$$
\begin{aligned}
E[X^2] &= E[(\xi + \lambda \sinh(U))^2] \\
	&= \xi^2 + 2\xi\lambda E[\sinh(U)] + \lambda^2 E[\sinh^2(U)] \\
\end{aligned}
$$

To compare with the lognormal model we want to match the first two moments
of $X$ and $F = f\exp(\sigma\sqrt{t} Z - \sigma^2t/2)$. We have $E[F] = f$
and $E[F^2] = f^2\exp(\sigma^2 t)$.

Consider $\gamma$ and $\delta$ as given input parameters corresponding to
skew and kertosis respectively. Given $f (= se^{rt})$ and $\sigma$ we want
$$
\begin{aligned}
f &= \xi + \lambda E[\sinh(U)] \\
f^2\exp(\sigma^2 t) &= \xi^2 + 2\xi\lambda E[\sinh(U)] + \lambda^2 E[\sinh^2(U)] \\
\end{aligned}
$$
Substituting ${\xi = f - \lambda E[\sinh(U)]}$
and using $u_n = E[\sinh^n(U)]$
gives
a quadratic expression in $\lambda$
$$
\begin{aligned}
f^2\exp(\sigma^2 t) &= (f - \lambda u_1)^2 + 2(f - \lambda u_1)\lambda u_1 + \lambda^2 u_2 \\
f^2\exp(\sigma^2 t) &=
	f^2 - 2f\lambda u_1 + \lambda^2 u_1^2
	+ 2f\lambda u_1 - 2\lambda^2 u_1^2
	+ \lambda^2 u_2 \\
f^2\exp(\sigma^2 t) &= (u_2 - u_1^2)\lambda^2 + f^2 \\
\end{aligned}
$$
This implies $\lambda = \sqrt{(u_2 - u_1^2)/\Var(F)}$.
