<!--
:!pandoc -t html5 -s --katex=https://cdn.jsdelivr.net/npm/katex@0.12.0/dist/ --css math.css ums.md -o ums.html
:!pandoc -V fontsize=12pt ums.md -o ums.pdf
-->
---
title: Simple Unified Model
abstract: Arbitrage-free prices are constrained by cash flows.
classoption: fleqn
header-includes:
	- \usepackage{bm}
...
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}
\newcommand\NN{\bs{N}}
\renewcommand\AA{\mathcal{A}}
\newcommand\PP{\mathcal{P}}
\newcommand\GG{\mathcal{G}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\ran}{\operatorname{ran}}
\renewcommand{\ker}{\operatorname{ker}}

Let $\Omega$ be a sample space representing all possible instrument prices.
Information at time $t$ is modelled by a partition $\AA_t$ of $\Omega$. We assume
$\AA_u$ is a refinement of $\AA_t$ whenever $u > t$.
The possible _trading times_ $T$ are a subset of the real numbers.
To avoid doubling strategies [@HarKre1979]
we assume $\epsilon = \inf\{|t - u|\mid t,u\in T, t\not=u\} > 0$.
Finally, let $I$ be the set of all market instruments.

We use $B(\Omega)$ for the space of bounded functions on $\Omega$.
Recall its vector space dual can be identified with the space of
finitely addititve measures on $\Omega$ denoted $ba(\Omega)$.

## Market

Every instrument has prices and cash flows indexed by $T$.
We assume instruments can be bought or sold in any amount at time $t$
with _price_ $X_t\in B(\Omega,\RR^I)$, $t\in T$.
_Cash flows_ associated with owning an instrument are $C_t\in B(\Omega,\RR^I)$ at time $t\in T$.
Examples of cash flows are stock dividends, bond coupons, and margin adjustements from futures.
The price of a futures contract is always zero.
Usually $C_t = 0$ for all but a finite number of times $t\in T$.

## Trading

A _trading strategy_ is a finite number of strictly increasing stopping times
$\tau_j\colon\Omega\to T$, $0\le j\le n$,
and number of shares to buy at $\tau_j$ denoted $\Gamma_j\colon\Omega\to\RR^I$ where
$\Gamma_j$ is constant on $\{\tau_j = t\}$ for all $t\in T$.
Shares accumulate to position $\Delta_t = \sum_{\tau_j < t} \Gamma_j$. Note the
strict inequality. Trades take some time to settle before becoming part of the position.
We also write this as $\Delta_t = \sum_{s < t} \Gamma_s$ where $\Gamma_s = \Gamma_j$ when $s = \tau_j$
and is zero otherwise. Note $\Delta_t + \Gamma_t = \Delta_u$ for $u > t$ and $u - t$ sufficiently small.

## Accounting

The _value_, or _mark-to-market_, of a position is how much you would make if you
liquidated at current prices, ${V_t = (\Delta_t + \Gamma_t)\cdot X_t}$. You don't own
$\Gamma_t$ at time $t$ but you will at $t + \epsilon$ and should be accounted for.
The _amount_ associated with a trading strategy at time $t$
is ${A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t}$: you receive cash flows proportional
to your position and have to pay for trades just executed.

## Arbitrage

We define arbitrage (for this model) as the existence of a trading strategy 
that closes out ($\sum_j \Gamma_j = 0$) with $A_{\tau_0} > 0$
and $A_t\ge0$, for $t > \tau_0$: you make money on the first trade and
never lose money therafter. If you don't require the strategy to close out
then borrowing a dollar every day would be an arbitrage.
Note our definition of arbitrage does not involve a probablility measure.

__Theorem__. (Fundamental Theorem of Asset Pricing.) _The Simple Unified Model is
arbitrage free if and only if there exist a_ deflator _, positive measures $D_t$ in $ba(\AA_t)$, $t\in T$, with_
$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}, t\le u
$$
_where $|$ indicates restriction of measure_.

__Lemma__. _Using the above definitions_
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}, t\le u.
$$

**Trading strategies create synthetic instruments where price corresponds
to value and cash flow corresponds to amount.**

_Proof_: We have ${X_t D_t = (X_u D_u + C_u D_u)|_{\AA_t}}$ and
${\Delta_t + \Gamma_t = \Delta_u}$ for some $u\in T$ 
with ${u - t \ge \epsilon}$ sufficiently small.

We have
$$
\begin{aligned}
V_t D_t &= (\Delta_t + \Gamma_t)\cdot X_t D_t \\
	&= (\Delta_u\cdot X_u D_u + \Delta_u C_u D_u)|_{\AA_t} \\
	&= (\Delta_u\cdot X_u + (\Gamma_u\cdot X_u + A_u)D_u|_{\AA_t} \\
	&= (\Delta_u + \Gamma_u)\cdot X_u + A_u)D_u|_{\AA_t} \\
	&= (V_u + A_u)D_u|_{\AA_t} \\
