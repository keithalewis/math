---
title: Ho-Lee Model
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Normal short rate.
...

\newcommand\mb[1]{\mathbf{#1}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

Every fixed income model is determined by the continuously compounded
stochastic forward rate $f_t$. This corresponds to the repurchase
agreement rate at time $t$. One unit invested at time $t$ pays
$1 + f_t\,dt = \exp(f_t\,dt)$ at time $t + dt$. Rolling over one
unit invested at time 0 has _realized return_ $R_t = \exp(\int_0^t f_s\,ds)$
at time $t$. The _stochastic discount_ is $D_t = 1/R_t$.

The price at time $t$ of a zero coupon bond maturing at $u$ is 
$$
	D_t(u) = E_t[D_u]/D_t = E_t[\exp(-\int_t^u f_s\,ds)]
$$
where $E_t$ is the conditional expectation given information at time $t$.
The _forward curve_ $f_t(u)$ at time $t$ is defined by
${D_t(u) = \exp(-\int_t^u f_t(s)\,ds)}$.
We write $D(t)$ for $D_0(t)$ and $f(t)$ for $f_0(t)$, today's
discount and forward curves.

__Exercise__. _Show $0 = E[(f_t - f(t))D_t]$_.

_Hint_. Use $E[\exp(-\int_0^ t f_s\,ds)] = \exp(-\int_0^t f(s)\,ds)$
and compute the derivative with respect to $t$

This shows $f(t)$ is the _par coupon_ of a forward contract paying $f_t - f(t)$ at $t$.

__Exercise__. _Show $0 = E_t[(f_u - f_t(u))D_u]$, $u\ge t$_. 

This shows $f_t(u)$ is the _par coupon_ at time $t$ of a forward contract paying $f_u - f_t(u)$ at $u$.

The futures quote at time $t$ of a contract settling at $u$ to $f_u$ is
$φ_t(u) = E_t[f_u]$, $u\ge t$. Futures quotes are naturally occuring martingales.
We write $φ(t)$ for $φ_0(t)$.

From above we have ${f(t)E[D_t] = E[f_t D_t] = E[f_t]E[D_t] + \Cov(f_t, D_t)}$ so
${φ(t) - f(t) = -\Cov(f_t, D_t)/D(t)}$. This is positive since the forward and discount
are negatively correlated. For most models it is approximately proportional to the the square
of time to expiration.

The stochastic forward rate determines all quantities relevant to the dynamics
of fixed income instruments. See [Yield Curve Model](ycm.html) for details.

## Model

The Ho-Lee model assumes the stochastic forward rate is 
$f_t = φ(t) + σ(t) B_t$ where $φ(t)$ is the futures quote
at time $t$, $σ(t)$ is the volatility,
and $B_t$ is standard Brownian motion.
We can also use multi-dimensional Brownian motion where $σ(t)$
vector-valued.

The stochastic discount is 
$$
	D_t = \exp(-\int_0^t f_s\,ds) = \exp(-\int_0^t (φ(s) + σ(s) B_s)\,ds)
$$

__Exercise__. _Show $\Var(\int_0^t σ(s) B_s\,ds) = \int_0^t (Σ(t) - Σ(s))^2\,ds$
where ${Σ(t) = \int_0^t σ(s)\,ds}$_.

_Hint_: $\Var(\sum_i X_i) = \sum_{i,j} \Cov(X_i, X_j)$.

<details><summary>Solution</summary>
We have
$$
\begin{aligned}
\Var(\int_0^t σ(s) B_s\,ds) &= \int_0^t\int_0^t σ(u) σ(v) \Cov(B_u,B_v)\,du\,dv \\
&= \int_0^t\int_0^t σ(u) σ(v)\min(u,v)\,du\,dv \\
&= \int_0^t\int_0^v σ(u) σ(v) u\,du\,dv + \int_0^t\int_v^t σ(u) σ(v) v\,du\,dv \\
&= \int_0^t\int_u^t σ(u) σ(v) u\,dv\,du + \int_0^t\int_v^t σ(u) σ(v) v\,du\,dv \\
&= \int_0^t σ(u) (Σ(t) - Σ(u)) u \,du + \int_0^t (Σ(t) - Σ(v)) σ(v) v \,dv \\
&= 2 \int_0^t σ(u) (Σ(t) - Σ(u)) u \,du \\
\end{aligned}
$$

Let $U = u$ and $dV = 2 σ(u) (Σ(t) - Σ(u))\,du = -d(Σ(t) - Σ(u))^2$
so $dU = du$ and $V = -(Σ(t) - Σ(u))^2$.
Since $Σ(0) = 0$ we have $2 \int_0^t σ(u) (Σ(t) - Σ(u)) u \,du = \int_0^t (Σ(t) - Σ(u))^2\,du$.
</details>

Since the exponent is normally distributed and
$E[\exp(N)] = \exp(E[N] + \Var(N)/2)$ if $N$ is normal
we have
$$
	D(t) = \exp\bigl(-\int_0^t φ(s)\,ds + \int_0^t (Σ(t) - Σ(s))^2\,ds/2\bigr)
$$

__Exercise__. _Show $(\partial/\partial t) \int_0^t (Σ(t) - Σ(s))^2/2\,ds = -Σ(t)^2/2$_.

_Hint_. Use $(\partial/\partial t)\int_0^t F(t,s)\,ds = F(t, t) + \int_0^t (\partial/\partial t) F(t, s)\,ds$.

<details><summary>Solution</summary>
Let $F(t,s) = (Σ(t) - Σ(s))^2/2$ so
$$
\begin{aligned}
\frac{\partial}{\partial t} \int_0^t (Σ(t) - Σ(s))^2/2\,ds
	&= 0 + \int_0^t (Σ(t) - Σ(s)) σ(t)\,ds \\
	&= \int_0^t d(Σ(t) - Σ(s))^2/2 \\
	&= (Σ(t) - Σ(s))^2/2|_0^t \\
\end{aligned}
$$
</details>

This shows the forward curve is $f(t) = φ(t) - Σ(t)^2/2$.
If $σ$ is constant then $f(t) = φ(t) -  σ^2 t^2/2$.

## Dynamics

For the Ho-Lee model
${D_t(u) = E_t[\exp(-\int_t^u (φ(s) + σ(s) B_s)\,ds)]}$.

__Exercise__. _Show $\int_t^u σ(s) B_s\,ds = \int_t^u (Σ(u) - Σ(s))\,dB_s + (Σ(u) - Σ(t)) B_t$_
where ${Σ(t) = \int_0^t σ(s)\,ds}$.

_Hint_ Use $d(Σ(t) B_t) = Σ(t)\,dB_t + Σ'(t) B_t\,dt$.

<details>
<summary>Solution</summary>
We have 
$$
\begin{aligned}
\int_t^u σ(s) B_s\,ds &= -\int_t^u Σ(t)\,dB_s + Σ(u) B_u - Σ(t) B_t \\
&= -\int_t^u Σ(s)\,dB_s + Σ(u) B_u - Σ(u) B_t + Σ(u) B_t - B_t Σ(t) B_t \\
&= \int_t^u (Σ(u) - Σ(s))\,dB_s + (Σ(u) - Σ(t)) B_t \\
\end{aligned}
$$
</details>

__Exercise__. _Show $E_t[\exp(\int_t^u Λ(s)\,dB_s)] = \exp(\int_t^u Λ(s)^2\,ds/2)$_.

_Hint_: Use ${X_t = \exp(\int_0^t Λ(s)\,dB_s - \int_0^t Λ(s)^2\,ds/2)}$ is a martingale.

<details>
<summary>Solution</summary>
$1 = E_t[X_u/X_t] = E_t[\exp(\int_t^u Λ(s)\,dB_s - \int_t^u Λ(s)^2\,ds/2)]$
</details>

Note the right hand side is not random an ${E_t[\exp(-\int_t^u Λ(s)\,dB_s)] = \exp(\int_t^u Λ(s)^2\,ds/2)}$
by replacing $Λ$ with $-Λ$.  We use this below.

The price at $t$ of a zero coupon bond maturing at $u$ in the Ho-Lee model is
$$
\begin{aligned}
D_t(u) &= E_t[D_u/D_t] \\
	&= E_t[\exp(-\int_t^u (φ(s) + σ(s) B_s)\,ds)] \\
	&= E_t[\exp\bigl(-\int_t^u φ(s)\,ds - \int_t^u (Σ(u) - Σ(s))\,dB_s - (Σ(u) - Σ(t)) B_t\bigr)] \\
	&= \exp(-\int_t^u φ(s)\,ds + \int_t^u (Σ(u) - Σ(s))^2\,ds/2 - (Σ(u) - Σ(t)) B_t) \\
\end{aligned}
$$

__Exercise__. _If $σ(t) = σ$ is constant show_
$$
D_t(u) = \exp(-\int_t^u φ(s)\,ds + σ^2(u - t)^3/6 - σ(u - t) B_t).
$$

_Hint_: Use $Σ(t) = σt$.

Note $D(t) = D_0(t) = \exp(-\int_0^u φ(s)\,ds + σ^2 t^3/6)$
so $f(t) =  φ(t) - σ^2 t^2/2$

__Exercise__ _Show $(\partial/\partial u)\int_t^u (Σ(u) - Σ(s))^2\,ds/2 = \int_t^u (Σ(u) - Σ(s))σ(u)\,ds$_. 

_Hint_. Use $(\partial/\partial u)\int_t^u F(u,s)\,ds = F(u, u) + \int_t^u (\partial/\partial u) F(u, s)\,ds$.

Since $D_t(u) = \exp(-\int_t^u f_t(s)\,ds)$ we have
$$
	f_t(u) = φ(u) - \int_t^u (Σ(u) - Σ(s))σ(u)\,ds + σ(u) B_t.
$$

__Exercise__. _If $σ(t) = σ$ is constant show $f_t(u) = φ(u) - σ^2(u - t)^2/2 + σ B_t$_.

The Ho-Lee model has a closed form solution for the dynamics of zero-coupon bond prices.

<!--

## Forward Rate Agreements

The forward rate at time $t$ over $[u,v]$ with daycount basis $\delta$ is
$F_t^\delta(u, v) = (D_t(u)/D_t(v) - 1)/\delta(u,v)$
so
$$
	F_t^\delta(t, u) = \frac{1}{\delta(u,v)}\left(\frac{}{D_t(u)} - 1\right).
$$


### Options

A _caplet_ with strike $k$ and expiration $t$ pays ${\max\{f_t - k, 0\} = (f_t - k)^+}$
and a _floorlet_ pays ${(k - f_t)^+}$ at $t$.
The risk-neutral value of a floorlet is $p = E[(k - f_t)^+D_t]$.

__Exercise__ _Show $p = E[(k + σ^2 t^2/2 - f_t)^+]D(t)$_.

_Hint_. Recall $E[f(M) e^N] = E[f(M + \Cov(M, N))]E[e^N]$ if $M$ and $N$ are jointly normal.

<details><summary>Solution</summary>
We have $\Cov(f_t, \log D_t) = \Cov(σ B_t, -\int_0^t σ B_s\,ds)
= -σ^2 \int_0^t s\,ds = -σ^2 t^2/2$.
</details>

Note the floorlet value can be calculated using the [Bachelier model](bach.html).
If $F = f + sZ$ where $Z$ is standard normal then $E[(k - F)^+] = (k - F)\Phi(z) + sφ(z)$
where $z = (k - f)/s$, $\Phi$ is the standard normal cumulative distribution, and
$φ = \Phi'$ is the standard normal density function.

__Exercise__. _Find a closed form solution for the floorlet value $E[(k - f_t)^+ D_t]$_.


## Discount

We can fit the discount curve if we make the expected stochastic forward rate a function of time.
Suppose $f_t = φ(t) + σ B_t$ so $E[f_t] = φ(t)$.

__Exercise__. _Show $D(t) = \exp(-\int_0^t φ(s)\,ds + σ^2t^3/6)$_.

<details><summary>Solution</summary>
The discount is $D(t) = E[D_t] = E[\exp(-\int_0^t φ(s) + σ B_s\,ds)]$
The result follows from $E[-\int_0^t φ(s) + σ B_s\,ds] =  -\int_0^t φ(s)\,ds$
and $\Var(-\int_0^t φ(s) + σ B_s\,ds) = σ^2t^3/3$.
</details>

In this case $f(t) = φ(t) - σ^2 t^2/2$ so $φ(t)$ is determined by the discount curve
and $σ$.

__Exercise__. _Show $φ(t) = -(d/dt)\log D(t) + σ^2 t^2/2$_.

_Hint_: $D(t) = \exp(-\int_0^t f(s)\,ds)$.

The discount curve is determined using market instruments. These are usually cash deposits
for the short end, forward rate agreements out to 4 years, and swaps or bonds for
longer maturities. [Bootstrap](fi.html) is the preferred method for doing this.


In the Ho-Lee model the dynamics of zero coupon bond prices are
$$
	D_t(u) = \exp(-φ(u - t) - \frac{1}{6}σ^2(u - t)^3 - σ(u - t) B_t).
$$
In particular, the discount to time $t$ is $D(t) = D_0(t) = \exp(-rt + σ^2 t^3/6)$.

__Exercise__. _Show the forward curve is $f(t) = rt - σ^2 t^2/2$_.
<details>
<summary>Solution</summary>
</details>

_Hint_: $D(t) = \exp(-\int_0^t f(s)\,ds)$.

Define the _stochastic forward_ curve at time $t$, $f_t(u)$, by $D_t(u) = \exp(-\int_t^u f_t(s)\,ds)$.
Note $f_t(t) = f_t$ is the stochastic short rate.
For each $t$ there is a futures contract expiring at $t$ on $f_t$. 
The futures quote at $s$ is $φ_s(t) = E_s[f_t]$ since futures quotes are a martingale.

__Exercise__. _Show the stochastic forward curve is $f_t(u) = φ - σ^2 (u - t)^2/2 + σ B_t$_.

<details>
<summary>Solution</summary>
</details>
Note $f_t(t) = φ + σ B_t = f_t$.

__Exercise__. _Show $E[f_t] - f(t) = σ^2t^2/2$_.
<details>
<summary>Solution</summary>
</details>

The difference between the futures quote and forward rate is called _convexity_.

__Exercise__. _Derive the formula for $D_t(u)$ when $φ = φ(t)$ is a function of time_.
<details>
<summary>Solution</summary>
</details>

We can also allow $σ = σ(t)$ to be a function of time.
Let $f_t = φ(t) + σ(s) B_t$.
Since $d(\Sigma(t)B_t) = \Sigma'(t)B_t\,dt + \Sigma(t)\,dB_t$ and
taking $σ(s) = \Sigma'(s)$ we have
$$
\begin{aligned}
	E_t[D_u/D_t] &= E_t[\exp(-\int_t^u φ(s) + σ(s) B_s\,ds)] \\
	&= E_t[\exp(-\int_t^u φ(s)\,ds + d(\Sigma(s)B_s) - \Sigma(s)\,dB_s)] \\
	&= E_t[\exp(-\int_t^u φ(s)\,ds + \Sigma(u)B_u - \Sigma(t)B_t - \int_u^t \Sigma(s)\,dB_s)] \\
	&= E_t[\exp(-\int_t^u φ(s)\,ds + (\Sigma(u)B_u - \Sigma(u)B_t + \Sigma(u)B_t - \Sigma(t)B_t)
		 - \int_u^t \Sigma(s)\,dB_s)] \\
	&= E_t[\exp(-\int_t^u φ(s)\,ds + \Sigma(u)\int_t^u dB_s + (\Sigma(u) - \Sigma(t))B_t - \int_u^t \Sigma(s)\,dB_s)] \\
	&= E_t[\exp(-\int_t^u φ(s)\,ds + \int_t^u (\Sigma(u) - \Sigma(s))\,dB_s + (\Sigma(u) - \Sigma(t))B_t )] \\
	&= \exp(-\int_t^u φ(s)\,ds + \frac{1}{2}\int_t^u (\Sigma(u) - \Sigma(s))^2\,ds + (\Sigma(u) - \Sigma(t))B_t ) \\
\end{aligned}
$$

Since $\int_t^u f_t(s)\,ds = \int_t^u φ(s)\,ds + \frac{1}{2}\int_t^u (\Sigma(u) - \Sigma(s))^2\,ds
+ (\Sigma(u) - \Sigma(t))B_t$ we have 
$$
	f_t(u) = φ(u) + σ(u) \int_t^u (\Sigma(u) - \Sigma(s))\,ds + σ(u) B_t
$$
using $(d/dx) \int_a^x g(x,s)\,ds = g(x,x) + \int_a^x (\partial/\partial x)g(x,s)\,ds$.

__Exercise__. _If $σ(t) = σ$ is constant then 
$f_t(u) = φ(u) - σ^2 (u - t)^2/2 + σ B_t$_.

The futures quote on a contract paying $f_t$ at time $t$ is $φ_s(t) = E_s[f_t]$
since futures are martingales.

A _forward contract_ is specified by an interval $[t,u]$, a forward rate $f$, and
a day count basis $\delta$. It has cash flows $-1$ at $t$ and $1 + f\delta(t,u)$ at $u$
where the day count fraction $\delta(t,u)$ is approximately equal to the time
in years from $t$ to $u$.

__Exercise__. _The price of the forward contract is zero at time $s \le t$ if and only
if_ 
$$
	f = (D_s(t)/D_s(u) - 1)/\delta(t,u)
$$

_Hint_: $0 = E_s[-D_t + (1 + f\delta)D_u]$.

We call $F_s^\delta(t,u) = (D_s(t)/D_s(u) - 1)/\delta(t,u)$
the _par forward_ at time $s$ over $[t,u]$ for day count basis $\delta$.

__Exercise__ _Show $E_s[F_t(t,u))\delta(t,u)D_u]] = E_s[D_t - D_u]$_.

