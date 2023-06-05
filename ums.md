---
title: A Unified Model of Derivative Securities
classoption: fleqn
...
\newcommand\RR{\boldsymbol{R}}
\renewcommand\AA{\mathcal{A}}

$T$ — totally ordered set of trading _times_.

$\Omega$ — all possible _outcomes_.

$I$ — market _instruments_.

$\AA_t$ — a partition of $\Omega$ indicating the _information_ available at time $t\in T$.

$X_t\colon\AA_t\to\RR^I$ — _prices_ at time $t$ of market instruments.

$C_t\colon\AA_t\to\RR^I$ — _cash flows_, usually 0, at time $t$ of market instruments.

$(\tau_j, \Gamma_j)$ — a finite _trading strategy_ of strictly increasing stopping
times $\tau_j$ and corresponding trades $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$
with $\sum_j \Gamma_j = 0$.

$\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s$ where
$\Gamma_s = \Gamma_j 1(\tau_j = s)$ — the _position_ resulting from trading.

$V_t = (\Delta_t + \Gamma_t)\cdot X_t$ — the _value_, or mark-to-market, of the strategy.

$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$ — the amount showing up in the trading _account_.

Arbitrage exists if there is a trading strategy with $A_{\tau_0} > 0$ and $A_t \ge0$, $t > \tau_0$.

__Fundamental Theorem of Asset Pricing__. There is no arbitrage if there exist positive
measures $D_t$ on $\AA_t$, $t\in T$, with
$$
	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}, t\le u.
$$

__Lemma__. With the above notation
$$
	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}, t\le u.
$$

Trading strategies create synthetic instruments where price corresponds
to value and cash flow corresponds to account.

Every arbitrage free model has the form
$$
	X_t D_t = M_t - \sum_{s\le t} C_s D_s
$$
where $M_t = M_u|_{\AA_t}$ is a _martingale measure_.
