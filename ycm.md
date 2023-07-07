---
title: Yield Curve Models
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Continuously compounded stochastic forward rate
...

\newcommand\RR{\boldsymbol{R}}
\newcommand\CC{\boldsymbol{C}}
\newcommand\FF{\boldsymbol{F}}
\newcommand\HH{\mathcal{H}}
\newcommand\MM{\mathcal{M}}
\renewcommand\span{\operatorname{span}}
\newcommand\ran{\operatorname{ran}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\Cov{\operatorname{Cov}}
\newcommand\Var{\operatorname{Var}}

Unlike the equity world where the menagerie of stock prices are like bees coming out of a hive,
there is a single thread that ties together all fixed income instrument prices.
The _continuously compounded stochastic forward rate_ $f_t$ corresponds quite closely
to the SOFR rate. The Secured Overnight Financing Rate
is based on the large volume of overnight repurchase agreements that actually trade in the market.
LIBOR was a term rate based on calling up traders and asking for their opinions.

## Models

Using the mathematical fiction of continuous time trading, 
the continuously compounded stochastic forward rate $f_t$ 
is the rate at which money can be borrowed or lent over an infinitesimal time period.
Any amount $a\in\RR$ can be invested at time $t$ and return $a(1 + f_t\,dt) = a\exp(f_t dt)$ at
time $t + dt$.
Rolling over 1 unit invested at time 0 results in realized return $R_t = \exp(\int_0^t f_s\,ds)$ at time $t$.
It is the price of a _money market_ account at time $t$.
The _stochastic discount_ is $D_t = 1/R_t$.


<!--
Instruments have _prices_. Continuing the mathematial fiction, we assume
any instrument with price $X_t$ can be bought or sold at any amount
$a\in\RR$.  Of course instruments trade in discret units, there is a
bid/ask spread that widens as the amount increases, and also depends on the
counterparties involved, not to mention the mechanics of trade execution.
Let me know if you are interested in helping put these market realities
on a firm mathematical foundation.

cites!!!
-->

Holding an instrument entails _cash flows_ that, unlike prices, are almost always 0.
Stocks have dividends, bonds have coupons,
futures have periodic cash flows in the margin account.
The price of a futures is always 0. Futures are naturally occuring martingales. 
Money market accounts have no cash flows.

In every [arbitrage-free model](um0.html) prices $X_t$ and cash flows $C_t$ must satisfy
$$
	X_t D_t = E_t[X_u D_u + \sum_{t < s \le u} C_s D_s],\quad t \le u.
$$
If an instrument has no cash flows then $X_t D_t$ is a martingale.
If $X_u D_u$ goes to 0 as $u\to\infty$ then the price
is the expected value of discounted future cash flows, just as
Graham and Todd taught us.

## Zero Coupon Bond

A zero coupon bond maturing at $u$ has a single non-zero cash flow $C_u^{D(u)} = 1$.
In an arbitrage-free model $X_t^{D(u)}D_t = E_t[D_u]$.
We write ${X_t^{D(u)} = D_t(u) = E_t[D_u]/D_t}$ for the price at time $t$
of a zero coupon bond maturing at $u$.

__Exercise__. _Show $D_t(u) = E_t[\exp(-\int_t^u f_s\,ds)]$_.

Every fixed income product is a portfolio of zero coupon bonds. For example,
a forward rate agreement over the period $[u,v]$ has two cash flows
$C_u = -1$ and $C_v = 1 + \delta(u,v) f$ where $\delta(u,v)$ is the
day count fraction for the interval and $f$ is a fixed coupon rate.
The _par coupon_ makes the price 0.

__Exercise__. _If a forward rate agreement has price 0 then
$f = (D(u)/D(v) - 1)/\delta(u, v)$_.

_Hint_: Use $0 = E[-D_u + (1 + \delta(u,v) f)D_v]$.

Mathematical analytics uses the dimensionless discount but traders like to use rates.
Letting $D(t) = D_0(t)$, the _forward curve_ $f(t)$ is defined
by $D(t) = \exp(-\int_0^t f(s)\,ds)$.

__Exercise__. _Show $f(t) = -(d/dt)\log D(t)$_.

__Exercise__. _Show $0 = E[(f_t - f(t))D_t]$_.

_Hint_: Compute $dD(t)/dt$ two ways using $E[\exp(-\int_0^t f_s\,ds)] = \exp(-\int_0^t f(s)\,ds)$

This shows $f(t)$ is the _par coupon_ for a forward rate agreement with cash flow $f_t - f(t)$ at time $t$.

Futures quotes are naturally occuring martingales. The futures quote at time 0
on $f_t$ expiring at $t$ is $\phi(t) = E[f_t]$.

Since ${0 = E[(f_t - f(t))D_t] = E[f_t D_t] - f(t) D(t) = E[f_t] D(t) + \Cov(f_t, D_t) - f(t) D(t)}$
we have $\phi(t) - f(t) = -\Cov(f_t, D_t)/D(t)$. In general $f_t$ and $D_t$
are negatively correlated so the difference between futures and forwards (_convexity_) is positive.

Every fixed income model is determined by the stochastic forward rate.

## LIBOR Market Model

The LIBOR market model assumes $f_t = \phi(t)\exp(\Sigma(t)\cdot B_t - \|\Sigma(t)\|^2t/2)$
where $B_t$ is vector-valued Brownian motion and $\Sigma(t)$ is a vector valued function of time.
The futures quotes $\phi(t)$ can be observed in the market. If we have at-the-money
call options with prices ${E[\max\{f_t - f(t), 0\}D_t]}$ then the implied volatility
gives us $\|\Sigma(t)\|$. Swaption prices can be used to determine the convexity.
A typical assumption is $\Sigma(t) = \sigma(t)(\cos\alpha(t), \sin\alpha(t))$ for some 
functions $\sigma(t)$ and $\alpha(t)$. 
One felicitous feature of this parameterization is the futures quotes and options prices
are independent of $\alpha(t)$ since $\|\Sigma(t)\| = \sigma(t)$.

There is no closed-form formula for calculating $\Cov(f_t, D_t)$ in the LIBOR market model
but there is for the Ho-Lee model.

## [Ho-Lee](ho-lee.html)

The Ho-Lee model specifies a stochastic forward rate
$f_t = \phi(t) + \Sigma(t)\cdot B_t$ where $\phi(t)$ is the futures
quote and $\Sigma(t)$ is the vector-valued volatility.

__Exercise__. _Show for the Ho-Lee model with constant scalar volatility $\sigma = \Sigma(t)$_
$$
	D(t) =  \exp(-\int_0^t \phi(s)\,ds + \sigma^2 t^3/6)
$$

_Hint_: Use $E[\exp(N)] = \exp(E[N] + \Var(N)/2)$ for any normally distributed
random variable and show ${\Var(\int_0^t B_s\,ds) = \int_0^t \int_0^t \Cov(B_u, B_v)\,du\,dv = t^3/3}$.

Since $D(t) = \exp(-\int_0^t f(s)\,ds)$ we have
$f(t) = \phi(t) - \sigma^2 t^2/2$.

__Exercise__. _Show $\Cov(N, f(M)) = E[f'(M)] \Cov(N, M)$ if $N$ and $M$ are jointly normal_.

_Hint_: Use $E[\exp(N) f(M)] = E[\exp(N)] E[f(M + \Cov(N,M))]$ if $N$ and $M$ are jointly normal,
differentiate $E[\exp(\alpha N) f(M)]$ with respect to $\alpha$, and set $\alpha = 0$.

__Exercise__. _Show $\Cov(f_t, D_t) = -D(t)\sigma^2 t^2/2$_.

_Hint_: Use the previous exercise.

Note this agrees with the previous convexity calculation.

<!--
$\Cov(f_t, D_t) = E[\exp(-\int_0^t \phi(s) + \sigma B_s\,ds)]\Cov(\sigma B_t,-\int_0^t \sigma B_s\,ds)
= D(t)  \int_0^t \sigma^2 s\,ds = D(t)\sigma^2 t^2/2$.
-->
