---
title: Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing and greeks
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
the _option payoff_ using the _underlying_ at _expiration_.
_Greeks_ are derivatives of the option value with respect to _model parameters_.
This short note derives formulas for these that can be used for any positive underlying.

## Black-Scholes/Merton

The classic Black-Scholes/Merton formula for the spot value of a call option is
$$
	v_0 = s N(d_1) - ke^{-rt} N(d_2)
$$
where $N$ is the standard normal cumluative distribution function, $s$ is
the spot price, $k$ is the call strike, $r$ is the risk-free continuously
compounded interest rate, $t$ is the time in years to expiration, $d_1 =
(\log(s/k) + (r + σ^2/2)t)/σ\sqrt{t}$, and $d_2 = d_1 - σ\sqrt{t}$.

Option _delta_ is the derivative of value with respect to the underlying. It is true that
$∂_s v_0 = ∂v_0/∂s = N(d_1)$, but $d_1$ and $d_2$ involve $s$ so one needs to
show $s ∂_s N(d_1) - ke^{-rt} ∂_s N(d_2) = 0$. Plowing through the
calculations involved is a ritual we all perform when first learning the theory.

Their Nobel Prize winning work showed how to replicate the payoff of
an option by dynamically hedging it with the underlying. The value
of an option is the cost of setting up the initial hedge. It is not
trivial to show the value is the expectation of the option payoff under
some probability measure. This is why Nobel Prizes are awarded.

Fischer Black simplified this formula by expressing it in terms of _forward values_.
$$
	v_t = f N(d_1) - k N(d_2),
$$
where $f = se^{rt}$ is forward price and $v_t = v_0 e^{rt}$ is the forward value of the option.
In this case $d_1 = (\log(f/k) + σ^2t/2)/σ\sqrt{t}$ and $d_2 = d_1 - σ\sqrt{t}$
which eliminates the parameter $r$. Letting $s = σ\sqrt{t}$ eliminates $t$.

We will skip the theory of stochastic differential equations, Ito's lemma,
self-financing portfolios, and other dainty mathematical machinery
required to prove their result. Let's fast-forward to calculating expected
values and derivatives with respect to model parameters.

## Put Formula

The forward value of a put with strike $k$ is $v = E[\max\{k - F\}]$, where $F$
is the random value of the underlying at expiration. We let $1_A$ denote
the _characteristic function_ with $1_A(x) = 1$ if $x\in A$ and $1_A(x) = 0$ if $x\notin A$.

$$
\begin{aligned}
	v &= E[\max\{k - F\}] \\
	  &= E[(k - F)1(F \le k)] \\
	  &= kP(F\le k) - E[F 1(F \le k)] \\
	  &= kP(F\le k) - f E[(F/f) 1(F \le k)] \\
	  &= kP(F\le k) - fP^s(F \le k)] \\
\end{aligned}
$$
where $f = E[F]$ and $P^s = (F/f)P$.

__Exercise__.  _If $F > 0$ then $P^s$ is a probability measure_.

The (forward) value of an option paying $\nu(F)$ at expiration is $v = E[\nu(F)]$.
If the option pays shares instead of currency its value is
$E[F\nu(F)] = fE[(F/f) \nu(F)] = f E^s[\nu(F)]$, where
$E^s$ is the expectation under _share measure_ $P^s$.

Recall the _moment generating function_ of a random variable $X$ is $E[e^{sX}]$
and its _cumulant_ is $\kappa(s) = \log E[e^{sX}]$.

__Exercise__. _If $F > 0$ then $F = fe^{sX - \kappa(s)}$ where $s^2 = \Var(\log F)$
and $X$ has mean 0 and variance 1_.

## Black Model

In Black's model, the forward at expiration is $F_t = fe^{σB_t - σ^2t/2}$,
where $B_t$ is standard Brownian motion.
The forward value of a call option is the expected value of the
call payoff at expiration
$$
	v_t = E[\max\{F_t - k, 0\}]
$$
The expiration $t$ can be subsumed into
the _vol_ $s = σ\sqrt{t}$ so $F_t = F = fe^{sX - s^2/2}$ where $X$
is standard normal. The only fact we use about Brownian motion is $B_t$
is normal with mean 0 and variance $t$.

Since $(F - k)^+ = \max\{F - k, 0\} = (F - k) 1(F\ge k)$,
$$
\begin{aligned}
	v &= E[\max\{F - k, 0\}] \\
	  &= E[(F - k) 1(F\ge k)] \\
	  &= E[F 1(F\ge k)] - kE[1(F\ge k)] \\
	  &= f E[e^{sX - s^2/2} 1(F\ge k)] - kP(F\ge k) \\
\end{aligned}
$$

__Exercise__. _Show $F\ge k$ if and only if $-X \le d_2$_.

