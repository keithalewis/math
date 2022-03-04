---
title: Zero Coupon Bonds
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Moving fixed cash flows through time.
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}

Finance involves moving cash flows through time.
The _realized return_, $R(t,u)$, from time $t$ to time $u$
indicates amount $c$ invested at $t$ yields $cR(t,u)$ at $u$.
Taking $c = 1/R(t,u)$ we have $1/R(t,u)$ at $t$ yields $1$ at $u$,
so $D(t,u) = 1/R(t,u)$ is the price at $t$ of a zero coupon bond maturing at $u$.

What economists call _the law of one price_ can be used to show
how the discount curve $D(t,u)$ at time $t$ in the future is determined
by todays discount $D(u) = D(0,u)$.
One unit today pays $R(t,u)$ at time $u$.
We can also invest one unit today and recieve $R(0,t)$ at time $t$, then reinvest that
at time $t$ to get $R(0,t)R(t,u)$ at time $u$. This shows $R(0,u) = R(0,t)R(t,u)$.
In terms of discounts $1/D(0,u) = 1/D(0,t)D(t,u)$ so $D(t,u) = D(0,u)/D(0,t) = D(u)/D(t)$.
Todays discount curve determines all future discount curves.

Mathematicians like to work with discounts but traders prefer to work in terms of rates.
There are various ways of converting rates to discounts.
The _spot_ rate $r(u)$ is defined by $D(u) = \exp(-ur(u))$.
The _forward_ rate $f(u)$ if defined by $D(u) = \exp(-\int_0^u f(t)\,dt)$.
Neither of these are directly quoted market rates and are called _continuously compounded_ rates
based on the mathematical fact $e^x = \lim_{n\to\infty}(1 + x/n)^n$.
They can be defined in terms
of discrete compounding periods and day count conventions used in the market.

We can define the spot and forward at time $t$ by 
_Forward spot_ $r(t,u)$ is defined by $D(t,u) = \exp(-(t - u)r(t,u))$.
_Forward forward_ is defined by D(t,u) = \exp(-\int_t^u f(s)\,ds)$.
