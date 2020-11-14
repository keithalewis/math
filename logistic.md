---
title: Logistic Distribution
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: The logistic distribution
...

The cumulative logistic distribution is $F(x) = 1/(1 + e^{-x})$,
$x\in\mathbf{R}$.
It's density function is $f(x) = e^{-x}/(1 + e^{-x})^2$. Note
$f(x) = \int_0^\infty e^{-x} e^{-\alpha e^{-x}} e^{-\alpha}\,d\alpha$.

The quantile function is $Q(u) = F^{-1}(u) = \log u/(1-u)$.

The moment generating function is $M_X(t) = E e^{tX}
= \Gamma(1 - t)\Gamma(1 + t)$, $-1 < t < 1$.

Using $u = F(x) = 1/(1 + e^{-x})$, so $e^x = u/(1 - u)$
$$
\begin{aligned}
E e^{tX} &= \int_{-\infty}^\infty e^{tx} e^{-x}/(1 + e^{-x})^2\,dx \\
    &= \int_0^1 u^t(1 - u)^{-t}\,du \\
    &= B(1 + t, 1 - t) \\
    &= \Gamma(1 + t)\Gamma(1 - t)/\Gamma(2) \\
    &= \Gamma(1 + t)\Gamma(1 - t)
\end{aligned}
$$

Using $u = F(x) = 1/(1 + e^{-x})$, so $e^x = u/(1 - u)$
$$
\begin{aligned}
\int_{-\infty}^a e^{tx} dF(x)
    &= \int_0^{F(a)} u^t(1 - u)^{-t}\,du \\
    &= B(F(a); 1 + t, 1 - t) \\
\end{aligned}
$$

