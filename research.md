---
title: Research
---
\renewcommand\AA{\mathcal{A}}
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}

The Black-Scholes/Merton model assumes continuous time trading.
This is an unrealistic artifact of the mathematical theory of Ito processes.
Traders can only make a finite number of transactions to hedge.

Sell side traders need to know when and how much to hedge to minimize their risk
when replicating a deriviative sold to a buy side company.
This short note proposes a generalization of the Markowitz efficient portfolio theory
as a first step in this direction.
See [Simple Unified Model](ross.html) for details.

Consider a European option that pays amount $A_t$ at expiration $t$.
Assume a model with sample space $\Omega$ and filtration $(\AA)_{t\in T}$
of algebras. If $\Omega$ is finite the atoms of an algebra are a partition
of $\Omega$. A function $X\colon\Omega\to\RR$ is $\AA$ measurable if and
only if it is constant on atoms so we can write $X\colon\AA\to\RR$.

We assume market instruments $I$ are available to trade at price
$X_t\colon\AA_t\to\RR^I$ and have no cash flows.
We also assume fixed trading times $0 = t_0 < \cdots < t_n = t$.

Let $\Gamma_j\colon\AA_{t_j}\to\RR^I$ be the number of shares traded
at time $t_j$ and $\Delta_j = \sum_{i < j}\Gamma_i$ be the position
settled by time $t_j$. The value, or mark-to-market is
$V_j = (\Delta_j + \Gamma_j)\cdot X_j$ and the amount showing up
in the trading account is $A_j = -\Gamma_j\cdot X_j$.

As Ross showed, if there is no arbitrage then exist there exist
(not generally unique) positive measures $D_t\in ba(\AA_j)$ for $t\in T$ with
$X_t D_t = X_u D_u|_{\AA_t}$.
A consequence is $V_0 D_0 = (V_t D_t + \sum_{j} A_{j})|_{\AA_0}$.
