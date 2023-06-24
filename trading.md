---
title: Trading
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Buyers and sellers buy and sell
...

\newcommand\RR{\boldsymbol{R}}

<!--
Suppose an instrument has price $X_t$ at time $t$.
The _profit and loss_ of holding one share
of the instrument over a period of time is
0 until the share is purchased, the difference of the
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

The definitive book on stochastic integration is {@Protter}.
_Elementary_ integrands have the form ${\Delta = \sum_j a_j 1_{(u_j, v_j]}}$
where $a_j$ is known at time $u_j$.
Define the stochastic integral
$$
	\int_0^t \Delta(s)\,dX_s = \sum_j a_j \int_0^t 1_(u_j, v_j])\,dX_s.
$$

This is similar to the definition of the Ito integral which uses left
end points, but is more general.

In the mathematical theory of _stochastic integration_ it is assumed $X_t$ is
_right continuous_: $X_{t+} = \lim_{u\downarrow t} X_u = X_t$.
This corresponds to the market reality that prices can jump.
You can observe $X_t$ over time, but when you enter a market order at $t$
you get filled at $X_t$, not necessarily at any of the prices $X_{t-\epsilon}$, for some $\epsilon > 0$,
you observe prior to trading.
This is called _slippage_.
We write $X_{t-} = \lim_{s\uparrow t} X_s$
so $X_t$ is _left-continuous_ at $t$ if $X_{t-} = X_t$.

In the mathematical theory of _stochastic integration_ it is assumed $\Delta_t$ is
_left continuous_: $\lim_{s\uparrow t} \Delta_s = \Delta_t$.

__Exercise__. _Show $1_{(u, v]}$ is left continuous_.

This corresponds to the market reality that it takes some time for orders to settle.
You can put on a trade at time $t$, but you don't actually own the
instrument until it _settles_ at ${t + \epsilon}$ for some ${\epsilon > 0}$.

For the profit and loss to be right continuous we define
$$
\int_0^t 1_{(u, v]}(s)\,dX_s = 
\begin{cases}
0 & t < u \\
X_{t+} - X_t & t = t \\
X_t - X_u & u < t < v \\
X_v - X_u & t \ge v \\
\end{cases}
$$
covering the $t = u$ and $t = v$ cases.
-->

Holding one share from time $u$ to time $v$ corresponds to the trading
stragegy of buying 1 share at $u$ and selling one share at $v$.  Of course
you exchange shares with someone other than yourself.  It is customary
in Mathematical Finance literature to assume there is a "market" available
that provides price $X_t$ at trading time $t$. It reality, things are more complicated.
Anyone who has ever traded has experienced _slippage_. The price you see on a trading screen is
not necessarily the price at which your order will be executed.
The price also depends on whether you are
buying or selling --- the _bid/ask spread_. That might increase depending
on the amount you want to buy or sell.  It also depends on the credit
worthiness of the counterparties involved.

We will ignore all that for now and pretend any amount can be bought
or sold at exactly price $X_t$.  These unrealistic assumptions can be
addressed by more precise mathematical models.

The market has many instruments so we assume $X_t$ is a vector
indexed by all available market instruments. A common assumption is that
a _money-market_ instruement available for financing trading strategies.
In the Black-Scholes/Merton model it has price $X_t = \exp(\rho t)$
for some constant $\rho\in\RR$.
We don't make that assumption.

A _trading strategy_ is a finite number of increasing (stopping) times $(\tau_j)$ and
the corresponding number of shares to trade $\Gamma_j$ that depend only
on the information available at time $\tau_j$.
Trades accumulate to a position ${\Delta_t = \sum_{\tau_j < t} \Gamma_j}$.
Note the strict inequality. It takes some time for a trade to settle and
become part of the position.
Define $\Gamma_t = \Gamma_j$ if $t = \tau_j$ for some $j$ and is zero otherwise.

__Exercise__. _Show $\Delta_t = \sum_{s<t}\Gamma_s$ is piecewise constant on $(\tau_j, \tau_{j+1}]$_.

_Hint_: The value on $(\tau_j, \tau_{j+1}]$ is $\sum_{i\le j}\Gamma_i$.

In particular, $\Delta_t$ is left-continuous and we can define the profit
and loss for the strategy by the stochastic integral.

### Value

The _value_, or _mark-to-market_ of a position is
${V_t = (\Delta_t + \Gamma_t)\cdot X_t}$. 
Note the position $\Delta_t$ does not contain the trade just executed, $\Gamma_t$. 
This also makes the unrealistic assumption that the entire position can
be liquidated at exactly price $X_t$.

Mark-to-market is used for accounting and does not involve actual trading.
Often the price is just a good faith estimate if the instrument is
not actively traded.

### Account

Trading involves entries in the _trading account/blotter_. Many instruments
entail _cash flows_ $C_t$ in proportion to the amount held at time $t$.
Stocks have dividends, bonds have coupons, futures have periodic margin adjustments
and their price is always 0. The money-market account has no cash flows.

The amount that shows up at time $t$ in the account is
$$
A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t.
$$
You get all cash flows proportional to your existing position and pay
for the trade just executed.

### Profit and Loss

The profit and loss of a trading strategy over an interval $(u, v]$ is
$$
	N(u, v) = V_v - V_u + \sum_{u < t \le v} A_t.
$$

## Exchange

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
If you exchange $(16, \$)$ for $(2, F)$ the price is $16/2$.

If a seller quotes a price $X_t$ then the exchange
$\chi = (t, (X_t a', e), (a', i', e'))$ is available to the buyer.

### Transaction

A _transaction_ is a collection of exchanges. Often several counterparties
are involed in trading, e.g., a broker who gets paid for hooking up the
buyer and seller.

[^2]: Actually a multiset. In practice, positions are associated with a unique position id.
The position id can be used as a primary key to associate more details about the position
in a table using that as a foreign key.
