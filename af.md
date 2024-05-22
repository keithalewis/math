---
title: Atomic Finance
author: Keith A. Lewis
---
\newcommand\ZZ{\bm{Z}}

The atoms of finance are holdings: an amount, instrument, and the owner of the holding.
Holding an instrument often entails auxiliary cash flows for the owner.
A buyer can exchange the amount and instrument of their holding with that of a seller. 
The price of the exchange is the ratio of buyer amount to seller amount.
A portfolio is a collection of holdings. Portfolios evolve over time via exchanges.
A transaction is a finite collection of associated exchanges.

Let $I$ be the set of all market instruments and $O$ the set of all
(potential) instrument owners.  A _holding_ is a triple $h = (a, i, o)$
where $i\in I$ is an instrument, $o\in O$ is the instrument owner, and
$a\in\ZZ$ is the amount as an integer multiple of the minimal trading
increment of the instrument.  Holdings can entail cash flows, coupons,
margin adjustments, fees, and taxes.

Let $T$ be the set of all trading times.  Holdings interact via an
_exchange_: a triple $\chi = (t, h, h')$ where $t\in T$, $h = (a,i,o)$
is the _buyer_ holding, and $h'=(a',i',o')$ is the _seller_ holding. The
_price_ of an exchange is $X = a/a'$.  Sellers quote a price $X$ and
buyers decide if they want to trade at time $t$ amount $a'X$ of instrument
$i$ they hold for amount $a'$ of instrument $i'$ the seller holds.

For example, if a buyer holds 8 dollars and
a seller holds 2 shares of Ford stock and
quotes a price of 4 dollars per share then the buyer can 
can acquire two shares of F for $8$ dollars. If the buyer wants to short two shares
of Ford the seller 
If the buyer wants to acquire 2M shares
of Ford the seller will most like quote a price higher than $4$ per share. 

A _portfolio_ is a collection of holdings. Exchanges act on portfolios.
A portfolio ${\{\ldots,(a,i,o),\ldots,(a',i',o'), \ldots\}}$ at time $t$
becomes ${\{\ldots,(a',i',o),\ldots,(a,i,o'), \ldots\}}$ after the exchange
$\chi = (t,h,h')$ at time $t$ settles.

A _transaction_ is a set of related exchanges, for example an exchange
may involve a broker fee.