A _forward contract paying in arrears_ is also specified by an interval
$[t,u]$, a forward rate $f$, and a day count basis $\delta$.
It has a single cash flow $(f - F_t^\delta(t,u))\delta(t,u)$ at $u$.
Note $F_t(t,u)$ is the forward rate at $t$ over the interval $[t, u]$.
The _effective date_ of the contract is $t$ and the _termination date_ is $u$.

__Exercise__. _Show $E_s[-D_t + (1 + f\delta)D_u] = E_s[(f - F_t(t,u))\delta(t,u)D_u]$_.

_Hint_: Use the previous exercise.

Both contracts have the same risk-neutral value, but they have very
different risk profiles. 

A forward contract involves the exchange of a
notional amount at the beginning and end of the contract. 
We have been using unit notional, but real-world contracts specify a notional
$N$ with cash flows $-N$ at $t$ and $N(1 + f\delta(t,u))$ at $u$. If
one counterparty defaults during the interval $[t,u]$ then the other
counterparty will not get paid what they expect.  If the absolute value
of $N$ is large both counterparties have to pay attention to this contingency.
_Collateral accounts_ are used to mitigate this risk. These are
similar to margin accounts used by exchanges.

Forward contracts paying in arrears are less risky.
The cash flow $N(f - F_t(t,u))\delta(t,u)$ at $u$
involves the difference of similar amounts.

