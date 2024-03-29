---
title: Unified Model for Derivative Instruments
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Value, hedge, and manage the risk of any instruments
...

\newcommand{\RR}{\boldsymbol{R}}
\renewcommand{\AA}{{\mathcal{A}}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

Let $T$ be trading times, $I$ the set of all market instruments, $\Omega$ the sample space of possible outcomes,
and $(A_t)_{t\in T}$ be algebras of sets on $\Omega$ indicating the information available at each trading time.

_Price_ - market price assuming perfect liquidity
: $X_t\colon\AA_t\to\RR^I$

_Cash flow_ - dividends, coupons, margin adjustments for futures
: $C_t\colon\AA_t\to\RR^I$

_Trading Strategy_ - increasing stopping times
: $\tau_0 < \cdots < \tau_n$ and trades $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$

_Position_ - accumulate trades not including last trade
: $\Delta_t = \sum_{\tau_j < t}\Gamma_j = \sum_{s < t} \Gamma_s$

_Value_ - mark-to-market including last trade
: $V_t = (\Delta_t + \Gamma_t)\cdot X_t$

_Account_ - trading account blotter
: $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$

_Arbitrage_ exists if there is a trading strategy
with $A_{\tau_0} > 0$, $A_t \ge 0$, $t > \tau_0$, and $\sum_{j} \Gamma_j = 0$.

The Fundamental Theorem of Asset Pricing states there is no arbitrage if and only
if there exist positive measures $D_t\colon\AA_t\to(0,\infty)$, ${t\in T}$ on $\Omega$ with
$$
	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}
$$

__Lemma__. For any arbitrage free model and any trading strategy
$$
	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}
$$

__Lemma__. If $X_t D_t = M_t - \sum_{s\le t} C_s D_s$ where $M_t = M_u|_{\AA_t}$, $t \le u$,
then there is no arbitrage.
