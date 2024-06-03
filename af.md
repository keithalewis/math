---
title: Atomic Finance
author: Keith A. Lewis
classoption: fleqn
---
\newcommand\ZZ{\bm{Z}}

There is an inevitable trajectory in the financial world toward more data,
faster calculations, and increasing complexity.

The atoms of finance are holdings: an amount, instrument, and the owner of the holding.
Holding an instrument often entails auxiliary cash flows for the owner.
A buyer can exchange the amount and instrument of their holding with that of a seller. 
The price of the exchange is the ratio of buyer amount to seller amount.
A portfolio is a collection of holdings. Portfolios evolve over time via exchanges.
A transaction is a collection of associated exchanges.

## Holding

Let $I$ be the set of all market instruments and $O$ the set of all
(potential) instrument owners.  A _holding_ is a triple
$$
	h = (a, i, o)
$$
where $i\in I$ is an instrument, $o\in O$ is the instrument owner, and
$a\in\ZZ$ is the amount as an integer multiple of the minimal trading
increment of the instrument.  Holdings can entail cash flows such as,
stock dividends, bond coupons,
futures margin adjustments, broker fees, and taxes.

## Exchange

Let $T$ be the set of all trading times.  Holdings interact via an
_exchange_: a triple 
$$
	\chi = (t, h, h')
$$
where $t\in T$, $h = (a,i,o)$
is the _buyer_ holding, and $h'=(a',i',o')$ is the _seller_ holding. The
_price_ of an exchange is $X = X_{i'}^i = a/a'$.  Sellers quote a price $X$ and
buyers decide if they want to trade at time $t$ amount $a'X$ of instrument
$i$ they hold for amount $a'$ of instrument $i'$ the seller holds.
An instrument is _fungible_ if $(a, i, o)$ can be split into
$(b, i, o)$ and $(a - b, i, o)$ when $0 < b < a$. Cash is fungible.
An instrument is a _numeraire_ if it has no cash flows. Cash is a numeraire.

For example, if a buyer holds 8 dollars and a seller holds 2 shares of
Ford stock and quotes a price of 4 dollars per share then the buyer can
acquire two shares of F for $8$ dollars. If the buyer wants to short two
shares of Ford the seller will most like quote a price higher than $4$
per share.

## Portfolio

A _portfolio_ is a collection of holdings. Exchanges act on portfolios.
A portfolio ${\{\ldots,(a,i,o),\ldots,(a',i',o'), \ldots\}}$ at time $t$
becomes ${\{\ldots,(a',i',o),\ldots,(a,i,o'), \ldots\}}$ after the exchange
$\chi = (t,h,h')$ at time $t$ settles.
$$
	\{\ldots,(a,i,o),\ldots,(a',i',o'), \ldots\}\overset{\chi}{\to}\{\ldots,(a',i',o),\ldots,(a,i,o'), \ldots\}
$$

A _transaction_ is a set of related exchanges, for example an exchange
may involve a broker fee or tax payment.

## Value

Given a portfolio the _value_ of instrument $i$ held by owner $o$ is
$$
	N(o, i) = \sum_h \{a\mid h = (a, i, o)\}
$$
for $h$ in the portfolio.

The _mark-to-market_ of a position in a cash numeraire $i_0$ requires
specifying putative prices $X^i_{i_0}$ for $i\in I$. 
make imaginary exchanges of $(a'X^i_{i_0}, i, o)$ for $(a', i', o')$

## Remarks

Mathematics allows you to think big. We can let $I$ be all market instruments
that exist now, in the past, or potentially in the future.

It is quite common for owners to have different best guesses of
$X_t^i_{i_0}$. Accountants might use "book," "market," "liquidation,"
or "going concern" values. This model does not suggest which is the
most appropriate in any given situation, it only makes that
choice explicit.
may involve a broker fee or tax obligation.

## Implementation

See [Domain Driven Design](https://en.wikipedia.org/wiki/Domain-driven_design)

Holdings are stored in a relational table with columns `Id`, `Amount`,
`Instrument`, and `Owner`.  The `Id` is a unique identifier that includes
the time the holding was entered. (E.g., UUID Version-4 or Time-First.)
The `Amount` is an signed integer value indicating the multiple of the
minimum trading increment of the `Instrument`. The `Owner` can be more
refined than, e.g., a Legal Entity Identifier. Legal entities have
subgroups and even individual employees associated with a holdings.

### `Id`

A unique identifier including the time a holding was inserted into the Holdings table.

### `Amount`

Integral multiple of smalled instrument trading unit. 64-bit signed integer. 32-bit is too small.

### `Instrument`

This can be more refined than a stock ticker or CUSIP. For example, a stock
might trade on multiple exchanges. CUSIPs can be reused so this should be taken into account.

### Entity

[LEI](https://www.lei-worldwide.com/) is too coarse. Need to subdivide into groups or even employee. 
This requires a slowly time-varying auxiliary table.

## Remarks

If it is complicated, it is wrong.

Can we make it a function? (Easier to reason about.)
