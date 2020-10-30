---
title: Unified Finance
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Unified Finance &ndash; holdings, transactions, and trading.
...

There is a unified way to organize the foundations of finance.
A _holding_ is the _amount_ of an _instrument_ held by a legal _entity_.
A _transaction_ is the exchange of holdings at a given _time_.
Instruments have _prices_ and _cash flows_ that determine the _values_
and _amounts_ involved with _trading_.

## Holding

A holding is an _instrument_, _amount_, and _legal entity_.
Examples of instruments are: stocks, bonds, futures, currencies, commodities, etc.
They are held by _legal entities_ in some amount: shares, notional, contracts,
units, and physical quantity respectively.
A legal entity is an individual or corporation.
The holding $(i,a,e)$ indicates entity $e$ owns amount $a$ of instrument $i$.

A _position_ is a set of holdings $\{(i_j,a_j,e_j)\}$.
Assuming each instrument is _fungible_ we can aggregate amounts.
The _net amount_ in instrument $i$ held by entity $e$ is
$$
N(i,e) = \sum_j \{a_j : i_j = i, e_j = e\}.
$$
The _net position_ is
$\cup_j \{(i_j, N(i_j,e_j), e_j)\}$. (Note if $i_j = i_k$ and $e_j = e_k$ for some $j,k$
then $(i_j, N(i_j,e_j), e_j) = (i_k, N(i_k,e_k), e_k)$ so this is the standard mathematical
set union.)

## Transaction

