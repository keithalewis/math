---
title: Fixed Income
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Fixed cash flows
...

\newcommand\RR{\mathbf{R}}
\renewcommand\AA{\mathcal{A}}
\newcommand{\Cov}{\operatorname{Cov}}

## Fixed Income

Zero coupon bonds are the basic mechanism for moving fixed cash flows
in time. A _zero coupon bond_ pays unit cash flow at _maturity_ $u$.
Its _price_ $D(u)$ is the _discount curve_. Paying $D(u)$ now to the bond
issuer results in receiving one unit from them at $u$, assuming they
have not defaulted. After a bond is issued it can be traded
in the _secondary market_.

A _fixed income instrument_ is a portfolio of zero coupon bonds.
It is specified by amounts $c_j$ paid at times $u_j$
and has _value_ $V_0 = \sum_j c_j D(u_j)$. Typical bonds
make semi-annual coupon payments and a final payment of
coupon plus notional at maturity.

We distinguish price from value. The value is only an idealized mathematical
approximation to a market price. A price is an amount involved in an
actual market transaction. Value does not take into account bid/ask
spread, which typically widens as the size of the trade increases, or counterparty
risk.

Paying $aD(u)$ now results in $a$ at maturity for any[^1] number $a$. 

[^1]: You can't buy more than than the amount issued. The amount must be
an integer multiple of some minimum trading unit.
Shorting a bond ($a < 0)$ might be difficult or impossible. 

__Exercise__. _Show paying 1 now results in $1/D(u)$ at $u$_.

_Hint_: Use $D(u)/D(u) = 1$.

We call $R(u) = 1/D(u)$ the _realized return_ over the interval $[0,u]$.

It is convenient to express discount in terms of _rates_
to compare bonds of different maturities.
For example, a $5\%$ annual
rate implies a realized return of $R = 1 + 0.05$ in 1 year.
If that is reinvested for the next year it grows to
$1.05^2 = 1.1025$.

## Dates and Times

One problem in valuing fixed income securites is how to convert
calendar dates into time in years used in the mathematical theory.
The difference of two calendar dates must be converted into
a time in years. The only requirement is if $y = d_1 - d_0$
is the number of years between two calendare dates then $d_0 + y = d_1$.
There is no unique solution to this problem. One possible solution
is to let $y$ be the number of seconds between $d0$ and $d1$ and
divide by the number of seconds in a year. There are exactly 86400
second in a day, but the number of days in a year varies.
If a year is divisible by 4 but not by 100 then it is
a leap year with a Feburary 29 that makes 366 days.

It is common to use $365 + 1/4 - 1/100 = 365.24$ for this but
the only thing that matters is being consistent.

Another issue is _day count basis_. 
Bonds pay coupons muliplied by a _aay count fraction_ that is
appoximately eqaul to the number of years over which the
coupon accures.

The discount can be expressed in terms of a _spot rate_ $r(u)$ where $D(u) = e^{-u r(u)}$
or a _forward curve_ $f(t)$ where $D(u) = e^{-\int_0^u f(t)\,dt}$.

__Exercise__. _Show $r(u) = (1/u)\int_0^u f(t)\,dt$_.

The spot rate is the average of the forward curve.

__Exercise__. _Show $f(u) = r(u) + ur'(u)$_

_Hint_: Use $u r(u) = \int_0^u f(t)\,dt$.

The forward equals the spot when $r'(u) = 0$.
It is numerically preferable to use the forward to define the spot
since averages smooth out the forward. Defining the forward in terms
of the spot involves a derivative that might spike.

A _fixed income_ instrument is specified by cash flows $(c_j)$ at times $(u_j)$.
A fixed income instrument is a portfolio of zero coupon bonds and its _present value_ is
$P = \sum_j c_j D(u_j)$ where $D(u)$.

???Secondary Market

### Zero Coupon Bond Dynamics

A _zero coupon bond_, $D(u)$, pays one unit at maturity $u$ so $C^{D(u)}_u = 1$ is the only cash flow.
We write $D_t(u)$ for the price $X_t^{D(u)}$ of the zero coupon bond at time $t$.
An [arbitrage free model](ucm0.html) with stochastic discount $D_t$ requires the price at time $t$ to
satisfy $D_t(u)D_t = E_t[D_u]$ so
$$
	D_t(u) = E_t[D_u]/D_t.
$$

We can write $D_t = \exp(-\int_0^t f_s\,ds)$ where $f_t$ is the _continuously compounded forward rate_,
or _short rate_ process.
It corresponds to repurchase agreement rates.

