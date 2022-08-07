---
title: Foundations of Finance
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Entity, instrument, price, cash flow, trading, value, account
...

\newcommand{\RR}{𝑹}
\renewcommand{\AA}{\mathcal{A}}
\renewcommand{\HH}{\mathcal{H}}

Most mathematical finance models lack some important real-world features.
It is customary to assume there is only one entity, the trader, involved
in a trading strategy.  The trader/buyer decides what hedging should
be done, but the issuer/seller sometimes also has a say. For example,
a callable bond allows the issuer to revoke ownership from the buyer by
providing an early principal payment. The initial transaction typically
involves a third entity, the broker/dealer or an exchange, that receives
a cash flow for providing liquidity. It is rare to find a model that
accounts for taxes that must be paid due to trading activity. These can
amount to a significant fraction of the cash flows involved and depend
on the entities invovled.

We outline a treatment that allows more realistic modeling.  It is
essential to identify who owns what amount in each instrument.  Holding an
instrument often involves cash flows that depend on the amount held and
the entity holding it.  Holdings are transacted over time at a price.
Each entity decides when and how much of each instrument they wish
to trade.  A complete model must allow for trading strategies to be
specified by each entity.

_Issuers_ create _instruments_. A company can issue stocks or bonds to
raise capital, exchanges create contracts to connect liquidity providers
with their customers.  Commodities originate from producers of the
physical product and currencies are issued by governments of countries.

Some instruments have _cash flows_.  Stocks may have dividends,
bonds may have coupons, futures have periodic margin adjustments.
Commodities and currencies do not have cash flows.  The _issuer_ of an
instrument determines when and how much to give per unit of amount
to instrument holders. 

A _holding_ is an _amount_ of an _instrument_ held by a _legal entity_.
Amounts have units based on the instrument: stocks have _shares_, bonds
have _notional_, futures have _contract size_.  Commodities have physical
quantities and currencies have denominations. Currencies never have
cash flows. The price of a futures is always zero.

Holdings are _transacted_ over time.
_Sellers_ determine what holdings they are willing to exchange with _buyers_. 
Buyers decide when to transact an available exchange of holdings with a seller.
A transaction involves a _trade date_, _settlement date_, and an exchange
of holdings between the _buyer_ and _seller_. 
The _price_ of the transaction is the quotient of the buyer amount and the seller amount.
Ownership of holdings is transferred on the settlement date.
The _position_ of an entity is their set of holdings at any given time.

The sum of the amounts held of each instrument in a position is the _net_ position in that instrument.
Given prices of instruments in some currency, the net positions can be
converted to the _value_, or _mark-to-market_, of the position in that currency.
Determining the "price" of an illiquid instrument is problematic.
The difference of the net value of positions at the beginning and end of
a period is the _profit and loss_ over the period.

Profit and loss does not capture the dynamics over the period.
Cash flows and transactions cause changes to positions.
Instrument holders receive cash flows based on the amount held and
transactions involve an exchange of holdings between the buyer and seller.
These show up in the trade blotter _account_.
Other measures such as drawdown and Sharpe ratio are used to mangage trading risk
and determine trading strategy.

## Model

Let $E$ be the set of market entities.

Let $T$ indicate the set of possible trading times.

Let $I$ be the set of market instruments.

Let $A = \RR$, be the set of real numbers denote the amounts that can be traded in each instrument.

A holding is a triple $(a, i, e)\in A\times I\times E$ indicating entity $e$ hold amount $a$
of instrument $i$.

A transaction is an exchange of two holdings at a time $t$.

The market at time $t$ is the set of all holdings $\HH_t = \{(a,i,e)\}$.
The _net_ amount entity $e$ holds in instrument $i$ is
$$
	N_t(i,e) = \sum \{a' \mid (a',i',e')\in\HH_t, i' = i, e' = e\}.
$$
The profit and loss over the period $(t, u]$ is
$$
	P_{t,u}(i, e) = N_u(i,e) - N_t(i,e).
$$
