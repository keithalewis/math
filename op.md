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
This short note derives formulas for these using any underlying distribution
that is positive.

Let $Y$ be the (random) value of the underlying at option expiration.
Any positive random variable $Y$ can be parameterized using the _forward_ $f$
and _vol_ $s$ by
$Y = f \exp(s X - κ(s))$, where $κ(s) = \log E[\exp(s X)]$ is the cumulant of $X$.
Note $E[Y] = f$ is the forward and $\Var(\log Y) = s^2$ is the vol squared
if $E[X] = 0$ and $E[X^2] = 1$, which we can, and do, assume.

__Exercise__. _If $E[X] = 0$, $\Var(X) = 1$, and $Y = \exp(aX + b)$
show $E[Y] = \exp(\kappa(a) + b)$ and $\Var(\log Y) = a^2$.
Solve $f = \exp(\kappa(a) + b)$ and $s^2 = a^2$ for $a$ and $b$
to show $Y = f\exp(sX - \kappa(s))$_.

For example, the Black model takes $X$ to be standard normal and vol
$s = σ \sqrt{t}$ where $σ$ is the _volatilty_ and $t$ is time in years to expiration.
In this case $Y = f\exp(σ \sqrt{t} X - σ^2t/2)$.

## Value and Greeks

Let $X$ be any random variable with mean 0 and variance 1 and define
$Y = fε_s(X)$ where $ε_s(x) = \exp(sX - κ(s))$ so 
the cumulant of $X$ is $\log E[ε_s(X)]$. The _Esscher transform_ $X_s$
of $X$ is defined by $P(X_s\le x) = E[1(X\le x)ε_s(X)]$
so $E[g(X_s)] = E_s[g(X)] = E[g(X)ε_s(X)]$ for any measurable function $g$.
The cumlant of $X_s$ is  $\kappa_s(u) = \log E[\exp(uX_s)]$ and
$E[\exp(uX_s)] = E[\exp(uX_s)\exp(sX - \kappa(s))]$
so $\kappa_s(u) = \kappa(u + s) - \kappa(s)$.

Note $dY/df = ε_s(X)$ and $dY/ds = Y(X - κ'(s)) = fε_s(X)(X - κ'(s))$.