__Exercise__. _Show $D_t(u) = E_t[\exp(-\int_t^u f(s)\,ds)]$_.

An interesting feature of fixed income is that the short rate determines the price
dynamics of all instruments, assuming there are no defaults.

### Risky Bonds

A _risky zero coupon bond_ with _recovery_ $R$ and _default time_ $T$
has a single cash flow $C_u = 1$ if default occurs after maturity or
$C_T = R$ if $T \le u$. It is customary to assume $R$ is constant.
We must expand the sample space to $Ω\times (0,\infty]$
where $(ω,t)\in Ω\times (0,\infty]$ indicates default occured at time $t$.
The partition of $(0\infty]$ representing information available at time $t$ for the default time is
$\{(t,\infty]\} \cup \{\{s\}:s \le t\}$. If default has
not occured prior to $t$ we only know $T > t$. If default occured prior
to time $t$ we know exactly when it happened.

We write $D_t^{R,T}(u)$ for the price $X_t^{D^{R,T}(u)}$ of the risky zero coupon bond at time $t$.
The dynamics of a risky zero are determined by
$$
	D_t^{R,T}(u) D_t = E_t[R 1(T \le u) D_T + 1(T > u) D_u].
$$
The _credit spread_ $s_t = s_t^{R,T}(u)$ defined by $D_t^{R,T}(u) = D_t(u) e^{-u s_t}$
incorporates both recovery and default.

If rates are zero then $D_t = 1$ for all $t$ and this simplifies to
$D_0^{R,T}(u) = R P(T \le u) + P(T > u)$ when $t = 0$. If $T$ is 
exponentially distributed with hazard rate $λ$ then $P(T > t) = e^{-λ t}$
and
$$
	D_0^{R,T}(u) = R + (1 - R)e^{-λu}.
$$
When $λ = 0$ the right hand side is 1.
When $R = 0$ the credit spread equals the hazard rate.
If $λu$ is small then the approximation
$e^x \approx 1 + x$ for small $x$ gives the rule of thumb
$s = λ(1 - R)$ where $s = s_0 = s_0^{R,T}(u)$ is the credit spread.

For general $t$ we have
$$
	D_t^{R,T}(u) = R P(T \le u | T > t) 1(t < T \le u) + P(T > u | T > t) 1(T > u).
$$

Unlike in the credit default swap market, mathematical finance literture likes to
assume recovery is delayed until maturity. It is also popular to make the unrealistic
assumption that default time is independent of the stochastic discount. Under these assumptions
we have
$$
	D_t^{R,T}(u) = D_t(u)\bigl(R P(T \le u | T > t) 1(t < T \le u) + P(T > u | T > t) 1(T > u)\bigr).
$$
In principal, $R$ could be random and joint distributions involving the default time
and stochastic discount could be specified.

## Discount Curve

Suppose a fixed income instrument pays cash flows $(c_k)$ at times $(u_k)$.
The _yield_, $y(p)$, given a price $p$ is determined by
$p = \sum_k c_k e^{-y(p)u_k}$. It is the constant forward curve
that reprices the fixed income instrument.
It is a convenient proxy for price, just like Black-Scholes/Merton
implied volatility.

It is not the case zero coupon bonds of all maturities are traded.
The _discount curve_ $D(t)$ is used to interpolate a discount for all maturities.
An instrument with cash flows $(c_k)$ at times $(u_k)$ and 
price $p$ _fits_ the curve if $p = \sum_k c_k D(u_k)$.
Typically a collection of such intruments and prices are given and we
wish to find a discount curve that fits all of them.
This is a highly underdetermined problem and there is a vast literature
on various methods of interpolation.
The simplest approach is to use market data directly and avoid
non-financial artifacts introduced by various splining methods.

### Bootstrap

Given a collection of fixed income instruments ordered by increasing
maturity and corresponding prices we can bootstrap a discount curve
having a piecewise constant forward curve that matches each price.
The first forward is the yield of the first instrument. Given a discount
to time $t$ and a forward rate $f$ we can extend the discount for $u >
t$ by $D(u) = D(t)e^{-f(u - t)}$.

The bootstrap method is deterministic. It assumes the
forward curve is piecewise constant with jumps at maturities
of instruments used to build the curve. As instruments of
increasing maturity are added, the initial part of the curve is
fixed and the new constant segment is chosen to match the
price of the instrument being added. It is important that no two
instruments have nearly equal maturity since the forward between
those dates may require a large adjustment to fit the price.

