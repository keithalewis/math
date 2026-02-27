---
title: Simplified Trading
author: Keith A. Lewis
classoption: fleqn
abstract: Market, Trading, Accounting
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}

Trading is buying and selling market instruments that have prices and
cash flows associated with instrument ownership, then accounting for the
values and amounts involved. This note only considers the simple case
where there is perfect liquidity and prices can be any real number.
In actual trading there is a bid-ask spread, depending on whether you
are selling or buying, that tends to increases along with the size of
the trade. Prices can only be integral multiples of the minimum tick
size of the instrument.  We completely ignore credit considerations of
the counterparties involved.

## Market

Instruments $I$ have $\RR^I = \{x\colon I\to\RR\}$[^1] valued prices
$(X_t)_{t\in T}$ and cash flows $(C_t)_{t\in T}$ at trading times
$T$. Only a finite number of cash flows (e.g., stock dividends, bond coupons,
futures margin adjustments) are not zero.

[^1]: Let $\bs{n} = \{1,\ldots,n\}$. The standard definition
$\RR^n = \{(x_1,\ldots,x_n)\mid x_j\in\RR\}$ can be identified with
all functions ${\RR^{\bs{n}} = \{\bs{x}\colon \bs{n}\to\RR\}}$ by $x_i =\bs{x}(i)$, $i\in\bs{n}$.
Here $\RR^n$ is a [cartesian product](https://ncatlab.org/nlab/show/cartesian+product)
of $n$ copies of $\RR$ while while $\RR^{\bs{n}}$ is a
[set exponential](https://ncatlab.org/nlab/show/exponential+object).

## Trading

A trading strategy is a finite number of increasing stopping times
$\tau_0 < \cdots < \tau_n$ and $\RR^I$ valued trades $\Gamma_j$ done at $\tau_j$.
Trades accumulate to positions $\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s$.
Note the strict inequality. It takes some time for trades to settle.

## Accounting

The value (or mark-to-market) of a trading account is the cash value of liquidating existing
positions and trades just done at current market prices:
$V_t = (\Delta_t + \Gamma_t)\cdot X_t$.
The amount appearing at time $t\in T$ in the trading account is all cash flows proportional to
existing position minus the cost of the trades just executed:
$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$.

## Money Market and Stock

We consider the case of a money market instrument and stock $X_t = (R_t, S_t)$.
For simplicity we assume cash flows are zero.
The trade $\Gamma_t = (M_t, N_t)$ is how much of the money market and stock is purchased
at time $t$. We write $\Delta_t = (\backslash M_t, \backslash N_t)$
where backslash is read as [partial sum](https://en.cppreference.com/w/cpp/algorithm/partial_sum.html)
or [scan](https://support.microsoft.com/en-us/office/scan-function-d58dfd11-9969-4439-b2dc-e7062724de29).
The [adjacent difference](https://en.cppreference.com/w/cpp/algorithm/adjacent_difference.html)
of $(x_0,\ldots, x_n)$ is $(x_0, x_1 - x_0, \ldots x_n - x_{n-1})$.

__Excercise__. _Show the partial sum of adjacent differences is the identity function_.

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

There is no activity prior to the first trade. The initial trade of $M$
in the money market and $N$ in the stock costs $MR_0 + NS_0$ and is
equal to the value of the position. When the trades settle the
position becomes $\Delta = (M,N)$ and its value is $MR_t + NS_t$
until the position is closed out by trading $\Gamma = (-M, -N)$.

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

A forward contact on the stock pays $S_1 - f$ at $\tau_1$.
To replicate this using the bond and stock we require $A_1 = S_1 - f = MR_1 + NS_1$.
This is satisfied by taking $N = 1$ and $MR_1 = -f$. The cost of setting
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

For $j > 0$ we have $V_j = (\Gamma_j + \Delta_j)\cdot X_j$ so
the positions should be $\Delta_j + \Gamma_j = dV_j/dX_j$,
the usual delta hedge.
The trades are the adjacent difference of positions.

A trading strategy is _self-financing_ if $A_j = 0$ for $0 < j< n$.
For a bond and stock this is the case when $M_j = -N_jS_j/R_j$.
Given the stock trades $N_j$, $0\le j < n$
then only $M_0$ is still to be determined.
Since $V_0 = M_0 R_0 + N_0 S_0$ we have $M_0 = (V_0 - N_0 S_0)/R_0$.
