---
title: Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing
...

\newcommand{\Var}{\operatorname{Var}}

European _option valuation_ involves calculating the expected value of
the _option payoff_ as a function of the _underlying_ at _expiration_.
_Greeks_ are derivatives of the _value_ with respect to _model parameters_.
This short note derives formulas for these using any positive underlying distribution.

Let $Y$ be the (random) value of the underlying at option expiration.
Any positive random variable $Y$ can be parameterized using the _forward_ $f$
and _vol_ $s$ by
$Y = f e^{s X - κ(s)}$, where $κ(s) = \log E[e^{s X}]$ is the cumulant of $X$.
Note $E[Y] = f$ is the forward and $\Var(\log Y) = s^2$ is the vol squared
if $E[X] = 0$ and $E[X^2] = 1$, which we can, and do, assume.

__Exercise__. _If $E[X] = 0$, $\Var(X) = 1$, and $Y = e^{aX + b}$
show $E[Y] = e^{κ(a) + b}$ and $\Var(\log Y) = a^2$.
Solve $f = e^{κ(a) + b}$ and $s^2 = a^2$ for $a$ and $b$
to show $Y = fe^{sX - κ(s)}$_.

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
	\frac{d^2v}{df^2} = \frac{d}{df} E[ν'(Y)Y/f] = E[ν''(Y)(Y/f)^2] = E_s[ν''(Y)Y]/f.
$$
since $d(Y/f)/df = 0$.

__Exercise__. _Show $d^nv/df^n = E[ν^{(n)}(Y)(Y/f)^n] = E_s[ν^{(n)}(Y)Y^{n-1}]/f^{n-1}$_.

_Vega_ is the derivative of value with respect to vol
$$
	\frac{dv}{ds} = E[ν'(Y)dY/ds] = E[ν'(Y)Y(X - κ'(s))] = fE_s[ν'(Y)(X - κ'(s))].
$$

The inverse of option value as a function of vol is the _implied vol_.

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

??? check

The spot vega is $dv_0/ds = e^{-rt}E[ν'(U) dU/ds] = e^{-rt}E[ν'(Y) dY/ds] = e^{-rt}dv/ds$.

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

Note $dΦ(x)
These are used in the formulas for put and call option values and their greeks.

## Put and Call

A _put option_ pays $\nu(Y) = (k - Y)^+ = \max\{k - Y,0\}$ at expiration and has value
$p = E[(k - Y)^+]$.
A _call option_ pays $\nu(Y) = (Y - k)^+$ at expiration and has value $c = E[(Y - k)^+]$.
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
	dv/ds = -E[1(Y\le k)Y(X - κ'(s))] = -f\frac{d}{ds}Φ_s(x(k)).
$$ 
since $dΦ_s(x)/ds = (d/ds)E[1(X \le x)e^{sX - κ(s)}] = E[1(X \le x)e^{sX - κ(s)}](X - κ'(s))]$.


Vega? Is there some $h$ with $E_s[g(X)] = E[g(h(X,s))]$?
If $X$ is standard normal then $h(X,s) = X + s = X + κ'(s)$.

## Digital

A _digital put_ has payoff $ν(Y) = 1(Y \le k)$ and a _digital call_ has payoff $ν(Y) = 1(Y > k)$
with values $p = P(Y \le k) = \Phi(x(k))$ and $c = P(Y > k) = 1 - \Phi(x(k))$.
Since $p + c = 1$ we have $d^np/df^n = -d^nc/df^n$ for all $n$.
The put delta is $dp/df = ?$

## Black Model

We use the above to derive the standard Black-Scholes/Merton formulas
for value and greeks. In the Black model $Y = fe^{σB_t - σ^2t/2}$ where
$f$ is the forward, $σ$ is the volatility, and
$B_t$ is Brownian motion at time $t$. There is really no need to drag
in Brownian motion to compute an option value, we only use the fact
$B_t$ is normally distributed with mean $0$ and variance $t$. There is also no need
to drag in $t$ either, let $s = σ\sqrt{t}$ and $X$ be standard normal
so $Y = fe^{sX - s^2/2}$ has the same distribution.

[Recall](cdf.html#normal) if $X$ is standard normal then $E[e^{μ + σ X}] = e^{μ + σ^2/2}$
and $E[g(X)e^{s X - s^2/2}] = E[g(X + s)]$ for any function $g$ and $s\in\RR$.
These formulas imply the cumulant of a standard normal is $κ(s) = s^2/2$
so $Φ_s(x) = P_s(X\le x) = E[1(X\le x)e^{s X - s^2/2}] = P(X + s \le x) = Φ(x - s)$
and $φ_s(x) = φ(x - s)$.
### Value

Put value is 
$$
	p = k Φ(x(k)) - f Φ(x(k) - s)
$$
where $x(k) = \log(k/f)/s + s/2$.

__Exercise__. _Show $x(k) = \log(k/f)/s + s/2 = -d_2$ and $x(k) - s = \log(k/f)/s - s/2 = -d_1$_.

Hint: The Black-Scholes/Merton formulas use $d_1 = (\log(f/k) + s^2/2)/s$ and $d_2 = d_1 - s$.

### Delta

Delta is
$$
	dp/df = -Φ_s(x(k)) = -Φ(x(k) - s).
$$

### Gamma

Gamma is
$$
	d^2p/df^2 = φ_s(x(k))/fs = φ(x(k) - s)/fs
$$
We also have the formula $d^2p/df^2 = φ(x(k))k/f^2s$
using $φ_s(x(k)) = φ(x(k))k/f$.

### Vega

Vega is
$$
	dv/ds = -E[1(Y\le k)Y(X - s)] = f φ(x - s).
$$

so $dΦ_s(x)/ds = E[1(X\le x) e^{sX - s^2/2}(X - s)] = -φ(x - s)$.

Taking the deriviative of $E_s[g(X)] = E[g(X)e^{s X - s^2/2}] = E[g(X + s)]$ with
respect to $s$ gives
$$
	E[g(X)e^{s X - s^2/2}(X - s)] = E[g'(X + s)]
$$
so $E_s[g(X)(X - s)] = E_s[g'(X)]$.

If $g(x) = \nu'(fe^{sx - κ(s)})$ then $g'(x) = \nu''(fe^{sx - κ(s)})fe^{sx - κ(s)}s$
so the formula for vega is
$$
\begin{aligned}
\frac{d}{ds}E[ν(Y)] &= E[ν'(Y)dY/ds] \\
	&= E[ν'(Y)Y(X - s)] \\
	&= f E_s[ν'(Y)(X - s)] \\
	&= f E_s[\delta_k(Y)Ys] \\
	&= f ψ_s(k)ks \\
	&= f(φ(x(k))/fs)ks \\
\end{aligned}
$$

## Discrete


<!--
## Fourier Transform

$\hat{φ}(\xi) = E[e^{-2\pi i\xi X}] = e^{κ(-2\pi i \xi)}$

$\check{h}(x) = \int h(\xi)e^{2\pi i x\xi}\,dx$.

$\hat{φ_s}(\xi) = E_s[e^{-2\pi i \xi X}]
= E[e^{-2\pi i \xi X}e^{sX - κ(s)}]
= E[e^{(s -2\pi i \xi) X}e^{-κ(s)}]
= e^{κ(s - 2\pi i\xi} - κ(s))$

$E[g(X)] = \int_{-\infty}^\infty g(x)φ(x)\,dx
= \int_{-\infty}^\infty \hat{g}(\xi)\hat{φ}(\xi)\,d\xi
= \int_{-\infty}^\infty \hat{g}(\xi)e^{κ(-2\pi i\xi)}\,d\xi$

## Discrete

A _discrete_ random variable has values $(x_i)$ with probabilities $(p_i)$ where
$p_i \ge 0$ and $\sum_i p_i = 1$.
Its cdf is $P(X\le x) = \sum_i 1(x_i\le x) p_i$ and pdf is $\sum_i δ_{x_i} p_i$.
The cumulant is $κ(s) = \log(\sum_ie^{s x_i} p_i} = \log e(s)$ so
$κ'(s) = e'(s)/e(s)$ and $κ''(s) = (e(s) e''(s) - e'(s)^2)/e(s)^2$.
Note $e^{(n)}(s) = \sum_i e^{s x_i} x_i^n p_i$ for $n \ge 0$.

## Trinomial

Define $X$ by $P(x = -a) = p$, $P(X = b) = q$, and $P(X = 0) = 1 - p - q$, $a,b\ge 0$.
If $0 = E[X] = -ap + bq$ and $\Var(X) = E[X^2] = a^2p + b^2 q$ then
$p = 1/a(a + b)$ and $q = 1/b(a+b)$. The condition $p + q \le 1$
is $ab \ge 1$. We parameterize this by $a = e^α$, $b = e^β$
where $α + β\ge 0$ so $p = 1/e^{α}(e^α + e^β)$
and $q = 1/e^{β}(e^α + e^β)$. Note $a,b\ge0$ for all $α,β$.

The cumulant is 

$$
\begin{aligned}
κ(s) &= \log E[e^{sX)] \\
     &= \log(pe^{-sa) + (1 - p - q) + qe^{sb)) \\
     &= \log(
	 		e^{-se^α)/e^{α}(e^α + e^β)
			+ (1 - 1/e^{α}(e^α + e^β) - 1/e^β(e^α + e^β))
			+ e^{se^β)/e^{β}(e^α + e^β)) \\
\end{aligned}
$$

## Remarks

If the cumulative distribution function of $X$ is $Φ$, that is $P(X\le x) = Φ(x)$,
and $g$ is invertible then the cdf of $Y = g(X)$ is $Ψ = Φ\circ g^{-1}$. For example,
if $X$ has mean $0$ and variance $1$ and $g(x) = μ + σ x$ then $Y = g(X)$ has mean
$μ$, variance $σ^2$, and $Ψ(y) = P(Y\le y) = Φ((y - μ)/σ)$.

The probability density function of $Y = g(X)$ is $ψ(y) = Ψ'(y) =
(φ\circ g^{-1}(y))(g^{-1})'(y)$.  Recall $(g^{-1})'(y) = 1/g'\circ
g^{-1}(y)$ so  $ψ(y) = (φ(g^{-1}(y))/g'(g^{-1}(y)) = φ(x)/g'(x)$
if $g(x) = y$.
-->
