---
title: Zero Coupon Bonds
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Moving fixed cash flows through time.
...

\newcommand\mb[1]{\mathbf{#1}}

Finance involves moving cash flows through time.
A _zero coupon bond_ paying 1 unit at time $t$ has price $D(t)$.
Equivalently, 1 unit invested now has _realized return_ $R(t) = 1/D(t)$ at time $t$.
The realized return over the period from time $t$ to time $u$
is denoted $R(t,u)$, so $R(0,t) = R(t)$.
The _discount_ over the period from $t$ to $u$ is $D(t,u) = 1/R(t,u)$.
Note $R(t) = R(0,t)$ and $D(t) = D(0,t)$.

What economists call _the law of one price_ can be used to show
how the realized return curve $R(t,u)$ at time $t$ in the future is determined
by today's realized return $R(t) = R(0,t)$.
Investing one unit today pays $R(0,u)$ at time $u$.
We can also invest one unit today and receive $R(0,t)$ at time $t < u$, then reinvest that
at time $t$ to get $R(0,t)R(t,u)$ at time $u$. This shows $R(0,u) = R(0,t)R(t,u)$
so $R(t,u) = R(0,u)/R(0,t)$. In terms of discounts $D(t,u) = D(0,u)/D(0,t) = D(u)/D(t)$.

Mathematicians like to work with discounts but traders prefer to work in terms of rates.
There are various ways of converting rates to discounts.

The _spot_ rate $r(u)$ is defined by $D(u) = \exp(-ur(u))$.

The _forward_ rate $f(u)$ if defined by $D(u) = \exp(-\int_0^u f(t)\,dt)$.

Neither of these are directly quoted market rates and are called _continuously compounded_ rates.
The continuously compounded rates can be defined in terms
of discrete compounding periods and day count conventions used in the market.

The _forward spot_ $r(t,u)$ is defined by $D(t,u) = \exp(-(u - t)r(t,u))$.

__Exercise__. _Use $D(t,u) = D(u)/D(t)$ to show $r(t,u) = (ur(u) - tr(t))/(u - t)$_.

The _forward forward_ $f(t,u)$ is defined by $D(t,u) = \exp(-\int_t^u f(s)\,ds)$.

__Exercise__. _Use $D(t,u) = D(u)/D(t)$ to show $f(t,u) = f(u)$, $u\ge t$_.

It is simple to convert the forward today into the forward forward at $t$,
just chop off the interval $[0,t]$.
