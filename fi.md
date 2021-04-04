---
title: Fixed Income
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Constant cash flows
...

\newcommand\RR{\mathbf{R}}
\renewcommand\AA{\mathcal{A}}

## Fixed Income

A _fixed income_ instrument is specified by cash flows $(c_j)$ at times $(u_j)$.
This is just a portfolio of zero coupon bonds so its _present value_ is
$P = \sum_j c_j D(u_j)$ where $D(u)$ is the discount to time $u$.
The present value at time $t$ is $P_t = \sum_{u_j > t} c_j D_t(u_j)$
where $D_t(u)$ is the discount at time $t$ to time $u$.

### Zero Coupon Bond

A _zero coupon bond_ , $D(u)$, pays one unit at maturity $u$ so $C^{D(u)}_u = 1$ is the only cash flow.
We write $D_t(u)$ for the price $X_t^{D(u)}$ of the zero coupon bond at time $t$.
An arbitrage free model requires the price at time $t$ to
satisfy $D_t(u)D_t = E_t[D_u]$ so $D_t(u) = E_t[D_u]/D_t$. In the continuous time
case $D_t(u) = E_t[\exp(-\int_t^u f_s\,ds)]$.

The forward curve, $f(u)$, is defined by $D_0(u) = \exp(-\int_0^u f(s)\,ds)$.
The forward curve at time $t$, $f_t(u)$, is defined by $D_t(u) = \exp(-\int_t^u f_t(s)\,ds)$.

A _risky zero coupon bond_ with _recovery_ $R$ and _default time_ $T$
has a single cash flow $C_u = 1$ if default occurs after maturity or
$C_T = R$ if $T \le u$. It is customary to assume $R$ is constant.
As with American options, we must expand the sample space to $Ω\times (0,\infty]$
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
assumption that default time is independent of the deflator. Under these assumptions
we have
$$
	D_t^{R,T}(u) = D_t(u)\bigl(R P(T \le u | T > t) 1(t < T \le u) + P(T > u | T > t) 1(T > u)\bigr).
$$
In principal, $R$ could be random and joint distributions involving the default time
and deflators could be specified.

### Discount Curve

It is not the case zero coupon bonds of all maturities are traded.
The _discount curve_ $D(t)$ is used to interpolate a discount for all maturities.
An instrument with cash flows $(c_k)$ at times $(u_k)$ and initial
price $p$ _fits_ the curve if $p = \sum_k c_k D(u_k)$.
Typically a collection of such intruments and prices are given and we
wish to find a discount curve that fits them.
This is a highly underdetermined problem and there is a vast literature
on various methods of interpolation.

The _spot_ rate $r(t)$ and _forward rate_ $f(t)$ are defined by
$D(t) = e^{-tr(t)} = e^{-\int_0^t f(s)\,ds}$. Since
$r(t) = (1/t)\int_0^t f(s)\,ds$  we have $f(t) = r(t) + tr'(t)$.
It is preferable to work with forward rates since
it is not obvious when looking at a curve for $r(t)$
when it implies $f(t) \ge 0$ for all $t$.
Also, integration smooths out functions while differentiation
can exaggerate variation.

### Bootstrap

A fixed income instrument has cash flows $(c_k)$ at times $(u_k)$
so it is simply a portfolio of zero coupon bonds. Given a
discount $D(t)$ its value is $p = \xum_k c_k D(u_k)$.
Given a price, its _yield_ $y$ is the constant forward rate that
matches the price for discount $D(t) = e^{-yt}$.

Given a collection of fixed income instruments ordered by increasing
maturity and corresponding prices we can bootstrap a discount curve
having a piecewise constant forward curve that matches each price.
The first forward is the yield of the first instrument. Given a discount
to time $u$ and a forward rate $f$ we can extend the discount for $t >
u$ by $D(t) = D(u)e^{-f(t - u)}$.  This determines a piecewise constant
forward curve that reprices every instrument in the collection.

