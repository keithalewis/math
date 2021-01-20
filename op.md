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
_Greeks_ are derivatives of the _value_ with respect to _model parameters_.
This short note derives formulas for these that can be used for any positive underlying.

## Black-Scholes/Merton

The classic Black-Scholes/Merton formula for the spot value of a call option is
$$
	v_0 = s N(d_1) - ke^{-rt} N(d_2),
$$
where $N$ is the standard normal cumluative distribution function, $s$
is the spot price, $k$ is the call strike, $r$ is the risk-free
interest rate, $t$ is the time in years to expiration, $d_1 = (\log(s/k)
+ (r + σ^2/2)t)/σ\sqrt{t}$, and $d_2 = d_1 - σ\sqrt{t}$. 

_Delta_ is the derivative of value with respect to the underlying. It is true that
$∂_s v_0 = ∂v_0/∂s = N(d_1)$, but $d_1$ and $d_2$ involve $s$ so one needs to
show $s ∂_s N(d_1) - ke^{-rt} ∂_s N(d_2) = 0$. Plowing through the
calculations involved is a ritual we all perform when first learning the theory.

Fischer Black simplified this formula by expressing it in terms of _forward values_.
$$
	v_t = f N(d_1) - k N(d_2),
$$
where $f = se^{rt}$ is forward price and $v_t = v_0 e^{rt}$ is the forward value of the option.

Their Nobel Prize winning work showed how to replicate the payoff of
an option by dynamically hedging it with the underlying. The value
of an option is the cost of setting up the initial hedge. It is not
trivial to show the value is the expectation of the option payoff under
some probability measure. This is why Nobel Prizes are awarded.

We will skip the theory of stochastic differential equations, Ito's lemma,
self-financing portfolios, and other dainty mathematical machinery
required to prove their result. Let's fast-forward to calculating expected
values and derivatives with respect to model parameters.

## Black Model

Fischer Black's model uses forward values.
Let $F_t = fe^{σB_t - σ^2t/2}$, where $B_t$ is standard Brownian motion,
be the forward price of the underlying at expiraton.
This eliminates the interest rate parameter $r$.
The forward value of a call option is the expected value of the
call payoff at expiration
$$
	v_t = E[\max\{F_t - k, 0\}]
$$
The expiration $t$ can be subsumed into
the _vol_ $s = σ\sqrt{t}$ so $F_t = F = fe^{sX - s^2/2}$ where $X$
is standard normal. The only fact we use about Brownian motion is $B_t$
is normal with mean 0 and variance $t$.

Since $\max\{F - k, 0\} = (F - k) 1(F\ge k)$,
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
	∂_f v = E[1(Fe^{s^2}\ge k)] = N(d_1).
$$
This establishes the formula for option delta without any turmoil.
Option values and greeks for any positive underlying can be calculated
in a similar fashion. 

## Positive Underlying

Every positive random variable $F$ can be parameterized
by $F = fe^{sX - \kappa(s)}$ where $f = E[F]$ is the _forward_,
$s^2 = \Var[\log F]$ is the vol squared,
and $κ(s) = \log E[e^{sX}]$ is the _cumulant_ of $X$.
Define the _partial moment generating function_ $M(s,x) = E[1(X\le x)e^{sX}]$
and the _partial cumulant_ $κ(s,x) = \log M(s,x)$.
Option values and their greeks can be expressed
in terms of the partial cumulant and its derivatives.

## Share Measure

Let $F$ be the price of the _underlying_ instrument at option expiration.
The forward value of an option paying $ν(F)$ in some currency at
expiration is $E[ν(F)]$.  We can also consider the payoff in terms of
shares of $F$, $ν_s(F) = ν(F)F/E[F]$; if we receive $ν_s(F)$ shares
of $F$ at expiration we can convert those at price $F$ to $ν(F)$ in
the currency.

_Share measure_ $E_s$ is defined by $E_s[ν(F)] = E[ν(F) F/E[F]]$.
Note $F > 0$ and $E_s[1] = 1$ so share measure is a probability measure.
If we let $ε_s(x) = e^{s x - κ(s)}$ this can be written
$E_s[ν(F)] = E[ν(F) ε_s(X)]$ and we see share measure is just the Esscher transform.
The cumulative distribution of $F$ under this measure is
$$
	P_s(F\le y) = P_s(X\le x) = E[1(X\le x) e^{sX - κ(s)}] = M(s,x)/M(s)
$$
where $m(y) = x = ε_s^{-1}(y/f) = (\log y/f + κ(s))/s$ is the _moneyness_
of $y$.

## Parameters

The Black-Scholes/Merton values and greeks can be calculated in terms of
the parameters $f$ and $s$ using the
chain rule.  For example, the Black model takes $X$ to be standard normal
and vol $s = σ \sqrt{t}$ where $σ$ is the standard Black volatilty
and $t$ is time in years to expiration.  In this case standard vega
is $∂_σ E[ν(F)] = ∂_s E[ν(F)] ∂_σ s = ∂_s E[ν(F)]\sqrt{t}$.

## Greeks

