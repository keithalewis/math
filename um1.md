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

Let $T$ be trading times, $I$ the set of all market instruments, and $\Omega$ the sample space of possible outcomes.

_Price_ - market price assuming perfect liquidity
: $X_t\colon\Omega\to\RR^I$, $t\in T$

_Cash flow_ - dividends, coupons, margin adjustments
: $C_t\colon\Omega\to\RR^I$

_Trade_ - shares per instrument based on historical data
: $\Gamma_t = \Gamma((X_s)_{s\le t}, (C_s)_{s\le t})\colon\Omega\to\RR^I$

_Position_ - accumulate trades not including last trade
: $\Delta_t = \sum_{s < t} \Gamma_s$

_Value_ - mark-to-market
: $V_t = (\Delta_t + \Gamma_t)\cdot X_t$

_Account_ - trading account blotter
: $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$

_Arbitrage_ exists if there is a trading stragegy $(\Gamma_t)_{t\in T}$
with $A_0 < 0$ and $A_t \ge 0$, $t > 0$.