The vast literature on various methods of interpolating discount curves
should be ignored. Splining introduces mathematical artifacts into
the discount. A cubic Hermite tension spline can produce a forward curve
that is pleasing to the eye, but makes it difficult to explain to a
trader why their rho bucketing is off. It is better to add synthetic
instruments at intermediate maturities with prices determined by an
interpolation method that traders can understand.
Curves should be bootstrapped with the instruments traders are using
to hedge their position.

A piecewise constant curve is determined by times $(t_j)$, $0\le j\le n$, and
forwards $(f_j)$, $0 < j \le n$, where $f(t) = f_j$ for $t_{j-1} < t \le t_j$.
Note $f(t_j) = f_j$ and the curve is undefined for $t > t_n$.
We assume $t_0 = 0$ so $(t_j, f_j)$, $1\le j\le n$, determine the curve.

Given a forward curve to time $t_n$ and an instrument with maturity $t > t_n$
we must find $f$ such that
$$
	p = \sum_{u_k \le t_n} c_k D(u_k) + \sum_{u_k > t_n} c_k D(t_n)e^{-f(u_k - t_n)}
$$
where $p$ is the instrument price. The discount $D(u)$ is determined
for $u \le t_n$ and the forward $f$ is constant for $u > t_n$.
This can be solved using one-dimensional root finding to produce the
next point $(t_{n+1}, f_{n+1}) = (t, f)$ of the piecewise constant forward curve
where $t$ is the maturity of the added instument.

If there is exactly one cash flow past $t_n$, $(c, u)$, then this equation has a closed
form solution since the second sum has only one term $c D(t_n)e^{-f(u - t_n)}$.
Denoting the first sum by $p_n$ we have
$$
	f = \frac{-\log((p - p_n)/c D(t_n))}{u - t_n}
$$
given price $p$ to produce the next point $(t_{n+1}, f_{n+1}) = (u, f)$.

If we extend the curve with an instrument having exactly two cash flows
$(c_0, u_0)$ and $(c_1, u_1)$ then there
are also closed form solutions. Since $u_1 > t_n$ we have two cases,
$u_0 \le t_n$ and $u_0 > t_n$. If $u_0 \le t_n$ then $D(u_0)$ is known
and we have $p = p_n + c_0 D(u_0) + c_1 D(t_n)e^{-f(u_1 - t_n)}$ so
$$
	f = \frac{-\log((p - p_n - c_0 D(u_0))/c_1 D(t_n))}{u_1 - t_n}.
$$
If $u_0 > t_n$ we have
$p = p_n + c_0 D(t_n)e^{-f(u_0 - t_n)} + c_1 D(t_n)e^{-f(u_1 - t_n)}$. 

__Exercise__. _Find an explicit formula for $f$_.

### Forward Rate Agreement

