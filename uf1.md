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

The atoms of finance are _holdings_: an _amount_, an _instrument_, and an _entity_.
We write $\alpha = (a, i, e)$ to indicate entity $e$ holds amount
$a\in\ZZ$ of instrument $i$. The amount is an integral multiple of the
minimum trading amount of the instrument.

Every holding $\alpha$ is an element of the cartesian product
$\alpha\in A\times I\times E$ where $A = \ZZ$ is the set of integers,
$I$ is the set of all market instruments, and $E$ is the set of all
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

An _exchange_ occurs when a buyer and seller swap the amounts and instruments of holdings.
If the buyer holds ${\alpha = (a, i, e)}$ and the seller holds ${\alpha' = (a', i', e')}$,
then after the exchage settles the buyer holds ${(a', i', e)}$ and the seller
holds ${(a, i, e')}$.
The _post facto price_ of the exchange is ${X = a'/a}$.
We write ${\chi = (t, \alpha, \alpha')}$ to indicate the exchange
occured at time $t$.

Typically a seller quotes a _pre facto price_ $X$ for some available instrument $i'$ in terms
of a currency $i$. If the buyer wants to acquire $n$ shares of $i'$ they
must give the seller $nX$ units of currency $i$. If $n$ is large, or negative,
the seller will usually adjust their quoted price. They might also adjust
the price based on the buyer.

Exchanges aggregate liquidity providers to offer limit orders to their customers.
The "price" of a market order is determined by the limit orders that
exist at the time of the transaction.

### Transacton

A _transaction_ is a collection of related exchanges. A broker might charge the
buyer, the seller, or both for facilitating an exchange.
If an entity holds an instrument they get all associated cash flows 
proportional to the amount held at the time of the cash flow.
These are related exchanges but usually between the buyer and
the instrument issuer. 

## Valuation


Given a base instrument $i_0$ (usually a currency),
a _price_ function $X\colon I\to\RR$ for one unit of each instrument,
the value of holding ${\alpha = (a, i, e)}$ is $a X(i)$.

Positions are dynamic and change throughout the day, but traders and
risk managers need to get a grip on the _value_, or _mark-to-market_
of a postion at any point in time. This involes nominal trades to convert each instrument
to a base instrument, usually the native currency of the company holding the position.

$(a, i, e) \mapsto (a', e', e)$.

It is necessary to specify a price function to convert 
For instruments trading in a liquid market, it is just a matter of looking at
the current quote. When that luxury is not available it is necessary to 
specify a function 

