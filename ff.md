---
title: Fundamental Finance
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Reflecting the real world in Mathematical Finance
...

\newcommand\RR{\mathbf{R}}
\renewcommand\AA{\mathcal{A}}

> In Physics, a theory that does not agree with experiment is
recognized as deficient and serious scientists get to work on a theory to address that.
This does not seem to be the case in Mathematical Finance.
It can't even answer questions a junior trader has the first day on
a trading floor. This short note takes a page out of the physicsts
playbook in an attempt to identify fundamental concepts and
provide a rigorous mathematical framework to reason about them.

A _market_ consists of _instruments_. Every instrument has a _price_
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
