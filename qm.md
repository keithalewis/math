---
title: Quantum Markets
abstract: Notes on Quantum Markets by Jack Sarkissian.
---

Notes on _Quantum Markets_ by Jack Sarkissian.

## Notation

$\tau$ -- time between trades  
$s$ -- price  
$x$ -- log price  
$m$ -- absolute value of order/trade size  
$M$ -- absolute value trade size  
$q$ -- order size  
$Q$ -- signed trade size  
$\rho$ -- order size density  $s\,dm/ds$
$\theta$ -- order density flow 
$\Delta$ -- bid/ask spread  
$\epsilon$ -- $\Delta/s$ - relative spread  
$h$ -- high minus low  
$I$ -- execution imbalance  
$J$ -- order imbalance  
$V$ -- volume  
$v$ -- order flow  
$L$ -- price impact  

## Holding, Portfolio, Exchange, Transaction

A _(legal) entitiy_ is a person or corporation that can own financial instruments.

A _holding_ is a triple $h = (a, i, o)$ indicating amount $a$ of instrument $i$.
is held by owner $o$.  A _portfolio_ is a collection of holdings.
Holdings are the atoms of finance.

An _atomic transaction_, or _switch_, is a triple $\chi = (t, h, h')$
where $t$ is the time the _buyer_ holding $h$ is exchanged with the _seller_ holding $h'$.
Both buyers and sellers are owners.

A switch results in the portfolio of the
buyer $o$ changing from $\{\ldots,(a,i,o),\ldots\}$
to $\{\ldots,(a',i',o),\ldots\}$ and the portfolio of the seller $o'$
changing from $\{\ldots,(a',i',o'),\ldots\}$
to $\{\ldots,(a,i,o'),\ldots\}$. The amount of each instrument is switched
between the buyer and seller.
Sellers passively offer potential exchanges and buyers actively decide which to accept.
Both buyers and sellers can buy/go long (amount is positive) or sell/go short (amount is negative).

A _transaction_ is a collection of related switches
involving, e.g., fees or taxes.
Transactions are the molecules of finance.

The _price_ of a switch is $X = a/a'$ where $h = (a, i, o)$ and
$h' = (a', i', o')$. If a buyer pays $(8, \$)$ for $(2, \text{F})$ shares of Ford stock
then the price is $8/2 = 4$ dollars per share. Typically $i$ is the preferred
currency of the buyer.

There is no uncertainty in the price of a switch.
It is simply a number entered into the books and records of each owner.

If a seller offers a price $X$ at time $t$ for buyers to exchange instrument $i'$
for instrument $i$ then it is approximately correct that
the switch $\chi = (t,(X a', i, o), (a',i',o'))$ is available to a buyer
wanting to acquire $a'$ of seller's instrument $i'$.
If the buyer wants to buy $a' > 0$ of $i'$ then the seller price $X$ will be the _ask_.
As $a'$ becomes a larger positive number, the ask will increase.
If the buyer want to sell $a' < 0$ of $i'$ then the seller price $X$ will be the _bid_.
As $a'$ becomes a larger negative number, the bid will decrease.

The price a seller quotes can also depend on the buyer but in all cases
the price recorded in books and records will be $X = a/a'$.

If $i$ is assumed to be the preferred buyer currency, $i'$ is a particular
seller instrument, and we lump all buyers into $o$ and all sellers into $o'$ then
market orders can be modeled as a sequence $(t_j, a_j')$ of times and
amounts of instrument $i'$ acquired by the buyer. The buyer
pays $a_j = a_j' X_j$ in the preferred currency to the seller
where $X_j$ is the price of the switch.

## Order Book

An _order book_ is a collection of limit orders.
A limit order is a quintuple $(t, l, a, i, o)$ indicating that owner $o$
is willing to buy amount $a > 0$
or sell amount $a < 0$ of instrument $i$ at price $l$
any time after $t$. Limit orders can be cancelled by the owner.

The _depth_ at time $t$ for level $l$ is the sum over the amount of every limit orders placed
prior to $t$ having level $l$.
$$
	A(t, l) = \sum_{(t_j,l_j,a_j,i_j,o_j)} \{a_j\mid t_j < t, l_j = l\}.
$$
The _ask_ is the lowest level with $A(t, l) > 0$. The _bid_
is the highest level with $A(t, l) < 0$.

The order book can be represented by
$$
	B(t, l) = \sum_{a_j > 0, t > t_j} a_j 1(l > l_j) + \sum_{a_j < 0, t > t_j} a_j 1(l < l_j)
$$
Note $dB/dl = A$ and the inverse of $B$ is the usual representation for order books.

TODO: explain better

Exchanges line up _liquidity providers_ to seed the order book prior to market open with
limit orders. Exchange customers can also place limit orders. 
Both liquidity providers and exchange customers
can execute market orders during trading hours.

A _market order_ specifies the holding $(a, i, o)$ that buyer $o$ would like to obtain
at time $t$. If the amount $a$ is positive the limit orders at the ask level
are matched in priority of when they were placed and removed from the order book.
This may result in a transaction with multiple 
switches having different limit owner orders.

If the depth at the ask is less than the amount $a$ then the price will be the ask.
If not, limit orders at the next highest level will be matched. If their
depth is still less than the remaining amount the process repeats
until the entire buy is filled.
This results in a transaction
containing switches for each level that was filled.

If the amount $a$ is negative the limit orders at the bid level 
are matched in priority of when they were placed and removed from the order book.
If the depth at the bid is less than the amount $a$ then the price will be the bid.
If not, limit orders at the next lowest level will be matched. If their
depth is still less than the remaining amount the process repeats
until the entire sell is filled.

The usual representation is the inverse of $B$ with level a function of amount.

A limit order placed at time $t$ will eventually have price $l$, but there
is no guarantee when, or if, it will get matched by a market orders. 
A market order is immediately matched with existing limit orders, but its price
is uncertain. This is not unlike the Heisenberg Uncertainty Principle.

The _ask_ for a order book is the lowest level with positive depth.
The _bid_ for a order book is the highest level with negative depth.
The _mid_ is the average of the bid and ask.
The _high_ over an interval is the largest trade price over the interval.
The _low_ over an interval is the smallest trade price over the interval.
The _open_ is the price of the first trade of the session and the sign of the amount.
The _close_ is the price of the last trade of the session and the sign of the amount.

## Notation

Now that we have established rigorous definitions of order books and market orders we
will revisit the notation from the first section.

Let $(t_j, a_j')$ be the market orders where the times are increasing.
Clearly $\Delta t_j = t_{j+1} - t_j$ is the time between trade $j$
and trade $j + 1$. Given two times $u < v$ the average time between trades
in $[u, v]$ is $\tau(u,v) = (\sum_{j=m}^n \Delta t_j)/(n - m + 1)$ where the
sum is over $\Delta t_j\subseteq [u,v]$.

The last price to trade at $s_t$ is $X_j = a_j/a_j'$ where $j = j(t) = \max \{i \mid t_i < t\}$.
We write $s_t^+$ if traded at the ask
and $s_t^-$ if traded at the bid. The mid is $s_t = (s_t^+ + s_t^-)/2$.

$m, M, q, Q$?

## Coupled-Wave Model

