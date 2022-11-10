---
title: Brownian Motion
author: Keith A. Lewis
fleqn: true
...

\newcommand{\Var}{\mathoperator{Var}}

Brownian motion is a stochastic process $(B_t)_{t\ge0}$.
with increments that are *stationary*, *independent*, and *normal*.

**stationary**
:   $t\mapsto B_{t + u} - B_u$ has the same law as
    $t\mapsto B_t$, $u\ge0$.

**independent**
:   If $0\le t_0 < \cdots < t_n$ then
    $B_{t_0}$, $B_{t_1} - B_{t_0}$, \dots, $B_{t_n} - B_{t_{n-1}}$ are independent.

**normal**
:   The increment [B_{t + u} - B_t$ is normally
    distributed.

*Standard Brownian motion* has [B_1 = 0$ and
[\operatorname{Var}(B_1) = 1$.

**Exercise**. *A stochastic process [(X_t)$ with
increments that are stationary, independent, and normal has the form
[X_t = \mu t + \sigma B_t$ for some constants
[\mu$ and [\sigma$ where [(B_t)]{.math
.inline} is standard Brownian motion*.

<details
<summary>Solution</summary>
Every process that is stationary with independent increments is determined by its distribution
at a single time.
</details>

## Reflection Principal

Let [\overline{B}_t = \max_{s\le t} B_s$ be the
running maximum of Brownian motion and [\underline{B}_t =
\min_{s\le t} B_s$ be the running minimum.

**Exercise**. *Show [-\underline{B}_t = \overline{-B}_t]{.math
.inline}*.

<details
<summary>Solution</summary>
Use $\(-\min\{x, \ldots\} = \max\{-x, \ldots\}$.
</details>

Fix [a \ge 0$ and define [\tau_a = \min \{t\ge
0\mid \overline{B}_t \> a\}$ to be the *first hitting
time* at level [a$. Note [B_{\tau_a} = a]{.math
.inline} almost surely. *Brownian motion reflected at [a]{.math
.inline}*, [B\^a_t$, is defined as [ B\^a_t =
\begin{cases} B_t, &t\le \tau_a \\ a + (a - B_t), &t\ge \tau_a
\\ \end{cases} ]{.math .display} Note [B\^0_t = -B_t$
for all [t$. Reflected Brownian motion switches to
[-B_t$ once level [a$ is hit.

**Exercise**. *Reflected Brownian motion is Brownian motion*.

<details
<summary>Solution</summary>

</details>

**Lemma**. *For any integrable function [f$ we have* 
$$
E[f(B_t) 1(\overline{B}_t > a)\] = E\[f(B_t) 1(B_t > a)] +
E[f(2a - B_t) 1(B_t > a)].
$$

*Proof*. Since either [B_t \> a$ or [B_t \le a]{.math
.inline} [ E\[f(B_t) 1(\overline{B}_t \> a)\] = E\[f(B_t) 1(B_t \> a,
\overline{B}_t \> a)\] + E\[f(B_t) 1(B_t \le a, \overline{B}_t \>
a)\] ]{.math .display} Since [B_t \> a$ implies
[\overline{B}_t \> a)$ we have the first term on the
right hand side [ E\[f(B_t) 1(B_t \> 0, \overline{B}_t \> a)\] =
E\[f(B_t) 1(B_t \> a)\]. ]{.math .display} Since [(B\^a_t)]{.math
.inline} is Brownian motion [ E\[f(B_t) 1(B_t \le a, \overline{B}_t
\> a\] = E\[f(B\^a_t) 1(B\^a_t \le a, \overline{B\^a}_t \> a\].
]{.math .display} If [\overline{B\^a}_t \> a$ we are on
a reflected path so [B\^a_t = 2a - B_t$ and [
\begin{aligned} E\[f(B\^a_t) 1(B\^a_t \le a, \overline{B\^a}_t \>
a\] &= E\[f(2a - B_t) 1(2a - B_t \le a, \overline{B\^a}_t \> a)\]
\\ &= E\[f(2a - B_t) 1(B_t \ge a, \overline{B\^a}_t \> a\] \\
\end{aligned} ]{.math .display} Since [B_t \ge a$
implies [\overline{B\^a}_t \> a$ we have the second
term on the right hand side [ E\[f(2a - B_t) 1(B_t \ge a,
\overline{B\^a}_t \> a\] = E\[f(2a - B_t) 1(B_t \ge a)\]. ]{.math
.display}

**Exercise**. *Show [P(\overline{B}_t \> a) = 2P(B_t \> a)]{.math

<details
<summary>Solution</summary>
</details>
.inline}*.

**Exercise**. *What are the corresponding formulas for [E\[f(B_t)
1(\overline{B}_t \le a)\]$, [E\[f(B_t)
1(\underline{B}_t \> a)\]$, and [E\[f(B_t)
1(\underline{B}_t \le a)\]$?*

<details
<summary>Solution</summary>
</details>

## Girsanov

If [(B_t)$ is standard Brownian motion with Wiener
measure [P$ then [B\^\alpha_t = B_t - \alpha t]{.math
.inline}, [\alpha\in\boldsymbol{R}$, is Brownian
motion with respect to [P\^\alpha$ where
[E_t\[dP\^\alpha/dP\] = e\^{\alpha B_t - \alpha\^2t/2}]{.math
.inline}.

**Exercise**. *Show [E\[e\^{\alpha B_t - \alpha\^2t/2} g(B_{t_1} -
\alpha t_1, \ldots)\] = E\[g(B_{t_1}, \ldots)\]$ for
any integrable function [g$ and [t \ge
t_1,\ldots$*.

*Hint*. [B_t$, [B_{t_1}, \ldots$, are
jointly normal.

<details
<summary>Solution</summary>
</details>

**Exercise**. *If [u \> t$ show [E_t\[E_u\[dP\^\alpha
/dP\]\] = E_t\[dP\^\alpha /dP\]$*.

*Hint*. [e\^{\alpha B_t - \alpha\^2t/2}$ is a
martingale.

<details
<summary>Solution</summary>
</details>

Let [F_t = fe\^{\sigma B_t - \sigma\^2t/2}$. An
*up-and-in* barrier option [\[@Mer75\]]{.citation cites="Mer75"} with
barrier [h$ pays [\phi(F_t) 1(\overline{F}_t \>
h)$ at expiration for some payoff function [\phi]{.math
.inline}. Using Girsanov's theorem [ E\[\phi(F_t) 1(\overline{F}_t \>
h)\] = E\^\alpha \[\phi(F\^\alpha _t) 1(\overline{F\^\alpha }_t
\> h)\] ]{.math .display} where [F\^\alpha _t = f e\^{\sigma
B\^\alpha _t - \sigma\^2t/2} = f e\^{\sigma (B_t - \alpha t) -
\sigma\^2t/2}$. Note [\overline{F\^\alpha }_t \>
h$ if and only if [\max_{s\le t} F\^\alpha _s \>
h$.

**Exercise**. *Show [\overline{F\^\alpha }_t \> h$ if
and only if* [\max_{s\le t} B_s - (\alpha + \sigma/2)s \> (\log
h/f)/\sigma$.

<details
<summary>Solution</summary>
</details>

**Exercise**. *Find a closed form solution for the value of an up-and-in
barrier option*.

*Hint*. Use [\alpha = -\sigma /2$.

<details
<summary>Solution</summary>
</details>
