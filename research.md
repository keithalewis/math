---
title: Research
---
\renewcommand\AA{\mathcal{A}}
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}

The Black-Scholes/Merton model assumes continuous time trading.
This is an unrealistic artifact of the mathematical theory of Ito processes.
Traders can only make a finite number of transactions.

See [Simple Unified Model](ross.html) for details.

Sell side traders need to know when and how much to hedge in order to minimize risk.

We assume market instruments $I$ are available to trade at price
$X_t\colon\AA_t\to\RR^I$ and have no cash flows.

A (cash settled) derivative specifies payments $\hat{A}_j$ at stopping times $\hat{\tau}_j$.
We wish to find trades
$\Gamma_t\colon\AA_{t}\to\RR^I$ resulting in amounts $A_t = \hat{A}_j$ when $t = \hat{\tau}_j$
and $A_t = 0$ otherwise in order to satisfy the contract.
If a money-market account is available then we can satisfy $A_t = 0$ when $t\not=\tau_j$,
but it is not obvious a self-financing strategy is optimal.

Following Markowitz we define an _efficent_ trading strategy as one that
makes $A_t - \hat{A}_{\tau_j}$ white noise with minimum variance.

