---
title: Unified Finance
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Unified Finance &ndash; holdings, trades, and managing risk
...

The financial world is a big, messy affair but its core involves trading
and bean counting: who traded how much of what when and accounting
for that over time.

The atoms of finance are _holdings_: an _instrument_, _amount_, and _legal entity_.
Holdings interact via _trades_: the exchange of two holdings at a given _time_. 
Instruments have _cash flows_ and _prices_ that determine
the _amounts_ and _values_ involved with trading.
Given a collection of holdings and
a sequence of trades the associated amounts and values determine
the _profit and loss_, among other quantities, relevant to managing a portfolio.

To properly assess risk it is necessary to include how a position will
be hedged over time, as pointed out in special cases by many authors.
Various hedging strategies can, and should, be used for insight on the
uncertainties involved.

This model highlights that both cash flows and prices must be specified
by mathematical models to determine the amounts and values associated
with a trading strategy. It also places instruments on equal footing to
get a complete picture of risk across **all** asset classes.  It does not
solve any particular problem in finance but it does specify a mathematical
notation to rigorously discuss all aspects of trading instruments using
realistic assumptions.

## Holding

A holding is an _instrument_, _amount_, and _legal entity_.  Examples of
instruments are: stocks, bonds, futures, currencies, and commodities.
They are traded in some amount: shares, notional, contracts, units,
and physical quantity respectively.  A legal entity is an individual
or a corporation. Corporations can subdivide holdings by individual
traders. The holding $(i,a,e)$ indicates entity $e$
owns amount $a$ of instrument $i$.

A _position_ is a set of holdings $\{(i_j,a_j,e_j)\}$.
Assuming each instrument is _fungible_ we can aggregate amounts.
The _net amount_ in instrument $i$ held by entity $e$ is
$$
	N(i,e) = \sum_j \{a_j : i_j = i, e_j = e\}.
$$
The _net position_ is $\cup_j \{(i_j, N(i_j,e_j), e_j)\}$. 
If $i_j = i_k$ and $e_j = e_k$ then $N(i_j,e_j) = N(i_k,e_k)$ so this
is standard mathematical set union.

## Trade

