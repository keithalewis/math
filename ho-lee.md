---
title: Ho-Lee Model[^1]
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

_Hint_. Use $D(t) = E[\exp(-\int_0^t f_s\,ds)] = \exp(-\int_0^t f(s)\,ds)$
and compute the derivative with respect to $t$

<details><summary>Solution</summary>
We have $(d/dt)E[\exp(-\int_0^ t f_s\,ds)] = E[-D_t f_t]$ and
$(d/dt)\exp(-\int_0^t f(s)\,ds) = -D(t) f(t)$.
The result follows from $D(t) = E[D_t]$.
</details>

This shows $f(t)$ is the _par coupon_ of a forward contract paying $f_t - f(t)$ at $t$.

__Exercise__. _Show $0 = E_t[(f_u - f_t(u))D_u]$, $t\le u$_. 

_Hint_: Use $D_t(u) = E_t[\exp(-\int_t^u f_s\,ds)] = \exp(-\int_t^u f_t(s)\,ds)$
and compute the derivative with respect to $u$.

This shows $f_t(u)$ is the _par coupon_ at time $t$ of a forward contract paying $f_u - f_t(u)$ at $u$.

The futures quote at time $t$ of a contract settling at $u$ to $f_u$ is
$φ_t(u) = E_t[f_u]$, $t\le u$. Futures quotes are naturally occurring martingales.
We write $φ(t)$ for $φ_0(t)$.

From above we have ${f(t)E[D_t] = E[f_t D_t] = E[f_t]E[D_t] + \Cov(f_t, D_t)}$ so
${φ(t) - f(t) = -\Cov(f_t, D_t)/D(t)}$. This is positive since the forward and discount
are negatively correlated. For most models it is approximately proportional to the the square
of time to expiration.

The stochastic forward rate determines all quantities relevant to the dynamics
of fixed income instruments. See [Yield Curve Model](ycm.html) for details.

## Model

The Ho-Lee model assumes the stochastic forward rate is 
$f_t = φ(t) + σ(t)\cdot B_t$ where $φ(t)$ is the futures quote
at time $t$, $σ(t)$ is the vector-valued volatility,
and $B_t$ is vector-valued standard Brownian motion.

The stochastic discount is $D_t = \exp(-\int_0^t f_s\,ds) = \exp(-\int_0^t φ(s) + σ(s)\cdot B_s\,ds)$.

__Exercise__: _Show $\int_0^t σ(s)\cdot B_s\,ds = \int_0^t (Σ(t) - Σ(s))\cdot dB_s$
where ${Σ(t) = \int_0^t σ(s)\,ds}$_.

_Hint_ Use $d(Σ(t)\cdot B_t) = Σ(t)\cdot dB_t + Σ'(t)\cdot B_t\,dt$.

