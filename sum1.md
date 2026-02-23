---
title: Elementary Trade
classoption: fleqn
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}

Instruments $I$ have $\RR^I$-valued prices $(X_t)_{t\in T}$, cash flows $(C_t)_{t\in T}$ at
trading times $T$. Only a finite number of cash flows (stock dividends, bond coupons,
futures margin adjustments) are not zero.

A trading strategy is a finite number of increasing stopping times
$\tau_0 < \cdots < \tau_n$ and $\RR^I$-valued trades $\Gamma_j$ done at $\tau_j$.
Trades accumulate to positions $\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s$.
Note the strict inequality. It takes some time for trades to settle.

The value (or mark-to-market) of a trading account is the cash value of liquidating existing
positions and trades just done at current market values:
$V_t = (\Delta_t + \Gamma_t)\cdot X_t$.
The amount appearing at time $t\in T$ in the account is all cash flows proportional to
the existing position minus the cost of the trade:
$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$.

We consider the case of a money market instrument and stock $X_t = (R_t, S_t)$.
For simplicity we also assume rates are zero so $R_t = 1$ and cash flows are zero.
The trade $\Gamma_t = (M_t, N_t)$ is how much of the money market and stock is purchased
at time $t$. We write $\Delta_t = (\backslash M_t, \backslash N_t)$
where backslash is read as scan, the cumulative sum.

An _elementary trade_ is buying $\Gamma$ shares at $\tau_0$ and selling $\Gamma$ shares at $\tau_1 > \tau_0$.
For a bond and a stock $\Gamma_0 = (M, N)$ and $\Gamma_1 = -\Gamma_0 = (-M, -N)$.
Money market accounts never have cash flows. We assume the stock has no divideds
so $C_t = (0,0)$. In this case $A_t = -\Gamma_t\cdot X_t$.

<table>
<thead>
<tr>
<td></td>
<td colspan="2">$X$</th>
<td colspan="2">$\Gamma$</th>
<td colspan="2">$\Delta = \backslash\Gamma$</th>
<td>$(\Delta + \Gamma)\cdot X$</td>
<td>$-\Gamma\cdot X$</td>
</tr>
<tr>
<td>$t$</td>
<td>$R$</td>
<td>$S$</td>
<td>$M$</td>
<td>$N$</td>
<td>$\backslash M$</td>
<td>$\backslash N$</td>
<td>$V$</td>
<td>$A$</td>
</tr>
</thead>
<tbody>
<tr>
<td>$[0, \tau_0)$</td>
<td>$1$</td>
<td>$S_t$</td>
<td>$0$</td>
<td>$0$</td>
<td>$0$</td>
<td>$0$</td>
<td>$0$</td>
<td>$0$</td>
</tr>
<tr>
<td>$\tau_0$</td>
<td>$1$</td>
<td>$S_0$</td>
<td>$M$</td>
<td>$N$</td>
<td>$0$</td>
<td>$0$</td>
<td>$M + NS_0$</td>
<td>$-M - NS_0$</td>
</tr>
<tr>
<td>$(\tau_0, \tau_1)$</td>
<td>$1$</td>
<td>$S_t$</td>
<td>$0$</td>
<td>$0$</td>
<td>$M$</td>
<td>$N$</td>
<td>$M + NS_t$</td>
<td>$0$</td>
</tr>
<tr>
<td>$\tau_1$</td>
<td>$1$</td>
<td>$S_1$</td>
<td>$-M$</td>
<td>$-N$</td>
<td>$M$</td>
<td>$N$</td>
<td>$0$</td>
<td>$M + NS_1$</td>
</tr>
<tr>
<td>$(\tau_1, \infty)$</td>
<td>$1$</td>
<td>$S_t$</td>
<td>$0$</td>
<td>$0$</td>
<td>$0$</td>
<td>$0$</td>
<td>$0$</td>
<td>$0$</td>
</tr>
</tbody>
</table>

If we let $M = -NS_0$ then the trading account has zero amount at $\tau_0$
and profit and loss $-NS_0 + NS_t = N(S_t - S_0)$ at $\tau_1$.
