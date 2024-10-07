---
title: Unified Finance
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Unified Finance &ndash; holding, exchange, portfolios, trading
...

\newcommand\RR{\bm{R}}
\newcommand\ZZ{\bm{Z}}

The financial world is a big, messy affair. No mathematical theory
or software implementation can accurately model reality.
The best a theory can do is to identify features relevant
to practitioners that can be practically implemented on a computer.

## Holding

The atoms of finance are holdings. A _holding_ is an _amount_, an _instrument_, and an _entity_.
We write $\alpha = (a, i, e)$ to indicate entity $e$ holds amount
$a\in\ZZ$ of instrument $i$. The amount is an integral multiple of the
minimum trading quantity of the instrument.
Holdings are element of the cartesian product
$A\times I\times E$ where $A = \ZZ$ is the set of integers,
$I$ is the set of market instruments, and $E$ is the set of 
entities. The set $I$ can be the set of all instruments
ever traded and $E$ can be all past, current, and future
possible entities. Math let's you think big.

### Cash Flow

Holdings can entail _cash flows_. Stocks have dividends, bonds have coupons,
futures have daily margin adjustments. (Taxes?)

### Position

A _position_ is a (multi)set of holdings $\pi\subseteq A\times I\times E$.
The total amount of instrument $i$ held by entity $e$ is
$$
	A(\pi, i, e) = \sum_{\alpha\in\pi}\{\alpha.a\mid \alpha.i = i, \alpha.e = e\}
$$

This can be implemented as a `positions` table in a database with columns
`amount`, `instrument`, and `entity`.
The above calculation corresponds to the SQL query

```
	SELECT SUM(amount) AS A
	FROM positions
	WHERE instrument = i AND entity = e
```

## Exchange

An _exchange_ occurs when two entities swap the amounts and instruments of their holdings.
Given holdings ${\alpha = (a, i, e)}$ and ${\alpha' = (a', i', e')}$
then, after the exchange settles, the entities hold ${(a', i', e)}$ and
${(a, i, e')}$ respectively.

### Price

Often entity $e$ is a _buyer_ and entity $e'$ is a _seller_.
A buyer decides whether or not to execute the exchange based on the
_price_ offered by the seller.
The _post facto price_ of the exchange is ${X = a'/a}$.
A seller quotes a _pre facto price_ $X$ for instrument $i'$ in terms
of a currency $i$. If the buyer wants to acquire $n$ shares of $i'$ they
must give the seller $nX$ units of currency $i$. If $n$ is large, or negative,
the seller will adjust their quoted price. They might also adjust
the price based on the buyer.

_Financial exchanges_ sign up liquidity providers to supply limit orders.
Each provider offers to buy or sell a fixed amount of some instrument if
there are any takers.
Exchanges make money by charging a fraction of the amount exchanged.
They only care about the volume of trades.

Exchange customers open an account by depositing a _margin_.


The _order book_ shows the total amounts available
to buy or sell at each price level.
They do not make the identity of liquidity
providers available.

The "price" of a market order executed by a customer of the exchange
is determined by the existing limit orders.  The amount of the market
order is matched against limit orders. If the amount of level one orders are
less than the amount of the market order than the trade is matched
against the next level.

We write ${\chi = (t, \alpha, \alpha')}$ to indicate the exchange
occurred at time $t$.

### Transaction

A _transaction_ is a collection of related exchanges. A broker might charge the
buyer, the seller, or both for facilitating an exchange.
If an entity holds an instrument they get all associated cash flows 
proportional to the amount held at the time of the cash flow.
These are related exchanges but usually between the buyer and
the instrument issuer. 

## Valuation

How much is a position worth?
In order to determine that you must
find putative prices for instruments you hold in terms of the
currency used for reporting.
Accountants might use "book," "market," "liquidation,"
or "going concern" values.

Mathematics is agnostic to that important problem.
Given a base instrument (the reporting currency) $i_0$,
a _price_ function $X\colon I\to\RR$ determines the
value of converting instrument $i\in I$ to $i_0$.
