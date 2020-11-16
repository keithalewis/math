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

Let $F > 0$ be the value of the underlying at option expiration.
Any positive random variable $F$ can be parameterized by
$F = f \exp(s X - κ(s))$, where $κ(s) = \log E[s X]$ is the cumulant of $X$.
Note $E[F] = f$ is the _forward_ and $\Var(\log F) = s^2$ is the variance
if $E[X] = 0$ and $E[X^2] = 1$, which we can, and do, assume.

For example, the Black model takes $X$ to be standard normal and  _vol_ 
$s = σ \sqrt{t}$ where $σ$ is the volatilty and $t$ is time in years to expiration.
In what follows we will call $s$ vol and $σ$ volatility.

The (forward) value of an option paying $π(F)$ at expiration is $v = E[π(F)]$.
Define Esscher transform $P^s$ by $dP^s/dP = \exp(s X - κ(s))$ 
so $E^s[π(F)] = E[π(F)\exp(s X - κ(s))]$. Note $E^s[1] = 1$ so $P^s$ is a probability measure.

_Delta_ 
  ~ $dv/df = E[π'(F) dF/df] = E[π'(F)\exp(s X - κ(s))] = E^s[π'(F)]$

_Gamma_ 
  ~ $d^2v/df^2 = E[π''(F)\exp(s X - κ(s))^2] = E^s[π''(F)\exp(s X - κ(s))]$ 

_Vega_
  ~ $dv/ds = E[π'(F) dF/ds] = E[π'(F)F(X - κ'(s))] = fE^s[π'(F)(X - κ'(s))]$.

The inverse of option value as a function of vol is the _implied vol_.

A _put option_ pays $\max\{k - F,0\}$ at expiration and has value $p = E[\max\{k - F,0\}]$.
A _call option_ pays $\max\{F - k, 0\}$ at expiration and has value $c = E[\max\{F - k, 0\}]$.
Note $\max\{F - k, 0\} - \max\{k - F,0\} = F - k$ is a _forward_ with _strike_ $k$ so
$c - p = f - k$ and is called _put-call parity_. 
Call delta is $dc/df = dp/df + 1$ and call gamma is $d^2c/df^2 = d^2p/df^2$.

Define _moneyness_ $x$ by $F = k$ iff $X = x = (\log(k/F) + κ(s))/s$.
The value of a put is

_Put_
  ~ $p = E[(k - F)1(F\le k)] = k P(X \le x) - f P^s(X \le x)$

where $dP^s/dP = \exp(s X - κ(s))$.

_Put Delta_
  ~ $dp/df = E[1(F \le k)\exp(s X - κ(s))] = P^s(X \le x)$ 

_Gamma_
  ~ $d^2p/df^2 = E^s[δ_k(F)] = P^s(F = k)$

If $X$ is standard normal then $E[\exp(\mu + \sigma X)] = \exp(\mu + \sigma^2/2)$
and $E[g(X)\exp(s X - κ(s))] = E[g(X + s)]$ for any $g$.
These formulas imply the cumulant of a standard normal is $κ(s) = s^2/2$
and $P^s(X\le x) = P(X + s \le x)$.
If we let $\Phi$ be the cumulative distribution function of $X$ then
the put value is $k \Phi((\log(k/f) + s^2/2)/s) - f \Phi((\log(k/f) - s^2/2)/s)
= k \Phi(x) - f \Phi(x - s)$.

__Exercise__. _Show $(\log(k/f) + s^2/2)/s = -d_2$ and $(\log(k/f) - s^2/2)/s = -d_1$_.

Hint: Recall $d_1 = (log(f/k) + s^2/2)/s$ and $d_2 = d_1 - s$ in the classical
Black-Scholes/Merton formula.

Let $\Psi(y) = \Phi((\log(y/f) + κ(s))/s) = \Phi(x)$
be the cdf of $F$ where $y = f\exp(s x - κ(s))$. 
Note $dy/dx = y s$ so the probability density function of $Y$ is 
$\psi(y) = \Psi'(y) = \phi(x) dx/dy = \phi(x)/y s$. 
The same argument applies to $\Psi^s$ so 
$\psi^s(y) = \phi^s(x)/y s = \exp(s x - κ(s))\phi(x)/ys = \phi(x)/fs$ since $\exp(s x - κ(s)) = y/f$.
The formula for gamma is $d^2p/df^2 = \psi^s(k) = \phi(x)/fs$ where $x = (\log(k/f) + κ(s))/s$.

We know $E[g(X)\exp(s X - κ(s))] = E[g(X + s)]$ for any $g$. Taking
a deriviative with respect to $s$ gives 
$E[g(X)\exp(s X - κ(s))(X - κ'(s)] = E[g'(X + s)]$. 
Using this and noting $F = f\exp(s X - κ(s))$ 
yields $dp/ds = E[1(F \le k)F(X - κ'(s))] = fE[\delta_k(X + s)] = f\psi(x + s)$.

The formula for vega is $dp/ds = E[π'(F) dF/ds] = E[1(F\le k)F(X - κ'(s))]$.

## Discrete

The cdf is $cdf(x) = \sum_{x_i\le x} p_i$. The pdf returns infinity at $x_i$.
The cumulant is $κ(s) = \log(\sum_i exp(s*x_i) p_i) = \log e(s)$ so
$κ'(s) = e'(s)/e(s)$ and $κ''(s) = (e(s) e''(s) - e'(s)^2)/e(s)^2$.
Note $e^{(n)}(s) = \sum_i exp(s*x_i) x_i^n p_i)$ for $n \ge 0$.

## Trinomial

Define $X$ by $P(x = -a) = p$, $P(X = b) = q$, and $P(X = 0) = 1 - p - q$, $a,b\ge 0$.
If $0 = E[X] = -ap + bq$ and $\Var(X) = E[X^2] = a^2p + b^2 q$ then
$p = 1/a(a + b)$ and $q = 1/b(a+b)$. The condition $p + q \le 1$
is $ab \ge 1$. We parameterize this by $a = e^\alpha$, $b = e^\beta$
where $\alpha + \beta\ge 0$ so $p = 1/e^{\alpha}(e^\alpha + e^\beta)$
and $q = 1/e^{\beta}(e^\alpha + e^\beta)$. Note $a,b\ge0$ for all $\alpha,\beta$.

The cumulant is 

$$
\begin{aligned}
κ(s) &= \log E[\exp(sX)] \\
     &= \log(p\exp(-sa) + (1 - p - q) + q\exp(sb)) \\
     &= \log(
	 		\exp(-se^\alpha)/e^{\alpha}(e^\alpha + e^\beta)
			+ (1 - 1/e^{\alpha}(e^\alpha + e^\beta) - 1/e^\beta(e^\alpha + e^\beta))
			+ \exp(se^\beta)/e^{\beta}(e^\alpha + e^\beta)) \\
\end{aligned}
$$

## Remarks

If the cumulative distribution function of $X$ is $\Phi$, that is $P(X\le x) = \Phi(x)$,
and $g$ is invertible then the cdf of $Y = g(X)$ is $\Psi = \Phi\circ g^{-1}$. For example,
if $X$ has mean $0$ and variance $1$ and $g(x) = \mu + \sigma x$ then $Y = g(X)$ has mean
$\mu$, variance $\sigma^2$, and $\Psi(y) = P(Y\le y) = \Phi((y - \mu)/\sigma)$.

The probability density function of $Y = g(X)$ is $\psi(y) = \Psi'(y) =
(\phi\circ g^{-1}(y))(g^{-1})'(y)$.  Recall $(g^{-1})'(y) = 1/g'\circ
g^{-1}(y)$ so  $\psi(y) = (\phi(g^{-1}(y))/g'(g^{-1}(y)) = \phi(x)/g'(x)$
if $g(x) = y$.
