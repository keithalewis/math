---
title: Brownian Motion
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Continuous time random walk
...

\newcommand{\RR}{\boldsymbol{R}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}
\renewcommand{\o}[1]{\overline{#1}}
\renewcommand{\u}[1]{\underline{#1}}

Brownian motion is a [stochastic process](sp.html) $(B_t)_{t\ge0}$ with increments that are
_stationary_, _independent_, and _normal_.

__stationary__
: $t\mapsto B_{t + u} - B_u$ has the same law as $t\mapsto B_t$, $u\ge0$.

__independent__
: If $0\le t_0  < \cdots < t_n$ then
$B_{t_0}$, $B_{t_1} - B_{t_0}$, \ldots, $B_{t_n} - B_{t_{n-1}}$ are independent.

__normal__
: The increment $B_{t + u} - B_t$ is normally distributed.

We also require paths are right-continuous almost surely.

_Standard Brownian motion_ has $B_1 = 0$ and $\Var(B_1) = 1$.

__Exercise__. _A stochastic process $(X_t)$ with increments that are stationary, independent,
and normal has the form $X_t = \mu t + \sigma B_t$ for some constants $\mu$ and $\sigma$ where
$(B_t)$ is standard Brownian motion_.

## Reflection Principal

Let $\o{B}_t = \max_{s\le t} B_s$ be the running maximum of Brownian motion
and $\u{B}_t = \min_{s\le t} B_s$ be the running minimum.

__Exercise__. _Show $-\u{B}_t = \o{-B}_t$_.

<details><summary>Solution</summary>
Use $-\min\{x\in X\} = \max\{-x\in X\}$ for $X\subset\RR$.
</details>

Fix $a \ge 0$ and define $\tau_a = \min \{t\ge 0\mid \o{B}_t > a\}$ to be the _first hitting time_
at level $a$. Note $B_{\tau_a} = a$ almost surely.
_Brownian motion reflected at $a$_, $B^a_t$, is defined as
$$
B^a_t =
\begin{cases}
B_t, &t\le \tau_a \\
a + (a - B_t), &t\ge \tau_a \\
\end{cases}
$$
Note $B^0_t = -B_t$ for all $t$. Reflected Brownian motion switches to $-B_t$ once level $a$ is hit.

__Exercise__. _Reflected Brownian motion is Brownian motion_.

__Lemma__. _For any integrable function $f$ we have_
$$
E[f(B_t) 1(\o{B}_t > a)] = E[f(B_t) 1(B_t > a)] + E[f(2a - B_t) 1(B_t > a)].
$$

_Proof_. Since either $B_t > a$ or $B_t \le a$
$$
	E[f(B_t) 1(\o{B}_t > a)] = E[f(B_t) 1(B_t > a, \o{B}_t > a)] + E[f(B_t) 1(B_t \le a, \o{B}_t > a)]
$$
Since $B_t > a$ implies $\o{B}_t > a)$ we have the first term on the right hand side
$$
E[f(B_t) 1(B_t > 0, \o{B}_t > a)] = E[f(B_t) 1(B_t > a)].
$$
Since $(B^a_t)$ is Brownian motion
$$
E[f(B_t) 1(B_t \le a, \o{B}_t > a] = E[f(B^a_t) 1(B^a_t \le a, \o{B^a}_t > a].
$$
If $\o{B^a}_t > a$ we are on a reflected path so $B^a_t = 2a - B_t$ and
$$
\begin{aligned}
E[f(B^a_t) 1(B^a_t \le a, \o{B^a}_t > a] &= E[f(2a - B_t) 1(2a - B_t \le a, \o{B^a}_t > a)] \\
	&= E[f(2a - B_t) 1(B_t \ge a, \o{B^a}_t > a] \\
\end{aligned}
$$
Since $B_t \ge a$ implies $\o{B^a}_t > a$ we have the second term on the right hand side
$$
	E[f(2a - B_t) 1(B_t \ge a, \o{B^a}_t > a] = E[f(2a - B_t) 1(B_t \ge a)].
$$

__Exercise__. _Show $P(\o{B}_t > a) = 2P(B_t > a)$_.

<details><summary>Solution</summary>
Use $f(x) = 1$.
</details>

__Exercise__. _What are the corresponding formulas for
$E[f(B_t) 1(\o{B}_t \le a)]$,
$E[f(B_t) 1(\u{B}_t > a)]$, and
$E[f(B_t) 1(\u{B}_t \le a)]$?_

## Girsanov

If $(B_t)$ is standard Brownian motion with Wiener measure $P$ then
$B^\alpha_t = B_t - \alpha t$, $\alpha\in\RR$, is Brownian motion with respect to $P^\alpha$ where
$E_t[dP^\alpha/dP] = e^{\alpha B_t - \alpha^2t/2}$.

__Exercise__. _Show $E[e^{\alpha  B_t - \alpha^2t/2} g(B_{t_1} - \alpha t_1, \ldots)]
= E[g(B_{t_1}, \ldots)]$ for any integrable function $g$ and $t \ge t_1,\ldots$_.

_Hint_. $B_t$, $B_{t_1}, \ldots$, are jointly normal.

__Exercise__. _If $u > t$ show $E_t[E_u[dP^\alpha /dP]] = E_t[dP^\alpha /dP]$_.

_Hint_. $e^{\alpha  B_t - \alpha^2t/2}$ is a martingale.

Let $F_t = fe^{\sigma B_t - \sigma^2t/2}$. An _up-and-in_ barrier option [@Mer75] with barrier $h$
pays $\phi(F_t) 1(\o{F}_t > h)$ at expiration for some payoff function $\phi$. Using Girsanov's theorem
$$
	E[\phi(F_t) 1(\o{F}_t > h)] = E^\alpha [\phi(F^\alpha _t) 1(\o{F^\alpha }_t > h)]
$$
where $F^\alpha _t = f e^{\sigma B^\alpha _t - \sigma^2t/2} = f e^{\sigma (B_t - \alpha t) - \sigma^2t/2}$.
Note $\o{F^\alpha }_t > h$ if and only if $\max_{s\le t} F^\alpha _s > h$.

__Exercise__. _Show $\o{F^\alpha }_t > h$ if and only if_
$\max_{s\le t} B_s - (\alpha + \sigma/2)s > (\log h/f)/\sigma$.

<details><summary>Solution</summary>
Since $F^\alpha _t = f e^{\sigma B^\alpha _t - \sigma^2t/2} = f e^{\sigma (B_t - \alpha t) - \sigma^2t/2}$
we have $F^\alpha _t > h$ if and only if $B_t - (\alpha + \sigma/2)t > (\log h/f)/\sigma$.
Take the max over $s\le t$.
</details>

__Exercise__. _Find a closed form solution for the value of an up-and-in barrier option_.

_Hint_. Use $\alpha  = -\sigma /2$.

<details><summary>Solution</summary>
From above, $\o{F^\alpha }_t > h$ if and only if $\o{B_t} > (\log h/f)/\sigma$
so we can apply the reflexion principal.
</details>

