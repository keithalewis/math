---
title: Yield Curve Models
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Continuously compounded stochastic short rate
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\CC{\boldsymbol{C}}
\newcommand\FF{\boldsymbol{F}}
\newcommand\HH{\mathcal{H}}
\newcommand\MM{\mathcal{M}}
\newcommand\span{\operatorname{span}}
\newcommand\ran{\operatorname{ran}}
\newcommand\ker{\operatorname{ker}}

Unlike the equity world where the menagerie of stock prices are like bees coming out of a hive,
there is a single thread that ties together all fixed income instrument prices.
The _continuously compounded stochastic short rate_ $f_t$ corresponds quite closely
to the new sheriff in town, the SOFR rate. The Secured Overnight Funding Rate
is based on overnight repurchase agreements that have actually traded in the market.
LIBOR was based on calling up traders and asking for their opinions.

It was quite shocking in September 2019 when SOFR rates jumped from ...

Every interest rate model is a special case of the LIBOR market model.
I learned about it when I started
my career on Wall Street at Bankers Trust. Peter Kleidman figured out
futures quotes were higher than forward rates.
Someone before me built a model to monetize that.
I was working in their IT department at the time
and was surprised I could see the profit and loss every trader was making.
He made 6 buck, in the lingo, but I don't know what his bonus was that year.
The market quickly figured this out and the convexity arbitrage evaporated.

The LMM model used to be called the BGM model. Those are the initials
of consultants hired at Bankers Trust who wrote a paper about what
they saw there. Steve Heston invented his model during his time
at BT that was used there.


Using the mathematical fiction of continuous time trading, $f_t$ 
is the rate at which money can be borrowed or lent over an infinitesimal time period.
Any amount $a\in\RR$ can be invested at time $t$ and return $a(1 + f_t\,dt) = a\exp(f_t dt)$ at
time $t + dt$.

Rolling over 1 unit invested at time 0 results in $R_t = \exp(\int_0^t f_s\,ds)$ at time $t$.
It is the price of a _money market_ account at time $t$.
The _stochastic discount_ is $D_t = 1/R_t$.

Instruments have _prices_. Continuing the mathematial fiction, we assume
any instrument with price $X_t$ can be bought or sold at any amount
$a\in\RR$.  Of course instruments trade in discret units, there is a
bid/ask spread that widens as the amount increases, and also depends on the
counterparties involved, not to mention the mechanics of trade execution.
Let me know if you are interested in helping put these market realities
on a firm mathematical foundation.

cites!!!

Holding an instrument entails _cash flows_ that, unlike prices, are almost always 0.
Stocks have dividends, bonds have coupons,
futures have periodic cash flows in the margin accout used to set them up.
The price of a futures is always 0. They are naturally occuring martingales. 
Money market accounts have no cash flows.

$X_t D_t = E_t[X_u D_u + \sum_{t < s \le u} C_s D_s]$.

$D_t(u) = E_t[D_U/D_t] = E_t[\exp(-\int_t^u f_s\,ds)]$.

Mathematical analytics uses the dimensionless discount but traders like to use rates.
Letting $D(t) = D_0(t)$, The forward curve $f(t)$ is defined
by $D(t) = \exp(-\int_0^t f(s)\,ds)$.

__Exercise__. _Show $f(t) = -(d/dt)\log D(t)$_.

__Exercise__. _Show $0 = E[(f(t) - f_t)D_t]

_Hint_: Compute $(d/dt)D(t)$ two ways using $D(t) = E[\exp(-\int_0^t f_s\,ds)] = \exp(-\int_0^t f(s)\,ds)$

This shows $f(t)$ is the _par coupon_ for a forward rate agreement paying $f(t) - f_t$ at time $t$.

$\Cov(f_t, D_t)$
