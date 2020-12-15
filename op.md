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

## Share Measure

Let $F$ be the positive, random price of some _underlying_ instrument at
option expiration.  The (forward)  _value_ of an option paying $\nu(F)$
in some currency at expiration is $E[\nu(F)] = \int \nu(F)\,dP$.
We can also consider the payoff in terms of shares of $F$,
$\nu_s(F) = \nu(F)F/E[F]$.  If we receive $\nu_s(F)$ shares of $F$ at
expiration we can convert those at price $F$ to $\nu(F)$ in the currency.

_Share measure_ $P_s$ is defined by $dP_s/dP = F/E[F]$.
We write $E_s$ for expectation under the share measure.
Note $E_s[1] = 1$ so share measure is a probability measure.

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
years to expiration.  In this case $F = fe^{σ \sqrt{t} X - σ^2t/2}$
and $∂E[\nu(F)]/∂σ = (∂E[\nu(F)]/∂s)(∂s/∂σ) = (∂E[\nu(F)]/∂s)\sqrt{t}$.

The Black-Merton/Scholes model uses _spot_ prices instead of forward.
If a risk-free bond has realized return $R$ over the period the value of the underlying
at expiration is $U = Rue^{sX - κ(s)}$. Since $F = U$ we have $f = Ru$.
The _spot_ value of the option is $v_0 = (1/R)E[\nu(U)]$. We have
$$
\frac{∂v_0}{∂u} = \frac{1}{R} E[ν'(U)\frac{∂U}{∂u}]
= \frac{1}{R} E[ν'(F) \frac{∂F}{∂f} \frac{∂f}{∂u}]
= \frac{1}{R} E[ν'(F) \frac{∂F}{∂f} R] = \frac{∂v}{∂f}.
$$
Spot and forward delta are equal but the spot gamma is
$$
\frac{∂^2v_0}{∂u^2} = \frac{∂}{∂u}\frac{∂v}{∂f} = \frac{∂^2v}{∂f^2}\frac{∂f}{∂u} = R \frac{∂^2v}{∂f^2}.
$$
Spot vega is 
$$
\frac{∂v_0}{∂s} = \frac{1}{R} E[ν'(U) \frac{∂U}{∂s}] = \frac{1}{R} E[ν'(F) \frac{∂F}{∂s} = \frac{1}{R}\frac{∂v}{∂s}.
$$

## Greeks

Define $ε_s(x) = e^{s x - κ(s)}$
so $∂ε_s(x)/∂x = ε_s(x)s$
and $∂ε_s(x)/∂s = ε_s(x)(x - κ'(s))$.
Let $y = y(x) = fε_s(x)$. 
The _moneyness_ of $y$ is $x = x(y) = ε_s^{-1}(y/f)
= (\log y/f + κ(s))/s$. Note
$F = fε_s(X)$ and $dP_s =  ε_s(X)\,dP$ is share measure.

For any payoff $\nu$ the _value_ is $v = E[\nu(F)]$ and
_delta_ is the derivative of value with respect to the forward
$$
\frac{∂v}{∂f}
	= E[\nu'(F)\frac{∂F}{∂f}]
	= E[\nu'(F)\frac{F}{f}]
	= E[\nu'(F)ε_s(X)]
	= E_s[\nu'(F)]
$$
since $∂F/∂f = F/f = ε_s(X)$.

_Gamma_ is the second derivative with respect to the forward
$$
\frac{∂^2v}{∂f^2} = E[\nu''(F)ε_s^2(X)] = E_s[\nu''(F)ε_s(X)]
$$
<!--
	= e^{κ(2s) - 2κ(s)}E_{2s}[\nu''(F)]
-->

_Vega_ is  the derivative with respect to vol
$$
\frac{∂v}{∂s} = E[\nu'(F)\frac{∂F}{∂s}] = E[\nu'(F)F(X - κ'(s))] = f E_s[\nu'(F)(X - κ'(s))]
$$
since $∂F/∂s = F(X - κ'(s))$.

The inverse of option value as a function of vol is the _implied vol_.

### Distribution

Let $Φ(x) = P(X\le x)$ be the cumulative distribution functions of $X$
and $Φ_s(x) = P_s(X\le x) = E[1(X\le x)ε_s(X)]$ be the _share_ cdf where
$ε_s(x) = e^{sx - κ(s)}$.
Note $φ_s(x) = Φ_s'(x) = φ(x) ε_s(x)$ and
$$
\frac{∂Φ_s(x)}{∂s} = E[1(X\le x)ε_s(X)(X - κ'(s))].
$$

Let $y = y(x) = fε_s(x)$ and $F = fε_s(X)$.
We have $F \le y(x)$ if and only if $X \le x(y)$,
where $x = x(y) = ε_s^{-1}(y/f)$,
since $∂ε_s(x)/∂x > 0$ (assuming $s > 0$).
The cumulative distribution of $F$ is 
$Ψ(y) = P(F\le y) = P(X\le x) = Φ(x)$ and
the density function of $F$ is $ψ(y) = Ψ'(y) = Φ'(x) dx/dy = φ(x)/ys$ since $dy/dx = ys$.
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
	\frac{∂p}{∂f} = E[-1(F\le k)ε_s(X)] = -P_s(X\le x(k)) = -Φ_s(x(k)). 
$$

Gamma for either a put or call is
$$
	\frac{∂^2p}{∂f^2} = E[δ_k(F)(F/f)^2] = ψ(k)(k/f)^2 = φ(x(k))k/f^2s = φ_s(x(k))/fs.
$$

Vega for a put is
$$
	\frac{∂p}{∂s} = -E[1(F\le k)F(X - κ'(s))] = -f\frac{∂}{∂s}Φ_s(x(k)).
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
	\frac{∂p}{∂f} &= -E[\delta_k(F)(F/f)] \\
	&= -\psi(k)k/f \\
	&= -(\phi(x(k)/ks)k/f \\
	&= -\phi(x(k))/fs \\
	&= -\phi_s(x(k))/ks \\
\end{aligned}
$$

Digital gamma is 
$$
\begin{aligned}
	\frac{∂^2p}{∂f^2} &= -E[\delta_k'(F)(F/f)^2] \\
	&= -\psi'(k)(k/f)^2 \\
	&= -((φ'(x(k)) - φ(x(k))s)/k^2s^2))(k/f)^2 \\
	&= -(φ'(x(k)) - φ(x(k))s)/f^2s^2) \\
\end{aligned}
$$

Digital put vega is 
$$
\begin{aligned}
\frac{∂p}{∂s} &= -E_s[\delta_k(F)F(X - s)] \\
	&= -\psi(k)k(x(k) - s) \\ 
	&= -(\phi(x(k))/ks)k(x(k) - s) \\ 
	&= -\phi(x(k))(x(k) - s)/s \\ 
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
	\frac{∂p}{∂f} = -Φ_s(x(k)) = -Φ(x(k) - s).
$$

Gamma is
$$
	\frac{∂^2p}{∂f^2} = φ(x(k))k/f^2s = φ_s(x(k))/fs.
$$

Vega is
$$
\begin{aligned}
	\frac{∂v}{∂s} &= -f\frac{∂}{∂s}Φ_s(x(k)) \\
	&= fφ(x(k) - s) = fφ_s(x(k)).
\end{aligned}
$$
