<!--
:!pandoc -t html5 -s --katex=https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/ --css math.css ums.md -o ums.html
:!pandoc -V fontsize=12pt ums.md -o ums.pdf
-->
---
title: Simple Unified Model of Derivative Securities
classoption: fleqn
...
\newcommand\RR{\boldsymbol{R}}
\renewcommand\AA{\mathcal{A}}

$T$ — totally ordered set of _trading times_.

$I$ — market _instruments_.

$\Omega$ — possible _outcomes_.

$(\AA_t)_{t\in T}$ — _partitions_[^1] of $\Omega$ indicating the information available at time $t\in T$.

$X_t\colon\AA_t\to\RR^I$ — bounded _prices_[^2] at times $t\in T$ of market instruments.

$C_t\colon\AA_t\to\RR^I$ — bounded _cash flows_ at times $t\in T$ of market instruments.

E.g., coupons, dividends, and futures margin adjustments are cash flows.

$(\tau_j, \Gamma_j)$ — _trading strategy_ of strictly increasing stopping
times $\tau_j$ and shares $\Gamma_j\colon\AA_{\tau_j}\to\RR^I$ purchased at $\tau_j$.

The _position_ resulting from a trading strategy is
$\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s$ where
$\Gamma_s = \Gamma_j 1(\tau_j = s)$. Note the strict inequality.
It takes time for a trade to settle and become a part of the position.

$V_t = (\Delta_t + \Gamma_t)\cdot X_t$ — the _value_, or _mark-to-market_, of the strategy.

$A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$ — the _amount_ showing up in the trading account.

Arbitrage exists if there is a trading strategy with $A_{\tau_0} > 0$, $A_t \ge0$, $t > \tau_0$, and
$\sum_j \Gamma_j = 0$. You make money on the first trade and never lose money until
the position is closed.

__Theorem__ (Fundamental Theorem of Asset Pricing) _There is no arbitrage if there exist _deflators_, positive
finitely additive measures[^3] $D_t$ on $\AA_t$, $t\in T$, with_
$$
	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}, t\le u.
$$
(Note $Y = E[X|\AA]$ if and only if $Y(P|_\AA) = (XP)|_\AA$ when $P$ is a positive measure with mass 1.)

__Claim__. _If $M_t = M_u|_{\AA_t}$, $t\le u$, is a $\RR^I$-valued_ martingale measure _and
$D_t\in ba(A_t)$ are positive measures then
${X_t D_t = M_t - \sum_{s\le t} C_s D_s}$ is arbitrage-free_.

__Example__. (Black-Scholes/Merton) $M_t = (r, se^{\sigma B_t - \sigma^2t/2})P$, $D_t = e^{-\rho t}P$ where
$P$ is Wiener measure.

<!--
__Example__. (LIBOR Market Model) _If repurchase agreements are available with price 1 at $t$
and pay $e^{f_t\,dt}$ at time $t$ then the_ stochastic discount _$D_t = e^{-\int_0^t} f_s\,ds}$ is a deflator_.
-->

__Lemma__. _With the above notation_
$$
	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}, t\le u.
$$

**Trading strategies create synthetic instruments where price corresponds
to value and cash flow corresponds to account.**

A (cash settled) derivative contract is specified by stopping times ${\hat{\tau}_j}$ and cash
flows $\hat{A}_j$.  If there exists a trading strategy
$(\tau_j,\Gamma_j)$ with ${\sum_j \Gamma_j = 0}$, ${A_{\hat{\tau}_j} = \hat{A}_j}$
and ${A_t = 0}$ (self-financing) otherwise, then a perfect hedge exists[^4].
The value of the derivative is determined by
$$
	V_t D_t = (\sum_{\hat{\tau}_j > t} \hat{A}_j D_{\hat{\tau}_j})|_{\AA_t}.
$$
Note the right hand side is determined by the contract specifications and $(D_t)$.
Assuming $\tau_0 = 0$, $V_0 = \Gamma_0\cdot X_0$ so the initial hedge $\Gamma_0$ is the Fréchet 
derivative $D_{X_0}V_0$ with respect to $X_0$.
Since $V_t = (\Gamma_t + \Delta_t)\cdot X_t$ we have
$\Gamma_t = D_{X_t}V_t - \Delta_t$. Note $\Delta_t$ is settled prior to time $t$.
This does not specify the trading times $\tau_j > 0$[^5].

[^1]: A partition of $\Omega$ is a collection of pairwise disjoint sets with union $\Omega$.
If $\AA$ is a finite algebra of sets on $\Omega$ then the atoms of $\AA$ form a partition
of $\Omega$. Partial information is knowing which atom $\omega\in\Omega$ belongs to.
A function $X\colon\Omega\to\RR$ is $\AA$-measurable if and only if it is constant on atoms
so $X$ _is_ a function on the atoms of $\AA$.

[^2]: Prices _are_ bounded. There is a finite amount of money in the world.
Likewise for the number of shares it is possible to trade.

[^3]: The dual of bounded functions $B(\Omega)^* \cong ba(\Omega)$ is the space
of finitely additive measures on $\Omega$. $L\in B(\Omega)^*$ corresponds to
the measure $\lambda(E) = L1_E$. If $P$ is a positive measure with mass 1 then
$Y = E[X|\AA]$ if and only if $Y(P|_\AA) = (XP)|_\AA$.

[^4]: A perfect hedge never exists.

[^5]: Continuous time trading is impossible.
