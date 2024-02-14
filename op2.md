---
title: Option Pricing
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: European option pricing and greeks
...

\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\newcommand{\RR}{𝑹}

## Value

A _European option_ pays some function of the underlying price at expiration.
If $F$ is the price at expiration and $\nu$ is the _payoff function_
then its Black _forward value_ is ${v = E[\nu(F)]}$.

If $F$ is positive and $\log F$ has finite mean and variance then
$F = fe^{sX - \kappa(s)}$ for some $X$ with mean zero and variance one
where $\kappa(s) = \log E[\exp(sX)]$ is the _cumulant_ of $X$.

__Exercise__. _Show $E[F] = f$ and $\Var(\log F) = s^2$_.

We call $f$ the _forward_ and $s$ the _vol_.

__Exercise__. _Prove ${X = (\log F/f + \kappa(s))/s}$ has mean 0 and variance 1 if $s > 0$_.

If an option pays off in shares of $F$ then 
$E[F\nu(F)] = fE[ e^{sX - \kappa(s)}\nu(F)] = fE^s[\nu(F)]$
where $E^s$ is the _share measure_.
Since $E[e^{sX - \kappa(s)}] = 1$, share measure is a probability measure
that we denote by $P^s$.

## Greeks

The _delta_ of an option is the derivative of its value with respect to the forward,
$$
	\partial_f v = E[\nu'(F)\partial_f F] = E[\nu'(F)e^{sX - \kappa(s)}] = E^s[\nu'(F)].
$$
The _gamma_ of an option is the second derivative of its value with respect to the forward,
The _vega_ of an option is the derivative of its value with respect to the vol,
$$
	\partial_s v = E[\nu'(F) F (X - \kappa'(s))] = f E^s[\nu'(F) (X - \kappa'(s))].
$$

## Put

A _put_ with strike $k$ pays $\nu(F) = \max\{k - F, 0\} = (k - F)^+ = (k - F)1(F\ge k)$ at expiration.
Note $F\le k$ is equivalent to $X\le x$ where
${x = x(k) = x(k;f,s) = (\log k/f + \kappa(s))/s}$
is the _moneyness_ of a put with strike $k$.

### Value

The forward value of a put is

$$
\begin{aligned}
E[(k - F)^+] &= E[(k - F)1(F\le k)] \\
	&= kE[1(F \le k)] - E[F1(F\le k)] \\
	&= kP(X \le x) - fP^s(X\le x). \\
\end{aligned}
$$

Let $\Psi(x) = P(X\le x)$ be the _cumulative distribution function_ of $X$.
The _cumulative share distribution_ is ${\Psi(x, s) = E[e^{sX - \kappa(s)} 1(X\le x)]}$.
Note ${\Psi(x, 0) = \Psi(x)}$.

We can write the put value as
$$
	p = k\Psi(x) - f\Phi(x, s).
$$

### Delta

Since $\partial_f (k - f)^+ = -1(f \le k)$ the put delta is
$$
\begin{aligned}
	\partial_f p &= E[-1(F \le k)\partial_f F] \\
	&= E[-1(F \le k)e^{sX - \kappa(s)}] \\
	&= -P^s(F\le k) \\
	&= -\Psi(x, s).
\end{aligned}
$$

### Gamma

The second derivative with respect to forward is
$$
\begin{aligned}
	\partial_f^2 p &= \partial_f (-\Psi(x, s)) \\
	&= -\partial_x\Psi(x, s)\partial_f x \\
	&= -\partial x\Psi(x, s)/fs \\
\end{aligned}
$$


__Exercise__. _Show $\partial_f x = 1/fs$_.

_Hint_. Use $f = ke^{sx - \kappa(s)}$ to show $\partial_x f = fs$.

### Vega

The derivative with respect to vol is
$\partial_s E[(k - F)^+] = -E[1(F\le k)F(X - \kappa'(s))]$.
Since ${\partial_s \Psi(x, s) = E[e^{sX - \kappa(s)}(X - \kappa'(s))1(X\le x)]}$
we have
$$
	\partial_s p = -f\partial_s\Psi(x, s).
$$

## Call

A _call_ with strike $k$ pays ${\nu(F) = (F - k)^+}$ at expiration
and has forward value ${c = E[(F - k)^+]}$.
Let $\overline{\Psi}(x) = 1 - \Psi(x)$ and
${\overline{\Psi}(x, s) = 1 - \Psi(x, s)}$ be the _complementary distributions_.
If $P^s$ does not have a point mass at $k$ then
${P^s(F\ge k) = P^s(X\ge x) = \overline{\Psi}(x, s)}$.

__Exercise__. _Show the forward call value is $c = f\overline{\Psi}(x, s) - k \overline{\Psi}(x)$_.

Since ${(F - k)^+ - (k - F)^+ = F - k}$ we have _put-call_ parity ${c - p = f - k}$
so $\partial_f c - \partial_f p = 1$.

__Exercise__. _Show call delta $\partial_f c = \overline{\Psi}(x, s)$_.

__Exercise__. _Show call gamma equals put gamma_.

__Exercise__. _Show call vega equals put vega_.

## Black

If $X$ is standard normal then $\Psi(x, s) = \Phi(x - s)$.

The Fischer Black model takes $f = f$, $s = \sigma\sqrt{t}$ and $X = B_t/\sqrt{t}$ where
$\sigma$ is the _volatility_, $t$ is time in years to expiration, and
$B_t$ is Brownian motion at time $t$. We only use the fact $B_t$ is normally distributed
with mean 0 and variance $t$.

__Exercise__. _Show $B_t/\sqrt{t}$ has mean 0 and variance 1_.

__Exercise__ _Show $E[e^{aB_t}] = e^{a^2t/2}$ for any $a\in\RR$_.

_Hint_. Use $E[\exp(N)] = \exp(E[N] + \Var(N)/2)$ if $N$ is normally distributed.

__Exercise__. _Show $F = fe^{\sigma B_t - \sigma^2t/2}$ in the Black model_.

Let $\Phi(x) = P(X\le x)$ be the standard normal cumulative distribution function.
The share cumulative distribution $\Phi(x, s) = E[e^{\sigma B_t - \sigma^2/2}1(X\le x)$
has a simple form.

__Exercise__. _Show $\Phi(x, s) = \Phi(x - s)$.


## Remarks

Instrument prices are discrete.
It is a fact that instrument prices are integer multiples of some minimum increment.
