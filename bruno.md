---
title: Example
---

\newcommand\RR{\boldsymbol{R}}
\newcommand\FF{\mathcal{F}}
\renewcommand\AA{\mathcal{A}}

The first step in solving a math problem is writing down the problem.
This note shows how to use [SUM](https://keithalewis.github.io/math/ums.html)
to express the problem of finding arbitrage constraints on initial European option
values paying $A_i$ at $t_i$, $i = 1,2$.
The model is a replacement for Black-Scholes/Merton
and extends Ross 1978 to explicitly include cash flows.
Unlike earlier models, every market instrument can be incorporated, including
futures and limit orders.

As a warm-up, let's start with a
one period model of bond and stock: bond has constant realized return $R$,
stock has initial price $s$ and final price any bounded function $S\in B(\Omega)$.

SUM notation: initial market prices $X_0 = x = (1,s)$, final market prices $X_1 = X = (R, S)$,
where $S(\omega) = \omega$, $\omega\in\Omega$.

By FTAP, no arbitrage if there exists a non-negative finitely additive measure $D\in ba(\Omega)$
with $x = XD(\Omega) = \int_\Omega X(\omega)\,dD(\omega)$.

This is equivalent to $x$ belonging to the smallest closed cone containing the range of $X$ in $\RR^2$.

Extend the model with an option paying ${A}$ at expiration. 
Let $x = (1,s,v)$, $X = (R,S,0)$, $C = (0, 0, {A})$.

No arbitrage if $x = (X + C)D(\Omega)$ so $(1,s,v) = \int_\Omega (R,S,{A})\,dD$.

Example: $\Omega = {L,H}$ (binomial model).
We must have $(1,s,v) = (R, L, A) D_L + (R, H, A) D_H$ for some $D_L,D_H\ge 0$.
Bond and stock components determine $D_L$ and $D_H$. Non-negativity of $D_L$ and $D_H$
imply $L\le Rs\le H$. These determine a unique option value $v$.

Example: $\Omega = [L,H]$. Option value is no longer unique,
the only constraint is $(1, s, v)$ belongs to the cone determined by the range.

If $A(\omega) = \max\{\omega - K,0\}$, $L < K < H$, then
$X(L)$, $X(K)$, and $X(H)$ are extreme points and
$(1, s, v) = X(L) D_L + X(K) D_K + X(H) D_H$ for some $D_L,D_K,D_H\ge 0$.

Note $X(H) = (0,0,H-K)$ so the third component is $v = (H - K)D_H$ and $D_H = v/(H - K)$.
Substitute that in the first two components and solve for $D_L$ and $D_K$ to get
$D_L = A + Bv > 0$ and $D_K = C + Dv > 0$ for the constraints on option value $v$.

__Exercise__. _Compute $A$, $B$, $C$, and $D$_.

__Exercise__. _What are the limits as $L\to 0$ and $H\to\infty$_?

In general, let $\Omega = B([0,\infty))$. Any bounded path is a possible trajectory.
This is a very general model.
Let the information at time $t$, $\AA_t$, be the smallest algebra of 
sets for which $\omega \mapsto \omega(s)$ are measurable for all $s\le t$.
The atom in $\AA_t$ containing $\omega\in\Omega$ is
the set $A_t(\omega) = \{\omega'\in\Omega\mid \omega(s) = \omega'(s), 0\le s \le t\}$,
i.e., all paths agreeing with $\omega$ up to time $t$.

Consider a model with two European options paying $A_1$ at $t_1$ and $A_2$ at $t_2$.
We have $X_0 = (1, s, v_1, v_2)$, $C_{t_1} = (0, 0, A_1, 0)$, $C_{t_2} = (0, 0, 0, A_2)$,
and $C_t = (0,0,0,0)$ otherwise. Note the third component of $X_t = 0$ for $t > t_1$
and the fourth component of $X_t = 0$ for $t > t_2$ since the value of
an option is zero after expiration.

By the FTAP, the model is arbitrage free if there exist non-negative finitely
additive measure $D_t\in ba(\AA_t)$ with
$$
	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}, t\le u.
$$

This in not a complete solution of the problem, it is only a rigorous way of writing it down.
