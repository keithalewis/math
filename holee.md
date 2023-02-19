---
title: Ho-Lee
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Normal short rate.
...

\newcommand\mb[1]{\mathbf{#1}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

The Ho-Lee model assumes the stochastic short rate process is 
$f_t = r + \sigma B_t$ where $r$ and $\sigma$ are constant
and $B_t$ is standard Brownian motion.

The stochastic discount is $D_t = \exp(-\int_0^t f_s\,ds) = 
\exp(-\int_0^t r + \sigma B_s\,ds) = \exp(-rt - \sigma\int_0^t B_s\,ds)$.

__Exercise__. _Show $\int_0^t B_s\,ds = t B_t - \int_0^t s dB_s$_.

_Hint_: Using Ito's formula, $d(t B_t) = B_t\,dt + t dB_t$ since $dt\,dB = 0$.

This shows $D_t = \exp(-rt - \sigma tB_t + \sigma \int_0^t s\,dB_s)$.

__Exercise__. _If $dX_t/X_t = \Lambda(t)\,dB_t$ and $X_0 = 1$ then
$X_t = \exp(-\frac{1}{2}\int_0^t \Lambda(s)^2\,ds + \int_0^t \Lambda(s)\,dB_s)$_.

_Hint_: $d\log X_t = (1/X_t)\,dX_t + \frac{1}{2}(-1/X_t^2)\,dX_t^2 = \Lambda(t)\,dB_t - \frac{1}{2}\Lambda(t)^2\,dt$
using Ito's calculus.

__Exercise__. _Show $E_t[\exp(\int_t^u \Lambda(s)\,dB_s)] = \exp(\frac{1}{2}\int_t^u \Lambda(s)^2\,ds)$_.

_Hint_: $X_t$ is a martingale. Note the right-hand side is not random.

The price at time $t$ of a zero coupon bond maturing at time $u$, $D_t(u)$,
satisfies $D_t(u)D_t = E_t[D_u]$ so

$$
\begin{aligned}
D_t(u) &= E_t[D_u/D_t] \\
	&= E_t[\exp(-r(u - t) - \sigma (u B_u - t B_t) + \int_t^u \sigma s\,dB_s)] \\
	&= E_t[\exp(-r(u - t) - \sigma (u B_u - u B_t + u B_t - t B_t) + \int_t^u \sigma s\,dB_s)] \\
	&= E_t[\exp(-r(u - t) - \sigma u \int_t^u\,dB_s + \sigma(u - t) B_t + \int_t^u \sigma s\,dB_s)] \\
	&= E_t[\exp(-r(u - t) + \sigma(u - t) B_t + \int_t^u \sigma(s - u)\,dB_s)] \\
	&= \exp(-r(u - t) + \sigma(u - t) B_t + \frac{1}{2}\int_t^u \sigma^2(s - u)^2\,ds) \\
\end{aligned}
$$

__Exercise__. _Show $\int_t^u (s - u)^2\,ds = (u - t)^3/3$_.

In the Ho-Lee model the dynamics of zero coupon bond prices are
$$
	D_t(u) = \exp(-r(u - t) + \frac{1}{6}\sigma^2(u - t)^3 + \sigma(u - t) B_t).
$$
In particular, the discount to time $t$ is $D(t) = D_0(t) = \exp(-rt + \sigma^2 t^3/6)$.

__Exercise__. _Show the forward curve is $f(t) = r - \sigma^2 t^2/2$_.

_Hint_: $D(t) = \exp(-\int_0^t f(s)\,ds)$.

Define the _stochastic forward_ curve at time $t$, $f_t(u)$, by $D_t(u) = \exp(-\int_t^u f_t(s)\,ds)$.
Note $f_t(t) = f_t$ is the stochastic short rate.
For each $t$ there is a futures contract expiring at $t$ on $f_t$. 
The futures quote at $s$ is $\phi_s(t) = E_s[f_t]$ since futures quotes are a martingale.

__Exercise__. _Show $f_t(u) = r - \sigma^2 (u - t)^2/2 + \sigma B_t$_.

Note $f_t(t) = r + \sigma B_t = f_t$.

__Exercise__. _Show $E[f_t] - f(t) = \sigma^2t^2/2$_.

The difference between the futures quote and forward rate is called _convexity_.

__Exercise__. _Derive the formula for $D_t(u)$ when $r = r(t)$ is a function of time_.

We can also allow $\sigma = \sigma(t)$ to be a function of time.
Let $f_t = r(t) + \sigma(s) B_t$.
Since $d(\Sigma(t)B_t) = \Sigma'(t)B_t\,dt + \Sigma(t)\,dB_t$ and
taking $\sigma(s) = \Sigma'(s)$ we have
$$
\begin{aligned}
	E_t[D_u/D_t] &= E_t[\exp(-\int_t^u r(s) + \sigma(s) B_s\,ds)] \\
	&= E_t[\exp(-\int_t^u r(s)\,ds + d(\Sigma(s)B_s) - \Sigma(s)\,dB_s)] \\
	&= E_t[\exp(-\int_t^u r(s)\,ds + \Sigma(u)B_u - \Sigma(t)B_t - \int_u^t \Sigma(s)\,dB_s)] \\
	&= E_t[\exp(-\int_t^u r(s)\,ds + (\Sigma(u)B_u - \Sigma(u)B_t + \Sigma(u)B_t - \Sigma(t)B_t)
		 - \int_u^t \Sigma(s)\,dB_s)] \\
	&= E_t[\exp(-\int_t^u r(s)\,ds + \Sigma(u)\int_t^u dB_s + (\Sigma(u) - \Sigma(t))B_t - \int_u^t \Sigma(s)\,dB_s)] \\
	&= E_t[\exp(-\int_t^u r(s)\,ds + \int_t^u (\Sigma(u) - \Sigma(s))\,dB_s + (\Sigma(u) - \Sigma(t))B_t )] \\
	&= \exp(-\int_t^u r(s)\,ds + \frac{1}{2}\int_t^u (\Sigma(u) - \Sigma(s))^2\,ds + (\Sigma(u) - \Sigma(t))B_t ) \\
\end{aligned}
$$

Since $\int_t^u f_t(s)\,ds = \int_t^u r(s)\,ds + \frac{1}{2}\int_t^u (\Sigma(u) - \Sigma(s))^2\,ds
+ (\Sigma(u) - \Sigma(t))B_t$
we have 
$$
	f_t(u) = r(u) + \sigma(u) \int_t^u (\Sigma(u) - \Sigma(s))\,ds + \sigma(u) B_t
$$
using $(d/dx) \int_a^x g(x,s)\,ds = g(x,x) + \int_a^x (\partial/\partial x)g(x,s)\,ds$.

__Exercise__. _If $\sigma(t) = \sigma$ is constant then 
$f_t(u) = r(u) - \sigma^2 (u - t)^2/2 + \sigma B_t$_.

<!--
The futures quote on a contract paying $f_t$ at time $t$ is $\phi_s(t) = E_s[f_t]$
since futures are martingales.
-->

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

The parameterization $f_t = r(1 + \sigma B_t)$ is closer to a lognormal model since $1 + x\approx e^x$
for small $x$. When using this replace $\sigma$ by $r\sigma$ in the equations above.

A multi-factor model can be specified using multi-dimensional independent Brownian motions and vector-valued volatility.

__Exercise__. _Show $\Cov(\sigma(t)\cdot B_t, \sigma(u)\cdot B_u) = \sigma(t)\cdot\sigma(u)\min\{t,u\}$_.

_Hint_: $\Cov(B_t, B_u) = \min\{t,u\}I$ where $I$ is the identity matrix.

A common choice for the 2-dimensional case is $\sigma(t) =
\sigma(\cos\alpha t, \sin\alpha t)$ for some constants $\sigma$ and $\alpha$.

__Exercise__. _Show $\sigma(t)\cdot\sigma(u) = \sigma^2\cos(\alpha(t - u))$_.