<details>
<summary>Solution</summary>
Integrating we have ${Σ(t)\cdot B_t - Σ(0)\cdot B_0 = \int_0^t Σ(s)\cdot dB_s + \int_0^t Σ'(s)\cdot B_s\,ds}$.
The result follows from ${B_t = \int_0^t dB_s}$ and $σ(t) = Σ'(t)$.
</details>

This shows
$$
	D_t = \exp\bigl(-\int_0^t φ(s)\,ds - \int_0^t (Σ(t) - Σ(s)\cdot dB_s\bigr).
$$

__Exercise__. _Show $\Var(\int_0^t (Σ(t) - Σ(s))\cdot dB_s) = \int_0^t \|Σ(t) - Σ(s)\|^2\,ds$_.

_Hint_: Use the Ito isometry $E[(\int_0^t X_s\cdot dB_s)^2] = E[\int_0^t \|X_s\|^2\,ds]$.

Since the exponent is normally distributed and
$E[\exp(N)] = \exp(E[N] + \Var(N)/2)$ if $N$ is normal
we have
$$
	D(t) =  E[D_t] = \exp\bigl(-\int_0^t φ(s)\,ds + \int_0^t \|Σ(t) - Σ(s)\|^2/2\,ds\bigr)
$$

__Exercise__. _Show if $σ$ is constant then $D(t) = \exp(-\int_0^t φ(s)\,ds + \|σ\|^2 t^3/6)$_.

_Hint_: $\int_0^t (t - s)^2\,ds = t^3/3$.

Now we determine the forward curve.

__Exercise__. _Show $(d/dt) \int_0^t \|Σ(t) - Σ(s)\|^2\,ds = 2σ(t)\cdot \int_0^t Σ(t) - Σ(s)\,ds$_.

_Hint_. Use the Leibniz integral rule $(d/dt)\int_0^t F(t,s)\,ds
= F(t, t) + \int_0^t (\partial/\partial t) F(t, s)\,ds$.

<details><summary>Solution</summary>
Let $F(t,s) = \|Σ(t) - Σ(s)\|^2$ so $(\partial/\partial t) F(t,s) = 2(Σ(t) - Σ(s))\cdot σ(t)$
and
${(d/dt) \int_0^t \|Σ(t) - Σ(s)\|^2\,ds = 0 + \int_0^t 2(Σ(t) - Σ(s))\cdot σ(t)\,ds}$. 
</details>

Since $D(t) = \exp(-\int_0^t f(s)\,ds)$ the forward curve is
$$
	f(t) = φ(t) - σ(t)\cdot \int_0^t Σ(t) - Σ(s)\,ds.
$$

__Exercise__. _If $σ$ is constant then ${f(t) = φ(t) -  \|σ\|^2 t^2/2}$_.

_Hint_: Use $Σ(t) = σt$.

There is an explicit formula for convexity in the Ho-Lee model.

__Exercise__. _Show $\Cov(f_t, D_t)/D(t) = -σ(t)\cdot \int_0^t sσ(s)\,ds$_.

_Hint_: Use $E[f(N) \exp(M)] = E[f(N + \Cov(N,M))] E[\exp(M)]$
if $N$ and $M$ are jointly normal to show
$\Cov(N, \exp(M)) = \Cov(N,M) E[\exp(M)]$. Recall $\Cov(B_t, B_s) = sI$ for $s\le t$.

<details><summary>Solution</summary>
We have $\Cov(f_t, D_t) = \Cov(σ(t)\cdot B_t,-\int_0^t σ(s)\cdot dB_s) E[D_t]
= -σ(t) \cdot \int_0^t σ(s)s\,ds\,D(t)$.
</details>

__Exercise__. _If $σ$ is constant show $\Cov(f_t, D_t)/D(t) = -\|σ\|^2 t^2/2$_.


<!--
Note
$$
\begin{aligned}
	D_u/D_t &= \exp\bigl(-\int_t^u φ(s)\,ds + \int_0^u Σ(u) - Σ(s)\,dB_s - \int_0^t Σ(t) - Σ(s)\,dB_s\bigr) \\
		&= \exp\bigl(-\int_t^u φ(s)\,ds
			+ \int_t^u Σ(u) - Σ(s)\,dB_s\
			+ \int_0^t Σ(u) - Σ(s) - (Σ(t) - Σ(s))\,dB_s\bigr) \\
		&= \exp\bigl(-\int_t^u φ(s)\,ds
			+ \int_t^u Σ(u) - Σ(s)\,dB_s\
			+ (Σ(u) - Σ(t))B_t\bigr) \\
\end{aligned}
$$
$$
	D(u)/D(t) = \exp\bigl(-\int_t^u φ(s)\,ds + \int_0^u (Σ(u) - Σ(s))^2\,ds/2 - \int_0^t (Σ(t) - Σ(s))^2\,ds/2\bigr)
$$

-->

## Dynamics

For the Ho-Lee model
${D_t(u) = E_t[\exp(-\int_t^u φ(s) + σ(s)\cdot B_s\,ds)]}$.

__Exercise__. _Show $\int_t^u σ(s)\cdot B_s\,ds = \int_t^u Σ(u) - Σ(s)\cdot dB_s + (Σ(u) - Σ(t))\cdot B_t$_
where ${Σ(t) = \int_0^t σ(s)\,ds}$.

_Hint_ Use $d(Σ(t)\cdot B_t) = Σ(t)\cdot dB_t + Σ'(t)\cdot B_t\,dt$.

<details>
<summary>Solution</summary>
We have 
$$
\begin{aligned}
\int_t^u σ(s)\cdot B_s\,ds &= -\int_t^u Σ(t)\cdot dB_s + Σ(u)\cdot B_u - Σ(t)\cdot B_t \\
&= -\int_t^u Σ(s)\cdot dB_s + Σ(u)\cdot B_u - Σ(u)\cdot B_t + Σ(u)\cdot B_t - Σ(t)\cdot B_t \\
&= -\int_t^u Σ(s)\cdot dB_s + Σ(u)\cdot \int_t^u dB_s + Σ(u)\cdot B_t - Σ(t)\cdot B_t \\
&= \int_t^u Σ(u) - Σ(s)\cdot dB_s + (Σ(u) - Σ(t))\cdot B_t \\
\end{aligned}
$$
</details>

__Exercise__. _Show $\Var(\int_t^u Σ(u) - Σ(s)\,dB_s) = \int_t^u (Σ(u) - Σ(s))^2\,ds$_.

__Exercise__. _Show $E_t[\exp(\int_t^u Λ(s)\,dB_s)] = \exp(\int_t^u Λ(s)^2/2\,ds)$_.

_Hint_: Use ${X_t = \exp(\int_0^t Λ(s)\,dB_s - \int_0^t Λ(s)^2/2\,ds)}$ is a martingale.

<details>
<summary>Solution</summary>
$1 = E_t[X_u/X_t] = E_t[\exp(\int_t^u Λ(s)\,dB_s - \int_t^u Λ(s)^2/2\,ds)]$
</details>

Note the right hand side is not random and
${E_t[\exp(-\int_t^u Λ(s)\,dB_s)] = \exp(\int_t^u Λ(s)^2/2\,ds)}$
by replacing $Λ$ with $-Λ$.  We use this below.

Using the previous two exercises, the price at $t$ of a zero coupon bond maturing at $u$ in the Ho-Lee model is
$$
\begin{aligned}
D_t(u) &= E_t[D_u/D_t] \\
	&= E_t[\exp(-\int_t^u φ(s) + σ(s) B_s\,ds)] \\
	&= E_t[\exp\bigl(-\int_t^u φ(s)\,ds - \int_t^u Σ(u) - Σ(s)\,dB_s - (Σ(u) - Σ(t)) B_t\bigr)] \\
	&= \exp(\int_t^u -φ(s)\,ds + \int_t^u (Σ(u) - Σ(s))^2/2\,ds - (Σ(u) - Σ(t)) B_t) \\
\end{aligned}
$$

__Exercise__. _If $σ$ is constant show_
$$
	D_t(u) = \exp(\int_t^u -φ(s)\,ds + σ^2(u - t)^3/6 - σ(u - t) B_t).
$$

Note $D_t(u)$ is lognormal with log-variance $\Var(\log D_t) =  (Σ(u) - Σ(t))^2 t$
and expected value
$$
	E[D_t(u)] = \exp(\int_t^u -φ(s)\,ds + \int_t^u (Σ(u) - Σ(s))^2/2\,ds + (Σ(u) - Σ(t))^2t/2) 
$$

__Exercise__. _If $σ$ is constant show_
$$
	E[D_t(u)] = \exp\bigl(\int_t^u -φ(s)\,ds + σ^2(u - t)^3/6 + σ^2(u - t)^2 t/2\bigr).
$$
<!--
Note
$$
	D_t(u)D_t = \exp\bigl(\int_0^u -φ(s)\,ds +  \int_t^u (Σ(u) - Σ(s))^2/2\,ds - \int_0^t (Σ(u) - Σ(s))\,dB_t\bigr)
$$
using $(Σ(u) - Σ(t)) B_t = \int_0^t (Σ(u) - Σ(t))\,dB_s$ and
$$
	D_t(u)D_t = D(u) \exp\bigl(-\int_0^t (Σ(u) - Σ(s))^2/2\,ds - \int_0^t (Σ(u) - Σ(s))\,dB_t\bigr)
$$
-->

Note 
$$
\begin{aligned}
\frac{D(u)}{D(t)}
	&= \exp\bigl(\int_t^u -φ(s)\,ds + \int_0^u (Σ(u) - Σ(s))^2/2\,ds - \int_0^t (Σ(t) - Σ(s))^2/2\,ds\bigr) \\
	&= \exp\bigl(\int_t^u -φ(s)\,ds + \int_t^u (Σ(u) - Σ(s))^2/2\,ds + \int_0^t U(s)/2\,ds\bigr) \\
	&= E[D_t(u)] \exp\bigl(-(Σ(u) - Σ(t))^2t/2 + \int_0^t U(s)/2\,ds\bigr) \\
\end{aligned}
$$ 
where ${U(s) = (Σ(u) - Σ(s))^2 - (Σ(t) - Σ(s))^2 = Σ(u)^2 - Σ(t)^2 - 2(Σ(u) - Σ(t))Σ(s))}$.
We have ${\int_0^t U(s)/2\,ds = (Σ(u)^2 - Σ(t)^2)t/2 - (Σ(u) - Σ(t)) \int_0^t Σ(s)\,ds}$ so
$$
\begin{aligned}
	E[D_t(u)] &= \frac{D(u)}{D(t)}
		\exp\bigl(-(Σ(u) - Σ(t))^2t/2 + (Σ(u)^2 - Σ(t)^2)t/2 + (Σ(u) - Σ(t))\int_0^t Σ(s)\,ds\bigr)  \\
	&= \frac{D(u)}{D(t)}
		\exp\bigl((Σ(u) - Σ(t))Σ(t) + (Σ(u) - Σ(t))\int_0^t Σ(s)\,ds\bigr)  \\
\end{aligned}
$$

<!--
where $U(s) = (Σ(u) - Σ(s))^2/2 - (Σ(t) - Σ(s))^2/2$ so
${dU = (-(Σ(u) - Σ(s)) σ(s) + (Σ(t) - Σ(s)) σ(s))\,ds = -(Σ(u) - Σ(t))σ(s)\,ds}$.
Let $dV = ds$ so $V = s$ and integration by parts gives
$$
\begin{aligned}
	\int_0^t U(s)\,dV
	&= U(s) s|_0^t + (Σ(u) - Σ(t))\int_0^t s σ(s)\,ds \\
	&= (Σ(u) - Σ(t))^2 t/2 - 0 + (Σ(u) - Σ(t))\int_0^t s σ(s)\,ds \\
\end{aligned}
$$
This shows
\begin{aligned}
	D_t(u) &= D(u)/D(t) \exp\bigl(-(Σ(u) - Σ(t))^2t/2 - (Σ(u) - Σ(t))\int_0^t s σ(s)\,ds - (Σ(u) - Σ(t))B_t\bigr) \\
\end{aligned}
-->

__Exercise__. _If $σ$ is contant show_
$$
	D_t(u) = D(u)/D(t) \exp(-σ^2 ut(u - t)/2 - σ(u - t) B_t) 
$$

Now we determine the forward curve.

__Exercise__ _Show $(\partial/\partial u)\int_t^u (Σ(u) - Σ(s))^2\,ds = 2σ(u)\int_t^u (Σ(u) - Σ(s))\,ds$_. 

_Hint_. Use $(\partial/\partial u)\int_t^u F(u,s)\,ds = F(u, u) + \int_t^u (\partial/\partial u) F(u, s)\,ds$.

<details><summary>Solution</summary>
Let $F(u,s) = (Σ(u) - Σ(s))^2$ so $(\partial/\partial u) F(u,s) = 2(Σ(u) - Σ(s)) σ(u)$
and
${(d/du) \int_t^u (Σ(u) - Σ(s))^2\,ds = 0 + \int_t^u 2(Σ(u) - Σ(s)) σ(u)\,ds}$. 
</details>

Since $D_t(u) = \exp(-\int_t^u f_t(s)\,ds)$ we have
$$
	f_t(u) = φ(u) - σ(u)\int_t^u Σ(u) - Σ(s)\,ds + σ(u) B_t.
$$

__Exercise__. _If $σ$ is constant show $f_t(u) = φ(u) - σ^2(u - t)^2/2 + σ B_t$_.

The Ho-Lee model has a closed form solution for the dynamics of zero-coupon bond prices.

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

Suppose a _fixed income instrument_ pays $c_j$ at times $u_j$. Its value at time $t$
is ${P_t = \sum_{u_j > t} c_j D_t(u_j)}$. If a European option pays
$g(P_t)$ at time $t$ its value
is $E[g(P_t) D_t] = E[h(\dots, D_t(u_j),\dots) D_t]$


We can approximate this with a
lognormal having expected value ${E[P_t] = \sum_{u_j > t} c_j E[D_t(u_j)]}$
and variance ${\Var(P_t) = \sum_{u_j, u_k > t} c_j c_k \Cov(D_t(u_j), D_t(u_k))}$.
A European option paying $g(P_t)$ at time $t$ has value $E[g(P_t)D_t]$.
Note $g(P_T) = h(B_t)$ since $D(t,u)$ is a function of $B_t$.
The option value is $E[h(B_t)D_t] = E[h(B_t + \int_0^t s σ(s)\,ds)] D(t)$.

__Exercise__. _Show $\int_0^t s σ(s)\,ds = t Σ(t) - \int_0^t Σ(s)\,ds$_.


## Reference

<div class="csl-bib-body" style="line-height: 1.35; margin-left: 2em; text-indent:-2em;">
[^1]:  <div class="csl-entry">Ho, Thomas S. Y., and Sang-Bin Lee. “Term Structure Movements and Pricing Interest Rate Contingent Claims.” <i>The Journal of Finance</i> 41, no. 5 (1986): 1011–29. <a href="https://doi.org/10.2307/2328161">https://doi.org/10.2307/2328161</a>.</div>
  <span class="Z3988" title="url_ver=Z39.88-2004&amp;ctx_ver=Z39.88-2004&amp;rfr_id=info%3Asid%2Fzotero.org%3A2&amp;rft_id=info%3Adoi%2F10.2307%2F2328161&amp;rft_val_fmt=info%3Aofi%2Ffmt%3Akev%3Amtx%3Ajournal&amp;rft.genre=article&amp;rft.atitle=Term%20Structure%20Movements%20and%20Pricing%20Interest%20Rate%20Contingent%20Claims&amp;rft.jtitle=The%20Journal%20of%20Finance&amp;rft.volume=41&amp;rft.issue=5&amp;rft.aufirst=Thomas%20S.%20Y.&amp;rft.aulast=Ho&amp;rft.au=Thomas%20S.%20Y.%20Ho&amp;rft.au=Sang-Bin%20Lee&amp;rft.date=1986&amp;rft.pages=1011-1029&amp;rft.spage=1011&amp;rft.epage=1029&amp;rft.issn=0022-1082"></span>
</div>