A _caplet_ with strike $k$ is a call option on a forward rate.
It has cash flow $\max\{F_t^\delta(t,u) - k, 0\}$ at time $u$.
A _floolet_ is a put option on a forward rate.
It has cash flow $\max\{k - F_t^\delta(t,u), 0\}$ at time $u$.

__Exercise__. _Find a closed form solution for the value of a caplet and floorlet in the Ho-Lee model_.

_Hint_: $F - k = fe^{sZ - s^2/2} - h$ for some constants $f, s, h$ where $Z$ is standard normal.
The value of a caplet involves the Black put formula and the value of a floorlet involes
the Black call formula.

## Remarks

An objection to the Ho-Lee model is that it allows
[negative interest rates](https://www.investopedia.com/articles/investing/070915/how-negative-interest-rates-work.asp).
This is unusual, but not a violation of arbitrage and has occurred in the real world.

The parameterization $f_t = φ(1 + σ B_t)$ is closer to a lognormal model since $1 + x\approx e^x$
for small $x$. When using this replace $σ$ by $φσ$ in the equations above.

A multi-factor model can be specified using multi-dimensional independent Brownian motions and vector-valued volatility.

__Exercise__. _Show $\Cov(σ(t)\cdot B_t, σ(u)\cdot B_u) = σ(t)\cdotσ(u)\min\{t,u\}$_.

_Hint_: $\Cov(B_t, B_u) = \min\{t,u\}I$ where $I$ is the identity matrix.

A common choice for the 2-dimensional case is $σ(t) =
σ(\cos\alpha t, \sin\alpha t)$ for some constants $σ$ and $\alpha$.

__Exercise__. _Show $σ(t)\cdotσ(u) = σ^2\cos(\alpha(t - u))$_.

-->
