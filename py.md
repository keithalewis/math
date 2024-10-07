---
title: Hitting Times
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: 
...

\newcommand\o[1]{\overline{#1}}
\newcommand\u[1]{\underline{#1}}

If $B_t$ is Brownian motion and $\o{B}_t = \max_{0\le s\le t}B_s$ is the running max, then
$$
	E[f(B_t) 1(\o{B}_t > a)] = E[f(B_t) 1(B_t > a)] + E[f(2a - B_t) 1(B_t > a)]
$$

Taking $f(x) = 1$ gives $P(\o{B}_t > a) = 2P(B_t > a)$.

$1 - G(x) = 2(1 - F(x))$, $G(x) = 2F(x) - 1$, $x > 0$.

$g(x) = 2f(x)$, $x > 0$.

Let $\tau_a = \inf\{t > 0\mid \o{B}_t > a\}$ be the first time $B$

Note $\tau_a < t$ if and only if $\o{B}_t > a$.

Recall $E[X] = \int_0^\infty P(X > x)\,dx$ if $X$ is positive.

$P(\min\{\tau_a, T\} > t) = P(\tau_a > t, T > t) = P(\tau_a > t)1(T > t)$

$E[\min\{\tau_a, T\}] = \int_0^T P(\tau_a > t)\,dt$.

Let $X_t = \mu t + \sigma B_t$.

$B_t - \alpha t$ is BM under $P_\alpha$ where $dP_\alpha/dP|_t = \exp(\alpha B_t - \alpha^2t/2)$.

$$
\begin{aligned}
&E[g(X_t) 1(\o{X}_t > a)] \\
\qquad &= E[f(B_t) 1(\max_{0\le s\le t}\mu s + \sigma B_s  > a)] \\
\qquad &= E[\exp(\alpha B_t - \alpha^2t/2) f(B_t - \alpha t)
	1(\max_{0\le s\le t}\mu s + \sigma (B_s - \alpha s)  > a)] \\
\qquad &= E[\exp((\mu/\sigma) B_t - (\mu/\sigma)^2t/2) f(B_t - (\mu/\sigma) t)
	1(\max_{0\le s\le t}\sigma B_s  > a)] \\
\qquad &= E[\exp((\mu/\sigma) B_t - (\mu/\sigma)^2t/2) f(B_t - (\mu/\sigma) t)
	1(\max_{0\le s\le t}B_s  > a/\sigma)] \\
\qquad &= E[h(B_t) 1(\o{B}_t  > a/\sigma)] \\
\qquad &= E[(h(B_t) + h(2a - B_t)) 1(B_t  > a/\sigma)], \\
\end{aligned}
$$
where $f(x) = g(\mu t + \sigma x)$ and $h(x) = \exp((\mu/\sigma) x - (\mu/\sigma)^2t/2) f(x - (\mu/\sigma) t)$.

If $g(x) = 1$ then $f(x) = 1$ and $h(x) = \exp((\mu/\sigma) x - (\mu/\sigma)^2t/2)$.

$$
P(\o{X}_t > a) = E[(\exp((\mu/\sigma) B_t - (\mu/\sigma)^2t/2)
	+ \exp((\mu/\sigma) (2a - B_t) - (\mu/\sigma)^2t/2))1(B_t > a)].
$$