Let $ν$ be the option payoff at expiration. The forward value of
the option is $v = E[ν(F)]$. 
_Delta_ is the derivative of value with respect to the forward
$$
∂_f v = E[ν'(F) ∂_f F] = E[ν'(F) ε_s(X)] = E_s[ν'(F)]
$$
since $∂_f F = ε_s(X)$.

_Gamma_ is the second derivative with respect to the forward
$$
∂_f^2 v = E[ν''(F)ε_s^2(X)] = e^{2κ(s) - κ(2s)} E_{2s}[ν''(F)].
$$

_Vega_ is  the derivative with respect to vol
$$
∂_s v = E[ν'(F) ∂_s F] = E[ν'(F)F(X - κ'(s))] = f E_s[ν'(F)(X - κ'(s))]
$$
since $∂_s F = F(X - κ'(s))$.

The inverse of option value as a function of vol is the _implied vol_.

## Put and Call

A _put option_ pays $ν(F) = (k - F)^+ = \max\{k - F,0\}$ at expiration
and has value $p = E[(k - F)^+]$.
A _call option_ pays $ν(F) = (F - k)^+$ at expiration
and has value $c = E[(F - k)^+]$.
Note $(F - k)^+ - (k - F)^+ = F - k$ is a _forward_ with _strike_ $k$ so
all models satisfy _put-call parity_: $c - p = f - k$.
Call delta is $∂_f c = ∂_f p + 1$ and call gamma equals put gamma $∂_f^2 c = ∂_f^2 p.
We also have $∂_s c - ∂_s p = 0$ so call vega equals put vega.

The value of a put is
$$
\begin{aligned}
p &= E[(k - F)^+] \\
  &= E[(k - F)1(F\le k)] \\
  &= k P(F \le k) - E[F 1(F \le k)] \\
  &= k P(F \le k) - fP_s(F \le k) \\
\end{aligned}
$$
where $P_s$ is share measure.

Put delta is
$$
	∂_f p = E[-1(F\le k)ε_s(X)] = -P_s(F\le k).
$$
since $∂_f F = ε_s(X)$.

Gamma for either a put or call is
$$
	∂_f^2 p = E[δ_k(F)ε_s(X)^2] = e^{2κ(s) - κ(2s)} E_{2s}[δ_k(F)]. = E_s[δ_k(F) ε_s(X)]
$$
where $δ_k$ is a point mass at $k$.

Vega for a put is
$$
	∂_s p = -E[1(F\le k) F (X - κ'(s))] = -f E_s[1(F\le k) (X - κ'(s))].
$$ 
since $∂_s F = F (X - κ'(s)$.

## Digital

A _digital put_ has payoff $ν(F) = 1(F \le k)$ and
a _digital call_ has payoff $ν(F) = 1(F > k)$ with values.
Since $1(F \le k) + 1(F > k) = 1$ we have digital put-call parity $p + c =
1$ where $p$ is the digital put value and $c$ is the digital call value.
$$
	p = P(F \le k), c = P(F > k) = 1 - p.
$$

Digital put delta is
$$
	∂_f p = -E[δ_k(F)ε_s(X)] = -E_s[\delta_k(F)]
$$

Digital gamma is 
$$
	∂_f^2 p = E[δ'_k(F)ε_s(X)^2] = e^{2κ(s) - κ(2s)} E_{2s}[δ'_k(F)]. = E_s[δ'_k(F) ε_s(X)]
$$

Digital put vega is 
$$
	∂_s p &= -E[\delta_k(F)F(X - s)] = -f E_s[δ_k(F) (X - κ(s))]
$$

### Distribution

Let $Φ(x) = P(X\le x)$ be the cumulative distribution functions of $X$
and $Φ_s(x) = P_s(X\le x) = E[1(X\le x)ε_s(X)]$ be the _share_ cdf where
$ε_s(x) = e^{sx - κ(s)}$. Of course $Φ(x) = Φ_0(s)$.
<!--
Since $Φ_s(x) = M(s,x)/M(s) = e^{κ(s, x) - κ(s)}$
-->
We have
$$
	∂_s Φ_s(x) = E[1(X\le x)ε_s(X)(X - κ'(s))] = E_s[1(X\le x) (X - κ'(s))].
$$

Let $Ψ(y) = P(F\le y) = P(X\le x)$ be the cumulative distribution functions of $F$
where $y = fε_s(x)$.
Since $∂y/∂x = ys$,
$$
	ψ(y) = Ψ'(y) = φ(x) ∂x/∂y = φ(x)/ys$.
$$
We also have 
$$
	ψ'(y) = φ(x) ∂^x/∂y^2 + φ'(x) ∂x/∂y = φ(x)/ys^2 + φ'(x)/ys$.
$$

Value
$$
	v = k Φ(m(k)) - f Φ_s(m(k))
$$
Delta
$$
	∂_f v = -Φ_s(m(k))
$$
Gamma
$$
	∂_f^2 p = e^{2κ(s) - κ(2s)} ??? E_{2s}[δ_k(F)].
$$ 
Vega
$$
	∂_s p = ??? -f E_s[1(F\le k) (X - κ'(s))].
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