A _trade_ involves a pair of holdings and a _trade time_.
The trade $(t; i, a, e; i', a', e')$ indicates _buyer_ $e$ exchanged
amount $a$ of instrument $i$ for amount $a'$ of instrument $i'$ with
seller $e'$ at time $t$.  The _price_ of the trade is the quotient of
the buyer and seller amounts, $X = a/a'$, so the trade is
$(t; i, a'X, e; i', a', e')$. Prices are determined by the seller.
The buyer decides the amount and instrument to exchange based on the
seller's price, among other considerations.

The trade $(t;i,a,e;i',a',e')$ changes the
holdings of the buyer and seller at time $t$. The holding $(i,a,e)$
of the buyer becomes $(i',a',e)$ and the holding $(i',a',e')$ of the
seller becomes $(i,a,e')$.  We assume instruments are _divisible_ so a
holding $(i,a_1,e)$ can be split into $(i,a_1-a_0,e)$ and $(i,a_0,e)$
for any amount $a_0$ at no cost. If $0 < a_0 < a_1$ this is
close to being true.

As an example, suppose a buyer holds 100 dollars $(\$, 100)$ and
a seller holds two shares of Ford stock $(F, 2)$. If the seller
quotes a price of 8 dollars per share
then the buyer can obtain $(F, 2)$ by giving the seller $(\$, 2\times 8)$
and now holds $(\$,100-16) = (\$, 84)$.

Foreign exchange is not a special case. If the USD/JPY exchange rate is 100 then
$(\$, a)$ can be exchanged for $($&yen;$,100a)$. If we write &dollar;1 = &yen;100
then USD/JPY is 100 where '1 = ' turns into '$/$'.

Similarly, commodities are also not special. This model can be used for **all** instruments.

## Cash Flow

Instruments entail _cash flows_; stocks pay dividends, bonds pays
coupons, futures have margin adjustments. These cause changes to positions.
If instrument $i$ pays cash flow $C_t(i,i')$ per share of $i$ in instrument
$i'$ at time $t$ then holding $(i,a,e)$ at time $t$ will cause $(i',a C_t(i,i'),e)$
to be included in the position of $e$ at $t$.  Usually $i'$ is the native
currency associated with instrument $i$.  Specifying $i'$
allows for _payment-in-kind_ cash flows.

In the Ford example above, when holding $\{(\$, 86),(F,2)\}$ and
the stock pays a dividend of $(\$,0.15)$ per share then the holdings
become $\{(\$, 86), (F,2), (\$, 2\times 0.15)\}$ and net to
$\{(\$, 86.30),(F,2)\}$

Cash flows are zero except at a discrete times. Stocks and
bonds typically pay dividends and coupons quarterly or semi-annually. Futures
margin accounts are usually adjusted once per day.

Cash flows do not depend on the entity holding the instrument.
They do depend on the _issuer_ of the instrument, but that is beyond
the scope of this model.

## Profit and Loss

Holdings and trades lead to some bean counting over time.

Given a position at time $t$, all trades and cash flows between $t$
and $u$ determine the position at time $u$ as described above.
The change in net amounts is called _profit and loss_.
If $N_t$ is the net amount defined above
then $N_u(i,e) - N_t(i,e)$ is the P&amp;L of entity $e$ in instrument $i$
over the period from $t$ to $u$.

Holdings can be converted into a native currency $i_0$ for reporting
purposes.  This does not involve actual trades, only a best guess
of the price at time $t$, $X_t(i_0,i)$, of each instrument $i$ in terms of $i_0$.
All holdings $(i,a,e)$ are converted to $(i_0, aX(i_0,i), e)$ then netted
to report the P&amp;L in terms of $i_0$.

It is quite common for entities to have different best guesses of
$X_t(i_0,i)$. Accountants might use "book", "market", "liquidation",
or "going concern" values. This model does not suggest which is the
most appropriate in any given situation, it only makes that
choice explicit.

Other relevant quantities can be computed similarly. For example the
_drawdown_ over the period is $N_u(i,e) - \min_{t\le s \le u} N_s(i,e)$
and the _drawup_ is $\max_{t\le s\le u} N_s(i,e) - N_u(i,e)$.

Any instrument could be used instead of a native currency.
A subset of instruments could also be chosen to break P&amp;L reporting
into components.  The set of all currencies involved in a position is
a common choice.

## Model

There is no question about cash flows received or prices
of trades after the fact.  Mathematics can be used to _model_
possible cash flows and prices in the future.

Let $T$ be the set of trading times, $I$ be the set of instruments, $A$
be the set of amounts, and $E$ be the set of entities.

All models have shortcomings to keep in mind when being applied.
Trading times depend on the instrument and the seller. If an instrument
is listed on an exchange then it can only be traded during market
hours. Every seller gets to determine when the instruments they offer
can be traded.
Amounts are constrained by the instrument, time, and seller.  Instruments
trade in finite increments and sometimes cannot be shorted ($a' < 0$
is not allowed). The amount available is also at the discretion of the
seller and may consist of the empty set for certain buyers.[^1]

A mathematical model for cash flows is a function[^2] $C_t:I\times I\to A$.
At time $t$ instrument $i$ has cash flow amount $C_t(i,i')$ in instrument $i'$.

A mathematical model for prices is a (partial) function $X_t\colon
I\times E\times I\times A\times E\to\mathbf{R}$.  At time $t$ the trade
$(t;i, a'X_t, e;i', a', e')$ is available to buyer $e$ from
seller $e'$ at price $X_t = X_t(i,e,i',a',e')$.
Price determines the amount of $i$ the buyer must
give the seller for amount $a'$ of $i'$ at time $t$.
It is possible there are no quoted prices so $X_t$ is only a partial function.

Most models of price in the financial literature do not depend on the
amount traded, $a'$, or the counterparties $e$, or $e'$.  Anyone who
has traded knows there are different prices depending on whether you
are buying ($a' > 0$) or selling ($a' < 0$) &ndash; the ask and the bid
price, respectively.  Anyone who has traded large amounts also knows the
bid/ask spread widens as the amount gets larger.  The price can also
depend on the counterparties in the trade, as anyone with poor credit
will find when attempting to take out a loan.

## Trading

A _trading strategy_ is an increasing sequence of _stopping times_[^3] $(\tau_j)$
and amounts $\Gamma_j\colon I\times E\times I\times E\to A$ 
to trade at time $\tau_j$ in two instruments between two entities.
The trades are $(\tau_j;i,\Gamma_j X_j,e;i', \Gamma_j, e')$
where $\Gamma_j = \Gamma_j(i, e, i', e')$ and $X_j = X_{\tau_j}(i,e,i',\Gamma_j,e')$.
After the trade the buyer $e$ holds amount $\Gamma_j$ of $i'$ and the
seller holds amount $\Gamma_j X_j$ of $i$ in exchange for that.

Most models do not specify the seller $e'$; traders assume there is an aggregate
market of _liquidity providers_ for $i'$. Usually $e$ is assumed to be
a single entity executing the strategy, however
if you are running a hedge fund you will have
a set of $e$'s called program managers to reckon with.

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

Note trading strategies do not explicitly involve cash flows and
the definition of $\Delta$ above does not take those into account.
The formula for _amount_ below is used to do that. Cash flows
are typically paid in the native currency and currencies do not have cash flows.
This may explain why cash flows seem to get short shrift in mathematical
finance literature.

Fix the funding currency $i_0$ and write $\Gamma_t(i_0, i) = \Gamma_t(i)$
and $X_t(i_0, i) = X_t(i)$.
The _cost_ of the initial trade in terms of $i_0$ is
$V_0 = \Gamma_0(i) X_{\tau_0}(i)$; buying
amount $\Gamma$ at price $X$ costs $\Gamma X$. This amount will be
deducted from the trader's account and reported as the value of
the position to risk management.

If more than one instrument is traded then
$V_0 = \sum_{i\in I}\Gamma_0(i) X_{\tau_0}(i)$.
The sum is over all instruments, but $\Gamma_0(i) = 0$ if $i$ is not traded.
If we represent trade amounts and prices as vectors indexed by instruments
this can be written as $V_0 = \Gamma_0\cdot X_{\tau_0}$ where
dot indicates the _inner product_ of vectors.

The _value_, or _mark-to-market_, of a trading strategy at time $t$ is
$$
	V_t = (\Delta_t + \Gamma_t)\cdot X_t.
$$
This is the amount the trader would get from unwinding the existing position
and trades just executed at the prevailing market price, assuming
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
between counterparties for exchanges of future amounts.  If a trading
strategy that produces those amounts exists then its initial value, plus vigorish,
is what a sell-side trader quotes to buy-side customers.
A quants job is to help traders figure out when ($\tau_j$) and how much ($\Gamma_j$)
to trade in order to satisfy the contract obligations.[^4]
The term _self-financing_ means satisfying the obligation to pay 0 on
non-payment dates.

When $\Delta_t + \Gamma_t = 0$ we say the trading strategy is _closed
out_ at $t$. If no trades are executed after that then future amounts and values
are zero.

If a trading strategy has $A_{\tau_0} > 0$, $A_t \ge 0$
for $t > \tau_0$, and eventually closes out then _arbitrage_ exists: it is
possible to make money on the initial trade and never lose money over the
life of the trading strategy.  This definition
of arbitrage depends on the model used for cash flows and prices.

[The Fundamental Theorem of Asset Pricing](https://kalx.net/um.pdf) describes all arbitrage-free models.
It also shows $\Delta$ is delta and $\Gamma$ is gamma.

## Risk

The basic problem with most measures of risk is that they fail to take
hedging into account.

_Value at risk_ (VaR) is defined using a time period
and a probability $p$.  The probability of the value of a portfolio at the
end of the period being less than VaR equals $p$, assuming no trades occur
over the period. As the length of the period increases the probability
of a portfolio manager being fired for not hedging it approaches 1.

VaR can be turned into a more useful measure by incorporating the
hedging strategy. Different hedging strategies can be compared for their
effectiveness. Of course drawup and drawdown should also be considered
instead of only the value of the hedged portfolio at one point in time.

Similarly, CVA fails to take into account hedging. The CVA of a portfolio
is $\int_T \max\{E[V_t], 0\} h(t)\,dt$ where $V_t$ is the value of the
portfolio at $t$ and $h$ is a given _haircut_. The term $\max\{V_t, 0\}$ is
the _exposure_ of the portfolio holder.[^5] Holders are not exposed
to counterparty risk if they owe money. The insurance industry
had been using this formula to calculate premiums long before it showed
up in the financial world. The 1933 Glass-Steagal Act prohibited investment
banks from participating in the insurance industry, but after the
merger of Citicorp with Travelers the Gramm-Leach-Bliley Act allowed
them into the party after 1999.

It is common for swaps to have unwind provisions that will be exercised if
the market moves against them. This is an example of a hedging strategy
that can be applied to a portfolio to get a more accurate estimate of
counterparty risk.  The CVA haircut should not be applied to a holding
that no longer belong to the portfolio.

DVA is just the CVA of the entity on the other side of the trades.
The menagerie of XVA measures are attempts to incorporate special case
hedging strategies or cash flows due to taxes or regulatory capital
requirements. They can all be replaced by explicitly incorporating the
appropriate trading strategy and cash flows involved when applying the
CVA formula.

## Model Risk

The two fundamental problems of risk management are that there is no
clear definition of risk and it is impossible to manage something that is
not clearly defined.  The term _model risk_ is even more unclear &ndash;
exactly what models are under consideration?

One universal property is that when a new model is introduced there is
always a P&amp;L hit.  Trades undervalued by the old model were executed
by counterparties who recognized that, and trades overvalued by the old
model found few takers.

In lieu of a proper theory of risk management the best that can be
accomplished is to make implicit assumptions explicit and provide
multiple models and more efficient reporting tools to allow risk
managers to quickly and easily assess the effects of the assumptions
they make.

Capturing every holding and transaction in a database turns historical
reporting into a well understood technology problem.  When decorated
with appropriate partitions for dimensions and measures, risk managers
can use off-the-shelf tools to create dynamic reports allowing them to
summarize data and drill down to individual holdings and transactions to
their heart's content. It is no longer necessary to have technologists
spend time developing custom reports.

Models can be used to generate scenarios for future cash flows and
prices. Trading strategies use these to determine holdings over time.
The same queries designed for historical reporting can
be reused to give a probability distribution for any values of interest.

The future of risk management is to use Monte Carlo methods to generate
scenarios given a model and trading strategy.
Existing models can be leveraged to do this. Off-the-shelf
tools can already report mean, standard deviation, and quantiles
for probability distributions. The only hurdle is computing power,
but we have Moore's Law on our side. Software built
today can be used without change to give better and faster answers in the future.

## Remarks

A _funding account_ is more complicated than it might seem at first blush.
A _funding desk_ provides a liquid market in a native currency to
traders for _funding_ their trades. One way to think of it is as a
perpetual bond; for unit notional you get a daily stream of
coupons. The coupons are not constant but they are known at
the beginning of each period[^6] and are usually tied to
short term market rates. A trading strategy involves many
transactions in the market account and it is common to implicitly
assume all holdings are reinvested in the account. 
A funding desk typically uses the _repurchase agreement_ market
to supply the account. There are many individual transactions
involved with funding accounts once you pull out your microscope.

Trades often involve the exchange of more than two holdings, for example
a fee or commission to a broker or market maker that enabled the trade.
These are accommodated by including the associated transactions as
trades with the third parties involved. Perhaps these should be called
the molecules of finance.

The financial world is still waiting for its Werner Heisenberg. The
price of a trade after it has been executed is a number: the amount
the buyer gave to the seller divided by the amount the seller gave
to the buyer. The price prior to completing a trade is more nebulous.
The difference between a price quoted prior to a trade and the realized
price after settlement is lumped into the term _slippage_.

Accurately modeling that uncertainty is an ongoing puzzle.

For trades on an exchange the order book can give a better handle on what
the slippage might be. Some exchanges report the net amount of limit
orders they have near the current market level. If a market order is
not too large then the levels of the limit orders it will match can be
determined. However, other customers and liquidity providers can cause
changes to the order book before market orders are executed to cause
uncertainty in the exact amounts of matching limit orders at each level.

There is a clear trajectory in Mathematical Finance starting from the
Black-Scholes/Merton model of a single option parameterized by a constant
volatility to portfolios of instruments belonging to the same asset
class using increasingly sophisticated models that can be parameterized
to fit all available market data.

The future of Mathematical Finance is developing more accurate models
that allow for incorporating potential trading strategies and extending
the set of instruments to all asset classes.

[^1]: Adhering to the trader aphorism, "Don't be a dick for a tick," can help prevent this.

[^2]: Cash flows and prices are modeled using _random variables_: a
variable together with the probabilities of the values it can have. The
mathematical definition is that a random variable is a function from a
_sample space_ to the real numbers. Prepend the sample space to
the cartesian products involved to make them mathematically correct.

[^3]: A _stopping time_ is a random variable taking values in $T$ that
depends only on prior information, for example when the price of a stock
hits a certain level.

[^4]: The trader aphorism, "Hedge when you can, not when you have to,"
is only a rough guide to solving this difficult problem.

[^5]: The coupons are a stochastic process that is called _predictable_
in the math literature. It means that it is a little better than
being merely _adapted_ to a _filtration_.

[^6]: The formula for CVA should use $E[\max\{V_t,0\}]$ and not $\max\{E[V_t], 0\}$
but that is computationally more difficult. Jensen's inequality implies
$E[\max\{V_t,0\}] \ge\max\{E[V_t], 0\}$ so CVA underestimates the risk.
