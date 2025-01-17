---
title: Optimal Hedging
fleqn: true
classoption: fleqn
---

\newcommand\RR{\boldsymbol{R}}

## Warmup

First exercise in understanding $(X,C)$, $(\tau,\Gamma)$, and $(V, A)$ notation.

Assume interest rate is zero, stock price is standard Brownian motion, and no dividends.

Let $X_t = (1, B_t)$, $C_t = (0, 0)$.

Find the best least square initial hedge for payoff $A_1 = B_1^+ = \max\{B_1,0\}$.

$\Gamma_0 = (\alpha, \beta)$, $\Gamma_1 = -\Gamma_0$.

$A_1 = -\Gamma_1\cdot X_1 = \alpha + \beta B_1$.

Find $\min_{\alpha,\beta} E[(A_1 - B_1^+)^2] = \min_{\alpha,\beta} E[(\alpha + \beta B_1 - B_1^+)^2]$.

First order conditions are
$$
\begin{aligned}
	0 &= E[2(\alpha + \beta B_1 - B_1^+)] \\
	0 &= E[2(\alpha + \beta B_1 - B_1^+)B_1^+] \\
\end{aligned}
$$
so
$$
\begin{aligned}
	E[B_1^+] &= \alpha + \beta E[B_1] \\
	E[(B_1^+)^2] &= \alpha E[B_1^+] + \beta E[B_1 B_1^+] \\
\end{aligned}
$$

Since $E[B_1^+] = 1/\sqrt{2\pi}$, $E[B_1] = 0$,
and $E[(B_1^+)^2] = E[B_1B_1^+] = 1/2$ we have
$$
	\begin{bmatrix}
		1/\sqrt{2\pi} \\
		1/2 \\
	\end{bmatrix}
	=
	\begin{bmatrix}
		1 & 0 \\
		1/\sqrt{2\pi} & 1/2 \\
	\end{bmatrix}
	\begin{bmatrix}
		\alpha \\
		\beta \\
	\end{bmatrix}
$$
so $\alpha = 1/\sqrt{2\pi} \approx 0.4$ and $\beta = 1 - 2/\sqrt{2\pi} \approx 0.2$.

Note $V_0 = \Gamma_0\cdot X_0 = 1/\sqrt{2\pi} = E[B_1^+]$.

In matrix form, minimizing $E[(\Gamma\cdot X - A)^2]$ has first order condition
${0 = E[2(\Gamma\cdot X - A)X]}$ so $\Gamma = E[XX^*]^{-1}E[AX]$.