A _forward rate agreement_ $F^{f,δ}(u,v)$ over the period $[u, v]$ with coupon $f$ and
_day count basis_ $δ$ pays $-1$ unit at the
_effective date_ $u$, and $1 + fδ(u,v)$ at the
_termination date_ $v$, where $δ(u,v)$ is the [_day count
fraction_](https://en.wikipedia.org/wiki/Day_count_convention) for the
period.  The day count fraction is approximately equal to the time in years
between $u$ and $v$ for any day count basis.

The _forward par coupon_ at time $t$, $F_t^{f,δ}(u,v)$ is the coupon that makes the price at
time $t\le u$ equal to $0$. Since $0 = E_t[-D_u + (1 + F_t^δ(u,v)δ(u,v))D_v]$
the par coupon is
$$
	F_t^δ(u,v) = (D_t(u)/D_t(v) - 1)/δ(u,v).
$$
Writing $F_t = F_t^δ(u,v)$ and $δ = δ(u,v)$ we have
$$
	E_t[F_tδ D_v] = F_tδ E_t[D_v] = E_t[D_u - D_v] = D_t(u) - D_t(v)
$$


There are also forward rate agreements not involving the exchange of notional. A
(fixed rate) _payer_ FRA has the single cash flow $(f - F_u^δ(u,v))δ(u,v)$ at time $v$.
A _receiver_ FRA has the negative of this cash flow. The value at any time $t \le u$ is
determined by

$$
\begin{aligned}
V_t D_t &= E_t[(f - F_u(u,v;δ))δ(u,v) D_v] \\
        &= E_t[fδ(u,v) D_v - E_u[D_u - D_v]]  \\
        &= E_t[fδ(u,v) D_v - D_u + D_v]  \\
        &= E_t[-D_u + (1 + fδ(u,v)) D_v] \\
\end{aligned}
$$

which is the same as for a forward rate agreement that does exchange notional.
These two types of FRAS's have very different risk characteristics.
If either counter-party defaults during the time notionals are exchanged the loss can
be much larger than when the payment is only the difference of the fixed and floating rate.

### Interest Rate Swap

An _interest rate swap_ $F^{c,δ}(t_0, \ldots, t_n)$ with _calculation
dates_ $(t_j)$, coupon $c$, and day count basis $δ$ pays $-1$ unit
at the effective date $t_0$, $cδ(t_{j-1},t_j)$ at $t_j$, $0 < j < n$,
and $1 + cδ(t_{n-1},t_n)$ at _termination_ $t_n$.

The _swap par coupon_ at time $t$, $F_t(t_0,\ldots,t_n;δ)$,
 is the coupon that makes the price at
time $t\le {t_0}$ equal to $0$:
$$
0 = E_t[-D_{t_0} + \sum_{0<j<n} F_tδ(t_{j-1},t_j) D_{t_j} + (1 + F_tδ(t_{n-1},t_n) D_{t_n}].
$$
Hence the par coupon,
$F_t(t_0,\ldots,t_n;δ) = (D_t(t_0) - D_t(t_n))/\sum_{0<j\le n}δ(t_{j-1},t_j) D_t(t_j)$,
is determined by zero coupon bond prices.

Note that if $n = 1$ this is identical to a forward rate agreement.

There are also interest rate swaps not involving the exchange of notional. A
(fixed rate) _payer_ has the cash flows $(c - F_{t_j}(t_{j-1},t_j;δ))δ(t_{j-1},t_j)$ at times $t_j$,
$0 < j \le n$.
A _receiver_ has the negative of these cash flow.

As with forward rate agreements, the coupon making the value at time $t$ equal to zero is
the swap par coupon.

### Floorlet

Options on FRA's are called floorlets or caplets.

A _floorlet_ is a put option on an at-the-money _forward rate agreement_.
It pays $\max\{k - F_u(u,v),0\}δ(u,v)$ at time $v$.
Its value at time $t < u$ is determined by $V_t D_t = E_t \max\{k - F_u(u,v),0\}δ(u,v) D_u$.
Writing $F_u = F_u(u,v)$ and $δ = δ(u,v)$ we have
<!--
\begin{align*}
V_t D_t &= E_t[\max\{k - F_u,0\}δ D_v] \\
        &= E_t[\max\{kδ - (1/D_u(v) - 1),0\} D_v] \\
        &= E_t[\max\{1 + kδ - 1/D_u(v),0\} D_v] \\
        &= E^*_t[\max\{1 + kδ - 1/D_u(v),0\}] E_tD_v \\
        &= E^*_t[\max\{1 + kδ - 1/D_u(v),0\}] D_t(v)D_t \\
\end{align*}
where $E_t^*$ is the expectation under the forward measure $P^*$ defined
by $dP_t^*/dP_t = D_v/E_t D_v$.
This shows the value at $t$ of a floorlet is
$V_t = E^*_t[\max\{1 + kδ - 1/D_u(v),0\}] D_t(v)$.
-->

### Caplet

A _caplet_ is a call option on an at-the-money _forward rate agreement_.
It pays $\max\{F_u(u,v) - k,0\}δ(u,v)$ at time $v$.
Its value at time $t < u$ is determined by $V_t D_t = E_t \max\{F_u(u,v) - k,0\}δ(u,v) D_u$.
Similar to floorlets, the value at $t$ of a caplet is
$V_t = E^*_t[\max\{1/D_u(v) - (1 + kδ),0\}] D_t(v)$

### Floor, Cap

A _floor_ and a _cap_ are just a sequence of back-to-back floorlets or caplets.

### Swaption

A _swaption_ is an option on a swap.
It has a single cash flow $\max\{k - F_{t_0}(t_0,\ldots,t_n;δ), 0\}$ at the
effective date of the swap, $t_0$.


## Risky Bond

A _risky zero coupon bond_ with maturity $u$ pays 1 unit at $u$ if the issuer
has not defaulted and pays recovery $\rho$ at default time $\tau$ if $\tau < u$.
Both $\rho\in[0,1]$ and $\tau\ge0$ can be random variables.
