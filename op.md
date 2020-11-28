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

Let $F$ be the (random) value of the underlying at option expiration.
Any positive random variable $F$ can be parameterized by
$F = f \exp(s X - κ(s))$, where $κ(s) = \log E[\exp(s X)]$ is the cumulant of $X$.
Note $E[F] = f$ is the _forward_ and $\Var(\log F) = s^2$ is the variance
if $E[X] = 0$ and $E[X^2] = 1$, which we can, and do, assume.

For example, the Black model takes $X$ to be standard normal and _vol_
$s = σ \sqrt{t}$ where $σ$ is the volatilty and $t$ is time in years to expiration.
In this case $F = f\exp(σ \sqrt{t} X - σ^2t/2)$.

## Value and Greeks

The (forward) value of an option paying $π(F)$ at expiration is $v = E[π(F)]$.
Define the Esscher transform $P_s$ by $dP_s/dP = \exp(s X - κ(s))$ 
so $E_s[π(F)] = E[π(F)\exp(s X - κ(s))]$. Note $E_s[1] = 1$ so $P_s$ is a probability measure.
If $X$ has probability density $φ$ we can write $dP = φ(x)\,dx$
and $dP_s = φ(x)\exp(s x -  κ(s))\,dx$.

_Delta_ is the derivative of value with respect to the forward
$$
  \frac{dv}{df} = E[π'(F) dF/df] = E[π'(F)\exp(s X - κ(s))] = E_s[π'(F)].
$$

_Gamma_ is the second derivative of value with respect to the forward
$$
	\frac{d^2v}{df^2} = \frac{d}{df}\left(\frac{dv}{df}\right) = E_s[π''(F)\exp(s X - κ(s))] 
	= E_s[π''(F)F]/f.
$$

_Vega_ is  the derivative of value with respect to the vol
$$
	dv/ds = E[π'(F) dF/ds] = E[π'(F)F(X - κ'(s))] = fE_s[π'(F)(X - κ'(s))].
$$

The inverse of option value as a function of vol is the _implied vol_.

Let $Ψ(y) = Φ(x)$ be the cumulative distribution functions of $F$ and $X$
where $y = y(x) = f\exp(sx -  κ(s))$ and $x = x(y) = (\log(y/f) + κ(s))/s$.
Let $ψ(y)$ and $φ(x)$ be the corresponding density functions so
$ψ(y) = dΨ(y)/dy = dΦ(x(y))/dy = Φ'(x(y))dx/dy = φ(x(y))/ys$
since $dy/dx = ys$. Likewise, $ψ_s(y) = φ_s(x(y))/ys$.
Using $φ_s(x) = φ(x)\exp(s x -  κ(s))$ and $\exp(sx -  κ(s)) = y(x)/f$
shows $φ_s(x) = φ(x)y(x)/f$. We collect these for easy reference:
$$
\begin{aligned}
	y &= y(x) = f\exp(sx -  κ(s)) \\
	x &= x(y) = (\log(y/f) + κ(s))/s \\
	φ_s(x) &= φ(x)\exp(sx -  κ(s)) = φ(x)y/f \\
	ψ(y) &= φ(x)/ys \\
	ψ_s(y) &= φ_s(x)/ys = φ(x)/fs \\
\end{aligned}
$$

These are used in the formulas for put and call option values and their greeks.

## Put and Call

A _put option_ pays $\max\{k - F,0\}$ at expiration and has value $p = E[\max\{k - F,0\}]$.
A _call option_ pays $\max\{F - k, 0\}$ at expiration and has value $c = E[\max\{F - k, 0\}]$.
Note $\max\{F - k, 0\} - \max\{k - F,0\} = F - k$ is a _forward_ with _strike_ $k$ so
all models satisfy _put-call parity_: $c - p = f - k$.
Call delta is $dc/df = dp/df + 1$ and call gamma equals put gamma $d^2c/df^2 = d^2p/df^2$.
We also have $dc/ds - dp/ds = 0$ so call vega equals put vega.

Define _moneyness_ $x(k) = (\log(k/f) + κ(s))/s$ and note $F \le k$ iff $X \le x(k)$. 
The value of a put is
$$
  p = E[(k - F)1(F\le k)] = k P(X \le x(k)) - P(F 1(F \le k)) = k P(X \le x(k)) - f P_s(X \le x(k))
$$
since $E[Fg(F)] = E[f\exp(s X - κ(s))g(F)] = fE_s[g(F)]$ for any function $g$.

Put delta is
$$
	dp/df = -P_s(X \le x(k)). 
$$

Gamma for either a put or call is
$$
	d^2p/df^2 = E_s[δ_k(F)F]/f.
$$

In terms of distribution functions put value is
$$
	p = kΦ(x(k)) - fΦ_s(x(k))
$$
put delta is 
$$
	dp/df = -Φ_s(x(k)).
$$
and gamma is
$$
	d^2p/df^2 = E_s[δ_k(F)F]/f = ψ_s(k)k/f = (φ_s(x(k))/ks)k/f = φ_s(x(k))/fs
$$
since $y = y(x(k)) = k$.  Using $φ_s(x) = φ(x)y(x)/f$ we also have the formula
$d^2p/df^2 = φ(x(k))k/f^2s$

Vega? Is there some $h$ with $E[g(X)\exp(s X - k(s))] = E[g(h(X,s))]$?
If $X$ is standard normal then $h(X,s) = X + s = X + \kappa'(s)$.

## Digital

A _digital put_ has payoff $\pi(x) = 1(x \le k)$ and a _digital call_ has payoff $\pi(x) = 1(X > k)$
with values $p = P(F \le k) = \Phi(x(k))$ and $c = P(F > k) = 1 - \Phi(x(k))$.
Since $p + c = 1$ we have $d^np/df^n = -d^nc/df^n$ for all $n$.
he call delta is $dc/df = E_s[\delta_k(F)] = \psi_s(k) = \phi_s(x(k))/fs = \phi(x(k))k/f^2s$.

## Black Model

We use the above to derive the standard Black-Scholes/Merton formulas
for value and greeks. In the Black model $F = f\exp(σB_t - σ^2t/2)$ where
$f$ is the forward, $σ$ is the volatility, and
$B_t$ is Brownian motion at time $t$. There is really no need to drag
in Brownian motion to compute an option value, we only use the fact
$B_t$ is normally distributed with mean $0$ and variance $t$. There is really no need
to drag in $t$ either, let $s = σ\sqrt{t}$ and $X$ be standard normal
so $F = f\exp(sX - s^2/2)$ has the same distribution.

The Black model uses forward values but it is straightforward to
use those to get spot values. In the Black-Scholes/Merton model
the underlying at expiration is
$U = u\exp(rt + σB_t - σ^2t/2)$ and the spot value is $v_0 = \exp(-rt)E[\pi(U)]$. 
The spot delta is $dv_0/du = \exp(-rt)E[\pi'(U)\exp(rt + σB_t - σ^2t/2)]
= E[\pi'(F)\exp(s X - s^2/2)] = dv/df$ where $v = E[\pi(F)]$ and $f = u\exp(rt)$.
The spot and forward delta are equal but
the spot gamma is $d^2v_0/du^2 = d(dv/df)/du = (d^2v/df^2) df/du = \exp(rt) d^2v/df^2$.

[Recall](cdf.html#normal) if $X$ is standard normal then $E[\exp(μ + σ X)] = \exp(μ + σ^2/2)$
and $E[g(X)\exp(s X - s^2/2)] = E[g(X + s)]$ for any $g$.
These formulas imply the cumulant of a standard normal is $κ(s) = s^2/2$
and $Φ_s(x) = P_s(X\le x) = E[1(X\le x)\exp(s X - κ(s))] = P(X + s \le x) = Φ(x - s)$.
Note $φ_s(x) = φ(x - s)$.

The put value is 
$$
	p = k Φ(x(k)) - f Φ(x(k) - s)
$$
where $x(k) = \log(k/f)/s + s/2$.

__Exercise__. _Show $x(k) = \log(k/f)/s + s/2 = -d_2$ and $x(k) - s = \log(k/f)/s - s/2 = -d_1$_.

Hint: The Black-Scholes/Merton formulas use $d_1 = (\log(f/k) + s^2/2)/s$ and $d_2 = d_1 - s$.

The formula for delta is
$$
	dp/df = -Φ_s(x(k)) = -Φ(x(k) - s).
$$

The formula for gamma is
$$
	d^2p/df^2 = φ_s(x(k))/fs = φ(x(k) - s)/fs
$$
We also have the formula $d^2p/df^2 = φ(x(k))k/f^2s$.

Taking the deriviative of $E[g(X)\exp(s X - s^2/2)] = E[g(X + s)]$ with
respect to $s$ gives
$$
	E[g(X)\exp(s X - s^2/2)(X - s)] = E[g'(X + s)].
$$
The formula for vega is $dv/ds = E[\pi'(F)F(X - s)] = f E[\pi'(F)\exp(s X - s^2/2)(X - s)]$.
Taking $g(x) = \pi'(f\exp(s x - s^2/2))$ we have $g'(x) = \pi''(f\exp(s x - s^2/2))f\exp(s x - s^2/2)s$
and using $\pi'' = \delta_k$ for either a put or a call
$$
\begin{aligned}
dv/ds &= f E[g'(X + s)] \\
      &= f E[\delta_k(f\exp(s (X + s) - s^2/2))f\exp(s (X + s) - s^2/2)s] \\
      &= f^2 s E_s[\delta_k(f\exp(s X - s^2/2))] \\
      &= f^2 \phi_s(x(k))/k \\
      &= f^2 \phi(x(k - s))/k \\
\end{aligned}
$$
where we use the general fact $E[\delta_a(h(X))] = \phi(h(a))/h'(a)$.

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
