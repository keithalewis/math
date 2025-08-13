---
title: Quantum Markets
---

Notes on _Quantum Msrkets_ by Jack Sarkissian.

## Notation

$\tau$ -- time between trades  
$\rho$ -- order size density  
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

## Holding, Portfolio, Transaction

A _holding_ is a triple $h = (a, i, o)$ indicating owner $o$ holds amount $a$ of instrument $i$.
A _portfolio_ is a collection of holdings. An _elementary transaction_ is a triple $\chi = (t, h, h')$
where $t$ is the time of the exchange, $h$ is a holding of the _buyer_, and $h'$ is
a holding of the _seller_. An elementary transaction results in the portfolio of the
buyer $o$ to change from $\{\ldots,(a,i,o),\ldots\}$
to $\{\ldots,(a',i',o),\ldots\}$ and the porfolion of the seller $o'$
to change from $\{\ldots,(a',i',o'),\ldots\}$
to $\{\ldots,(a,i,o'),\ldots\}$.

A _transaction_ is a collection of related elementary transactions.
Sellers offer elementary transactions and buyers decide which to accept/lift.
It is not uncommon for elementary transactions to involve associated elementary
transactions, for example, broker fees or taxes. Savvy buyers should take
these into account. Sellers have already done so.

Elementary transactions are the atoms of finance. Transactions are the molecules.

The _price_ of an elementary transaction is $X = a/a'$ where $h = (a, i, o)$ and
$h' = (a', i', o')$. If a buyer pays $(8, \$)$ for $(2, \text{F})$ shares of Ford stock
then the price is $8/2 = 4$ dollars per share.
There is no uncertainty in the price of an elementary transaction,
it is simply a number entered into the books and records of each owner.

If a seller offers a price $X$ at time $t$ for buyers to exchange instrument $i'$
for instrument $i$ then it is approximately correct that
the transaction $\chi = (t,(Xa', i, o),(a',i',o'))$ is available to a buyer
wanting to acquire $a'$ of instrument $i'$.
If the buyer wants to buy $a' > 0$ of $i'$ then the seller price $X$ will be the ask.
As $a'$ becomes a larger positive number, the ask will increase.
If the buyer want to sell $a' < 0$ of $i'$ then the seller price $X$ will be the bid.
As $a'$ becomes a larger negative number, the bid will decrease.

# Order Book

An _order book_ is a collection of _limit orders_.

