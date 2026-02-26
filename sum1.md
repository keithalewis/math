---
title: Elementary Trade
classoption: fleqn
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}

Instruments $I$ have $\RR^I$-valued prices $(X_t)_{t\in T}$ and cash flows $(C_t)_{t\in T}$ at
trading times $T$. Only a finite number of cash flows (stock dividends, bond coupons,
futures margin adjustments) are not zero.

A trading strategy is a finite number of increasing stopping times
$\tau_0 < \cdots < \tau_n$ and $\RR^I$-valued trades $\Gamma_j$ done at $\tau_j$.
Trades accumulate to positions $\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s$.
Note the strict inequality. It takes some time for trades to settle.

The value (or mark-to-market) of a trading account is the cash value of liquidating existing
positions and trades just done at current market prices:
$V_t = (\Delta_t + \Gamma_t)\cdot X_t$.
The amount appearing at time $t\in T$ in the account is all cash flows proportional to
the existing position minus the cost of the trades just executed:
$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$.

We consider the case of a money market instrument and stock $X_t = (R_t, S_t)$.
For simplicity we assume cash flows are zero.
The trade $\Gamma_t = (M_t, N_t)$ is how much of the money market and stock is purchased
at time $t$. We write $\Delta_t = (\backslash M_t, \backslash N_t)$
where backslash is read as scan, the cumulative sum.

An _elementary trade_ is buying $\Gamma$ shares at $\tau_0$ and selling $\Gamma$ shares at $\tau_1 > \tau_0$.
For a bond and a stock $\Gamma_0 = (M, N)$ and $\Gamma_1 = -\Gamma_0 = (-M, -N)$.
Money market accounts never have cash flows. We assume the stock has no divideds
so $C_t = (0,0)$. In this case $A_t = -\Gamma_t\cdot X_t$.

<table>
<colgroup>
<col>
<col>
<col>
<col>
<col>
<col>
<col>
<col style="width:18%">
<col style="width:18%">
</colgroup>
<thead>
<tr>
<td></td>
<td colspan="2">$X$</th>
<td colspan="2">$\Gamma$</th>
<td colspan="2">$\Delta$</th>
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
<td>$R_t$</td>
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
<td>$R_0$</td>
<td>$S_0$</td>
<td>$M$</td>
<td>$N$</td>
<td>$0$</td>
<td>$0$</td>
<td>$MR_0 + NS_0$</td>
<td>$-MR_0 - NS_0$</td>
</tr>
<tr>
<td>$(\tau_0, \tau_1)$</td>
<td>$R_t$</td>
<td>$S_t$</td>
<td>$0$</td>
<td>$0$</td>
<td>$M$</td>
<td>$N$</td>
<td>$MR_t + NS_t$</td>
<td>$0$</td>
</tr>
<tr>
<td>$\tau_1$</td>
<td>$R_1$</td>
<td>$S_1$</td>
<td>$-M$</td>
<td>$-N$</td>
<td>$M$</td>
<td>$N$</td>
<td>$0$</td>
<td>$MR_1 + NS_1$</td>
</tr>
<tr>
<td>$(\tau_1, \infty)$</td>
<td>$R_t$</td>
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

We can eliminate all but the $\tau_j$ rows by replacing the position $\Delta$ column
with $\Delta + \Gamma$, the position that occurs after the trade has settled.

<table>
<colgroup>
<col>
<col>
<col>
<col>
<col>
<col>
<col>
<col style="width:18%">
<col style="width:18%">
</colgroup>
<thead>
<tr>
<td></td>
<td colspan="2">$X$</th>
<td colspan="2">$\Gamma$</th>
<td colspan="2">$\Delta + \Gamma$</th>
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
<td>$\tau_0$</td>
<td>$R_0$</td>
<td>$S_0$</td>
<td>$M$</td>
<td>$N$</td>
<td>$M$</td>
<td>$N$</td>
<td>$MR_0 + NS_0$</td>
<td>$-MR_0 - NS_0$</td>
</tr>
<tr>
<td>$\tau_1$</td>
<td>$R_1$</td>
<td>$S_1$</td>
<td>$-M$</td>
<td>$-N$</td>
<td>$0$</td>
<td>$0$</td>
<td>$0$</td>
<td>$MR_1 + NS_1$</td>
</tr>
</tbody>
</table>

