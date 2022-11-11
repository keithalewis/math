---
title: Zero Coupon Bonds
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Moving fixed cash flows through time.
...

\newcommand\mb[1]{\mathbf{#1}}

A _zero coupon bond_ paying 1 unit at time $t$, $D(t)$, has _price/discount_
we will also denote by $D(t)$. It is the cost of moving 1 unit at $t$ back to today.
Equivalently, 1 unit invested now can be redeemed at the _realized return_ $R(t) = 1/D(t)$ at time $t$.
The _forward realized return_ over the period from time $t$ to time $u$
is denoted $R(t,u)$, where $a$ units invested at $t$ can be redeemed
for $aR(t,u)$ at time $u$.
The _forward discount_ over the period from $t$ to $u$ is $D(t,u) = 1/R(t,u)$.
It is the price of a zero coupon bond at time $t$ paying 1 unit at $u$.
Note $R(t) = R(0,t)$ and $D(t) = D(0,t)$.

What economists call _the law of one price_ can be used to show
how the realized return $R(t,u)$ at time $t$ of recieving
one unit at $u > t$ is determined
by today's realized return $R(t) = R(0,t)$.
We can invest one unit today and receive $R(t)$ at time $t < u$, then reinvest that
at time $t$ to get $R(t)R(t,u)$ at time $u$. 
Investing one unit today pays $R(u)$ at time $u$.
This shows $R(u) = R(t)R(t,u)$
so $R(t,u) = R(u)/R(t)$. In terms of discounts $D(t,u) = D(u)/D(t)$.

Mathematicians like to work with discounts but traders prefer to work in terms of rates.
There are various conventions for converting rates to discounts.

The _spot_ rate, or _yield_, $r(t)$ is determined by $D(t) = \exp(-tr(t))$.
It is the constant rate that recovers the price of the zero coupon bond
maturing at $t$.

The _forward_ rate $f(t)$ is determined by $D(t) = \exp(-\int_0^t f(s)\,ds)$.

__Exercise__. _Show $r(t) = (1/t)\int_0^t f(s)\,ds$_.

The spot rate is the average of the forward rate.

__Exercise__. _Show $f(t) = r(t) + tr'(t)$_.

Note $f(t) = r(t)$ when $r'(t) = 0$. If $r(t)$ has local bumps this formula magnifies those
when its derivative is large.
It is numerically more stable to work with forward rates
when implementing these on a computer.

__Exercise__. _Show any one of $D(t)$, $r(t)$, and $f(t)$ determine the other two_.

The _forward spot_ $r(t,u)$ is defined by $D(t,u) = \exp(-(u - t)r(t,u))$.

__Exercise__. _Use $D(t,u) = D(u)/D(t)$ to show $r(t,u) = (ur(u) - tr(t))/(u - t)$_.

The _forward forward_ $f(t,u)$ is defined by $D(t,u) = \exp(-\int_t^u f(t, s)\,ds)$.

__Exercise__. _Use $D(t,u) = D(u)/D(t)$ to show $f(t,u) = f(u)$, $u\ge t$_.

Note $f(t,t) = f(t)$.

It is simple to convert the forward today into the forward forward at $t$,
just chop off the interval $[0,t]$.

## Stochastic Forward

Model with stochastic interest rates are completly determined
by the _continuously compounded short rate_, $f_t$.  It is a random
variable that corresponds to the unknown _repurchase agreement rate_
at time $t$. A repurchase agreement specifies a time $t$, an interval $\Delta t$,
and a rate $r_t$ known at time $t$. One unit invested at time $t$ pays $1 + r_t\Delta t$
at $t + \Delta t$. There exists $f_t$, known at time $t$, with $1 + r_t\Delta t = e^{f_t\Delta t}$.
Since $1 + x \approx e^x$ for small $x$, $r_t\approx f_t$. 

__Exercise__. _Show $f_t = \log(1 + r_t\Delta t) /\Delta t$_.

Note since $\log(1 + x)\approx x$ for small $x$ this also shows $f_t\approx r_t$.

In the continuous time limit, one unit invested at time 0 and rolled over
at the short/repo rate accrues to $R_t = e^{\int_0^t f_s\,ds}$.  This instrument
is the _money market_ account. It can be used to borrow or lend money to
fund trading strategies.  The stochastic discount is $D_t = 1/R_t$.

Let $D_t(u)$ be the price at time $t$ of a zero coupon bond maturing at $u$.
By the Fundamental Theorem of Arbitrage Pricing, $D_t(u)D_t = E_t[D_u]$ so
$D_t(u) = E_t[D_u/D_t] = E_t[\exp(-\int_t^u f_s\,ds)]$.

The _stochastic forward curve_ $f_t(u)$ is defined
by $D_t(u) = \exp(-\int_t^u f_t(s)\,ds)$.
It is the forward curve given information at time $t$.
