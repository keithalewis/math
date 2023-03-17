---
title: Finance
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Atoms of finance and their interaction.
...

\newcommand\mb[1]{\mathbf{#1}}
\newcommand\RR{\mb{R}}

What does it mean to say "Ford is trading at 8?"

The first approximation is "Ford stock is trading at 8 dollars per share."

This means you can pay 8 dollars to obtain 1 share of Ford stock.
You can also get 8 dollars to take on the obligation of buying
back one share of F at some future date.
More generally, you can pay $8a$ dollars to obtain $a$ shares of Ford stock,
where $a$ can be positive or negative, if you are a mathematician
ignoring reality.

In order to do this you will need to set up an account with an _exchange_
that has legal agreements with _broker_s
licensed to trade F, the stock symbol for Ford.  Step one is to lay down
some money for a _margin account_ with the exchange to fund your trading
activity.  They will provide you with software that will show you the
"price" of F.  When their screen shows a price of 8 and you buy one
share of F you might be surprised to find out they debited your account
for 8.01 dollars. This is called "slippage" but the exchange calls it
the vigorish they get for hooking you up with a broker/_liquidity provider_.

Liquidity providers submit _limit orders_ to the exchange.
They agree to buy or sell some _amount_ of the underlying at a specific _level.

Broker

bid/ask spread

a = 8a' <-> a'

(a, i, e) <-> (a', i', e') has price X = a'/a


## Entity

Let $E$ be a set of _entities_. An entitiy $e\in E$ can own intruments and is subject to
laws and regulations of the country they are governed by.

## Instrument

Let $I$ be a set of _instruments_. An _instrument_ $i\in I$ is a tradeable asset that can be owned by an entity.

## Amount

An _amount_ $A$ measures the quantity of an instrument. Stocks have shares...

## Atom

The _atoms_ of finance are _positions_: $\pi = (a, i, e)\in A\times I\times E$.
Entity $e$ owns amount $a$ of instrument $i$.
Given a postion $\pi = (a, i, e)$ we write $\pi.a$, $\pi.i$, and $\pi.e$ for $a$, $e$, and $i$.

## Portfolio

A _portfolio_ is a set of positions $\Pi \subseteq A\times I\times E$.
It is convenient to aggregate portfolios into _net_ amounts.
Define $N_\Pi\colon I\times E\to A$ by
$$
	N_\Pi(i, e) = \sum_{\pi\in\Pi} \{\pi.a\mid \pi.i = i, \pi.e = e\}
$$

## Transaction

A _transaction_ is an exchange of positions at a time $t$, $\chi = (t, \pi, \pi')$.
The _buyer_ holding $\pi$ trades that with a _seller_ holding $\pi'$ at time $t$.

If $A$ is the set of real numbers, $\RR$, then $N_\Pi\in\RR^{I\times E}$ is a vector.
Let $\delta_{i,e}\colon \RR^{I\times E}\to\RR$ be the delta function
$\delta_{i,e}(i',e') = 1$ if $i = i'$ and $e = e'$, otherwise 0.
A transaction can be represented by a vector
$$
	\chi = a(\delta_{i,e'} - \delta_{i,e}) + a'(\delta_{i',e} - \delta_{i',e'}).
$$
If the net portfolio is $N$ at time $t$ the result of the transaction
is $N + \chi$ when it settles.
Amount $a$ of of instrument $i$ is credited to entity $e'$ and debited from $e$.
Amount $a'$ of of instrument $i'$ is credited to entity $e$ and debited from $e'$.

## Price

The _price_ of an exchange is $X = \pi'.a/\pi.a$ 

## Mark to Market

Given $i'\in I$ and a set of prices $X_{i,i'}$ we can mark a portfolio to $i'$
by assuming the transactions $(t; a'X_{i,i'}, i; a', i')$, $a\in\RR$
are available to any entities.

A single entity $e$ computes $\sum$...

If the USD/JPY exchange rate is $123$ then one dollar can be exchanged for 123 yen at
the time it is _quoted_ by the seller. It is almost true that the buyer
can exchange $a$ dollars for $123a$ yen with the seller. In reality it depends on
the sign and size of $a$. If $a$ is positive then the seller will quote
the _ask_ price. If $a$ is negative then the seller will quote the _bid_ price.
The _spread_ is the difference between the ask and bid is typically a positive number.
As the magnitude of the amount the buyer wants to transact increases, the spread gets larger.
