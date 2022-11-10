---
title: Ho-Lee
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Normal short rate.
...

\newcommand\mb[1]{\mathbf{#1}}
\newcommand{\Var}{\operatorname{Var}}

The Ho-Lee model assumes the stochastic short rate process is 
$f_t = r + \sigma B_t$ where $r$ and $\sigma$ are constant
and $B_t$ is standard Brownian motion.

The stochastic discount is $D_t = \exp(-\int_0^t f_s\,ds) = 
\exp(-\int_0^t r + \sigma B_s\,ds) = \exp(-rt - \sigma\int_0^t B_s\,ds)$.

__Exercise__. _Show $\int_0^t B_s\,ds = t B_t - \int_0^t s dB_s$_.

_Hint_: $d(t B_t) = B_t\,dt + t dB_t$ since $dt\,dB = 0$.

This shows $D_t = \exp(-rt - \sigma tB_t + \sigma \int_0^t s\,dB_s)$.

__Exercise__. _If $dX_t/X_t = \Sigma(t)\,dB_t$ and $X_0 = 1$ then
$X_t = \exp(-\frac{1}{2}\int_0^t \Sigma(s)^2\,ds + \int_0^t \Sigma(s)\,dB_s)$_.

_Hint_: $d\log X_t = (1/X_t)\,dX_t + \frac{1}{2}(-1/X_t^2)\,dX_t^2 = \Sigma(t)\,dB_t - \frac{1}{2}\Sigma(t)^2\,dt$
by Ito's formula.

__Exercise__. _Show $E_t[\exp(\int_t^u \Sigma(s)\,dB_s)] = \exp(\frac{1}{2}\int_t^u \Sigma(s)^2\,ds)$_.

_Hint_: $X_t$ is a martingale. Note the right-hand side is not random.

The price at time $t$ of a zero coupon bond maturing at time $u$, $D_t(u)$,
satisfies $D_t(u)D_t = E_t[D_u]$ so

$$
\begin{aligned}
D_t(u) &= E_t[D_u/D_t] \\
	&= E_t[\exp(-r(u - t) - \sigma (u B_u - t B_t) + \int_t^u \sigma s\,dB_s)] \\
	&= E_t[\exp(-r(u - t) - \sigma (u B_u - u B_t + u B_t - t B_t) + \int_t^u \sigma s\,dB_s)] \\
	&= E_t[\exp(-r(u - t) - \sigma u \int_t^u\,dB_s + \sigma(u - t) B_t + \int_t^u \sigma s\,dB_s)] \\
	&= E_t[\exp(-r(u - t) + \sigma(u - t) B_t + \int_t^u \sigma(s - u)\,dB_s)] \\
	&= \exp(-r(u - t) + \sigma(u - t) B_t + \frac{1}{2}\int_t^u \sigma^2(s - u)^2\,ds) \\
\end{aligned}
$$

__Exercise__. _Show $\int_t^u (s - u)^2\,ds = (u - t)^3/3$_.

In the Ho-Lee model the dynamics of zero coupon bond prices are
$$
	D_t(u) = \exp(-r(u - t) + \frac{1}{6}\sigma^2(u - t)^3 + \sigma(u - t) B_t).
$$
In particular, the discount to time $t$ is $D(t) = D_0(t) = \exp(-rt + \sigma^2 t^3/6)$.

__Exercise__. _Show the forward curve is $f(t) = r - \sigma^2 t^2/2$_.

_Hint_: $D(t) = \exp(-\int_0^t f(s)\,ds)$.

Define the _forward forward_ curve at time $t$, $f_t(u)$, by $D_t(u) = \exp(-\int_t^u f_t(s)\,ds)$.

__Exercise__. _Show $f_t(u) = r - \sigma^2 (u - t)^2/2 + \sigma B_t$_.

