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

Let $F$ be the value of the underlying at option expiration.
Any positive random variable $F$ can be parameterized by
$F = f \exp(s X - κ(s))$, where $κ(s) = \log E[\exp(s X)]$ is the cumulant of $X$.
Note $E[F] = f$ is the _forward_ and $\Var(\log F) = s^2$ is the variance
if $E[X] = 0$ and $E[X^2] = 1$, which we can, and do, assume.

For example, the Black model takes $X$ to be standard normal and  _vol_ 
$s = σ \sqrt{t}$ where $σ$ is the volatilty and $t$ is time in years to expiration.
In what follows we will call $s$ vol and $σ$ volatility.

## Value and Greeks

The (forward) value of an option paying $π(F)$ at expiration is $v = E[π(F)]$.
Define the Esscher transform $P^s$ by $dP^s/dP = \exp(s X - κ(s))$ 
so $E^s[π(F)] = E[π(F)\exp(s X - κ(s))]$. Note $E^s[1] = 1$ so $P^s$ is a probability measure.

_Delta_ is the derivative of value with respect to the forward
$$
  \frac{dv}{df} = E[π'(F) dF/df] = E[π'(F)\exp(s X - κ(s))] = E^s[π'(F)].
$$

_Gamma_ is the second derivative of value with respect to the forward
$$
	\frac{d^2v}{df^2} = \frac{d}{df}\left(\frac{dv}{df}\right) = E^s[π''(F)\exp(s X - κ(s))] 
	= E^s[π''(F)F]/f.
$$

_Vega_ is  the derivative of value with respect to the vol
$$
	dv/ds = E[π'(F) dF/ds] = E[π'(F)F(X - κ'(s))] = fE^s[π'(F)(X - κ'(s))].
$$

The inverse of option value as a function of vol is the _implied vol_.

## Put and Call

A _put option_ pays $\max\{k - F,0\}$ at expiration and has value $p = E[\max\{k - F,0\}]$.
A _call option_ pays $\max\{F - k, 0\}$ at expiration and has value $c = E[\max\{F - k, 0\}]$.
Note $\max\{F - k, 0\} - \max\{k - F,0\} = F - k$ is a _forward_ with _strike_ $k$ so
all models satisfy _put-call parity_: $c - p = f - k$.
Call delta is $dc/df = dp/df + 1$ and call gamma is $d^2c/df^2 = d^2p/df^2$.

Define _moneyness_ $x = x(f,s,k) = (\log(k/f) + κ(s))/s$ and note $F \le k$ iff $X \le x$. 
The value of a put is

$$
  p = E[(k - F)1(F\le k)] = k P(X \le x) - f P^s(X \le x).
$$

Put delta is
$$
	dp/df = -P^s(X \le x). 
$$

Gamma for either a put or call is
$$
	d^2p/df^2 = E^s[δ_k(F)F]/f.
$$

Put vega
$$
	dv/ds = fE^s[1(F\le k)(X - κ'(s))].
$$

Let $\Psi(y) = \Phi(x)$ be the cumulative distribution functions of $F$ and $X$
where $y = y(x) = f\exp(sx -  κ(s))$ and $x = x(y) = (\log(y/f) + κ(s))/s$. The probability
density function of $Y$ is $\psi(y) = \Phi'(x)dx/dy = \phi(x)/ys$
since $dy/dx = ys$. The same reasoning gives $\psi^s(y) = \phi^s(x)/ys$
so $E^s[δ_k(F)F]/f = \psi^s(k)k/f = (\phi^s(x(k))/ks)k/f = \phi^s(x(k))/fs$ and we have
$$
	d^2p/df^2 = \phi^s(x(k))/fs.
$$

Using $\phi^s(x) = \phi(x)\exp(s x -  κ(s)) = \phi(x)y(x)/f$ we also have the formula
$$
	d^2p/df^2 = \phi(x(k))k/f^2s
$$
since $y(x) = k$ when $x = x(k)$.

## Black Model

If $X$ is standard normal then $E[\exp(μ + σ X)] = \exp(μ + σ^2/2)$
and $E[g(X)\exp(s X - κ(s))] = E[g(X + s)]$ for any $g$.
These formulas imply the cumulant of a standard normal is $κ(s) = s^2/2$
and $P^s(X\le x) = E[1(X\le x)\exp(s X - κ(s))] = P(X + s \le x)$.
If we let $Φ$ be the cumulative distribution function of $X$ then
$Φ^s(x) = Φ(x - s)$ and the put value is 
$p = k Φ(x) - f Φ(x - s) = k Φ(\log(k/f)/s + s/2) - f Φ(\log(k/f)/s - s/2)$.

__Exercise__. _Show $\log(k/f)/s + s/2 = -d_2$ and $\log(k/f)/s - s/2 = -d_1$_.

Hint: Recall $d_1 = (\log(f/k) + s^2/2)/s$ and $d_2 = d_1 - s$ in the classical
Black-Scholes/Merton formula.

Let $Ψ(y) = P(F\le y) = Φ((\log(y/f) + κ(s))/s) = Φ(x)$ be the cdf of $F$.
Since $y = f\exp(s x -  κ(s))$ we have $dy/dx = y s$ so the probability
density function of $Y$ is $ψ(y) = Ψ'(y) = φ(x) dx/dy = φ(x)/y s$.
The same argument applies to $Ψ^s$ so $ψ^s(y) = φ^s(x)/y s
= φ(x) \exp(s x - κ(s))/ys = φ(x)/fs$ since $\exp(s x - κ(s)) = y/f$. 
The formula for gamma is $d^2p/df^2 = E^s[δ_k(F)\exp(s X - κ(s))] = \phi(x)k/f s$.

We know $E[g(X)\exp(s X - κ(s))] = E[g(X + s)]$ for any $g$. Taking
a deriviative with respect to $s$ gives 
$E[g(X)\exp(s X - κ(s))(X - κ'(s)] = E[g'(X + s)]$. 
Using this and noting $F = f\exp(s X - κ(s))$ 
yields $dp/ds = E[1(F \le k)F(X - κ'(s))] = fE[δ_k(X + s)] = fψ(x + s)$.

The formula for vega is $dp/ds = E[π'(F) dF/ds] = E[1(F\le k)F(X - κ'(s))]$.

## Discrete

A _discrete_ random variable has values $(x_i)$ with probabilities $(p_i)$ where
$p_i \ge 0$ and $\sum_i p_i = 1$.
Its cdf is $P(X\le x) = \sum_i 1(x_i\le x) p_i$ and pdf is $\sum_i δ_{x_i} p_i$.
The cumulant is $κ(s) = \log(\sum_ie^{s x_i} p_i) = \log e(s)$ so
$κ'(s) = e'(s)/e(s)$ and $κ''(s) = (e(s) e''(s) - e'(s)^2)/e(s)^2$.
Note $e^{(n)}(s) = \sum_i e^{s x_i} x_i^n p_i)$ for $n \ge 0$.

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
