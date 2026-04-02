---
classoption: fleqn
header-includes:
- \pagenumbering{gobble}
---

<!--
title: Simple Unified Model
author: Keith A. Lewis
email: kal@kalx.net
-->

# Simple Unified Model

## Market

$X_t$ - prices at time $t$ indexed by instruments  
$C_t$ - discrete cash flows at time $t$ indexed by instruments  
E.g., stock dividends, bond coupons, futures margin adjustments.

## Trading

$(\tau_j, \Gamma_j)$ - times and trades indexed by instruments with $\tau_0 < \cdots < \tau_n$  
$\Delta_t$ - trades accumulate to a position $\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s$  
It takes some time for a trade to settle into a position.

## Accounting

$V_t = (\Delta_t + \Gamma_t)\cdot X_t$ - value (mark-to-market)  at time $t$  
$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$ - amount deposited in trading account at time $t$  

## Arbitrage

Trades $(\tau_j, \Gamma_j)$ with $A_{\tau_0} > 0$, $A_t \ge 0$ for $t > \tau_0$, and $\sum_j \Gamma_j = 0$.

## Fundamental Theorem of Asset Pricing

No arbitrage iff there exist positive, adapted measures $D_t$ with
$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_u D_s)|_{\mathcal{A}_t},
$$
where $\mathcal{A}_t$ is information at time $t$.

With $V_t$ and $A_t$ as above,
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\mathcal{A}_t}.
$$
Values $V_t$ corresponds to prices $X_t$, amounts $A_t$ correspond to cash flows $C_t$.  
**Trading strategies create synthetic market instruments.**

Every arbitrage-free model is parametrized by adapted vector-valued measures $M_t$
where $M_t = M_u|_{\mathcal{A}_t}$, $t \le u$ and
$$
\tag{3}	X_t D_t = X_0 M_t - \sum_{s \le t} C_s D_s.
$$