\end{aligned}
$$
The lemma follows by finite induction since $\epsilon > 0$.

We say $(M_t)_{t\in T}$ is a martingale measure if $M_t\in ba(\AA_t)$
and $M_t = M_u|_{\AA_t}$ for $u > t$.

__Lemma__. _If $(M_t)_{t\in T}$ is an $\RR^I$-valued martingale
measure and $D_t\in ba(\AA_t)$ are positive then_
$$
	X_t D_t = M_t - \sum_{s\le t} C_s D_s
$$
_is an arbitrage-free model of prices and cash flows_.

_Proof_: Since ${V_{\tau_0} = (\sum_{u > \tau_0} A_u D_u)|_{\AA_t}}$ and
if $A_t \ge 0$ for $t > \tau_0$ then $V_{\tau_0} \ge 0$.
Since $\Delta_{\tau_0} = 0$ we have ${V_{\tau_0} = \Gamma_{\tau_0}\cdot X_{\tau_0}}$
and ${A_{\tau_0} = -\Gamma_{\tau_0}\cdot X_{\tau_0}}$ so ${A_{\tau_0} = -V_{\tau_0} \le 0}$.
This shows the model is arbitrage-free and proves the "easy" direction of the FTAP.
The contrapositive involves the Hahn-Banach theorem, but given the plethora of
arbitrage-free models why bother?

## Derivative

A (cash settled) derivative contract is specified by stopping times ${\hat{\tau}_j}$ and cash
flows $\hat{A}_j$.  If there exists a trading strategy
$(\tau_j,\Gamma_j)$ with ${\sum_j \Gamma_j = 0}$, ${A_{\hat{\tau}_j} = \hat{A}_j}$
and ${A_t = 0}$ (self-financing) otherwise, then a perfect hedge exists.
The value of the derivative instrument is determined by
$$
\tag{3}	V_t D_t = (\sum_{\hat{\tau}_j > t} \hat{A}_j D_{\hat{\tau}_j})|_{\AA_t}.
$$
Note the right hand side is determined by the contract specifications and deflator.
Assuming $\tau_0 = 0$, $V_0 = \Gamma_0\cdot X_0$ so the initial hedge $\Gamma_0$ is the Fréchet 
derivative $D_{X_0}V_0$ with respect to $X_0$.
Since $V_t = (\Gamma_t + \Delta_t)\cdot X_t$ we have
$\Gamma_t = D_{X_t}V_t - \Delta_t$. Note $\Delta_t$ is settled prior to time $t$.
This does not determine the trading times $\tau_j$.

## Examples

The Black-Scholes[@BlaSch1973] and Merton[@Mer1973] model has
$\Omega = C[0,\infty)$, $T = [0,\infty)$ with
instruments a bond and a stock having no associated cash flows.
Our martingale measure
is $M_t = (r, se^{\sigma B_t - \sigma^2t/2})P$ where $(B_t)$ is
Brownian motion and $P$ is Weiner measure. The deflator is $D_t = e^{-\rho t}P$.

If repurchase agreements are availble they determine a _canonical deflator_.
A repurchase agreement over the interval $[t_j, t_{j+1}]$ is specified
by a rate $f_j$ known at time $t_j$. The price at $t_j$ is $1$ and it
has a cash flow of ${\exp(f_j\Delta t_j)}$ at time $t_{j+1}$
where $\Delta t_j = t_{j+1} - t_j$.
By equation (1) we have ${D_j = \exp(f_j\Delta t_j)D_{j+1}|_{\AA_j}}$.
If $D_{j+1}$ is known at time $t_j$ then ${D_{j+1} = \exp(-f_j\Delta t_j)D_j}$ and
${D_n = \exp(-\sum_{j < n} f_j\Delta t_j) D_{t_0}}$ is the canonical deflator
at time $t_n$.

The continuous time analog is $D_t = \exp(-\int_0^t f_s\,ds)D_0$ where
$f$ is the continuously compounded instantaneous forward rate.
This is commonly referred to as the _stochastic discount_.

## Notes

The set exponential $B^A$ is the set of all functions from $A$ to $B$.
For any set $I$, $\RR^I$ is a vector space with scalar multiplication
and vector addition defined pointwise.

If $\AA$ is a sigma algebra on $\Omega$ then it is an algebra. If it is finite
then the atoms of $\AA$ form a partition of $\Omega$. In this case
a function $X\colon\Omega\to\RR$ is $\AA$-measurable if and only if
$X$ is constant on atoms of $\AA$. In this case it is a function on
the atoms of $\AA$ and write $B(\AA)$.

Our definition of arbitrage is not sufficient. Recall $A_0 = -\Gamma_0\cdot X_0$.
Even if this is strictly positive traders and risk managers will compare it
to $|\Gamma_0|\cdot|X_0|$ as a measure of how much capital will be tied up
in the trading strategy. 
