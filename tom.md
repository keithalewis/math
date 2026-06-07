---
title: Tom's Question
classoption: fleqn
fleqn: true
---

\renewcommand\AA{\mathcal{A}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

> “Mathematicians are like Frenchmen: whatever you say to them they
translate into their own language and forthwith it is something entirely
different.” ― Johann Wolfgang von Goethe

Thank you for telling me exactly your definition of a constant maturity
bond in the case of a zero coupon bond.
If $D_t(u)$ is the price at time $t$ of a zero coupon bond maturing
at $u$ then the arbitrage-free value at time $t$ of a constant maturity $u$ zero is $X_t = D_t(t + u)$.

Recall the value at time $t$ of a zero coupon bond with maturity $u$
is ${D_t(u) = E_t[\exp(-\int_t^u f_s\,ds)]}$,
where $f_t$ is the continuously compounded instantaneous forward rate
and $E_t$ denotes the conditional expectation given information at time $t$.
We can write this as $D_t(u) = \exp(-\int_t^u f_s(t)\,ds)$ where
the implied forward as seen from time $t$ is $s\mapsto f_s(t)$, $s \ge t$.

## Ho-Lee

The (one-factor) [Ho-Lee model](https://keithalewis.github.io/math/ho-lee.html)
assumes the forward rate is $f_t = \phi(t) + \sigma(t) B_t$, where $B_t$ is
one-dimensional Brownian motion so we can find closed form solutions.
In particular, if $\phi$ and $\sigma$ are constant we have
$$
	D_t(u) = \exp(-(u - t)\phi + \sigma^2(u - t)^3/6 - \sigma(u - t)B_t).
$$
For a constant $u$ maturity zero this gives
$$
D_t(t + u) = \exp(-u\phi + \sigma^2 u^3/6 - \sigma u B_t)
$$
Recall if $N$ is normally distributed then ${E[\exp(N)] = \exp(E[N] + \Var(N)/2)}$.
This implies
$$
\begin{aligned}
	E[D_t(t + u)] &= \exp(-u\phi + \sigma^2 u^3/6 + \sigma^2 u^2 t/2) \\
		&= \exp(-u\phi + \sigma^2 u^2(u + 3t)/6) \\
\end{aligned}
$$
since $\Var(B_t) = t$.

Note ${(\partial/\partial t)E[D_t(t + u)] = E[D_t(t + u)]\sigma^2 u^2/2}$
so the expected realized return, $(\partial X_t/\partial t)/X_t = \partial \log X_t/\partial t$, does not depend on $t$.

__Exercise__. _Show $E[f_t(t + u)] = \phi - \sigma^2 u^2/2$_.

This shows the convexity adjustment between forwards and futures is the expected realized return.

The realized return over the interval $[t, t + \Delta t]$ is
${R(t, \Delta t) = (X_{t + \Delta t} - X_t)/X_t = X_{t + \Delta t}/X_t - 1}$.

$\Delta\log X_t = \log X_{t + \Delta t} - \log X_t$
<!--
If ${X_t = \exp(Y_t)}$ then ${R\approx Y_{t + \Delta t} - Y_t = \Delta Y_t}$.
In the Ho-Lee model we have $Y_t = -u\phi + \sigma^2 u^3/6 - \sigma u B_t$ so
$$
	\Delta Y_t = -\sigma u \Delta B_t.
$$
If $N$ and $M$ are jointly normal then ${E[\exp(N)f(M)] = E[\exp(N)]E[f(M + \Cov(N,M))]}$
for any reasonable function $f$. Taking $f(M) = \exp(-M)$ we have
$f(M + \Cov(N,M)) = \exp(-M - \Cov(N,M))$ so
$$
	E[\exp(N)/\exp(M)] = E[\exp(N)] \exp(-E[M] - \Cov(N,M) + \Var(M)/2) 
$$
If we let $M = -N$ we get ${\Var(\exp(N)) = E[\exp(N)]^2(\exp(\Var(N)) - 1)}$.

so ${E[R] = \exp(\sigma^2 u^2 \Delta t/2) - 1 \approx \sigma^2 u^2 \Delta t/2}$ and
${\Var(R) = E[R]^2(\exp(\sigma^2 u^2 \Delta t) - 1)}$.
-->

Using $X_t = D_t(t + u)$ we have $R = X_{t + \Delta t}/X_t - 1 = \exp(-\sigma u\Delta B_t) - 1$
so $E[R] = \exp(\sigma^2 u^2\Delta t/2) - 1 \approx \sigma^2 u^2\Delta t/2$.

Assume prices $(X_t)$ and cash flows $(C_t)$, $t\ge 0$, indexed by market tradeable instruments.
Given a finite trading strategy $(\tau_j,\Gamma_j)$ let $\Gamma_t = \Gamma_j 1(t = \tau_j)$
so the position at time $t$ is $\sum_{s < t}\Gamma_s$. The trade blotter will show
mark-to-market value $V_t = (\Delta_t + \Gamma_t)\cdot X_t$ and amounts
$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$.

| \(t\)                | \(X\)   | \(C\)   | \(\Gamma\)   | \(\Delta\)   | \(V\)                 | \(A\)                  |
|----------------------|---------|---------|--------------|--------------|-----------------------|------------------------|
| \([0, \tau_0)\)      | \(X_t\) | \(C_t\) | 0            | 0            | 0                     | 0                      |
| \(\tau_0\)           | \(X_0\) | \(C_0\) | \(\Gamma_0\) | 0            | \(\Gamma_0\cdot X_0\) | \(-\Gamma_0\cdot X_0\) |
| \((\tau_0, \tau_1)\) | \(X_t\) | \(C_t\) | 0            | \(\Gamma_0\) | \(\Gamma_0\cdot X_t\) | \(\Gamma_0\cdot C_t\)  |
| \(\tau_1\)           | \(X_1\) | \(C_1\) | \(\Gamma_1\) | \(\Gamma_0\) | \((\Gamma_0+\Gamma_1)\cdot X_0\) |\(\Gamma_0\cdot C_1 - \Gamma_1\cdot X_1\) |
| \((\tau_1, \tau_2)\) | \(X_t\) | \(C_t\) | 0            | \(\Gamma_0 + \Gamma_1\) | \((\Gamma_0 + \Gamma_1)\cdot X_t\) | \((\Gamma_0 + \Gamma_1)\cdot C_t\) |
| \(\cdots\) | \(\cdots\) | \(\cdots\) | \(\cdots\) | \(\cdots\) | \(\cdots\) | \(\cdots\) |
| \(\tau_n\)           | \(X_n\) | \(C_n\) | \(\Gamma_n\) | \(\sum_{j < n}\Gamma_j\) | \((\sum_{j\le n}\Gamma_j)\cdot X_0\) | \((\sum_{j < n} \Gamma_j)\cdot C_n - \Gamma_n\cdot X_n\) |
| \((\tau_n, \infty)\) | \(X_t\) | \(C_t\) | 0            | \(\sum_{j\le n}\Gamma_j\) | \((\sum_{j\le n} \Gamma_j)\cdot X_t\) | \((\sum_{j\le n})\cdot C_t\) |

The strategy is closed out at $\tau_n$ if $\Gamma_n = -\sum_{j < n}\Gamma_j$ so $\sum_{j\le n}\Gamma_j = 0$.
In this case the value $V_{\tau_n} = 0$ and the amount
$A_{\tau_n} = -\Gamma_n\cdot C_{\tau_n} - \Gamma_n\cdot X_{\tau_n}$. We then
have $V_t = A_t = 0$ for $t > \tau_n$.

This table can be simplified if we let $\Delta_{+j}$ at $\tau_j$ be the position over $(\tau_j,\tau_{j+1}]$ so
${\Delta_{+j} = \Delta_{+(j-1)} + \Gamma_j}$.
We now only need the $t = \tau_j$ rows. We can also eliminate the non-informative $X$ and $C$ columns.

| \(t\)      | \(\Gamma\)   | \(\Delta_+\)               | \(V\)                    | \(A\)                                        |
|------------|--------------|----------------------------|--------------------------|----------------------------------------------|
| \(\tau_0\) | \(\Gamma_0\) | \(\Gamma_0\)               | \(\Delta_{+0}\cdot X_0\) | \(-\Gamma_0\cdot X_0\)                       |
| \(\tau_1\) | \(\Gamma_1\) | \(\Delta_{+0} + \Gamma_1\) | \(\Delta_{+1}\cdot X_1\) | \(\Delta_{+0}\cdot C_1 - \Gamma_1\cdot X_1\) |
| \(\cdots\) | \(\cdots\)   | \(\cdots\)                 | \(\cdots\)               | \(\cdots\)                                   |
| \(\tau_n\) | \(\Gamma_n\) | 0                          | 0                        | \(-\Gamma_n\cdot(C_n + X_n)\)                |

In general, $V_j = \Delta_{+j}\cdot X_j$ and $A_j = \Delta_{+(j-1}}\cdot C_j - \Gamma_j\cdot X_j$
for $0 < j < n$.

## Replication

A constant maturity $u$ zero coupon bond is a contract to deliver $D(\tau, \tau + u)$ given
any stopping time $\tau$ at which the buyer decides to exercise.

Assume the set of market tradeable instruments include a money-market
account $(R_t)$ and zero coupon bonds of every maturity $D(t)$, $t > 0$.
To create a constant $u$ maturity zero coupon bond purchase $D(u)$ at
time 0 for $D_0(u)$. At time $\Delta t$ sell the original at $D_{\Delta
t}(u)$ and buy $D(\Delta t + u)$ by borrowing $D_{\Delta t}(\Delta t +
u)$. Rinse and repeat.
