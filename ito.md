---
title: Ito Processes
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Stochastic differential equations and integrals
...

\newcommand{\RR}{\boldsymbol{R}}
\newcommand{\Var}{\operatorname{Var}}
\renewcommand{\o}[1]{\bar{#1}}

A large class of [stochastic processes](sp.html) can be defined using
standard [Brownian motion](bm.html) $(B_t)_{t\ge 0}$.

The _stochastic differential equation_
$$
	dX = \mu\,dt + \sigma\,dB, X_{t_0} = x_0
$$
is shorthand for
$$
	X_t = x_0 + \int_{t_0}^t \mu\,ds + \int_{t_0}^t \sigma\,dB_s,
$$
which is shorthand for
$$
	X_t(\omega) = x_0 + \int_{t_0}^t \mu(s,\omega)\,ds + \int_{t_0}^t \sigma(s,\omega)\,dB_s(\omega),
$$
where $\mu,\sigma\colon [0,\infty)\times\Omega\to\RR$ are the _drift_ and
_diffusion_ coefficients, respectively.
The first integral is (pointwise in $\omega$) Riemann and the second is the _Ito integral_.

## Ito Integral

Just as an integral is a continuous linear transformation from a vector space of functions to the real
numbers, a _stochastic integral_ is a continuous linear transformation from a vector space of functions
to a vector space of random variables.

Recall that Brownian motion is a stochastic process $B_t\colon\Omega\to\RR$, $t\ge 0$,
where $B_t(\omega) = \omega(t)$ for $\omega\in\Omega = C[0,\infty)$, the space
of continuous function from $[0,\infty)$ to the real numbers $\RR$.
The information available at time $t$ is specified by $\mathcal{F}_t$,
the smallest $\sigma$-algebra for which $(B_s)_{0\le s\le t}$ are measurable.

If $\omega\mapsto\sigma(t, \omega)$ is $\mathcal{F}_t$ measurable (only depends on
the information available at time $t$) then 
so is the Ito integral $\int_0^t \sigma(s, \omega)\,dB_s(\omega)$ defined as a limit
$$
	\int_0^t \sigma(s, \omega)\,dB_s(\omega)
		= \lim_{\Delta T\to 0} \sum_{0\le j < n} \sigma(t_j, \omega)\,\Delta B_j(\omega)
$$
where $0 = t_0 < \cdots < t_n = t$ is a partition of $[0,t]$ and $\Delta B_j = B_{t_{j+1}} - B_{t_j}$.
We let $T = \{t_j\}$ denote the partition and define $\Delta T = \max_{0\le j < n}\{\Delta t_j\}$.
The set of all partitions of $[0,t]$ is a [net](https://en.wikipedia.org/wiki/Net_(mathematics)) and
the limit is defined as described therein.

__Exercise__.
_Show $E[\sum_{0\le j < n} B_{t_j}\Delta B_j] = 0$ for any partition
$0 = t_0 < \cdots < t_n = t$ of $[0,t]$_.

This shows $E[\int_0^t B_s\,dB_s] = 0$. Later we will see $\int_0^t B_s dB_s = (B_t^2 - t)/2$.

__Exercise__.
_Show $E[\sum_{0\le j < n} B_{t_{j+1}}\Delta B_j] = t \not= 0$_.

_Hint_: $E[B_t B_u] = \min\{t, u\}$. Note the integrand $\omega\mapsto B_{t_{j+1}}(\omega)$
is _not_ $\mathcal{F}_{t_j}$ measurable.

The Riemann integral $\int_0^t f(s)\,ds = \lim_{\Delta T\to 0} \sum_j f(t_j^*)\Delta t_j$ converges
to the same value if $f$ is continuous and $t_j^*$ is _any_ point in $[t_j, t_{j+1}]$.
Unlike the Riemann integral, the Ito integral requires the left endpoint be used.

__Exercise__. _Show $E[\sum_{0\le j < n} (\Delta B_j)^2] = t$ for any partition_.

_Hint_: $E[(\Delta B)^2] = \Delta t$.

__Exercise__. _Show $\lim_{\Delta T\to 0}\sum_{0\le j < n} (\Delta t_j)^2 = 0$_.

_Hint_: $\sum_j (\Delta t_j)^2 \le (\max_j \Delta t_j) \sum_j \Delta t_j = (\max_j \Delta t_j)t$.

Shorthand notation for this is $(dt)^2 = 0$.

__Exercise__ _Show $\lim_{\Delta T\to 0}\Var(\sum_{0\le j < n} (\Delta B_j)^2) = 0$_.

_Hint_: $E[(\Delta B)^4] = 3(\Delta t)^2$.

<details><summary>Solution</summary>
We have $\Var(\sum_{0\le j < n} (\Delta B_j)^2) = \sum_{0\le j < n} 3(\Delta t)^2$
since Brownian motion has independent increments and $E[(\Delta B)^4] 3(\Delta t)^2$.
</details>

Although $\sum_{0\le j < n} (\Delta B_j)^2$ is random for any given partition, it always
has expected value $t$ and its variance tends to 0 as the partition gets finer.
Shorthand notation for this is $(dB)^2 = dt$.

__Exercise__ _Show $\sum_{0\le j < n} \Delta B_j \Delta t_j$ has mean 0 and its variance tends to 0
as $\Delta T\to 0$_.

Shorthand notation for this is $dB\,dt = 0$.

## Higher Dimensions

The Ito integral can be extended to $m$-dimensional Brownian motion, $B_t = (B_t^1,\ldots,B_t^m)$,
where the $B_t^j$ are independent standard Brownian motions. In this case
$\mu\colon [0,\infty)\times\Omega\to\RR^n$ is vector-valued
and $\sigma\colon [0,\infty)\times\Omega\to\RR^{n,m}$ is matrix-valued.
The $\sigma dB$ term is the matrix-vector product.

<!--
__Exercise__. _Let $B_t = $\begin{bmatrix}B_t^1\\B_t^2\end{bmatrix}$ be 2-dimensional brownian motion.
	, $\begin{bmatrix} 1\\ \mu\end{bmatrix}$, 
	and $\o{\sigma} = \begin{bmatrix} 0 & 0 \\ 0 & \sigma \end{bmatrix}$.
		Show $d\o{B} = \o{\mu}\,dt + \o{\sigma}\,d\o{B}$ is equivalent to ... _.
-->

### Stochastic Integral

The Ito integral can be generalized to stochastic process other than Brownian motion.
If $X_t$ is any stochastic process we can define $dY_t = \sigma\,dX_t$, $Y_0 = y$, by
$$
	Y_t(\omega) = y + \lim_{\Delta T\to 0}\sum_j \sigma(t_j, \omega) \Delta X_j(\omega)
$$
where $\Delta X_j = X_{t_{j+1}} - X_{t_j}$. For $Y_t$ to be $\mathcal{F}_t$-measurable
we need $\sigma$ to be adapted. Of course there must be restrictions on $X_t$ too in order
to ensure convergence and continuity. If $X_t$ is a martingale that is (almost surely)
continuous from the right and has left limits then a well-behaved stochastic integral can be define.
Note Brownian motion satisfies this since it is almost everywhere continuous.
This can be generalized by adding a stochastic process to the martingale that has bounded variation.
As shown in [@Pro04], this is the most general process
for which a well-behaved stochastic integral can be defined.

## Ito process

An Ito process $X_t:\Omega\to\RR$, $t\ge0$, satisfies the SDE
$$
	dX_t(\omega) = \mu(t,\omega)\,dt + \sigma(t,\omega)\,dB_t(\omega), X_{t_0} = x_0, t\ge t_0.
$$
where $\mu,\sigma:[0,\infty)\times\Omega\to\RR$ are functions of time and the Brownian
sample path $\omega\in\Omega$.
If $\omega\mapsto \mu(t, \omega)$ is $\mathcal{F}_t$ measurable for all $t$ then so is
the Riemann integral $\omega\mapsto \int_0^t \mu(s, \omega)\,ds$.
If $\omega\mapsto \sigma(t, \omega)$ is $\mathcal{F}_t$ measurable for all $t$ then so is
the Ito integral $\omega\mapsto \int_0^t \sigma(s, \omega)\,dB_s(\omega)$.

__Exercise__. _In this case the Ito integral $\int_0^t \sigma dB$ is a martingale._

_Hint_: $E[B_u - B_t\mid\mathcal{F}_s] = 0$ if $s\le t\le u$.

__Exercise__. _If $dX = \mu\,dt + \sigma\,dB$ is a martingale then $\mu = 0$_.

_Hint_: Show $\int_t^u E_t[\mu(s,\omega)]\,ds = 0$ for $t\le u$, $\omega\in\Omega$.

__Exercise__. _The sum of Ito processes is an Ito process_.

_Hint_: If $dX^j = \mu_j\,dt + \sigma_j\,dB$ are Ito processes what are $\mu$ and $\sigma$
for $X = \sum_j X_j$? Write out the integrals in full.

If $X_t$ and $Y_t$ are Ito processes then so is their product $X_tY_t$.

__Exercise__. _Show $d(XY) = Y\,dX + X\,dY + dX\,dY$_.

_Hint_: Show $X_t Y_t = X_0 Y_0 + \lim_{\Delta T\to 0}\sum_j Y_j\Delta X_j + Y_j\Delta Y_j + \Delta X_j\Delta Y_j$
where where $\Delta X_j = X_{t_{j+1}} - X_{t_j}$, etc., using
$(X_j + \Delta X_j)(Y_j + \Delta Y_j) = X_jY_j + Y_j\Delta X_j + X_j\Delta Y_j + \Delta X_j \Delta Y_j$.

__Exercise__. _If $dX = \mu\,dt + \sigma\,dB$ and $dY = \nu\,dt + \tau\,dB$
show $d(XY) = (\mu Y + \nu X + \sigma\tau)\,dt + (\sigma Y + \tau X)\,dB$_.

_Hint_: Show
$$
\begin{aligned}
	X_t(\omega)Y_t(\omega) = &X_0 Y_0 \\
	&+ \int_0^t (\mu(s,\omega) Y_s(\omega) + \nu(s,\omega) X_s(\omega) + \sigma(s, \omega)\tau(s,\omega))\,ds \\
&+ \int_0^t (\sigma(s,\omega) Y_s(\omega) + \tau(s, \omega) X_s(\omega))\,dB_s(\omega) \\
\end{aligned}
$$

The _Ito calculus_ uses $(dt)^2 = 0$, $dt\,dB = 0 = dB\,dt$, and $(dB)^2 = dt$ to simplify such calculations.
$$
\begin{aligned}
	d(XY) &= Y\,dX + X\,dY + dX\,dY \\
		&= Y(\mu\,dt + \sigma\,dB) + X(\nu\,dt + \tau\,dB) + (\mu\,dt + \sigma\,dB)(\nu\,dt + \tau\,dB) \\
		&= (\mu Y + \nu X + \sigma\tau)\,dt + (\sigma Y + \tau X)\,dB.
\end{aligned}
$$

<details><summary>Solution</summary>
Use $(XY)_t = X_0Y_0 + \int_0^t d(XY)_s = X_0Y_0 + \int_0^t Y_s\,dX_s X_s + X_s\,dY_s
+ dX_s\,dY_s$.

Using the previous exercises we have $\int_0^t Y_s\,dX_s = \int_0^t Y_s(\mu\,dt + \sigma\,dB_s)$ and
$\int_0^t X_s\,dY_s = \int_0^t X_s(\nu\,dt + \tau\,dB_s)$.

$\int_0^t dX_s\,dY_s = \int_0^t (\mu\,dt + \sigma\,dB_s)(\nu\,dt + \tau\,dB_s)
= \int_0^t \sigma\tau\,dB^2_s = \int_0^t \sigma\tau\,ds$.
</details>

__Exercise__. _If $dS/S = \mu\,dt + \Sigma\,dB$ and $\Sigma^2 = (1/t)\int_0^t (dS/S)^2$
show $\Sigma$ is constant_.

_Hint_. Compute $t\Sigma^2$ two ways.

## Ito Formula

If $X_t$ is an Ito process and $f\colon[0,\infty)\times\RR\to\RR$ then $Y_t = f(t, X_t)$ is
also an Ito process satisfying the SDE
$$
	dY_t = f_t(t, X_t)\,dt + f_x(t, X_t)\,dX_t + \frac{1}{2} f_{xx}(t, X_t) (dX_t)^2
$$
If $X_t = B_t$ is standard Brownian motion then
$dY_t = (f_t + \frac{1}{2}f_{xx})\,dt + f_x\,dB$.

__Exercise__. _If $f_t + \frac{1}{2}f_{xx} = 0$ then $f(t,B_t)$ is a martingale_.

__Exercise__. _Show $f(t, x) = x^2 - t$ and $f(t, x) = se^{\sigma x - \sigma^2t/2}$
satisfy $f_t + \frac{1}{2}f_{xx} = 0$_.

__Exercise__. _Show $\int_0^t B_s\,dB_s = B_t^2/2$_.

## Ito Diffusion

An _Ito diffusion_ $\o{X}_t(\omega)$ satisfies
$$
	d\o{X}_t(\omega) = \o{\mu}(t,\o{X}_t(\omega))\,dt + \o{\sigma}(t,\o{X}_t(\omega))\,dB_t(\omega),
	\o{X}_{t_0} = x, t \ge t_0
$$
where $\o{\mu},\o{\sigma}\colon [0,\infty)\times\RR\to\RR$.

__Exercies__. _Show an Ito diffusion is an Ito process._

The Ito formula holds for diffusions but we have $f(t, X_t)$ is also an Ito diffusion.

__Exercise__. _If $X_t$ and $Y_t$ are Ito diffusions then so are $X_t + Y_t$ and $X_t Y_t$_.

Ito diffusions satisfy the _Markov property_. Loosely speaking,
$E[f(t, \o{X}_t)\mid\mathcal{F}_t] = E[f(t, \o{X}_t)\mid \o{X}_t]$.
The conditional expectation does not depend on
the trajectory $s\mapsto X_s(\omega)$, $0\le s\le t$, it only depends
on the final value $X_t(\omega)$.

### Higher Dimensions

We can define vector-valued Ito processes. Let $B_t = (B_t^j)_{j=1}^n$ be
independent Brownian motions. We write
$dX = \mu\,dt + \sigma\,dB_t$ where $\mu$ 
takes values in $\RR^n$ and $\sigma$ is
an $n\times n$ matrix.

<!--
### Higher Dimensions

Let $E^{(t_0,x_0)}[f(t,\o{X}_t)]$, $t \ge t_0$, denote
the expected value of $f(t,X_t)$ when the Ito diffusion $\o{X}_t$ has initial condition $\o{X}_{t_0} = x_0$,

__Theorem__ (Markov property) _$E^{(t, x)}[f(t + h, \o{X}_{t+h})\mid\mathcal{F}_t](\omega)
= E^{(t,\o{X}_t(\omega))}[f(h, \o{X}_h)]$ for $t,h \ge 0$_.
-->

