---
title: What is my P&L?
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: It is not just bean counting.
...

Every trader knows about slippage. The price quoted by an exchange is not
necessarily the price at which a trade is executed. Market orders get matched
against limit orders like blocks dropping in tetris. Limit order quantities
get eaten up until the market order is filled. If the market order is
larger then the amount of the total of the level 1 limit orders it spills over to
the next best offers by the liquidity provider.
It is also possible other
market orders or limit orders are placed in the meantime.

If you have spent time on a trading floor you have probably
heard a discussion between a trader and a back office person about how
their positions were marked-to-market. Traders care about this very much
because that is used to determine their profit and loss, but they sometimes
don't understand exactly how this is calculated.

This document provides a precise description of how P&L is calculated.

The atoms of finance are _positions_: a legal entity owns some amount
of an instrument. Positions change via _transactions_: amounts
and instruments are exchanged at some time between two entities.
A _portfolio_ is a collection of positions belonging to an entity.
A _market_ is a collection of portfolios.

We can express this using math by a position is an amount, instrument,
and entity: $\pi = (a, i, e)$ and a transaction is the exchange of
positions at some time $t$: $\chi = (t, \pi, \pi')$.
The market ${\{\ldots,(a, i, e),\ldots,(a',i',e'),\ldots\}}$
becomes ${\{\ldots,(a', i', e),\ldots,(a,i,e'),\ldots\}}$
after the transaction.

If $\mathcal{M} = \{\pi_j\}$ is a market define the _net_ amount
of instrument $i$ held by entity $e$ by
$$
	N(i, e) = \sum_{\pi_j = (a_j, i_j, e_j)}\{a_j\mid i_j = i, e_j = e\}.
$$

The _market price_ of a transaction $\chi = (t,\pi,\pi')$ is $X^{i'}_{i} = a'/a$.
To calculate P&L in native currency $i_0$ it is necessary to specify "prices" $X^{i_0}_{i}$ for each
instrument $i$. The position $(a,i,e)$ can, in principal,
be exchanged for $(aX^{i_0}_i, i_0, e_0)$ with some imaginary entity $e_0$.
The _mark-to-market_ in currency $i_0$ for entity $e$ is
$$
	N(e) = \sum_{\pi_j = (a_j, i_j, e_j)}\{a_jX^{i_0}_{i_j}\mid e_j = e\}.
$$
The _profit-and-loss_ over an interval of time is the difference of the mark-to-mark
at the end and beginning of the interval.

It is not controversial to assume $X^{i_0}_{i_0} = 1$ but the other "prices" can be contentious.
If $i$ is exchange traded and liquid then its closing price can be used.
If $i$ is rarely traded then its price is problematic to determine.
Firms often have pricing models for illiquid instruments that everyone agrees to use
in order to prevent heated arguments.

## But that's not all!

If you work in a back office you have to deal with fiddly, but important, details.
It is not as simple as specifying a position as an amount, instrument, and entity.
The amount can be precisely modeled as an integer. Every instrument has a lowest
level of divisibility and trades in an integer multiple of that.

Instruments have [ISIN](https://en.wikipedia.org/wiki/International_Securities_Identification_Number)s
that are supposed to uniquely identify them. If you can afford to pay for them.

There are [LEI](https://en.wikipedia.org/wiki/Legal_Entity_Identifier)s to identify legal entities,
but legal entities have internal subdivisions. The back office has to keep track of
the ever changing portfolio managers.

We have to give names to mathematical concepts, but I always think
in terms of the mathematical concepts. The names are just shorthand.
The fundamental problem of risk management is assessing the risk of
future P&L, where P&L is a stochastic process defined by a model.

In the one-period case the model is a set $I$ of instruments, initial
prices $x \in \RR^I$, a set $\Omega$ of possible outcomes over the period, a
function $X\colon\Omega \to \RR^I$ of final prices given $\omega\in\Omega$ occurred,
and a probability measure $P$ on Omega. P&L is defined by specifying a
portfolio $\xi\in\RR^I$. To be completely rigorous, $\xi$ is in the dual space
of $\RR^I$ with dual pairing $xi^* x = \langle x, xi\rangle = sum_{i\in I} xi_i x_i$.
In this case the stochastic process for the P&L is the number $xi^* x$ at time 0
and the random variable $xi^*X\colon\Omega \to \RR$ at time 1.  What is the "risk"
of the one period model P&L? 

