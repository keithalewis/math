---
title: Zero Coupon Bonds
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Moving fixed cash flows through time.
...

\newcommand\mb[1]{\mathbf{#1}}

A _zero coupon bond_ paying 1 unit at time $t$ has _price/discount_ $D(t)$.
Equivalently, 1 unit invested now can be redeemed at the _realized return_ $R(t) = 1/D(t)$ at time $t$.
The _forward realized return_ over the period from time $t$ to time $u$
is denoted $R(t,u)$, so $R(0,t) = R(t)$, $a$ units invested at $t$ can be redeemed
for $aR(t,u)$ at time $u$.
The _forward discount_ over the period from $t$ to $u$ is $D(t,u) = 1/R(t,u)$.
Note $R(t) = R(0,t)$ and $D(t) = D(0,t)$.

What economists call _the law of one price_ can be used to show
how the realized return $R(t,u)$ at time $t$ in the future or recieving
one unit at $u > t$ is determined
by today's realized return $R(t) = R(0,t)$.
Investing one unit today pays $R(u)$ at time $u$.
We can also invest one unit today and receive $R(t)$ at time $t < u$, then reinvest that
at time $t$ to get $R(t)R(t,u)$ at time $u$. This shows $R(u) = R(t)R(t,u)$
so $R(t,u) = R(u)/R(t)$. In terms of discounts $D(t,u) = D(u)/D(t)$.

Mathematicians like to work with discounts but traders prefer to work in terms of rates.
There are various conventions of converting rates to discounts.

The _spot_ rate, or _yield_, $r(t)$ is determined by $D(t) = \exp(-tr(t))$.
It is the constant rate that recovers the price of the zero coupon bond.

The _forward_ rate $f(t)$ is determined by $D(t) = \exp(-\int_0^t f(s)\,ds)$.

__Exercise__. _Show $r(t) = (1/t)\int_0^t f(s)\,ds$_.

The spot rate is the average of the forward rate.

__Exercise__. _Show $f(t) = r(t) + tr'(t)$_.

__Exercise__. _Show any one for $D(t)$, $r(t)$, and $f(t)$ determine the other two_.

Note $f(t) = r(t)$ when $r'(t) = 0$. If $r(t)$ has local bumps this formula magnifies those
when its derivative is large.
It is better to work numerically with forward rates.

The _forward spot_ $r(t,u)$ is defined by $D(t,u) = \exp(-(u - t)r(t,u))$.

__Exercise__. _Use $D(t,u) = D(u)/D(t)$ to show $r(t,u) = (ur(u) - tr(t))/(u - t)$_.

The _forward forward_ $f(t,u)$ is defined by $D(t,u) = \exp(-\int_t^u f(s)\,ds)$.

__Exercise__. _Use $D(t,u) = D(u)/D(t)$ to show $f(t,u) = f(u)$, $u\ge t$_.

It is simple to convert the forward today into the forward forward at $t$,
just chop off the interval $[0,t]$.

