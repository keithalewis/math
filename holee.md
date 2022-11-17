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

The Ho-Lee model assumes the stochastic short rate process is 
$f_t = r + \sigma B_t$ where $r$ and $\sigma$ are constant
and $B_t$ is standard Brownian motion.

The stochastic discount is $D_t = \exp(-\int_0^t f_s\,ds) = 
\exp(-\int_0^t r + \sigma B_s\,ds) = \exp(-rt - \sigma\int_0^t B_s\,ds)$.

The discount to time $t$ is $D(t) = E[D_t]$. The _forward curve_ $f(t)$
is defined by $D(t) = \exp(-\int_0^t f(s)\,ds)$.

__Exercise__. _Show $f(t) = -(d/dt)\log D(t)$_.

The discount at time $t$ of a zero coupon bond maturing at $u$ is
$D_t(u) = E_t[D_u/D_t]$. The _stochastic forward curve_ $f_t(u)$
is defined by $D_t(u) = \exp(-\int_t^u f_t(s)\,ds)$.

__Exercise__. _Show $\int_0^t B_s\,ds = -\int_0^t s dB_s + t B_t$_.

_Hint_: $d(t B_t) = t dB_t + B_t\,dt + dt\,dB_t$ and $dt\,dB_t = 0$.

This shows $D_t = \exp(-rt + \sigma \int_0^t s\,dB_s - \sigma tB_t)$.

__Exercise__. _If $dX_t/X_t = \Lambda(t)\,dB_t$ and $X_0 = 1$ then
$X_t = \exp(-\frac{1}{2}\int_0^t \Lambda(s)^2\,ds + \int_0^t \Lambda(s)\,dB_s)$_.

_Hint_: $d\log X_t = (1/X_t)\,dX_t + \frac{1}{2}(-1/X_t^2)\,dX_t^2 = \Lambda(t)\,dB_t - \frac{1}{2}\Lambda(t)^2\,dt$
by Ito's formula.

__Exercise__. _Show $E_t[\exp(\int_t^u \Lambda(s)\,dB_s)] = \exp(\frac{1}{2}\int_t^u \Lambda(s)^2\,ds)$_.

_Hint_: $X_t$ is a martingale. Note the right-hand side is not random.

The price at time $t$ of a zero coupon bond maturing at time $u$, $D_t(u)$,
satisfies $D_t(u)D_t = E_t[D_u]$ so

$$
\begin{aligned}
D_t(u) &= E_t[D_u/D_t] \\
	&= E_t[\exp(-\int_t^u r + \sigma B_s\,ds)] \\
	&= E_t[\exp(-r(t - u) - \int_t^u \sigma B_s\,ds)] \\
	&= E_t[\exp(-r(u - t) + \int_t^u \sigma s\,dB_s - \sigma (u B_u - t B_t))] \\
	&= E_t[\exp(-r(u - t) + \int_t^u \sigma s\,dB_s - \sigma (u B_u - u B_t + u B_t - t B_t))] \\
	&= E_t[\exp(-r(u - t) + \int_t^u \sigma s\,dB_s - \int_t^u \sigma u\,dB_s + \sigma(u - t) B_t)] \\
	&= E_t[\exp(-r(u - t) - \int_t^u \sigma (u - s)\,dB_s + \sigma(u - t) B_t)] \\
	&= E_t[\exp(-r(u - t) - \frac{1}{2}\int_t^u \sigma^2 (u - s)^2\,ds + \sigma(u - t) B_t)] \\
\end{aligned}
$$

This show $f_t(u) = r(u - t) + \frac{1}{2}\int_t^u \sigma^2 (u - s)^2\,ds - \sigma(u - t) B_t)$.

__Exercise__. _Show $\int_t^u (s - u)^2\,ds = (u - t)^3/3$_.

In the Ho-Lee model the dynamics of zero coupon bond prices are
$$
	D_t(u) = \exp(-r(u - t) + \frac{1}{6}\sigma^2(u - t)^3 - \sigma(u - t) B_t).
$$
In particular, the discount to time $t$ is $D(t) = D_0(t) = \exp(-rt + \sigma^2 t^3/6)$.

__Exercise__. _Show the forward curve is $f(t) = r - \sigma^2 t^2/2$_.

__Exercise__. _Show the stochastic forward curve is $f_t(u) = r - \sigma^2 (u - t)^2/2 - \sigma B_t$_.

Note $f_t(t) = r + \sigma B_t = f_t$.

__Exercise__. _Show $E[f_t] - f(t) = \sigma^2t^2/2$_.

The difference between the futures quote and forward rate is called _convexity_.

__Exercise__. _Find the formula for $D_t(u)$ when $r = r(t)$ is a function of time_.

<!--
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
	&= E_t[\exp(-\int_t^u r(s)\,ds + \int_t^u \Sigma(u) - \Sigma(s)\,dB_s + (\Sigma(u) - \Sigma(t))B_t )] \\
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

A _forward contract_ is specified by an interval $[t,u]$, a forward rate $f$, and
a day count basis $\delta$. It has cash flows $-1$ at $t$ and $1 + f\delta(t,u)$ at $u$
where the day count fraction $\delta(t,u)$ is approximately equal to the time
in years from $t$ to $u$.

__Exercise__. _The price of the forward contract is zero at time $s \le t$ if and only
if $f = (1/\delta(t,u))(D_s(t)/D_s(u) - 1)$_.

_Hint_: $0 = E_s[-D_t + (1 + f\delta)D_u]$.

We call $F_s^\delta(t,u) = (1/\delta(t,u))(D_s(t)/D_s(u) - 1)$
the _par forward_ at time $s$ over $[t,u]$ for day count basis $\delta$.

A _foward contract paying in arrears_ is also specified by an interval
$[t,u]$, a forward rate $f$, and a day count basis $\delta$.
It has a single cash flow $(f - F_t(t,u))\delta(t,u)$ at $u$.

A _caplet_ with strike $k$ is a call option on a forward rate.
It has cash flow $\max\{F_t^\delta(t,u) - k, 0\}$ at time $u$.
A _floolet_ is a put option on a forward rate.
It has cash flow $\max\{k - F_t^\delta(t,u), 0\}$ at time $u$.

__Exercise__. _Find a closed form solution for the value of a caplet and floorlet in the Ho-Lee model_.

_Hint_: $F - k = e^N - h$ for some normally distributed random variable $N$ and constant $h$.

## Remarks

An objection to the Ho-Lee model is that is allows
[negative interest rates](https://www.investopedia.com/articles/investing/070915/how-negative-interest-rates-work.asp).
This is not an arbitrage violation and has occured in the real world.

The parameterization $f_t = r(1 + \sigma B_t)$ is closer to a lognormal model since $1 + x\approx e^x$
for small $x$. When using this replace $\sigma$ by $r\sigma$ in the equations above.

A multi-factor model can be specified using multi-dimensional Brownian motion and vector-valued volatility.
