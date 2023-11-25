---
title: What is my P&L?
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: It is not just bean counting.
...

Every trader knows about slippage. The price quoted by an exchange is not
necessarly the price at which a trade is executed. Market orders get matched
against limit orders like blocks dropping in tetris. Limit order quantities
get eaten up until the market order is filled. It is also possible other
market orders more limit orders are placed in the meantime.

If you have spent time on a trading floor you have probably
heard a discussion between a trader and a back office person about how
their positions were marked-to-market. Traders care about this very much
because that is used to calculate their profit and loss, but often
don't understand exactly how this is calculated.

The atoms of finance are _positions_: a legal entity owns some amount
of an instrument. Positions change via _transactions_: amounts
and instruments are exchanged at some time between two entities.
A _portfolio_ is a collection of positions belonging to an entity.
The _market_ is the collection of all portfolios.

We can express this using math by a position is an amount, instrument,
and entity: $\pi = (a, i, e)$ and a transaction is the exchange of
positions at some time: $\chi = (t, \pi, \pi')$.
The market ${\{\ldots,(a, i, e),\ldots,(a',i',e'),\ldots\}}$
becomes ${\{\ldots,(a', i', e),\ldots,(a,i,e'),\ldots\}}$
after the transaction.

The _market price_ of this particular transaction is $X = a/a'$.
It is often the case prices are quoted in terms of some native currency.
If Ford has "price" $10.4 per share then $a = 10.4a'$ dollars can be exchanged for
$a'$ shares. 

If $\mathcal{M} = \{\pi_j\}$ is a market define the _net_ amount
of instrument $i$ held by entity $e$ by
$$
	N(i, e) = \sum_{\pi_j = (a_j, i_j, e_j)}\{a_j\mid i = i_j, e = e_j\}.
$$

This is just bean counting of instruments. The tricky thing is to
come up with a way to convert an amount of an instrument into
a price in a native currency in the absence of an actual trade.

To _mark-to-market_ entity $e$ it is necessary to specify a "price" $X(i,i')$ where
$i$ is the native currency.  ...
