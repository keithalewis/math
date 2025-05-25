---
title: Johnson Distribution
author: Keith A. Lewis
---
\newcommand\Var{\operatorname{Var}}

N. L. Johnson considerd how to apply classical statistical techniques involving
normal distributions to almost normal distributions.
Given an almost normal distribution $X$ he looked for transformations of the
form $\gamma + \delta f((X - \xi)/\lambda)$ that would result in a normal distribution,
where $\gamma$, $delta > 0$, $xi$, $\lambda > 0$ are real numbers
and $f$ is function.

If $N = \gamma + \delta f((X - \xi)/\lambda)$ is a normal distribution
then we can adjust $\gamma$ and $\delta$ to make it standard normal.

__Exercise__. _If $\mu = E[N]$ and $\sigma^2 = \Var(N)$
then $\gamma' + \delta' f((X -\xi)/\lambda)$ is standard normal
if $\gamma' = (\gamma - \mu)/\sigma$ and $\delta' = \delta/\sigma$_.

We will use $Z = \gamma + \delta f((X - \xi)/\lambda)$ where $Z$ is
standard normal in what follows. If $f$ is invertable then
$X = \xi + \lambda f^{-1}(Z - \gamma)/\delta$.