A _transaction_ involves a pair of holdings and a _transaction time_.
The transaction $(t; i, a, e; i', a', e')$ indicates
_buyer_ $e$ exchanged amount $a$ of instrument $i$ for amount $a'$ of instrument $i'$
with seller $e'$ at time $t$.
The _price_ for the transaction is $X = a'/a$.
Prices are determined by the seller.
The buyer decides the amount and instruments to exchange based on the seller's price
(among other considerations).

The transaction $(t;i,a,e;i',a',e')$ changes the holdings of the buyer and seller
at time $t$. The holding $(i,a,e)$ of the buyer becomes $(i',a',e)$ and
the holding $(i',a',e')$ of the seller becomes $(i,a,e')$.
We assume instruments are _divisible_ so a holding $(i,a_1,e)$ can be
split into $(i,a_1-a_0,e)$ and $(i,a_0,e)$ for any amount $a_0$ at no cost
if needed. If $0 < a_0 < a_1$ this is close to being true.

As an example, suppose a buyer $b$ holds 16 dollars $(\$, 16, b)$ and
a seller $s$ holds two shares of Ford stock $(F, 2, s)$. If the seller
quotes a price of 8 dollars per share
then the buyer can obtain $(2, F)$ by giving the seller $(\$, 16)$.

Foreign exchange is not a special case. If the USD/JPY exchange rate is 100 then
$(\$, a)$ can be exchanged for $($&yen;$,100a)$. If we write &dollar;1 = &yen;100
then USD/JPY is 100 where '1 = ' turns into '$/$'.

Similarly, commodities are also not special. This model can be used for **all** instruments.

## Cash Flow

Instruments entail _cash flows_. Stocks pay dividends, bonds pays
coupons, futures have margin adjustments. These cause changes to holdings.
If instrument $i$ pays cash flow $C_t(i,i')$ per share of $i$ in instrument
$i'$ at time $t$ then holding $(i,a,e)$ at time $t$ will cause $(i',aC_t(i,i'),e)$
to be included in the position of $e$ at $t$.  Usually $i'$ is the native
currency associated with instrument $i$ and is omitted.  Specifying $i'$
allows for _payment-in-kind_ cash flows.

Note that cash flows are zero except at a discrete number of times. Stocks and
bonds typically pay dividends and coupons quarterly or semi-annually. Futures
margin accounts are usually adjusted once per day.

Cash flows do not depend on the entity holding the instrument.
They do depend on the _issuer_ of the instrument, but that is beyond
the scope of this model.

## Profit and Loss

Holdings and transactions lead to some bean counting over time.

Given a position at time $t$, all transactions and cash flows between $t$
and $u$ determine the position at time $u$ as described above.
The change in net amounts is called _profit and loss_.
If $N_t$ is the net amount defined above
then $N_u(i,e) - N_t(i,e)$ is the P&amp;L for instrument $i$
and entity $e$ over the period from $t$ to $u$.

Holdings can be converted into a native currency $i_0$ for reporting
purposes.  This does not involve actual transactions, only a best guess
of the price at time $t$, $X_t(i_0,i)$, of each instrument $i$ in terms of $i_0$.
All holdings $(i,a,e)$ are converted to $(i_0, aX(i_0,i), e)$ then netted
to report the P&amp;L in terms of $i_0$.

Any instrument could be used instead of a native currency.
A subset of instruments could also be chosen to break P&amp;L reporting
into components.  The set of all currencies involved in a position is
a common choice.

## Model

There is no question about the cash flows recieved or the prices
of transactions after the fact.  Mathematics can be used to _model_
possible cash flows and prices in the future.

Let $T$ be the set of trading times, $I$ be the set of instruments, $A$
be the set of amounts, and $E$ be the set of entities.

Trading times depend on the instrument and the seller. If an instrument
is listed on an exchange then it can only be traded during market
hours. Every seller gets to determine when the instruments they offer
can be traded.

Amounts are constrained by the instrument, time, and seller.  Instruments
trade in finite increments and sometimes cannot be shorted ($a < 0$
is not allowed). The amount available is also at the discretion of the
seller and may consist of the empty set for some buyers.[^1]

A mathematical model for cash flows are functions $C_t:I\times
I\to A$, where $C_t(i,i')$ is the amount per share of instrument
$i'\in I$ paid to the holder of $i\in I$ at time $t$ by the issuer.

A mathematical model for prices is a (partial) function
$X_t\colon I\times A\times E\times I\times E\to\mathbf{R}$.
At time $t$ the transaction
$(t;a,i,e;a X_t(i,a,e,i',e'),i',e')$ is available to the buyer $e$
from the seller $e'$.
It is possible there are no quoted prices so $X_t$ is only a partial function.

Most models of price in the financial literature do not depend on $a$,
$e$, and $e'$.  Anyone who has traded knows there are different prices
depending on whether you are buying ($a > 0$) or selling ($a < 0$) &ndash;
the ask and the bid price, respectively.
Anyone who has traded large amounts also knows the
bid/ask spread widens as the amount becomes large.
The price can also depend on the counter-parties in the transaction,
as anyone with poor credit will find when attempting to take out a loan.

## Trading

A _trading strategy_ is an increasing sequence of _stopping times_[^2] $(\tau_j)$
and trades $\Gamma_j\colon I\times E\times I\times E\to A$ indicating the
amount to trade at time $\tau_j$ in two instruments between two entities.
Each trade results in a transaction $(\tau_j;\Gamma_j,i,e;\Gamma_j X_j, i', e')$
where $\Gamma_j = \Gamma_j(i, e, i', e')$ and $X_j = X_{\tau_j}(i,\Gamma_j,e,i',e')$.

Most models do not specify the seller $e'$; traders assume there is an aggregate
market of _liquidity providers_ for $i'$.

<!--
The mathematical finance literature customarily assumes a "_money market_"
account is available to fund trade execution.  Funding trades actually
involves many fixed income instruments.  Traders at Big Banks use their
_funding desk_ to insulate themselves from the details, but they are
charged for this.  Daily positions funded by _repurchase agreements_
require at least as many instruments as the number of days involved in
trading. These may not be cost effective for longer term strategies so
forward rate agreements and swaps are often used.

The unified model for finance allows these to be easily integrated.
-->

Trades accumulate into positions $\Delta_t = \sum_{\tau_j < t} \Gamma_j$.
If we write $\Gamma_t = \Gamma_j$ if $t = \tau_j$ and $\Gamma_t = 0$
otherwise, this becomes $\Delta_t = \sum_{s < t} \Gamma_s$.  Note the
strict inequality. A trade executed at time $t$ is not included in the
position at $t$; it takes some time for a trade to settle.

We will fix the funding currency $i = i_0$ and write $\Gamma_t(i_0, i) = \Gamma_t(i)$
and $X_t(i_0, i) = X_t(i)$.
The _cost_ of the initial trade in terms of $i_0$ is
is $V_0 = \sum_{i\in I}\Gamma_0(i) X_{\tau_0}(i)$; buying
$\Gamma$ shares at price $X$ costs $\Gamma X$. This amount will be
deducted from the trader's account and reported as the value of
the position to risk management.

If we represent trades and prices as vectors indexed by instruments
this can be written as $V_0 = \Gamma_0\cdot X_{\tau_0}$ where
dot indicates the _inner product_ of vectors.

The _value_, or _mark-to-market_ of a trading strategy at time $t$ is
$$
	V_t = (\Delta_t + \Gamma_t)\cdot X_t.
$$
This is the amount the trader would get from unwinding the existing position
and the trades just executed at the prevailing market price, assuming
that were possible. Note $V_{\tau_0} = \Gamma_0\cdot X_{\tau_0}$ is
the cost of the initial trade.

Trading strategies cause _amounts_ in $i_0$ to show up in
the trader's account:
$$
	A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t.
$$
At time $t$ cash flows proportional the the existing position are credited
and the cost of trades just executed are debited. Note $A_{\tau_0} = -V_{\tau_0}$.

Trading strategies create synthetic instruments. Amounts and values are
proxies for cash flows and prices. A derivative security is a contract
between counterparties for an exchange of future amounts.  If a trading
strategy that produces those amounts exists then its initial value should
be in the neighborhood of what a sell side trader quotes to customers.
A quant's job is to help traders figure out when ($\tau_j$) and how much ($\Gamma_j$)
to trade in order to satisfy the contract.[^3]

When the position $\Delta_t = 0$ we say the trading strategy is _closed
out_ at $t$. If no trades are executed after that then future values and amounts
will be zero.

If a trading strategy has $A_{\tau_0} > 0$, $A_t \ge 0$
for $t > \tau_0$, and eventually closes out, then _arbitrage_ exists: it is
possible to make money on the initial trade and never lose money over the
life of the trading strategy.  It is important to note this definition
of arbitrage depends on the model used for cash flows and prices.

[The Fundamental Theorem of Asset Pricing](https://kalx.net/um.pdf) describes all arbitrage-free models.

## Remarks

The financial world is still waiting for its Werner Heisenberg. The price
of a transaction after it has been executed is a number: the amount
the buyer gave to the seller divided by the amount the seller gave to
the buyer. The price prior to completing a transaction is more nebulous.
The difference between a quoted price and the actual price is lumped
into the term _slippage_.

Modeling that uncertainty is an ongoing puzzle.

For trades on an exchange the order book can tell you exactly what the
slippage will be, but only rough details of the order book are available
to exchange clients. Other clients and liquidity providers
can affect the order book before a trade gets executed.

[^1]: Adhering to the trader aphorism, "Don't be a dick for a tick," can help prevent this.

[^2]: A _stopping time_ is a random variable taking values in $T$ that
depends only on prior information, for example when the price of a stock
achieves a certain level.

[^3]: The trader aphorism, "Hedge when you can, not when you have to," is only a rough guide to solving
this difficult problem.
