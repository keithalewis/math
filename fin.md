---
title: Unified Finance
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Transactions of holdings.
...

There is a unified way to describe the foundations of the financial world.
A _holding_ is a triple of instrument, amount, and legal entity.
A financial _transaction_ consists of the exchange of two holdings at a given time.

## Holding

Finance involves _holding_ _instruments_, _amounts_, and _legal entities_.
Examples of instruments are: stocks, bonds, futures, currencies, commodities, etc.
They are held by entities in some amount: shares, notional, contracts,
units, and physical quantity respectively. We use lowercase Greek iota
holdings; $\iota = (i,a,e)$ where $i$ is an instrument, $a$ is an amount,
and $e$ is the legal entity owning the amount of the instrument.

## Transaction

A _transaction_ between two entities at a given time is a swap of entities
between two holdings; $\chi = (t;i,a,e;i',a',e')$. The first entity $e$
is the _buyer_ and the second entity $e'$ is the _seller_. The _price_
of the exchange is $X = a'/a$ and is determined by the seller. The
buyer decides when to make an exchange based on the seller's price
(among other consideration).

For example, if the buyer $b$ holds 16 dollars $(\$, 16, b)$ and
the seller $s$ has two shares of Ford stock $(F, 2, s)$ then the buyer
can obtain two shares at price 8 dollars per share to get $(2, F, b)$
by giving the buyer $(\$, 16, s)$.

Foreign exchange is not a special case. If the USD/JPY exhange rate is 100 then
$(\$, a)$ can be exchanged for $($&yen;$,100a)$. If we write &dollar;1 = &yen;100
then USD/JPY is 100 where '1 = ' turns into '$/$'.

Similarly, commodities are also not special.  This model unifies trading of all instruments.

## Market

The _market_ $\mathcal{M}_t$ is the collection of holdings at time $t$.
A transaction $\chi = (t;i,a,e;i',a',e')$ changes the holdings $\mathcal{M}_t$
by replacing $(i,a,e)$ and $(i',a',e')$ with $(i',a',e)$ and $(i,a,e')$ respectively.

The market is determined by a sequence of transactons over time.

## Price

Sellers determine prices. At any given time $t$ they quote a price for exchanging
instruments with buyers given the amount the buyer wishes to obtain.

Price is a function $X_t\colon I\times A\times E\times I\times E\to\bm{R}$,
where $I$ is the set of instruments, $A$ is the set of amounts (which
typically depends on $i\in I$), and $E$ is the set of entities.  At time $t$ the
transaction $(t;a,i,e;a X_t(i,a,e,i',e'),i',e')$ is available to the
buyer $e$ from the seller $e'$. The amount $a$ is actually constrained by
the instrument $i$ and possibly also by the time $t$ and seller $e'$.
Instruments trade in finite increments (that can change over time) and
sometimes cannot be shorted ($a < 0$). The amount available is also
at the discretion of the seller and may consist of the empty set
for some buyers.

Most models of price in the financial liturature do not depend on $a$, $e$, and
$e'$. It is also common to assume $i$ is the native currency of the
buyer $e$. In this case $X_t = X_t(i')$ where $i'$ is the instrument
whos price is being modeled. Anyone who has traded knows there are
different prices depending on whether you are buying or selling &ndash;
the ask and the bid, respectively. Anyone who has traded large amounts also knows the
bid/ask spread widens as the amount increases. The price can also depend
on the counterparties in the transaction, as anyone with poor credit
will find when attempting to take out a loan.

We can combine the prices for all instruments into a vector-value function
$X_t\colon A\times E\times I\times E\to\bm{R}^I$
where $X_t(i,a,e,i',e')$ is the $i$-th component of $X_t(a,e,i',e')$ and we use
the same symbol $X_t$ for both functions.

## Cash Flow

Holding instruments entails _cash flows_. A stock pays dividends, a bond pays coupons,
a futures has margin adjustments.

Cash flows are functions $C_t:I\times I\to\bm{R}^I$, where $C_t(i,i')$ is
the amount of instrument $i'\in I$ paid to the holder of $i\in I$ at time $t$.
Cash flows do not depend on the entity holding the instrument.
Usually $i'$ is the native currency associated with instrument $i$ and is omitted.
Specifying $i'$ allows for _payment-in-kind_ cash flows.


## P&amp;L

a sequence of transaction $\{\chi_j\}$...

Define $\Gamma_t = ...$.

The position is $\Delta_t = \sum_{s < t} \Gamma_t$.

The _profit and loss_ of

## Trading

A _trading strategy_ is an increasing sequence of (stopping) times $(\tau_j)$
and trades $\Gamma_j\colon I\times E\times I\times E\to\bm{R}$ indicating the
amount to trade at time $\tau_j$ in two instruments between two entities.
This results in the exchanges $\chi_j = (\tau_j;\Gamma_j,i,e;\Gamma_j X_j, i', e')$
where $\Gamma_j = \Gamma_j(i, e, i', e')$ and $X_j = X_{\tau_j}(i,\Gamma_j,e,i',e')$.

If $\iota = (i_\iota, a_\iota, e_\iota)$ then the position of entity $e$ is the set
$\Delta_e = \{\iota\in\mathcal{M} : e_\iota = e\}$.