The (forward) value of an option paying $ν(Y)$ at expiration is
$v = E[ν(Y)]$.  Note $dv/df = E[ν'(Y)dY/df] = Eν'(Y)ε_s(X)]$ and
$dε_s(X)/df = 0$ so $d^nv/df^n = E[ν^{(n)}(Y)ε_s^n(X)]
= e^{κ(ns) - nκ(s)} E_{ns}[ν^{(n)}(Y)]$ and $dv/ds =
E[ν'(Y)dY/ds] = E[ν'(Y)Y(X - κ'(s))] = fE_s[ν'(Y)(X - κ'(s))]$.

The inverse of option value as a function of vol is the _implied vol_.

If $Φ(x)$ is the cumulative distribution functions of $X$ then the cumulative
distribution of $Y$ is $Ψ(y) = Φ(x)$ where $y = y(x) = fε_s(x)$
and _moneyness_ $x = x(y) = ε_s^{-1}(y/f) = (\log(y/f) + κ(s))/s$.
Let $ψ(y)$ and $φ(x)$ be the corresponding density functions so
$ψ(y) = dΨ(y)/dy = dΦ(x(y))/dy = Φ'(x(y))dx/dy = φ(x(y))/ys$
since $dy/dx = ys$. Likewise, $ψ_s(y) = φ_s(x(y))/ys$.
Using $φ_s(x) = φ(x)ε_s(x)$ and $ε_s(x) = y(x)/f$
shows $φ_s(x) = φ(x)y(x)/f$. We collect these for easy reference:
$$
\begin{aligned}
	y &= y(x) = fε_s(x)\\
	x &= x(y) = ε_s^{-1}(y/f) \\
	φ_s(x) &= φ(x)ε_s(x) = φ(x)y/f \\
	ψ(y) &= φ(x)/ys \\
	ψ_s(y) &= φ_s(x)/ys = φ(x)/fs \\
\end{aligned}
$$

These are used in the formulas for put and call option values and their greeks.

## Put and Call

A _put option_ pays $\nu(Y) = \max\{k - Y,0\}$ at expiration and has value $p = E[\max\{k - Y,0\}]$.
A _call option_ pays $\nu(Y) = \max\{Y - k, 0\}$ at expiration and has value $c = E[\max\{Y - k, 0\}]$.
Note $\max\{Y - k, 0\} - \max\{k - Y,0\} = Y - k$ is a _forward_ with _strike_ $k$ so
all models satisfy _put-call parity_: $c - p = f - k$.
Call delta is $dc/df = dp/df + 1$ and call gamma equals put gamma $d^2c/df^2 = d^2p/df^2$.
We also have $dc/ds - dp/ds = 0$ so call vega equals put vega.

Note $Y \le y(x)$ iff $X \le x(y)$ so $ψ(y(x)) = Φ(x(y))$.
The value of a put is
$$
  p = E[(k - Y)1(Y\le k)] = k P(X \le x(k)) - P(Y 1(Y \le k)) = k Φ(x(k)) - f Φ_s(x(k)).
$$

Put delta is
$$
	dp/df = -Φ_s(x(k)). 
$$

Gamma for either a put or call is
$$
	d^2p/df^2 = E_s[δ_k(Y)Y]/f = \psi_s(k)k/f = \phi_s(x(k))/fs = φ(x(k))k/f^2s.
$$

Vega for either a put or call is
$$
	dv/ds = E[ν'(Y) dY/ds] = E[ν'(Y)Y(X - κ'(s))] = fE_s[ν'(Y)(X - κ'(s))].
$$ 
Note $1 = E[\epsilon_s(X)]$ so $0 = E[\epsilon_s(X)(X - \kappa'(s)] = E_s[X - κ'(s)]$
so $E_s[1(Y\le y)(X - κ'(s))] = -E_s[1(Y > y)(X - κ'(s))]$.

Vega? Is there some $h$ with $E_s[g(X)] = E[g(h(X,s))]$?
If $X$ is standard normal then $h(X,s) = X + s = X + κ'(s)$.

## Digital

A _digital put_ has payoff $ν(Y) = 1(Y \le k)$ and a _digital call_ has payoff $ν(Y) = 1(Y > k)$
with values $p = P(Y \le k) = \Phi(x(k))$ and $c = P(Y > k) = 1 - \Phi(x(k))$.
Since $p + c = 1$ we have $d^np/df^n = -d^nc/df^n$ for all $n$.
The put delta is $dp/df = ?$

## Black Model

We use the above to derive the standard Black-Scholes/Merton formulas
for value and greeks. In the Black model $Y = f\exp(σB_t - σ^2t/2)$ where
$f$ is the forward, $σ$ is the volatility, and
$B_t$ is Brownian motion at time $t$. There is really no need to drag
in Brownian motion to compute an option value, we only use the fact
$B_t$ is normally distributed with mean $0$ and variance $t$. There is really no need
to drag in $t$ either, let $s = σ\sqrt{t}$ and $X$ be standard normal
so $Y = f\exp(sX - s^2/2)$ has the same distribution.

The Black model uses forward values but it is straightforward to
use those to get spot values. In the Black-Scholes/Merton model
the underlying at expiration is
$U = u\exp(rt + σB_t - σ^2t/2)$ and the spot value is $v_0 = \exp(-rt)E[ν(U)]$. 
The spot delta is $dv_0/du = \exp(-rt)E[ν'(U)\exp(rt + σB_t - σ^2t/2)]
= E[ν'(Y)\exp(s X - s^2/2)] = dv/df$ where $v = E[ν(Y)]$ and $f = u\exp(rt)$.
The spot and forward delta are equal but
the spot gamma is $d^2v_0/du^2 = d(dv/df)/du = (d^2v/df^2) df/du = \exp(rt) d^2v/df^2$.

[Recall](cdf.html#normal) if $X$ is standard normal then $E[\exp(μ + σ X)] = \exp(μ + σ^2/2)$
and $E[g(X)\exp(s X - s^2/2)] = E[g(X + s)]$ for any $g$.
These formulas imply the cumulant of a standard normal is $κ(s) = s^2/2$
and $Φ_s(x) = P_s(X\le x) = E[1(X\le x)\exp(s X - κ(s))] = P(X + s \le x) = Φ(x - s)$.
Note $φ_s(x) = φ(x - s)$.

### Value

The put value is 
$$
	p = k Φ(x(k)) - f Φ(x(k) - s)
$$
where $x(k) = \log(k/f)/s + s/2$.

__Exercise__. _Show $x(k) = \log(k/f)/s + s/2 = -d_2$ and $x(k) - s = \log(k/f)/s - s/2 = -d_1$_.

Hint: The Black-Scholes/Merton formulas use $d_1 = (\log(f/k) + s^2/2)/s$ and $d_2 = d_1 - s$.

### Delta

The formula for delta is
$$
	dp/df = -Φ_s(x(k)) = -Φ(x(k) - s).
$$

### Gamma

The formula for gamma is
$$
	d^2p/df^2 = φ_s(x(k))/fs = φ(x(k) - s)/fs
$$
We also have the formula $d^2p/df^2 = φ(x(k))k/f^2s$
using $\phi_s(x(k)) = \phi(x(k))k/f$.

### Vega

Taking the deriviative of $E_s[g(X)] = E[g(X)\exp(s X - s^2/2)] = E[g(X + s)]$ with
respect to $s$ gives
$$
	E[g(X)\exp(s X - s^2/2)(X - s)] = E[g'(X + s)]
$$
so $E_s[g(X)(X - s)] = E_s[g'(X)]$.

The formula for vega is
$$
\begin{aligned}
$dv/ds &= E[ν'(Y)Y(X - s)] = f E_s[ν'(Y)(X - s)]\\
	&= f E_s[\delta_k(Y)] \\
	&= f \psi_s(k) \\
	&= f^2 \phi_s(x(k))k \\

      &= f^2 \phi_s(x(k))/k \\
      &= f^2 \phi(x(k) - s)/k \\
\end{aligned}
$$
where we use the general fact $E[\delta_a(h(X))] = \phi(h(a))/h'(a)$.

## Fourier Transform

$\hat{\phi}(\xi) = E[\exp(-2\pi i\xi X)] = \exp(\kappa(-2\pi i \xi))$

$\check{h}(x) = \int h(\xi)\exp(2\pi i x\xi)\,dx$.

$\hat{\phi_s}(\xi) = E_s[\exp(-2\pi i \xi X)]
= E[\exp(-2\pi i \xi X)\exp(sX - \kappa(s))]
= E[\exp((s -2\pi i \xi) X)\exp(-\kappa(s))]
= \exp(\kappa(s - 2\pi i\xi) - \kappa(s))$

$E[g(X)] = \int_{-\infty}^\infty g(x)\phi(x)\,dx
= \int_{-\infty}^\infty \hat{g}(\xi)\hat{\phi}(\xi)\,d\xi
= \int_{-\infty}^\infty \hat{g}(\xi)\exp(\kappa(-2\pi i\xi))\,d\xi$

<!--
## Discrete

A _discrete_ random variable has values $(x_i)$ with probabilities $(p_i)$ where
$p_i \ge 0$ and $\sum_i p_i = 1$.
Its cdf is $P(X\le x) = \sum_i 1(x_i\le x) p_i$ and pdf is $\sum_i δ_{x_i} p_i$.
The cumulant is $κ(s) = \log(\sum_ie^{s x_i} p_i) = \log e(s)$ so
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
κ(s) &= \log E[\exp(sX)] \\
     &= \log(p\exp(-sa) + (1 - p - q) + q\exp(sb)) \\
     &= \log(
	 		\exp(-se^α)/e^{α}(e^α + e^β)
			+ (1 - 1/e^{α}(e^α + e^β) - 1/e^β(e^α + e^β))
			+ \exp(se^β)/e^{β}(e^α + e^β)) \\
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
