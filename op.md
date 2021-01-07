---
title: Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing
thanks: Thank you Peter Carr and Bill Goff for your valuable feedback.
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\RR}{𝑹}

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
This short note derives formulas for these that can be used for any positive underlying.

In the Nobel Prize winning theory of Black, Scholes, and Merton the value of
an option is ...

The option delta is the derivative of the value with respect to the underlying,
$\partial_s v = ...$. The naive derivative gives the correct answer, but
$d_1$ and $d_2$ depend on $s$ so the mathematically correct derivative
is ...

Every positive random variable $F$ can be parameterized as $F = fe^{sX - \kappa(s)}$
where $f = E[F]$ is the _forward_, $s^2 = \Var[\log F]$ is the _vol_ squared, and
$κ(s) = \log E[e^{sX}]$ is the _cumulant_ of $X$.
Define the _partial cumulant_ $κ(x,s) = \log E[1(X\le x) e^{sX}]$.
Call and put values and their greeks can be expressed in terms of
the partial cumulant and its derivatives.

## Share Measure

Let $F$ be the positive, random price of some _underlying_ instrument at
option expiration.  The (forward)  _value_ of an option paying $ν(F)$
in some currency at expiration is $E[ν(F)] = \int ν(F)\,dP$.
We can also consider the payoff in terms of shares of $F$,
$ν_s(F) = ν(F)F/E[F]$.  If we receive $ν_s(F)$ shares of $F$ at
expiration we can convert those at price $F$ to $ν(F)$ in the currency.

_Share measure_ $P_s$ is defined by $dP_s/dP = F/E[F]$.
We write $E_s$ for expectation under the share measure.
Note $F > 0$ and $E_s[1] = 1$ so share measure is a probability measure.

## Parameters

The _forward_ is $f = E[F]$ and the _vol_ squared is $s^2 = \Var(\log F)$.
Every positive random variable can be written $F = e^{m + sX}$ for
constants $m$, $s$ and $X$ having mean 0 and variance 1.  Using $f = E[F]
= e^m E[e^{sX}]$ we see $e^m = f e^{-κ(s)}$ where
$κ(s) = \log E[e^{sX}]$ is the _cumulant_ of $X$.
Hence $F = fe^{sX - κ(s)}$ is parameterized by $f$, $s$,
and a mean 0 variance 1 random variable $X$.
_Greeks_ are the derivatives of value with respect
to forward and vol.

If you prefer a different parameterization, say $f = f(u,t)$, $s = s(u,t)$,
the chain rule can be applied to get greeks in terms of $u$ and $t$.
For example, the Black model takes $X$ to be standard normal and vol
$s = σ \sqrt{t}$ where $σ$ is the _volatilty_ and $t$ is _time_ in
years to expiration.  In this case $F = fe^{σ\sqrt{t} X - σ^2t/2}$
and $∂_σ E[ν(F)] = ∂_sE[ν(F)] ∂s/∂σ = ∂_sE[ν(F)]\sqrt{t}$.

## Greeks

