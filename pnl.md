
---
title: Profit and Loss
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: P&L is stochastic integration.
...

\newcommand{\sgn}{\mathop{\rm{sgn}}}

We define the profit and loss of a trading strategy.

Suppose a stock has price $X_t$ at time $t$. If we buy one share of
stock at time $t_0$ the potential profit and loss at time $t > t_0$, or
mark-to-market, is $X_t - X_{t_0}$ assuming we could sell the share
at time $t$ for $X_t$. If we actuall sell the share at
time $t_1 > t_0$ the realized profit and loss is $X_{t_1} - X_{t_0}$.
This simple observation corresponds to the mathematical
definition of stochastic integration.

What the math does not accurately reflect is that the "price" $X_t$ is
somewhat nebulous in the absence of an actual transaction. Your brokerage
account will record the exact time, price, and amount of every transaction executed.
Anyone who has ever traded knows the "price" $X_t$ they watch during
trading hours is not necessarily what will ultimately show up in their account.

If $\Delta_t = 1$ when $t_0 < t \le t_1$ and is zero otherwise, then the P&L is
$$
\int_0^t \Delta_s\,dX_s = \int_0^t 1_{(t_0,t_1]}(s)\,dX_s = 
\begin{cases}
0 & t \le t_0 \\
X_t - X_{t_0} & t_0 < t \le t_1 \\
X_{t_1} - X_{t_0} & t > t_1 \\
\end{cases}
$$

Instead of one share, we could buy any number of shares $\Gamma_0$ based on information available at time $t_0$
and sell $\Gamma_0$ shares at time $t_1$.
$$
\int_0^t \Gamma_0 1_{(t_0, t_1]}(s)\,dX_s = 
\begin{cases}
0 & t \le t_0 \\
\Gamma_0(X_t - X_{t_0}) & t_0 < t \le t_1 \\
\Gamma_0(X_{t_1} - X_{t_0}) & t > t_1 \\
\end{cases}
$$

This corresponds to the _elementry_ trading strategy buy $\Gamma_0$ at $t_0$ and sell $\Gamma_0$ at $t_1$.

Instead of fixed times $t_j$ we can generalize to _stopping times_ $\tau_j$.

A _trading strategy_ is a finite number of increasing stopping times
$\tau_0 < \tau_1 < \cdots < \tau_n$ and trades $\Gamma_0, \Gamma_1, \dots, \Gamma_n$
where $\Gamma_j$ is a function of information available at time $\tau_j$
and $\sum_j \Gamma_j = 0$. Every trading strategy must close out.

The _position_ is the accumulation of trades ${\Delta_t = \sum_{\tau_j < t} \Gamma_j}$.
Note the strict inequality. It takes some time for a trade to settle.
We can write this as ${\Gamma_t = \sum_{s<t} \Gamma_s}$ where
${\Gamma_s = \Gamma_j 1(s = \tau_j)}$. Note $\Delta_t$ is a linear combination of
elementary treades and we define the profit and loss at time $t$ by
the stochastic integral
$$
	\int_0^t \Delta_s\,dX_s.
$$

It is possible to incorporate transaction costs by replacing $\Gamma_j$
with, e.g., $\epsilon\sgn(\Gamma_j)) + \Gamma_j$ or
$(1 + \epsilon\sgn(\Gamma_j))\Gamma_j$ where $\epsilon$ is
the absolute or proportional transaction cost respectively and $\sgn(x)$ is the sign of $x$.

<!--

$\Delta (X_j Y_j)
= X_{j+1}Y_{j+1} - X_j Y_j
= X_{j+1}Y_{j+1} - X_{j+1} Y_j + X_{j+1} Y_j - X_j Y_j
= X_{j+1}(Y_{j+1} - Y_j) + (X_{j+1} - X_j) Y_j$

$X_n Y_n - X_0 Y_0 = \sum_0^{n-1} X_{j+1}\Delta Y_j + \Delta X_j Y_j$
 -->
