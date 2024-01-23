
---
title: Profit and Loss
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: P&L is stochastic integration.
...

Suppose a stock has price $X_t$ at time $t$. If we buy one share of
stock at time $t_0$ the potential profit and loss at time $t > t_0$, or
mark-to-market, is $X_t - X_{t_0}$, assuming we could sell the share
at time $t$ for $X_t$. If we sell the share at
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

This corresponds to the trading strategy buy $\Gamma_0$ at $t_0$ and sell $\Gamma_0$ at $t_1$.
Define $\Gamma_t = \Gamma_0$ if $t = t_0$, $\Gamma_t = -\Gamma_0$ if $t = t_1$, and $\Gamma_t = 0$ otherwise.

__Exercise__. _Show $\Delta_t = \sum_{s < t} \Gamma_s = \Gamma_0 1_{(t_0, t_1]}(t)$_.

This corresponds to the usual trader notion of $\Delta$ (delta) being
the position and $\Gamma$ (gamma) being the change in the position.

Instead of fixed $t_0 < t_1$ we can generalize to _stopping times_ $\tau_0 < \tau_1$.