__Exercise__. _Use $E[e^{sX - s^2/2} g(X)] = E[g(X + s)]$ to show
$E[e^{sX - s^2/2} 1(F\ge k)] = P(Fe^{s^2}\ge k)$_.

__Exercise__. _Show $Fe^{s^2}\ge k$ if and only if $-X\le d_1$_.

This establishes the Black formula for the forward value of an option
since $-X$ has the same distribution as $X$.

For any differentiable function $ν$, 
$∂_f E[ν(F)] = E[ν'(F) ∂_f F] = E[ν'(F) e^{sX - s^2/2}] = E[ν'(Fe^{s^2})]$ so
$$
	∂_f v = E[1(Fe^{s^2}\ge k)] = P(Fe^{s^2}\ge k) = N(d_1).
$$
This establishes the formula for option delta without any turmoil.
Option values and greeks for any positive underlying can be calculated
in a similar fashion. 

## Share Measure

Let $F$ be the price of the _underlying_ instrument at option expiration.
The forward value of an option paying $ν(F)$ in some currency at
expiration is $E[ν(F)]$. If $F$ is positive we can also consider the payoff in terms of
shares of $F$, $ν_s(F) = ν(F)F/E[F]$; if we receive $ν_s(F)$ shares
of $F$ at expiration we can convert those at price $F$ to $ν(F)$ in
the currency.

_Share measure_ for positive underlyings is defined by $E_s[ν(F)] = E[ν_s(F)] = E[ν(F) F/E[F]]$.
Note $F > 0$ and $E_s[1] = 1$ so share measure is a probability measure.
It shows up in the formula for valuing a call
$$
\begin{aligned}
	E[(F - k)^+] &= E[(F - k)1(F\ge k)] \\
		&= E[F1(F\ge k)] - k P(F\ge k) \\
		&= fP_s(F\ge k) - k P(F\ge k).
\end{aligned}
$$
Every positive random variables $F$ can be written $F = f e^{s X - κ(s)}$
where $X$ is a random variable with mean 0 and variance 1 and
$κ(s) = \log E[e^{sX}]$ is the cumulant of $X$.
Note $f = E[F]$ and $s^2 = \Var(\log F)$.

__Exercise__. _Clearly $\log(F/E[F]) = m + sX$ for some random variable $X$ with mean 0 and variance 1.
Show $E[F] = f$ implies $m = -κ(s)$_.

If we let $ε_s(x) = e^{s x - κ(s)}$, so $F = fε_s(X)$, this can be written
$E_s[ν(F)] = E[ν(F) ε_s(X)]$ and we see share measure is the Esscher transform.
The cumulative distribution of $F$ under this measure is
$$
	P_s(F\le y) = P_s(X\le x) = E[1(X\le x) e^{sX - κ(s)}]
$$
where $x = x(y) = ε_s^{-1}(y/f) = (\log y/f + κ(s))/s$ is the _moneyness_
of $y$. Note $∂_x ε_s(x) =  ε_s(x) s$, $∂_s ε_s(x) = ε_s(x) (x - κ'(s))$, 
and $ε_s(x(y)) = y/f$.

### Greeks

Let $ν(F)$ be the option payoff at expiration. The forward value of
the option is $v = E[ν(F)]$. 
Option _delta_ is the derivative of value with respect to the forward
$$
∂_f v = E[ν'(F) ∂_f F] = E[ν'(F) ε_s(X)] = E_s[v'(F)]
$$
using $∂_f F = ε_s(X)$.

_Gamma_ is the second derivative with respect to the forward
$$
∂_f^2 v = E[ν''(F)ε_s^2(X)].
$$

_Vega_ is  the derivative with respect to vol
$$
∂_s v = E[ν'(F) ∂_s F] = E[ν'(F)F(X - κ'(s))] = fE_s[ν'(F)(X - κ'(s))]
$$
using $∂_s F = F(X - κ'(s))$.

The inverse of option value as a function of vol is the _implied vol_.

## Put and Call

A _put option_ pays $ν(F) = (k - F)^+ = \max\{k - F,0\}$ at expiration
and has value $p = E[(k - F)^+]$.
A _call option_ pays $ν(F) = (F - k)^+$ at expiration
and has value $c = E[(F - k)^+]$.
Note $(F - k)^+ - (k - F)^+ = F - k$ is a _forward_ with _strike_ $k$ so
all models satisfy _put-call parity_: $c - p = f - k$.
Call delta is $∂_f c = ∂_f p + 1$ and call gamma equals put gamma
$∂_f^2 c = ∂_f^2 p$.  We also have $∂_s c - ∂_s p = 0$ because
forwards are independent of vol so call vega equals put vega.

The value of a put is
$$
	p =  E[(k - F)^+] = kP(F\le k) - f P_s(F\le k).
$$

Put delta is
$$
	∂_f p = E[-1(F\le k)ε_s(X)] = -P_s(F\le k).
$$

Gamma for either a put or call is
$$
	∂_f^2 p = E[δ_k(F)ε_s(X)^2] = E_s[δ_k(F)ε_s(X)]
$$
where $δ_k$ is a point mass at $k$.

Vega for a put or call is
$$
	∂_s p = E[-1(F\le k) F (X - κ'(s))] = -f E_s[1(F\le k) (X - κ'(s))].
$$ 

### Distribution

Let $Φ(x) = P(X\le x)$ be the cumulative distribution functions of $X$
and $Φ_s(x) = P_s(X\le x) = E[1(X\le x)ε_s(X)]$ be the _share_ cdf.
Of course $Φ(x) = Φ_0(x)$.
Let $Ψ_s(y) = P_s(F\le y) = Φ_s(x)$ be the share cumulative distribution function of $F$
where $y = fε_s(x)$. The share density function is
$$
	ψ_s(y) = φ_s(x) ∂x/∂y = φ_s(x)/ys
$$
since $∂y/∂x = ys$.
We also have
$$
	∂_s Φ_s(x) = E[1(X\le x)ε_s(X)(X - κ'(s))] = E_s[1(X\le x) (X - κ'(s))].
$$

In terms of the distribution function for $X$, the value is
$$
	p = k Φ(x(k)) - f Φ_s(x(k),
$$
put delta is
$$
	∂_f p = -Φ_s(x(k)),
$$
put gamma is
$$
	∂_f^2 p = E_s[δ_k(F)ε_s(X)] = ψ_s(k) ε_s(x(k)) = (φ_s(x(k))/ks) (k/f) = φ_s(x(k))/fs,
$$ 
and put vega is
$$
	∂_s p = -f E_s[1(F\le k) (X - κ'(s))] = -f ∂_s Φ_s(x(k)).
$$ 

## Black Model

In the Black modes $F = fe^{sX - s^2/2}$ where $X$ is standard normal.
[Recall](cdf.html#normal) if $X$ is standard normal then $E[g(X) e^{sX}] = e^{s^2/2}E[g(X + s)]$.
Using $g(x) = 1$ we see $κ(s) = s^2/2$. Using $g(X) = 1(X\le x)$
we get $Φ_s(x) = P(X + s \le x) = Φ(x - s)$
and $∂Φ_s(x)/∂s = -φ(x - s) = -φ_s(x)$.

Put value is 
$$
	p = k Φ(x(k)) - f Φ(x(k) - s),
$$
where $x(k) = \log(k/f)/s + s/2$.

Put delta is
$$
	∂_f p = -Φ_s(x(k)) = -Φ(x(k) - s).
$$
Gamma is
$$
	∂_f^2 p = φ_s(x(k))/fs = φ(x(k) - s)/fs
$$
Vega is
$$
	∂_s v = -f ∂_s Φ_s(x(k)) = fφ_s(x(k)) = fφ(x(k) - s).
$$

## Digital

A _digital put_ has payoff $ν(F) = 1(F \le k)$ and
a _digital call_ has payoff $ν(F) = 1(F > k)$.
Since $1(F \le k) + 1(F > k) = 1$ we have digital put-call parity $p + c =
1$ where $p$ is the digital put value and $c$ is the digital call value:
$$
	p = P(F \le k), c = P(F > k) = 1 - p.
$$

Digital put delta is
$$
	∂_f p = -E[δ_k(F)ε_s(X)] = -E_s[δ_k(F)]
$$

Digital gamma is 
$$
	∂_f^2 p = E[δ'_k(F)ε_s(X)^2] = E_s[δ'_k(F) ε_s(X)].
$$

Digital vega is 
$$
	∂_s p = -E[\delta_k(F)F(X - s)] = -f E_s[δ_k(F) (X - κ(s))].
$$

## Parameters

The Black-Scholes/Merton values and greeks can be calculated in terms of
the parameters $f$ and $s$ using the
chain rule.  For example, the Black model takes $X$ to be standard normal
and vol $s = σ \sqrt{t}$ where $σ$ is the standard Black volatilty
and $t$ is time in years to expiration.  In this case standard vega
is $∂_σ E[ν(F)] = ∂_s E[ν(F)] ∂_σ s = ∂_s E[ν(F)]\sqrt{t}$.

The Black-Merton/Scholes model uses _spot_ prices instead of forward.
If a risk-free bond has realized return $R = e^{rt}$ over the period, the value of the underlying
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

<!--
## Remarks

$$
\begin{aligned}
κ_{a + bX}(s,x) &= \log E[1(a + bX \le x) e^{s(a + bX)}] \\
	&= \log e^{as} E[1(X \le (x - a)/b) e^{sbX}] \\
	&= as + κ_X(bs, (x - a)/b) \\
\end{aligned}
$$
-->
