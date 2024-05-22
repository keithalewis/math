---
title: Atomic Finance
author: Keith A. Lewis
---
\newcommand\ZZ{\bm{Z}}

Let $I$ be the set of all market instruments and $O$ the set of all (potential) instrument owners.
A _holding_ is a triple $h = (a, i, o)$ where $i\in I$ is an instrument,
$o\in O$ is the instrument owner, and $a\in\ZZ$ is the amount as an integer multiple
of the minimal trading increment of the instrument.

Let $T$ be the set of all trading times.
An _exchange_ is a triple $\chi = (t, h, h')$ where $t\in T$, $h$
is the _buyer_ holding, and $h'$ is the _seller_ holding. The _price_
of an exchange is $X = a/a'$.  Sellers quote a price $X$ and buyers
decide if they want to trade at time $t$ amount $a'X$ of instrument $i$
they hold for amount $a'$ of instrument $i'$ the seller holds.

For example, if a buyer holds 8 dollars and a seller holds 2 shares of stock and
quotes a price of 4 dollars per share of Ford stock then the buyer can 
can acquire $2F$ for $8\$$.

A _portfolio_ is a collection of holdings. Exchanges act on porfolios.

A _transaction_ is a set of exchanges.

Instruments have cash flows. The issuer pays ...
