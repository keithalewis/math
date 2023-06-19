---
title: Trading
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Buyers and sellers
...

Suppose some instrument has price $X_t$ at time $t$.
The _profit and loss_ of holding one share
of the instrument over the interval from $u$ to $v$ is
0 until the position is entered and the difference of the
current price and the price when the position was
entered until that is locked in when the position is unwound.

Ignoring the details of when $t = u$ and $t = v$ for now
$$
PnL(t) = 
\begin{cases}
0 & t < u \\
X_t - X_u & u < t < v \\
X_v - X_u & t > v \\
\end{cases}
$$

If $\Delta(t) = 1_{(u,v]}(t)$ is 1 when $u < t \le v$ and 0 otherwise this is
the _stochastic integral_
$$
	PnL(t) = \int_0^t \Delta(s)\,dX_s.
$$

In the mathematical theory of _stochastic integration_ it is assumed $X_t$ is
_right continuous_: $\lim_{u\downarrow t} X_u = X_t$.
This corresponds to the market reality that prices can jump.
You can observe $X_t$ over time, but when you enter a market order at $t$
you get filled at $X_{t + \epsilon}$ for some $\epsilon > 0$.
This is called _slippage_.

__Exercise__. _Show $1_{(u, v]}$ is left continuous_.

In the mathematical theory of _stochastic integration_ it is assumed $\Delta_t$ is
_left continuous_: $\lim_{s\uparrow t} \Delta_s = \Delta_t$.
This corresponds to the market reality that it take some time for orders to settle.
You can put on a trade at time $t$, but you don't actually own the
instrument until ${t + \epsilon}$ for some ${\epsilon > 0}$.
This is called _settlement_.

## Trading Strategy

Putting on the position of holding one share from time $u$ to time $v$
corresponds to the trading stragegy of buying 1 share at $u$ and
selling one share at $v$.  Of course you exchange shares with
someone other than yourself[^1].  Mathematical Finance literature assumes
there is a "market" available that provides prices $X_t$. It reality,
things are more complicated.  Anyone who has ever traded knows the price
depends on whether you are buying or selling --- the bid/ask spread. That
might increase depending on the amount you want to buy or sell.  It also
depends on the credit worthiness of the counterparties involved.
We will ignore that for now and assume any amount can be bought or
sold at exactly price $X_t$.

### Exchange

If Ford is trading at $8$ the buyer can give the seller $8$ dollers to obtain
one share of Ford stock. With the above assumptions, the buyer
can give $8a$ dollard to obtain $a$ shares of F.

A _position_ is an amount of an instrument owned by an entity $\pi = (a,i,e)$.
A _market_ is a set of positions[^2].
An _exchange_ is a time, a _buyer_ position, and a _seller_ position
$\chi = (t, \pi, \pi')$.
The market $\{\ldots, (a,i,e),\ldots,(a',i',e')\ldots\}$ becomes
$\{\ldots, (a',i',e),\ldots,(a,i,e')\ldots\}$ after the exchange.
Usually $i$ is a currency and $i'$ is some instrument.
If a seller quotes a price $X_t$ then the exchange
$\chi = (t, (X_t a', e), (a', i', e'))$ is available to the buyer.

[^1]: Unless you are doing [_wash trading_](https://www.investopedia.com/terms/w/washtrading.asp).

[^2]: Actually a multiset. In practice positions are associated with a position id.
The position id can be used to associate more details about the position.