Define $ε_s(x) = e^{s x - κ(s)}$
so $∂_x ε_s(x) = ε_s(x)s$
and $∂_s ε_s(x) = ε_s(x)(x - κ'(s))$.

For any payoff $ν$ the _value_ is $v = E[ν(F)]$ and
_delta_ is the derivative of value with respect to the forward
$$
∂_f v
	= E[ν'(F) ∂_f F]
	= E[ν'(F)ε_s(X)]
	= E_s[ν'(F)]
$$
since $∂_f F = ε_s(X)$.

_Gamma_ is the second derivative with respect to the forward
$$
∂_f^2 v = E[ν''(F)ε_s^2(X)] = E_s[ν''(F)ε_s(X)]
$$

_Vega_ is  the derivative with respect to vol
$$
∂_s v = E[ν'(F) ∂_s F] = E[ν'(F)F(X - κ'(s))] = f E_s[ν'(F)(X - κ'(s))]
$$
since $∂_s F = F(X - κ'(s))$.

The inverse of option value as a function of vol is the _implied vol_.

### Distribution

Let $Φ(x) = P(X\le x)$ be the cumulative distribution functions of $X$
and $Φ_s(x) = P_s(X\le x) = E[1(X\le x)ε_s(X)]$ be the _share_ cdf where
$ε_s(x) = e^{sx - κ(s)}$. Note $Φ_s(x) = \exp(κ(x,s))$ can be written
in terms of the partial cumulant.
Since $φ_s(x) = Φ_s'(x) = φ(x) ε_s(x)$ we have
$$
∂_s Φ_s(x) = E[1(X\le x)ε_s(X)(X - κ'(s))].
$$

Let $y = y(x) = fε_s(x)$. 
The _moneyness_ of $y$ is $x = x(y) = ε_s^{-1}(y/f)
= (\log y/f + κ(s))/s$. Note
$F = fε_s(X)$ and $dP_s =  ε_s(X)\,dP$ is share measure.

We have $F \le y(x)$ if and only if $X \le x(y)$, where
$x = x(y) = ε_s^{-1}(y/f)$, since $∂_x ε_s(x) > 0$ (assuming $s > 0$).
The cumulative distribution of $F$ is $Ψ(y) = P(F\le y) = P(X\le x)
= Φ(x)$ and the density function of $F$ is $ψ(y) = Ψ'(y) = Φ'(x)
dx/dy = φ(x)/ys$ since $dy/dx = ys$. 
Note
$$
	ψ'(y) = \frac{φ'(x) - φ(x)s}{y^2s^2}. 
$$

<!--
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
-->

## Put and Call

A _put option_ pays $ν(F) = (k - F)^+ = \max\{k - F,0\}$ at expiration and has value
$p = E[(k - F)^+]$.
A _call option_ pays $ν(F) = (F - k)^+$ at expiration and has value $c = E[(F - k)^+]$.
Note $(F - k)^+ - (k - F)^+ = F - k$ is a _forward_ with _strike_ $k$ so
all models satisfy _put-call parity_: $c - p = f - k$.
Call delta is $∂c/∂f = ∂p/∂f + 1$ and call gamma equals put gamma $∂^2c/∂f^2 = ∂^2p/∂f^2$.
We also have $∂c/∂s - ∂p/∂s = 0$ so call vega equals put vega.

The value of a put is
$$
\begin{aligned}
p &= E[(k - F)^+] \\
  &= E[(k - F)1(F\le k)] \\
  &= k P(F \le k) - E[F 1(F \le k)] \\
  &= k P(F \le k) - fP_s(F \le k) \\
  &= k Φ(x(k)) - f Φ_s(x(k)). \\
\end{aligned}
$$

Put delta is
$$
	∂_f p = E[-1(F\le k)ε_s(X)] = -P_s(X\le x(k)) = -Φ_s(x(k)). 
$$

Gamma for either a put or call is
$$
	∂_f^2 p = E[δ_k(F)(F/f)^2] = ψ(k)(k/f)^2 = φ(x(k))k/f^2s = φ_s(x(k))/fs.
$$

Vega for a put is
$$
	∂_s p = -E[1(F\le k)F(X - κ'(s))] = -f ∂_s Φ_s(x(k)).
$$ 

## Digital

A _digital put_ has payoff $ν(F) = 1(F \le k)$ and
a _digital call_ has payoff $ν(F) = 1(F > k)$ with values
$$
	p = P(F \le k) = Φ(x(k)),
	c = P(F > k) = 1 - Φ(x(k)).
$$

Digital put delta 
$$
\begin{aligned}
	∂_f p &= -E[\delta_k(F)(F/f)] \\
	&= -ψ(k)k/f \\
	&= -(φ(x(k)/ks)k/f \\
	&= -φ(x(k))/fs \\
	&= -φ_s(x(k))/ks \\
\end{aligned}
$$

Digital gamma is 
$$
\begin{aligned}
	∂_f^2 p &= -E[\delta_k'(F)(F/f)^2] \\
	&= -ψ'(k)(k/f)^2 \\
	&= -((φ'(x(k)) - φ(x(k))s)/k^2s^2))(k/f)^2 \\
	&= -(φ'(x(k)) - φ(x(k))s)/f^2s^2) \\
\end{aligned}
$$

Digital put vega is 
$$
\begin{aligned}
∂_s p &= -E_s[\delta_k(F)F(X - s)] \\
	&= -ψ(k)k(x(k) - s) \\ 
	&= -(φ(x(k))/ks)k(x(k) - s) \\ 
	&= -φ(x(k))(x(k) - s)/s \\ 
\end{aligned}
$$

## Black Model

We use the above to derive the standard Black-Scholes/Merton formulas
for value and greeks. In the Black model $F = fe^{σB_t - σ^2t/2}$ where
$f$ is the forward, $σ$ is the volatility, and
$B_t$ is Brownian motion at time $t$. There is really no need to drag
in Brownian motion to compute an option value, we only use the fact
$B_t$ is normally distributed with mean $0$ and variance $t$. There is also no need
to drag in $t$, let $s = σ\sqrt{t}$ and $X$ be standard normal
so $F = fe^{sX - s^2/2}$ has the same distribution.

[Recall](cdf.html#normal) if $X$ is standard normal then $E[e^{μ + σ X}] = e^{μ + σ^2/2}$
and $E[g(X)e^{s X - s^2/2}] = E[g(X + s)]$ for any function $g$ and $s\in\RR$.
These formulas imply the cumulant of a standard normal is $κ(s) = s^2/2$
and $Φ_s(x) = P_s(X\le x) = E[1(X\le x)e^{s X - s^2/2}] = P(X + s \le x) = Φ(x - s)$.
Note $φ_s(x) = φ(x - s)$ and $∂Φ_s(x)/∂s = -φ(x - s) = -φ_s(x)$.

Put value is 
$$
	p = k Φ(x(k)) - f Φ(x(k) - s)
$$
where $x(k) = \log(k/f)/s + s/2$.

__Exercise__. _Show $x(k) = \log(k/f)/s + s/2 = -d_2$ and $x(k) - s = \log(k/f)/s - s/2 = -d_1$_.

Hint: The Black-Scholes/Merton formulas use $d_1 = (\log(f/k) + s^2/2)/s$ and $d_2 = d_1 - s$.

Put delta is
$$
	∂_f p = -Φ_s(x(k)) = -Φ(x(k) - s).
$$

Gamma is
$$
	∂_f^2 p = φ(x(k))k/f^2s = φ_s(x(k))/fs.
$$

Vega is
$$
\begin{aligned}
	∂_s v &= -f ∂_s Φ_s(x(k)) \\
	&= fφ(x(k) - s) = fφ_s(x(k)).
\end{aligned}
$$

## Spot

The Black-Merton/Scholes model uses _spot_ prices instead of forward.
If a risk-free bond has realized return $R$ over the period the value of the underlying
at expiration is $U = Rue^{sX - κ(s)}$. Since $F = U$ we have $f = Ru$.
The _spot_ value of the option is $v_0 = E[ν(U)]/R$. We have
$$
∂_u v_0 = E[ν'(U) ∂_u U]/R
= E[ν'(F) ∂_f F ∂_u f]/R
= E[ν'(F) ∂_f F R]/R = ∂_f v.
$$
Spot and forward delta are equal but the spot gamma is
$$
∂_u^2 v_0 = ∂_u ∂_f v = ∂_f^2 v ∂_u f = ∂_f^2 v R.
$$
Spot vega is 
$$
∂_s v_0 = E[ν'(U) ∂_s U]/R = E[ν'(F) ∂_s F/R = ∂_s v/R.
$$

## Remarks

Let $X$ have cdf $Φ(x) = P(X\le x)$ and pdf $φ(x) = Φ'(x)$.
$$
	K(s,x) = E[1(X\le x) e^{sX}], K(s) = E[e^{sX}]
$$
be the partial, moment generating function and $κ(s,x) = \log K(s,x)$,
$κ(s) = \log K(s)$ be the partial, cumulant generating function of $X$.

Let $ε_s(x) = e^{sx}/K(s) = e^{sx - κ(s)}$.

If $X$ is standard normal $K(s,x) = e^{s^2/2}Φ(x - s)$ and $K(s) = e^{s^2/2}$.

$Φ_s(x) = K(s,x)/K(s)$. If $X$ is standard normal $Φ_s(x) = Φ(x - s)$.

$∂_x K(s,x) = E[δ_x(X) e^{sX}] = e^{sx} φ(x)$

$∂_x Φ_s(x) = e^{sx} φ(x)/K(s) = e^{sx - κ(s)} φ(x)$.

$∂_x^{n+1} Φ_s(x) = e^{sx - κ(s)}\sum_{k=0}^n \binom{n}{k} φ^{(n - k)}(x) s^k$.

$∂_s^n K(s,x) = E[1(X\le x) e^{sX} X^n]$, $∂_s^n K(s) = E[e^{sX} X^n]$.

$∂_s Φ_s(x) = (K(s)∂_s K(s, x) - ∂_s K(s) K(s, x))/K(s)^2$.

$$
\begin{aligned}
∂_x^2 K(s,x) &= s(sK(s,x) + e^{sx} φ(x)) + e^{sx}s φ(x) + e^{sx}φ'(x) \\
	&= s^2 K(s,x) + e^{sx} (2s φ(x) + φ'(x)\\
\end{aligned}
$$

$$
\begin{aligned}
∂_x^3 K(s,x) &= s^2 (s K(s,x) + e^{sx}φ(x)) + e^{sx}s(2 φ(x) + φ'(x)) + e^{sx}(2 φ'(x) + φ''(x))\\
	&= s^3 K(s,x) + e^{sx} (3s^2 φ(x) + 3φ'(x) + φ''(x))\\
\end{aligned}
$$

and $K(x, s) = \exp(κ(x,s)) = Φ_s(x)$.
We have $φ_s(x) = ∂_x Φ_s(x) = K_x(x, s) = K(x, s)∂_x κ(x,s)$.

$$
\begin{aligned}
κ_{a + bX}(x,s) &= \log E[1(a + bX \le x) e^{s(a + bX)}] \\
	&= \log e^{as} E[1(X \le (x - a)/b) e^{sbX}] \\
	&= as + κ_X((x - a)/b, bs) \\
\end{aligned}
$$