The bootstrap method is completely deterministic. It assumes the
forward curve is piecewise constant with jumps at maturities
of instruments used to build the curve. As instruments of
increasing maturity are added, the initial part of the curve is
fixed and the new piecewise constant segment is chosen to match the
price of the instrument being added. It is important that no two
instruments have nearly equal maturity since the forward between
those dates may require a large adjustment to fit the price.

The vast literature on various methods of interpolating discount curves
should be ignored. Splining data introduces mathematical artifacts into
the discount. A cubic Hermite tension spline can produce a forward curve
that is pleasing to the eye, but makes it difficult to explain to a
trader why their rho bucketing is off. It is better to add synthetic
instruments at intermediate maturities with prices determined by an
interpolation method that traders can understand.

A piecewise constant curve is determined by times $(t_j)$, $0\le j\le n$, and
forwards $(f_j)$, $0 < j \le n$, where $f(t) = f_j$ for $t_{j-1} < t \le t_j$.
Note $f(t_j) = f_j$ and the curve is undefined for $t > t_n$.
We assume $t_0 = 0$ so $(t_j, f_j)$, $1\le j\le n$, determine the curve.

Given a forward curve and an instrument with maturity $t > t_n$
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
$p = p_n + c_0 D(t_n)e^{-f(u_0 - t_n) + c_1 D(t_n)e^{-f(u_1 - t_n)}$ so
$$
	f = ...
$$

<!--
Add zero.
Add with one cash flow after $t_n$.
Add atm forward with one or two cash flows after $t_n$
-->

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

<!--
Series of back-to-back forwards...
-->

There are also forward rate agreements not involving the exchange of notional. A
(fixed rate) _payer_ FRA has the single cash flow $(f - F_u^δ(u,v))δ(u,v)$ at time $v$.
A _receiver_ FRA has the negative of this cash flow. The value at any time $t \le u$ is
determined by

<!--
f delta - F delta' if different day count basis
-->

\begin{align*}
V_t D_t &= E_t[(f - F_u(u,v;δ))δ(u,v) D_v] \\
        &= E_t[fδ(u,v) D_v - E_u[D_u - D_v]]  \\
        &= E_t[fδ(u,v) D_v - D_u + D_v]  \\
        &= E_t[-D_u + (1 + fδ(u,v)) D_v] \\
\end{align*}

which is the same as for a forward rate agreement that does exchange notional.
These two types of FRAS's have very different risk characteristics.
If either counter-party defaults during the time notionals are exchanged the loss can
be much larger than when the payment is only the difference of the fixed and floating rate.

<!--
Floating leg, fixed leg.
Allow different dcb and frequency
-->

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

### LIBOR Market Model

Assuming discrete times $(t_j)$, the deflator is determined by the joint distribution of
the repo rates $F_j = F_{t_j}$ over $[t_j, t_{j+1})$. (We use capital $F$ instead of
lower case $f$ to indicate it is a random variable.)

The LIBOR Market model assumes the forwards are jointly lognormal,
$$
	F_j = \phi(t_j)\exp(\Sigma_j\cdot B_{t_j} - ||\Sigma_j||^2 t_j/2),
$$
where $\phi(t_j) = E f_j$ is the futures quote, $\sigma_j$ is a vector with norm
equal to the at-the-money caplet volatility, and $B_t$ is vector-valued Brownian motion.
A nice feature of this model is that the forward curve and at-the-money caplet prices
are not affected by the individual components of the volatility vectors.

<!--
A common parameteration for the volatilities is $\Sigma(t) = \sigma(t)(\cos\alpha t, \sin\alpha t)$
for some parameter $\alpha$. Clealy $||\Sigma(t)|| = sigma(t)$. This can be used to fit, e.g., one
swaption price. Note $\Sigma\cdot B_t = \sigma(B_t^0\cos(\alpha t) + B_t^1\sin(\alpha t)$ and
$\Cov(B_t,B_u) = t\cos(\alpha(u-t))$ for $t < u$.

The futures are determined by the forwards and volatilities; $\phi(t) = f(t) + \sigma(t)^2 t^2/2$.
-->
