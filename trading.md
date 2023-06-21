---
title: Trading
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Buyers and sellers buy and sell
...

\newcommand\RR{\boldsymbol{R}}

Suppose an instrument has price $X_t$ at time $t$.
The _profit and loss_ of holding one share
of the instrument over a period of time is
0 until the the share is purchased, the difference of the
current price and the purchse price while holding the share,
and the difference of the selling price and the purchase price thereafter.

If the share is bought at $u$ and sold at $v$ 
$$
PnL(t) = 
\begin{cases}
0 & t < u \\
X_t - X_u & u < t < v \\
X_v - X_u & t > v \\
\end{cases}
$$
ignoring $t = u$ and $t = v$ for now.

If $\Delta(t) = 1_{(u,v]}(t)$ is 1 when $u < t \le v$ and 0 otherwise this is
the _stochastic integral_
$$
	PnL(t) = \int_0^t \Delta(s)\,dX_s.
$$

The definitive book on stochastic integration is \cite{Protter}.
_Elementary_ integrands have the form $\Delta = \sum_j a_j 1_{(u_j, v_j]}$
where $a_j$ is known at time $u_j$. This is similar to the definition
of the Ito integral which uses left end points, but is more general.

In the mathematical theory of _stochastic integration_ it is assumed $X_t$ is
_right continuous_: $\lim_{u\downarrow t} X_u = X_t$.
This corresponds to the market reality that prices can jump.
You can observe $X_t$ over time, but when you enter a market order at $t$
you get filled at $X_t$, not at any of the prices $X_{t-\epsilon}$, for some $\epsilon > 0$,
you observe prior to trading.
This is called _slippage_.

In the mathematical theory of _stochastic integration_ it is assumed $\Delta_t$ is
_left continuous_: $\lim_{s\uparrow t} \Delta_s = \Delta_t$.

__Exercise__. _Show $1_{(u, v]}$ is left continuous_.

This corresponds to the market reality that it takes some time for orders to settle.
You can put on a trade at time $t$, but you don't actually own the
instrument until it _settles_ at ${t + \epsilon}$ for some ${\epsilon > 0}$.

## Trading Strategy

Holding one share from time $u$ to time $v$ corresponds to the trading
stragegy of buying 1 share at $u$ and selling one share at $v$.  Of course
you exchange shares with someone other than yourself[^1].  It is customary
in Mathematical Finance literature to assume there is a "market" available
that provides prices $X_t$. It reality, things are more complicated.
Anyone who has ever traded knows the price depends on whether you are
buying or selling --- the bid/ask spread. That might increase depending
on the amount you want to buy or sell.  It also depends on the credit
worthiness of the counterparties involved.  We will ignore that for now
and assume any amount can be bought or sold at exactly price $X_t$.
These assumptions can be addressed by more precise
mathematical models.

### Exchange

If Ford is trading at $8$ the buyer can give the seller $8$ dollers to obtain
one share of Ford stock. With the above assumptions, the buyer
can give $8a$ dollars to obtain $a$ shares of F for any real number $a\in\RR$,
ignoring the fact stocks trade in a discrete number of shares.

A _position_ is an amount of an instrument owned by an entity $\pi = (a,i,e)$.
A _market_ is a set of positions[^2].
An _exchange_ is a time, a _buyer_ position, and a _seller_ position
$\chi = (t, \pi, \pi')$.
The market $\{\ldots, (a,i,e),\ldots,(a',i',e')\ldots\}$ becomes
$\{\ldots, (a',i',e),\ldots,(a,i,e')\ldots\}$ after the exchange.
Usually $i$ is a currency and $i'$ is some instrument.
The _price_ of the exchange is $X_t = a/a'$. 
If you exchange $(16, \$) for $(2, F)$ the price is $16/2$.

If a seller quotes a price $X_t$ then the exchange
$\chi = (t, (X_t a', e), (a', i', e'))$ is available to the buyer.

[^2]: Actually a multiset. In practice positions are associated with a unique position id.
The position id can be used as a primary key to associate more details about the position
in a table using that as a foreign key.
