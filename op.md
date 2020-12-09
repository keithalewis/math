---
title: Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\RR}{\bm{R}}

<!--
> _Besides it is an error to believe that rigour is the enemy of simplicity. 
> On the contrary we find it confirmed by numerous examples that the rigorous 
> method is at the same time the simpler and the more easily comprehended. 
> The very effort for rigor forces us to find out simpler methods of proof. 
> &mdash; David Hilbert_
-->

European _option valuation_ involves calculating the expected value of
the _option payoff_ as a function of the _underlying_ at _expiration_.
_Greeks_ are derivatives of the _value_ with respect to _model parameters_.
This short note derives formulas for these using any positive underlying distribution.

## Share Measure

Let $Y$ be the positive, random price of some _underlying_ instrument at
option expiration.  The (forward)  _value_ of an option paying $\nu(Y)$
in some currency at expiration is $E[\nu(Y)]$ under the probability
measure $P$.  We can also consider the payoff in terms of shares of $Y$,
$\nu_s(Y) = \nu(Y)Y/E[Y]$.  If we receive $\nu_s(Y)$ shares of $Y$ at
expiration we can convert those at price $Y$ to $\nu(Y)$ in the currency.

_Share measure_ $P_s$ is defined by $dP_s/dP = Y/E[Y]$.
We write $E_s[f(Y)] = E[f(Y)Y/E[Y]$ for expectation under
the share measure.

### Parameters

The _forward_ is $y = E[Y]$ and the _vol_ squared is $s^2 = \Var(\log Y)$.
Every positive random variable can be written $Y = e^{m + sX}$ for
constants $m$, $s$ and $X$ having mean 0 and variance 1.  Using $y = E[Y]
= e^m E[e^{sX}]$ we see $e^m = y e^{-\kappa(s)}$ where
$\kappa(s) = \log E[e^{sX}]$ is the _cumulant_ of $X$.
Hence $Y = ye^{sX - \kappa(s)}$ is parameterized by $f$, $s$,
and a mean 0 variance 1 random variable $X$.

_Greeks_ are the values of the derivatives of value with respect
to forward and vol. If you prefer a different parameterization
$y = y(z,t)$, $s = s(z,t)$ the chain rule can be applied to
get greeks in terms of $z$ and $t$.

Define $\epsilon_s(x) = e^{s x - \kappa(s)}$ so $Y = y\epsilon_s(X)$
and $X = \epsilon_s^{-1}(Y/y)$. The _moneyness_ of $k$ is 
$x(k) = \epsilon_s^{-1}(k/y) = (\log k/y + \kappa(s))/s$.
Note $\partial \epsilon_s(x)/\partial x = \epsilon_s(x)s$
and  $\partial \epsilon_s(x)/\partial s = \epsilon_s(x)(x - \kappa'(s))$.

### Greeks

For any payoff $\nu$ with value $v = E[\nu(Y)]$, _delta_ is the
derivative of value with respect to the forward
$$
\partial v/\partial y = E[\nu'(Y)\partial Y/\partial y] = E_s[\nu'(Y)]
$$
since $\partial Y/\partial y = Y/y$.

__Exercise__. _Show $\partial^nv/\partial y^n = E[\nu'(Y)(\partial Y/\partial y)^n]
= E_s[\nu^{(n)}(Y)Y^{n-1}]/y^{n-1}$_, $n\ge 1$.

_Gamma_ is the second derivative with respect to the forward
$$
\partial^2 v/\partial y^2 = E_s[\nu''(Y)Y]/y.
$$

_Vega_ is  the derivative with respect to vol
$$
\partial v/\partial s = E[\nu'(Y)\partial Y/\partial s]
= E[\nu'(Y)Y(X - \kappa'(s))] = yE_s[\nu'(Y)(X - \kappa'(s))]
$$
since $\partial Y/\partial s = Y\epsilon_s(X)$.

The value and greeks of any option can be expressed in terms of
derivatives of the cumulative distribution function $\Psi_s(y) = P_s(Y\le y)$ and
those of $\kappa(s)$. Let $\phi_s(y)$ be the corresponding density function.
Note $\partial \Psi_0(y)/\partial s = E[-\delta_y(Y)Y(X - \kappa'(s))]
= -yE_s(\delta_y(Y)(X - \kappa'(s))]$.

$\partial v/\partial s = E[\nu'(Y)Y(X - \kappa'(s))] = -E[\delta_k(Y)Y(X - \kappa'(s))]$

## Parameters

Any positive random variable $Y$ can be parameterized using the _forward_ $f$
and _vol_ $s$ by
$Y = f e^{s X - κ(s)}$, where $κ(s) = \log E[e^{s X}]$ is the cumulant of $X$.
Note $E[Y] = f$ is the forward and $\Var(\log Y) = s^2$ is the vol squared
if $E[X] = 0$ and $E[X^2] = 1$, which we can, and do, assume.

For example, the Black model takes $X$ to be standard normal and vol
$s = σ \sqrt{t}$ where $σ$ is the _volatilty_ and $t$ is _time_ in years to expiration.
In this case $Y = fe^{σ \sqrt{t} X - σ^2t/2}$.

## Value and Greeks

Let $X$ be any random variable with mean 0 and variance 1 and define
$Y = fε_s(X)$ where $ε_s(x) = e^{sx - κ(s)}$.
The _Esscher transform_ $X_s$
of $X$ is defined by $P(X_s\le x) = E[1(X\le x)ε_s(X)]$
so $E[g(X_s)] = E_s[g(X)] = E[g(X)ε_s(X)]$ for any measurable function $g$.

The (forward) _value_ of an option paying $ν(Y)$ at expiration is
$$
v = E[ν(Y)].
$$

_Delta_ is the derivative of value with respect to forward
$$
	\frac{dv}{df} = E[ν'(Y)dY/df] = E[ν'(Y)Y/f] = E_s[ν'(Y)].
$$

_Gamma_ is the second derivative of value with respect to forward
$$
	\frac{d^2v}{df^2} = \frac{d}{df} E[ν'(Y)Y/f] = E[ν''(Y)(Y/f)^2] = E_s[ν''(Y)Y]/f
$$
since $d(Y/f)/df = 0$.

__Exercise__. _Show $d^nv/df^n = E[ν^{(n)}(Y)(Y/f)^n] = E_s[ν^{(n)}(Y)Y^{n-1}]/f^{n-1}$_.

_Vega_ is the derivative of value with respect to vol
$$
	\frac{dv}{ds} = E[ν'(Y)dY/ds] = E[ν'(Y)Y(X - κ'(s))] = fE_s[ν'(Y)(X - κ'(s))].
$$

The inverse of option value as a function of vol is the _implied vol_.

### Spot

It is straightforward to convert these formulas to spot values and corresponding greeks.
If the _spot price_ of the underlying is $u$ the forward is $f = e^{rt}u$
where $r$ is the risk-free continuously compounded interest rate and $t$ is
the time in years to expiration. The underlying at expiration is $U = Y$.

The _spot value_ is $v_0 = e^{-rt}E[ν(U)]$ and _spot delta_ is
$dv_0/du = e^{-rt}E[ν'(U) dU/du]
= e^{-rt}E[ν'(F) (dY/df) df/du]
= e^{-rt}E[ν'(F) (dY/df) e^{rt}]
= dv/df$.

The spot and forward delta are equal but the spot gamma is $d^2v_0/du^2 =
d(dv/df)/du = (d^2v/df^2) df/du = e^{rt} d^2v/df^2$.

__Exercise__. _Show $d^nv_0/du^n = e^{(n-1)rt}d^nv/df^n$_.

The spot vega is $dv_0/ds = e^{-rt}E[ν'(U) dU/ds] = e^{-rt}E[ν'(Y) dY/ds] = e^{-rt}dv/ds$.


### Distribution

If $Φ(x)$ is the cumulative distribution functions of $X$ then the cumulative
distribution of $Y$ is $Ψ(y) = Φ(x)$ where $y = y(x) = fε_s(x)$
and _moneyness_ $x = x(y) = ε_s^{-1}(y/f) = (\log(y/f) + κ(s))/s$.
Let $ψ(y)$ and $φ(x)$ be the corresponding density functions so
$ψ(y) = φ(x)dx/dy = φ(x)/ys$ since $dy/dx = ys$.
Likewise, $ψ_s(y) = φ_s(x)/ys$.
Note $φ_s(x) = φ(x)ε_s(x) = φ(x)y/f$.
We collect these formulas for easy reference:
$$
\begin{aligned}
	y &= y(x) = fε_s(x)\\
	x &= x(y) = ε_s^{-1}(y/f) \\
	φ_s(x) &= φ(x)ε_s(x) = φ(x)y/f \\
	ψ(y) &= φ(x)/ys \\
	ψ_s(y) &= φ_s(x)/ys = φ(x)/fs \\
\end{aligned}
$$
Note $ψ_s'(y) = φ'(x)(dx/dy)/fs = φ'(x)/yfs^2$.

We will also need the formula
$$
\frac{d}{ds}Φ_s(x) = \frac{d}{ds}E[1(X \le x)ε_s(X)] = E[1(X \le x)ε_s(X)(X - κ'(s))]
$$
since $dε_s(x)/ds = ε_s(x)(x - κ'(s))$.

These are used in the formulas for put and call option values and their greeks.

## Put and Call

A _put option_ pays $ν(Y) = (k - Y)^+ = \max\{k - Y,0\}$ at expiration and has value
$p = E[(k - Y)^+]$.
A _call option_ pays $ν(Y) = (Y - k)^+$ at expiration and has value $c = E[(Y - k)^+]$.
Note $(Y - k)^+ - (k - Y)^+ = Y - k$ is a _forward_ with _strike_ $k$ so
all models satisfy _put-call parity_: $c - p = f - k$.
Call delta is $dc/df = dp/df + 1$ and call gamma equals put gamma $d^2c/df^2 = d^2p/df^2$.
We also have $dc/ds - dp/ds = 0$ so call vega equals put vega.

Note $Y \le y(x)$ iff $X \le x(y)$ since $dε_s(x)/dx > 0$.
The value of a put is
$$
\begin{aligned}
p &= E[(k - Y)^+] \\
  &= E[(k - Y)1(Y\le k)] \\
  &= k P(Y \le k) - E[Y 1(Y \le k)] \\
  &= k P(Y \le k) - fP_s(Y \le k) \\
  &= k Φ(x(k)) - f Φ_s(x(k)). \\
\end{aligned}
$$

Put delta is
$$
	\frac{dp}{df} = -Φ_s(x(k)). 
$$

Gamma for either a put or call is
$$
	\frac{d^2p}{df^2} = E[δ_k(Y)(Y/f)^2] = ψ(k)(k/f)^2 = φ(x(k))k/f^2s = φ_s(x(k))/fs.
$$

Vega for a put is
$$
	\frac{dp}{ds} = -E[1(Y\le k)Y(X - κ'(s))] = -f\frac{d}{ds}Φ_s(x(k)).
$$ 

## Digital

A _digital put_ has payoff $ν(Y) = 1(Y \le k)$ and
a _digital call_ has payoff $ν(Y) = 1(Y > k)$ with values
$$
	p = P(Y \le k) = Φ(x(k)),
	c = P(Y > k) = 1 - Φ(x(k)).
$$

Digital put delta 
$$
\begin{aligned}
	\frac{dp}{df} &= -E[\delta_k(Y)(Y/f)] \\
	&= -\psi(k)k/f \\
	&= -(\phi(x(k)/fs)k/f \\
	&= -\phi(x(k))k/f^2s \\
	&= -\phi_s(x(k))/fs \\
\end{aligned}
$$

Digital gamma is 
$$
\begin{aligned}
	\frac{d^2p}{df^2} &= -E_s[\delta_k'(Y)Y]/f \\
	&= -\psi_s'(k)k/f \\
	&= -\phi'(x(k))/f^2s^2
\end{aligned}
$$
where we use $\psi_s(y) = \phi(x)/fs$ so $\psi_s'(y) = \phi'(x)/fks^2$.

Digital put vega is 
$$
\begin{aligned}
\frac{dp}{ds} &= -E_s[\delta_k(Y)Y(X - s)] \\
	&= -\psi(k)k(x(k) - s) \\ 
	&= -(\phi(x(k))/ks)k(x(k) - s) \\ 
	&= -\phi(x(k))(x(k) - s)/s \\ 
\end{aligned}
$$

Since $p + c = 1$ we have $d^nc/df^n = -d^np/df^n$ and $d^nc/ds^n = -d^np/ds^n$ for all $n > 0$.

## Black Model

We use the above to derive the standard Black-Scholes/Merton formulas
for value and greeks. In the Black model $Y = fe^{σB_t - σ^2t/2}$ where
$f$ is the forward, $σ$ is the volatility, and
$B_t$ is Brownian motion at time $t$. There is really no need to drag
in Brownian motion to compute an option value, we only use the fact
$B_t$ is normally distributed with mean $0$ and variance $t$. There is also no need
to drag in $t$, let $s = σ\sqrt{t}$ and $X$ be standard normal
so $Y = fe^{sX - s^2/2}$ has the same distribution.

[Recall](cdf.html#normal) if $X$ is standard normal then $E[e^{μ + σ X}] = e^{μ + σ^2/2}$
and $E[g(X)e^{s X - s^2/2}] = E[g(X + s)]$ for any function $g$ and $s\in\RR$.
These formulas imply the cumulant of a standard normal is $κ(s) = s^2/2$
so $Φ_s(x) = P_s(X\le x) = E[1(X\le x)e^{s X - s^2/2}] = P(X + s \le x) = Φ(x - s)$
and $φ_s(x) = φ(x - s)$. Note $dΦ_s(x)/ds = -φ(x - s) = -φ_s(x)$.

Put value is 
$$
	p = k Φ(x(k)) - f Φ(x(k) - s)
$$
where $x(k) = \log(k/f)/s + s/2$.

__Exercise__. _Show $x(k) = \log(k/f)/s + s/2 = -d_2$ and $x(k) - s = \log(k/f)/s - s/2 = -d_1$_.

Hint: The Black-Scholes/Merton formulas use $d_1 = (\log(f/k) + s^2/2)/s$ and $d_2 = d_1 - s$.

Put delta is
$$
	\frac{dp}{df} = -Φ_s(x(k)) = -Φ(x(k) - s).
$$

Gamma is
$$
	\frac{d^2p}{df^2} = φ_s(x(k))/fs = φ(x(k))k/f^2s
$$

Vega is
$$
\begin{aligned}
	\frac{dv}{ds} &= -E[1(Y\le k)Y(X - s)] \\
	&= -f\frac{d}{ds}Φ_s(x(k)) \\
	&= f(x(k) - s) = fφ_s(x(k)).
\end{aligned}
$$

$\langle\text{mic drop}/\rangle$
