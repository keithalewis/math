---
title: Optimal Hedging
fleqn: true
classoption: fleqn
---

\newcommand\RR{\boldsymbol{R}}

## Warmup

First exercise in understanding the market $(X,C)$, trading $(\tau,\Gamma)$, and account $(V, A)$ notation.

Assume interest rate is zero, stock price is standard Brownian motion starting at 1, and no dividends.

Let $X_t = (R_t, S_t) = (1, 1 + B_t)$, $C_t = (0, 0)$.

Find the best least square initial hedge for contractual at-the-money
call payoff ${\hat{A}_1 = \max\{S_1, 1\} = 1 + B_1^+}$.

Initial hedge, $\Gamma_0 = (m, n)$ with unwind $\Gamma_1 = -\Gamma_0$.

Amount from unwinding the initial hedge is $A_1 = -\Gamma_1\cdot X_1 = mR_1 + nS_1 = m + n (1 + B_1)$.

Find $\min_{m,n} E[(A_1 - \hat{A}_1)^2] = \min_{m,n} E[(m + n (1 + B_1) - (1 + B_1^+))^2]$.

First order conditions taking derivatives with respect to $m$ and $n$ are
$$
\begin{aligned}
	0 &= E[2(m + n (1 + B_1) - (1 + B_1^+))] \\
	0 &= E[2(m + n (1 + B_1) - (1 + B_1^+))(1 + B_1)] \\
\end{aligned}
$$
so
$$
\begin{aligned}
	E[1 + B_1^+] &= m + n E[1 + B_1] \\
	E[(1 + B_1^+)(1 + B_1)] &= m E[B_1^+] + n E[(1 + B_1)^2] \\
\end{aligned}
$$

Since $E[B_1^+] = 1/\sqrt{2\pi}$, $E[B_1] = 0$,
and $E[(B_1^+)^2] = E[B_1B_1^+] = 1/2$ we have
$$
	\begin{bmatrix}
		1 + 1/\sqrt{2\pi} \\
		1 + 2/\sqrt{2\pi} + 1/2 +  \\
	\end{bmatrix}
	=
	\begin{bmatrix}
		1 & 0 \\
		1/\sqrt{2\pi} & 1/2 \\
	\end{bmatrix}
	\begin{bmatrix}
		m \\
		n \\
	\end{bmatrix}
$$
hence
$$
	\begin{bmatrix}
		m \\
		n \\
	\end{bmatrix}
	= 2
	\begin{bmatrix}
		1/2 & 0 \\
		-1/\sqrt{2\pi} & 1 \\
	\end{bmatrix}
	\begin{bmatrix}
		1/\sqrt{2\pi} \\
		1/2 \\
	\end{bmatrix}
$$
so $m = 1/\sqrt{2\pi} \approx 0.4$ and $n = -1/\pi + 1 \approx 0.68$.

Note $V_0 = \Gamma_0\cdot X_0 = 1/\sqrt{2\pi} = E[B_1^+]$.

In matrix form, minimizing $E[(\Gamma\cdot X - \hat{A})^2]$ has first order condition
${0 = E[2(\Gamma\cdot X - A)X]}$ so $\Gamma = E[XX^*]^{-1}E[AX]$.
