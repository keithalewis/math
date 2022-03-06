---
title: Fundamental Finance
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Evincing the real world in Mathematical Finance
...

\newcommand\RR{\mathbf{R}}
\renewcommand\AA{\mathcal{A}}

> In Physics, a theory that does not agree with experiment is recognized
as deficient and serious scientists get to work on improving the theory.
Mathematical Finance seems to ignore fundamental shortcomings.
Continuous time hedging is impossible. Traders need to know when,
and by how much, they should adjust their hedges.
This short note takes a page out of the
physicsts playbook in an attempt to identify the fundamental components
of real-world trading and define a vocabulary for a rigorous mathematical
framework to reason about them.

A _market_ consists of _instruments_.
_Stocks_ and _bonds_ come into existence by companies wanting to raise capital.
_Commodities_ are instruments that involve growing crops, raising livestock,
and digging things out of the ground.
_Currencies_ are issued by nation states to facilitate trustworth transactions.
_Exchanges_ provide a means for _buyers_ and _sellers_ to _transact_ instruments. 

Every instrument has a _price_
at which it can be bought or sold and holding an instrument entails
_cash flows_ to its owner.  Stocks pay dividends, or may incur borrow
costs when shorted. Bonds pay coupons.  Futures always have price zero
and have daily margin adjustements.  Currencies never have cash flows.

Instruments do not trade in a vacuum. Companies bring them into the market
by issuing them and legal _entities_, companies or individuals, trade
them. Price is typically quoted in terms of the _amount_ that is converted
to a native currency required to exchange ownership. Stocks trade in
shares.  Bonds have notionals. Futures have contract sizes. Exchanging
one currency for another is the foreign exchange rate.

The elementary particles of finance are _holdings_, $(a,i,e)$, indicating
amount $a$ of instrument $i$ is owned by entity $e$.  Holdings interact
via _transactions_, $(t;a,i,e;a',i',e')$, indicating the _buyer_ $e$
transferred ownership of amount $a$ of instrument $i$ to _seller_ $e'$
in exchange for amount $a'$ of instrument $i'$. This corresponds to
a measurement indicating the price for this particular transaction
of instruments between the entities is $a'/a$.

Transactions are not symmetric. The buyer decides when and how much of
an instrument they hold to bid. The seller offers a price
$X = X(t;a,i,e;i',e')$ that the buyer can lift for the transaction
$(t;a,i,e;aX,i'e')$, so $a' = aX$ and $X = a'/a$ is the price.


