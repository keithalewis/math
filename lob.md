---
title: Limit and Market Orders
author: Keith A. Lewis
---

A _limit order_ $\lambda(t, a, l, e)$
at time $t$ is an offer to buy amount ($a > 0$) or sell ($a < 0$) at level/price $l$
that is provided by a market maker $e$.
The liquidity provider can cancel the order at any time $u > t$.

A _market order_ $\mu(t,a,e)$
at time $t$ causes limit orders to execute execute until amount $a$ is
obtained by market taker $e$.

Limit orders always execute at the specified level, but there is no
guarantee when and if they will be filled.
Market orders execute almost immediately, but there is no
guarantee at what level they will be filled.
It is the Heisenberg Uncertainty Principal of exchanges.

An order book is a collection of limit orders $\{\lambda_j\}$ 
The depth at time $t$ at level $l$ is $D(t,l) = \sum\{a_j\mid t_j < t, l_j = l\}$.
When a market order appears it gobbles up limit orders like in tetris.

If the market order buy amount is $a > 0$ then all limit orders
with $D(t,l) < a$ will be filled, with perhaps a partial fill on the
highest level.

If the market order sell amount is $a < 0$ then all limit orders
with $D(t,l) > a$ will be filled, with perhaps a partial fill on the
lowest level.


