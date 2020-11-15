---
title: Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing
...

\renewcommand{\Var}{\operatorname{Var}}

European _option valuation_ involves calculating the expected value of
the _option payoff_ at _expiration_. Greeks are derivatives of the value.
Payoff is a function of the _underlying_ at expiration.

Let $F > 0$ be the value of the underlying at option expiration.
Any positive random variable $F$ can be parameterized by
$F = f \exp(s X - κ(s))$, where $κ(s) = \log E[s X]$ is the cumulant of $X$.
Note $E[F] = f$ is the _forward_ and $\Var(\log F) = s^2$ is the variance
if $E[X] = 0$ and $E[X^2] = 1$, which we can, and do, assume.
For example, the Black model takes $X$ to be standard normal and  _vol_ 
$s = σ \sqrt{t}$ where $σ$ is the volatilty and $t$ is time in years to expiration.

The (forward) value of an option paying $π(F)$ at expiration is $v = E[π(F)]$.

_Delta_ 
  ~ $dv/df = E[π'(F) dF/df] = E[π'(F)\exp(s X - κ(s))] = E^s[π'(F)]$

_Gamma_ 
~ $d^2v/df^2 = E[π''(F)\exp(s X - κ(s))^2] = e^{κ(2s) - 2κ(s)}E^{2s}[π''(F)]$ 

_Vega_
  ~ $dv/ds = E[π'(F) dF/ds] = E[π'(F)F(X - κ'(s))]$.

The inverse of value as a function of vol is the _implied volatility_.

A _put option_ pays $\max\{k - F,0\}$ at expiration and has value $p = E[\max\{k - F,0\}]$.
A _call option_ pays $\max\{F - k, 0\}$ at expiration and has value $c = E[\max\{F - k, 0\}]$.
Note $\max\{F - k, 0\} - \max\{k - F,0\} = F - k$ is a _forward_ with _strike_ $k$ so
$c - p = f - k$ and is called _put-call parity_. 

Define _moneyness_ $x$ by $F = k$ iff $X = x = (\log(k/F) + κ(s))/s$.
The value of a put is

_Put_
  ~ $p = E[(k - F)1(F\le k)] = k P(X \le x) - f P^s(X \le x)$

where $dP^s/dP = \exp(s X - κ(s))$.

_Put Delta_
  ~ $dp/df = E[1(F \le k)\exp(s X - κ(s))] = P^s(X \le x)$ 

Since $c = p + f - k$ call delta is $dc/df = dp/df + 1$.

_Put Gamma_
  ~ $d^2p/df^2 = E^s[δ_k(F)] = ...$

Since $dc/df = dp/df + 1$ call gamma is $d^2c/df^2 = d^2p/df^2$.
