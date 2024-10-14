---
title: Hitting Times
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: 
...

\renewcommand\o[1]{\overline{#1}}
\renewcommand\u[1]{\underline{#1}}
\newcommand{\Cov}{\operatorname{Cov}}

If $B_t$ is Brownian motion let $\o{B}_t = \max_{0\le s\le t}B_s$ be the running max.

$$
	E[f(B_t) 1(\o{B}_t > a)] = E[f(B_t) 1(B_t > a)] + E[f(2a - B_t) 1(B_t > a)]
$$

__Proof__. Define the reflected Brownian motions $B_t^a = B_t$ for $t < \tau_a$ and $B_t^a = 2a - B_t$ for $t > \tau_a$.
We have
$$
\begin{aligned}
E[f(B_t) 1(\o{B}_t > a)] &= E[f(B_t) 1(\o{B}_t > a,B_t > a)] + E[f(B_t) 1(\o{B}_t > a,B_t < a)]\\
&= E[f(B_t) 1(B_t > a)] + E[f(B_t) 1(\o{B}_t > a,B_t < a)] \\
&= E[f(B_t) 1(B_t > a)] + E[f(B^a_t) 1(\o{B^a}_t > a,B^a_t < a)] \\
&= E[f(B_t) 1(B_t > a)] + E[f(2a - B_t) 1(\o{B^a}_t > a,2a - B_t < a)] \\
&= E[f(B_t) 1(B_t > a)] + E[f(2a - B_t) 1(\o{B^a}_t > a, B_t > a)] \\
&= E[f(B_t) 1(B_t > a)] + E[f(2a - B_t) 1(B_t > a)] \\
&= E[\bigl(f(B_t) + f(2a - B_t)\bigr) 1(B_t > a)] \\
\end{aligned}
$$

Taking $f(x) = 1$ gives $P(\o{B}_t > a) = 2P(B_t > a)$.

Let $\u{B}_t = \min_{0 \le s \le t} B_s$. $(\u{-B})_t = -\o{B}_t$.

$$
\begin{aligned}
	E[f(B_t) 1(\u{B}_t < a)] &= E[f(-B_t) 1(\u{-B}_t < a)] \\
		&= E[f(-B_t) 1(-\o{B}_t < a)] \\
		&= E[f(-B_t) 1(\o{B}_t > -a)] \\
		&= E[\bigl(f(-B_t) + f(-(-2a - B_t)\bigr) 1(B_t > -a)] \\
		&= E[\bigl(f(-B_t) + f(2a + B_t)\bigr) 1(B_t > -a)] \\
		&= E[\bigl(f(B_t) + f(2a - B_t)\bigr) 1(B_t < a)] \\
\end{aligned}
$$

Taking $f(x) = 1$ gives $P(\u{B}_t < a) = 2P(B_t < a)$.

Let $\tau_a = \inf\{t > 0\mid \u{B}_t < a\}$ be the first time $B_t$ hits level $a < 0$.

Note $\tau_a > t$ if and only if $\u{B}_t < a$.

Recall $E[\tau] = \int_0^\infty P(\tau > t)\,dt$ if $\tau\ge0$.

$P(\min\{\tau_a, T\} > t) = P(\tau_a > t, T > t) = P(\tau_a > t)1(T > t)$

$E[\min\{\tau_a, T\}] = \int_0^T P(\tau_a > t)\,dt$.

Let $X_t = \mu t + \sigma B_t$.

Girsanov's theorem states $B_t - \alpha t$ is BM under $P_\alpha$
where ${dP_\alpha/dP|_t = \exp(\alpha B_t - \alpha^2t/2)}$.
Let $g(x) = f(\mu t + \sigma x)$ and $\alpha = \mu/\sigma$.

$$
\begin{aligned}
E[f(X_t) 1(\u{X}_t < a)] &= E[g(B_t) 1(\min_{0\le s\le t}\mu s + \sigma B_s  < a)] \\
&= E[\exp(\alpha B_t - \alpha^2t/2) g(B_t - \alpha t)
	1(\min_{0\le s\le t}\mu s + \sigma (B_s - \alpha s)  < a)] \\
&= E[\exp((\mu/\sigma) B_t - (\mu/\sigma)^2t/2) g(B_t - (\mu/\sigma) t)
	1(\min_{0\le s\le t}\sigma B_s  < a)] \\
&= E[\exp((\mu/\sigma) B_t - (\mu/\sigma)^2t/2) g(B_t - (\mu/\sigma) t)
	1(\min_{0\le s\le t}B_s  < a/\sigma)] \\
&= E[h(B_t) 1(\u{B}_t  < a/\sigma)] \\
&= E[(h(B_t) + h(2a - B_t)) 1(B_t < a/\sigma)], \\
\end{aligned}
$$
where $h(x) = \exp((\mu/\sigma) x - (\mu/\sigma)^2t/2) g(x - (\mu/\sigma) t)$.

If $f(x) = 1$ then $g(x) = 1$ and $h(x) = \exp((\mu/\sigma) x - (\mu/\sigma)^2t/2)$.

If $f(x) = 1(x < b)$ then $g(x) = 1(\mu t + \sigma x < b)$
and ${h(x) = \exp((\mu/\sigma) x - (\mu/\sigma)^2t/2) 1(\mu t + \sigma (x - (\mu/\sigma) t) < b)}$

$$
P(\u{X}_t < a) = E[\bigl(\exp((\mu/\sigma) B_t - (\mu/\sigma)^2t/2)
	+ \exp((\mu/\sigma) (2a - B_t) - (\mu/\sigma)^2t/2)\bigr)1(B_t < a/\sigma)].
$$

$E[\exp(\alpha B_t - \alpha^2t/2) 1(B_t < a)]
= E[1(B_t + \Cov(\alpha B_t,B_t) < a)]
= P(B_t < a - \alpha t)$.

$E[\exp((\mu/\sigma) B_t - (\mu/\sigma)^2t/2) 1(B_t < a/\sigma)]
= P(B_t < a/\sigma - (\mu/\sigma)t)$.

$E[\exp((\mu/\sigma) (2a - B_t) - (\mu/\sigma)^2t/2) 1(B_t < a/\sigma)]
=\exp(2a\mu/\sigma) P(B_t < a/\sigma + (\mu/\sigma)t)$.

$$
E[\min\{\tau_a,T\}] = \int_0^T P(B_t < a/\sigma - (\mu/\sigma)t)
	+ \exp(2a\mu/\sigma) P(B_t < a/\sigma + (\mu/\sigma)t)\,dt \\
$$

Let $Z$ be standard normal.

$\int_0^T P(Z < a/\sqrt{t} + b\sqrt{t})\,dt$

No closed form solution.

$$
\begin{aligned}
P(B_t < a, \u{B_t} < \u{a}) &= E[1(B_t < a) 1(\u{B_t} < \u{a})] \\
	&= E[(1(B_t < a) + 1(2\u{a} - B_t  < a) 1(B_t < \u{a})] \\
	&= E[(1(B_t < a) 1(B_t < \u{a})] + E[1(2\u{a} - B_t  < a) 1(B_t < \u{a})] \\
	&= P(B_t < \min\{a, \u{a}\}) + P(B_t > 2\u{a} - a, B_t < \u{a}) \\
	&= P(B_t < \min\{a, \u{a}\}) + P(2\u{a} - a < B_t < \u{a}) \\
\end{aligned}
$$

$P(S_t - \u{S}_t > a)$, $S_t = s\exp(\mu t + \sigma B_t - \sigma^2 t/2)$.

$P(X_t - \u{X}_t > a)$, $X_t = x + \mu t + \sigma B_t$.
