---
title: Unified Finance
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Unified Finance &ndash; holding, exchange, portfolios, trading
...

\newcommand\RR{\bm{R}}
\newcommand\ZZ{\bm{Z}}

The financial world is a big, messy affair. No mathematical theory
or software implementation can accurately model reality.
The best a theory can do is to identify features recognizable
to practitioners that can be implemented on a computer.

## Holding

The atoms of finance are _holdings_: an amount, an instrument, and an owner.
We write $\alpha = (a, i, o)$ to indicate owner $o$ holds amount $a$
of instrument $i$. It is common in mathematical finance literature
to represent the amount $a$ as a real number in $\RR$.
In the real world it is an integer multiple of the minimum trading
amount of the instrument.

Every holding $\alpha$ is an element of the cartesion product
$\alpha\in A\times I\times O$ where $A = \ZZ$ is the set of integers,
$I$ is the set of all market instruments, and $O$ is the set of all
owners. The set $I$ can be the set of all instruments
ever traded and $O$ can be all past, current, and future
possible owners. Math let's you think big, but people running
a business need math implemented on a computer that produces
numbers they find useful.

## Position

A _position_ is a set of holdings $\pi \subseteq A\times I\time E$.
This can be implemented as a table in a database with columns
`amount`, `instrument`, and `owner`. Databases also assign a unique `id`
to each entry to distinguish positions having the same amount, instrument, and owner.
No matter the size of $I$ and $O$, this is just a finite number of rows in the table.

For example, the total amount of instrument $i$ owned by $o$ is
$$
	A(i, o) = \sum_{\alpha\in\pi}\{a\mid \alpha.i = i, \alpha.o = o\}$
$$

This corresponds to the SQL query
```
SELECT SUM(amount)
FROM positions
WHERE instrument = i AND owner = o
```

## Valuation

Positions are dynamic and change throughout the day, but traders and
risk managers need to get a grip on the _value_, or _mark-to-market_
of a postion at any point in time. This involes nominal trades to convert each instrument
to a base instrument, usually the native currency of the company holding the position.

$(a, i, e) \mapsto (a', e', e)$.

It is necessary to specify a price function to convert 
For instruments trading in a liquid market, it is just a matter of looking at
the current quote. When that luxury is not available it is necessary to 
specify a function 

