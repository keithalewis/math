---
title: Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing and greeks
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


## Black-Scholes/Merton ($k$, $s$, $σ$, r$, $t$)
$$
	v_0 = s N(d_1) - ke^{-rt} N(d_2),
$$
where $N$ is the standard normal cumluative distribution function,
$d_1 = (\log(s/k) + (r + σ^2/2)t)/σ\sqrt{t}$, and $d_2 = d_1 - σ\sqrt{t}$. 

## Fischer Black ($k$, $f$, $σ$, $t$)
$$
	v_t = f N(d_1) - k N(d_2),
$$
where $f = se^{rt}$ is forward price and $v_t = v_0 e^{rt}$.

## Positive underlying ($k$, $f$, $s$)
$$
	v = f P_s(F \ge k)  - k P(F\ge k)
$$
where $dP_s/dP = ε_s(X) = e^{s X - κ(s)}$, $F = fε_s(X)$, and
$κ(s) = \log E[e^{s X - κ(s)}]$ is the cumulant.

For any differentiable function $ν$ let $v = E[ν(F)]$, then
$$
	∂_f v = E[ν'(F) ∂_f F] E[ν'(F) e^{sX - s^2/2}] = E_s[ν'(F)].
$$
This establishes the formula for option delta without any turmoil.

## Share Measure

The forward value of an option paying $ν(F)$ in some currency at
expiration is $E[ν(F)]$.
In terms of shares of $F$, $ν_s(F) = E[ν(F)F/E[F]$.

_Share measure_ for positive underlyings $E_s$ is defined by $E_s[ν(F)] = E[ν(F) F/E[F]]$.
Note $F > 0$ and $E_s[1] = 1$ so share measure is a probability measure.
It shows up in the formula for valuing a call
$$
\begin{aligned}
	E[(F - k)^+] &= E[(F - k)1(F\ge k)] \\
		&= EF1(F\ge k) - k P(F\ge k) \\
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
of $y$. Note $ε_s(x(y)) = y/f$.

## Greeks

Let $ν(F)$ be the option payoff at expiration. The forward value of
the option is $v = E[ν(F)]$. 
_Delta_ is the derivative of value with respect to the forward
$$
∂_f v = E[ν'(F) ∂_f F] = E[ν'(F) ε_s(X)]
$$
since $∂_f F = ε_s(X)$.

_Gamma_ is the second derivative with respect to the forward
$$
∂_f^2 v = E[ν''(F)ε_s^2(X)].
$$

_Vega_ is  the derivative with respect to vol
$$
∂_s v = E[ν'(F) ∂_s F] = E[ν'(F)F(X - κ'(s))]
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
Call delta is $∂_f c = ∂_f p + 1$ and call gamma equals put gamma $∂_f^2 c = ∂_f^2 p$.
We also have $∂_s c - ∂_s p = 0$ so call vega equals put vega.

The value of a put is
$$
p =  E[(k - F)^+] = kP(F\le k) - f P_s(F\le k).
$$

Put delta is
$$
	∂_f p = E[-1(F\le k)ε_s(X)] = -P_s(F\le k).
$$
since $∂_f F = ε_s(X)$.

Gamma for either a put or call is
$$
	∂_f^2 p = E[δ_k(F)ε_s(X)^2] = E_s[δ_k(F)ε_s(X)]
$$
where $δ_k$ is a point mass at $k$.

Vega for a put or call is
$$
	∂_s p = -E[1(F\le k) F (X - κ'(s))] = -f E_s[1(F\le k) (X - κ'(s))].
$$ 

### Distribution

Let $Φ(x) = P(X\le x)$ be the cumulative distribution functions of $X$
and $Φ_s(x) = P_s(X\le x) = E[1(X\le x)ε_s(X)]$ be the _share_ cdf where
$ε_s(x) = e^{sx - κ(s)}$. Of course $Φ(x) = Φ_0(s)$.
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
put and call gamma is
$$
	∂_f^2 p = E_s[δ_k(F)ε_s(X)] = ψ_s(k) ε_s(x(k)) = (φ_s(x(k))/ks) (k/f) = φ_s(x(k))/fs.
$$ 
Since $φ_s(x) = φ(x) ε_s(x)$ and ε_s(x(y)) = y/f$, $∂_f^2 p
and put and call vega is
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
	p = k Φ(x(k)) - f Φ(x(k) - s)
$$
where $x(k) = \log(k/f)/s + s/2$.

__Exercise__. _Show $x(k) = \log(k/f)/s + s/2 = -d_2$ and $x(k) - s = \log(k/f)/s - s/2 = -d_1$_.

Put delta is
$$
	∂_f p = -Φ_s(x(k)) = -Φ(x(k) - s).
$$

Gamma is
$$
	∂_f^2 p = φ_s(x(k))/fs.
$$

Vega is
$$
	∂_s v = -f ∂_s Φ_s(x(k)) = fφ_s(x(k)).
$$

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
	∂_f p = -E[δ_k(F)ε_s(X)] = -E_s[δ_k(F)]
$$

Digital gamma is 
$$
	∂_f^2 p = E[δ'_k(F)ε_s(X)^2] = E_s[δ'_k(F) ε_s(X)].
$$

Digital put vega is 
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

$$
\begin{aligned}
κ_{a + bX}(s,x) &= \log E[1(a + bX \le x) e^{s(a + bX)}] \\
	&= \log e^{as} E[1(X \le (x - a)/b) e^{sbX}] \\
	&= as + κ_X(bs, (x - a)/b) \\
\end{aligned}
$$

