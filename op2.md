---
title: Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing and greeks
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\RR}{𝑹}

If an European option on underlying $F$ pays $\nu(F)$ at expiration...

$$
\begin{aligned}
E[(k - F)^+] &= E[(k - F)1(F\le k)] \\
	&= kE[1(F \le k)] - E[F1(F\le k)] \\
	&= kP(F \le k) - E[F]E[F/E[F]1(F\le k)] \\
	&= kP(F \le k) - fP_*(F\le k) \\
\end{aligned}
$$

$E[(k - F)^+] = E[(k - F)1(F\le k)] = (k - f)P(F\le k) - \Cov(F,1(F\le k))$
