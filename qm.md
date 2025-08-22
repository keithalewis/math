---
title: Quantum Markets
abstract: Notes on Quantum Markets by Jack Sarkissian.
---

Notes on _Quantum Markets_ by Jack Sarkissian.

## Notation

$\tau$ -- time between trades  
$\rho$ -- order size density  $s\,dm/ds$
$\theta$ -- order density flow 
$\Delta$ -- bid/ask spread  
$s$ -- price  
$x$ -- log price  
$\epsilon$ -- $\Delta/s$ - relative spread  
$h$ -- high minus low  
$I$ -- execution imbalance  
$J$ -- order imbalance  
$m$ -- order/trade imbalance  
$q$ -- order size  
$M$ -- absolute value trade size  
$Q$ -- signed trade size  
$V$ -- volume  
$v$ -- order flow  
$L$ -- price impact  

## Holding, Portfolio, Exchange, Transaction

A _holding_ is a triple $h = (a, i, o)$ indicating amount $a$ of instrument $i$.
is held by owner $o$.  A _portfolio_ is a collection of holdings.

An _exchange_ is a triple $\chi = (t, h, h')$
where $t$ is the time of the exchange, $h$ is a holding of the _buyer_, and $h'$ is
a holding of the _seller_. An exchange results in the portfolio of the
buyer $o$ changing from $\{\ldots,(a,i,o),\ldots\}$
to $\{\ldots,(a',i',o),\ldots\}$ and the portfolio of the seller $o'$
changing from $\{\ldots,(a',i',o'),\ldots\}$
to $\{\ldots,(a,i,o'),\ldots\}$.

A _transaction_ is a collection of related exchanges.
Transactions often involve exchanges such as broker fees or taxes.
Savvy buyers should take these into account. Sellers have already done so.

Sellers passively offer exchanges as _limit orders_ and buyers actively decide which to accept/lift
using _market orders_.

Exchanges are the atoms of finance. Transactions are the molecules.

The _price_ of an exchange is $X = a/a'$ where $h = (a, i, o)$ and
$h' = (a', i', o')$. If a buyer pays $(8, \$)$ for $(2, \text{F})$ shares of Ford stock
then the price is $8/2 = 4$ dollars per share. Typically $i$ is the preferred
currency of the buyer.

There is no uncertainty in the price of an exchange,
it is simply a number entered into the books and records of each owner.

If a seller offers a price $X$ at time $t$ for buyers to exchange instrument $i'$
for instrument $i$ then it is approximately correct that
the transaction $\chi = (t,(Xa', i, o),(a',i',o'))$ is available to a buyer
wanting to acquire $a'$ of instrument $i'$.
If the buyer wants to buy $a' > 0$ of $i'$ then the seller price $X$ will be the _ask_.
As $a'$ becomes a larger positive number, the ask will increase.
If the buyer want to sell $a' < 0$ of $i'$ then the seller price $X$ will be the _bid_.
As $a'$ becomes a larger negative number, the bid will decrease.

## Order Book

An _order book_ is a collection of limit orders.
A limit order is a quintuple $(t, l, a, i, o)$ indicating that seller $o$
is willing to buy amount $a > 0$ or sell mount $a < 0$ of instrument $i$ at price $l$
any time after $t$. Limit orders can be cancelled by the seller.

A _market order_ specifies the holding $(t, a, i, o)$ that buyer $o$ would like to obtain
at time $t$. A limit order placed at time $t$ will eventually have price $l$, but there
is no guarantee when, or if, it will get matched by a market orders. 
A market order is immediately matched with existing limit orders, but its price
is uncertain. This is similar to the Heisenberg Uncertainty Principle.

The _depth_ at time $t$ for level $l$ is the sum over limit orders placed
prior to $t$ having level $l$
$$
	A(t, l) = \sum_{(t_j,l_j,a_j,i_j,o_j)} \{a_j\mid t_j < t, l_j = l\}.
$$

The _ask_ for a order book at $t$ is the lowest level with positive depth.
The _bid_ for a order book at $t$ is the highest level with negative depth.
The _mid_ is the average of the bid and ask.
The _high_ over an interval is the largest trade price over the interval.
The _low_ over an interval is the smallest trade price over the interval.
The _open_ is the price of the first trade of the session and the sign of the amount.
The _close_ is the price of the last trade of the session and the sign of the amount.

## Coupled-Wave Model