For example, a forward contact on the stock pays $S_1 - f$ at $\tau_1$.
To replicate this using the bond and stock we require $S_1 - f = MR_1 + NS_1$.
This is statisfied by taking $N = 1$ and $MR_1 = -f$. The cost of setting
up this hedge is $A_0 = fR_0/R_1 - S_0$. The initial cost is zero when
$f = S_0R_1/R_0$, which is the standard cost-of-carry formula.

This can be extended to any closed out trading strategy $(\tau_j, \Gamma_j)$ with $\sum_j \Gamma_j = 0$.

<table>
<colgroup>
  <col>
  <col>
  <col>
  <col style="width:12%">   <!-- 4 -->
  <col style="width:12%">   <!-- 5 -->
  <col style="width:11%">
  <col style="width:10%">
  <col style="width:20%">
  <col style="width:20%">
</colgroup>
<thead>
<!--
<tr>
<td></td>
<td colspan="2">$X$</th>
<td colspan="2">$\Gamma$</th>
<td colspan="2">$\Delta + \Gamma$</th>
<td>$(\Delta + \Gamma)\cdot X$</td>
<td>$-\Gamma\cdot X$</td>
</tr>
-->
<tr>
<th>$t$</th>
<th>$R$</th>
<th>$S$</th>
<th>$M$</th>
<th>$N$</th>
<th>$\backslash M$</th>
<th>$\backslash N$</th>
<th>$V$</th>
<th>$A$</th>
</tr>
</thead>
<tbody>
<tr>
<td>$\tau_0$</td>
<td>$R_0$</td>
<td>$S_0$</td>
<td>$M_0$</td>
<td>$N_0$</td>
<td>$M_0$</td>
<td>$N_0$</td>
<td>$R_0 M_0 + N_0 S_0$</td>
<td>$-R_0 M_0 - N_0 S_0$</td>
</tr>
<tr>
<td>$\tau_1$</td>
<td>$R_1$</td>
<td>$S_1$</td>
<td>$M_1$</td>
<td>$N_1$</td>
<td>$M_0 + M_1$</td>
<td>$N_0 + N_1$</td>
<td>$(M_0 + M_1)R_0 + (N_0 + N_1)S_1$</td>
<td>$-M_1 R_1 - N_1 S_1$</td>
</tr>
<tr>
<td>$\cdots$</td>
<td>$\cdots$</td>
<td>$\cdots$</td>
<td>$\cdots$</td>
<td>$\cdots$</td>
<td>$\cdots$</td>
<td>$\cdots$</td>
<td>$\cdots$</td>
<td>$\cdots$</td>
</tr>
<tr>
<td>$\tau_n$</td>
<td>$R_n$</td>
<td>$S_n$</td>
<td>$-\sum_j M_j$</td>
<td>$-\sum_j N_j$</td>
<td>$0$</td>
<td>$0$</td>
<td>$0$</td>
<td>$R_n\sum_j M_j + S_n\sum_j N_j$</td>
</tr>
</tbody>
</table>

A trading strategy is _self-financing_ if $A_j = 0$ for $0 < j< n$.
For a bond and stock this is the case when $M_j = -N_jS_j/R_j$.
If the stock hedges $N_j$, $0\le j < n$ are fixed then
then only $M_0$ is still to be determined.
Since $V_0 = M_0 R_0 + N_0 S_0$ we have $M_0 = (V_0 - N_0 S_0)/R_0$.
For $j > 0$ we have $V_j = (\Gamma_j + \Delta_j)\cdot X_j$ so
$\Gamma_j + \Delta_ = dV_j/d_X_j$, the standard delta hedge.
