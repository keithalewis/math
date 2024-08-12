---
title: Unified Model
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Value, hedge, and manage the risk of derivative instruments.
...

\newcommand{\RR}{\boldsymbol{R}}
\newcommand{\ZZ}{\boldsymbol{Z}}
\renewcommand{\AA}{{\mathcal{A}}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

This note provides a replacement for the Black, Scholes[@BlaSch1973]
and Merton[@Mer1973] theory of option valuation. Scholes and Merton won
a Nobel Prize in Economics for showing how value a derivative instrument
using dynamic hedging: the value of an option is the cost of setting
up the initial hedge.
Their assumption of continuous time trading is not realistic
and leads to paradoxical results[^1].
It is a mathematical artifact of the theory of Ito processes
and duped many people in the academic world into believing complete markets and
perfect hedges exist.

The Unified Model is an extension of Stephen Ross'[@Ros1978] "A Simple
Approach to the Valuation of Risky Streams". According to Ross

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator, $L$_.

He used the Hahn-Banach theorem to show the existence of $L$
and observed it is not necessarily unique when the market is not complete.
This set off a cottage industry of mathematical nitpickers pointing out
he had not established the existence of an interior point required for
its application.  This culminated in Delbaen and Schachermeyer's No Free
Lunch with Vanishing Arbitrage theorem to get around the 
fact that the unit ball in the $L^\infty$ weak-$*$ topology does not have an
interior point, something no trader has ever found useful for doing their job.

<!--
Eventually this was called the _Fundamental Theorem of Asset Pricing_.
-->
In physics, when a theory does not agree with observation it time to
come up with a new theory.

> _Für die Richtung des dabeieinzuschlagenden Gedankenganges giebt der
  Hinblick auf dieUnhaltbarkeit der früher gemachten Voraussetzung einen
  Finger-zeig_. -- Max Planck

> _The untenability of the assumption made earlier provides an indication
  of the direction of the line of thought to be taken_.

The untenable assumption of the Black-Scholes/Merton theory is that
continous time trading is possible. The indicated direction is
to provide a theory reflecting the fact traders decide at
discrete times, based on available information, what to trade.

The Unified Model does not require the Hahn-Banach theorem.  It also
does not involve a so-called real-world probability measure that
is immediately throw out to get a risk-neutral probability measure.
It does not involve stochastic integrals, the Ito formula, partial differential equations,
much less weak-$*$ topologies. It does not even involve probability.

The Fundamental Theorem of Asset pricing is a geometric fact.
Positive measures having mass 1 show up, but they are not the probability of anything.

Every arbitrage-free model is determined by _deflators_ that correspond
to Ross' valuation operator $L$ and a _martingale measure_.
Market instruments have prices and associated cash flows.
Trading involves buying instruments at discrete times.

This note does not solve the crucial problem of when and how much to
trade. It only provides an elementary and mathematically rigorous
framework to put your nose in the most important unsolved problem in
Mathematical Finance.

[^1]: Merton provided a closed form solution for valuing
barrier options based on the reflection principal of Brownian motion.
[@cite]. The classical theory implies the
value of a barrier option that knocks in or out the second
time the barrier is hit has the same value.
It also implies the value of a barrier option that knocks in
or out the millionth time it hits the barrier has exactly
the same value. This is just a mathematical artifact of the
properties of Brownian motion.

## Unified Model

We assume you are familiar with measure theory and stochastic
processes, but are not necessarily an expert.
The Preliminaries section explains all the mathematics
required.
The Unified Model places Ross's seminal work on a firm mathematical
foundation. It does not involve the Hahn-Banach
theorem. 
It also does not involve probability measures,
Brownian motion, the Ito formula, or partial differential equations.
As Ross observed, the Fundamental Theorem of Asset Pricing involves only
geometry, not probability.  The Unified Model can be used for _any_ collection
of instruments to value, hedge, and understand how poorly risk-neutral
pricing can be used for managing risk. It does not provide a solution,
only an initial framework for further research. 

<details><summary>Preliminaries</summary>
Let $\Omega$ be a set of possible outcomes. _Partial information_ is modeled
by a partition of $\Omega$. A collection of subsets of $\Omega$, $\{A_j\}$,
is a _partition_ if they are pairwise disjoint and their union is $\Omega$.
Full information is knowing $\omega\in\Omega$. Partial information is
knowing only to which atom $\omega$ belongs.
No information is modeled by the singleton partition $\{\Omega\}$.

An _algebras of sets_ is a collection of sets
closed under union and complement.

__Exercise__. _Show algebras of sets are closed under intersection_.

_Hint_: Let $A' = \Omega\setminus A = \{\omega\in\Omega\mid \omega\not\in A\}$
be the set complement of $A$ in $\Omega$.
Use De Morgan's Law $(A\cap B)' = A'\cup B'$.

We can identify a set $A$ with its _indicator function_ $1_A\colon\Omega\to\RR$
defined by $1_A(\omega) = 1$ if $\omega\in A$ and $1_A(\omega) = 0$ if $\omega\not\in A$.
Note $1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$, $1_{A'} = 1 - 1_A$, and
$1_{A\cap B} = 1_A 1_B$,

__Exercise__. _Prove De Morgan's Law_.

_Hint_: Start from $1_{A'\cup B'} = 1_{A'} + 1_{B'} - 1_{A'\cap B'}$.

Calculations on algebras of sets is algebra.

If $\AA$ is a finite algebra of sets on $\Omega$ then
$[\omega] = \cap\{A\in\AA\mid\omega\in A\}$ is the _atom_ of $\AA$ containing ${\omega\in\Omega}$.

__Exercise__. _If $B\subseteq[\omega]$ and $B\in\AA$ then
$B = \emptyset$ or $B = [\omega]$_.

__Exercise__. _The atoms of $\AA$, $[\AA]$, form a partition of $\Omega$_.

This shows we can identify a finite algebra of sets with its atoms.

A function $X\colon\Omega\to\RR$ is $\AA$-_measurable_
for an algebra of sets $\AA$
if $\{\omega\in\Omega\mid X(\omega) \le x\}$ belongs to $\AA$
for all $x\in\RR$.

__Exercise__. _If $\AA$ is finite, show $X$ is $\AA$-measurable
if and if and only if it is constant on atoms of $\AA$_.

This shows $X\colon[\AA]\to\RR$ _is_ a function.
We jettison the word 'measurable' and say $X$ _is known given_ $\AA$.

### Integration

Integration is a _linear functional_: it assigns a function to a number
where a constant times a function is assigned to the constant
times the integral and the integral of the sum of two functions
is the sum of the integrals. Integration involves _measures_.
A finitely-additive measure is a _set function_ $\lambda\colon\AA\to\RR$ satisfying
$\lambda(A\cup B) = \lambda(A) + \lambda(B) - \lambda(A\cap B)$
and $\lambda(\emptyset) = 0$. Measures don't count things
twice and the measure of the empty set is 0.

If $S$ is a set and $f\colon S\to\RR$ is a function on $S$ define
its _norm_ $\|f\| = \sup_{s\in S} |f(s)\|$.
Let $B(S) = \{f\colon S\to\RR\mid \|f\| < \infty\}$ be the
_normed linear space_ of bounded functions on $S$.
The _dual_ of $B(S)$, $B(S)^*$, is the set of all
_bounded linear functionals_ $L\colon B(S)\to\RR$.
A linear functional is bounded if there exists a constant $M\in\RR$
with $|Lf| \le M\|f\|$ for all $f\in B(S)$.
The least such constant is the _norm_ of $L$, $\|L\|$.

Every bounded linear functional gives rise to a finitely-additive
measure $\lambda$ on $S$ by $\lambda(A) = L1_A$.
Let $ba(S)$ denote all finitely-additive measures on $S$.  We now show
how to identify $B(S)^*$ with $ba(S)$.

__Exercise__: _Show $\lambda$ is a measure_.

Every finitely-additive measure gives rise to a linear functional.
We say $f$ is _elementary_ if it is a finite linear combination
of indicator functions $f = \sum_j a_j 1_{A_j}$.
Given a measure $\lambda$ define $Lf = \sum_j a_j \lambda(A_j)$.

__Exercise__. _If $\{A_j\}$ are pairwise disjoint show $Lf = 0$
implies $f = 0$_.

__Exercise__. _Show for any collection $\{B_i\}$ we have $\sum_i b_i 1_{B_i} = \sum_j a_j 1_{A_j}$
where $\{A_j\}$ are pairwise disjoint_.

_Hint_: Use $1_{E\cup F} = 1_{E\setminus F} + 1_{F\setminus E} - 1_{E\cap F}$
and induction.

This shows $L$ is _well-defined_ for elementary functions.

__Exercise__. _Given any bounded function $g$ and $\epsilon > 0$ there
exists an elementary function $f$ with $\|g - f\| < \epsilon$_.

_Hint_: Let $a_n = f(n\epsilon)$ and $A_n = f^{-1}([n\epsilon, (n + 1)\epsilon))$.

This shows the set of elementary functions is _dense_ in $B(S)$.
We can extend the definition from elementary
functions to all of $B(S)$ since $L$ is bounded

__Exercise__: _If $f\in B(S)$ and $\lim_n f_n = f$
then $\lim_n Lf_n = Lf$_.

_Hint_ Use $L$ is bounded.

This defines the _integral_ $Lf = \int_S f\,d\lambda$.

We can define a norm on $ba(S)$ by $\|\lambda\| = \sup_{\{A_j\}} |\lambda(A_j)|$
where the supremum is over all pairwise disjoint subsets of $S$.

__Exercise__. _Show $\|\lambda\| = \|L\|$_.

If $S$ is finite then $B(S)$ can be identified with $\RR^S = \{f\colon S\to\RR\}$
where $s\mapsto  f(s)$.
Similarly, $ba(S)$ can be identified with $\RR^S = \{\lambda\colon S\to\RR\}$
where $\{s\}\mapsto \lambda(\{s\})$.
This is good news when it comes to computer implementation,
everything is just a finite vector of numbers.

### Probability

The Unified Model does not involve probability, however as an
aid to those schooled in the classical theory we will reconnoiter
some elementary facts.

A _probability measure_ is a positive measure with mass 1.
If $P$ is a probability measure on $\Omega$
then any function $X\colon\Omega\to\RR$ is a _random variable_.
The _expected value_ of $X$ is $E[X] = \int_\Omega X\,dP$.

The _conditional probability_ of $B$ given $A$ is
$P(B\mid A) = P(B\cap A)/P(A)$ for $B,A\subseteq\Omega$.

__Exercise__. _Show $B\mapsto P(B\mid A)$ is a probability measure on $A$_.

This can be generalized to the conditional expectation of a random
variable given an algebra of sets. We say $Y = E[X\mid\AA]$ if
$Y$ is known given $\AA$ and $\int_A Y\,dP = \int_A X\,dP$ for
all $A\in\AA$.

If $X$ is a random variable and $P$ is a measure we can define the
measure $XP$ by $(XP)(A) = \int_A X\,dP$.

__Exercise__. _Show $XP$ is a measure_.

__Exercise__ _Show if $X\ge 0$ and $E[X] = 1$ then $XP$ is a probability measure_.

_Hint_: Show $XP$ is positive and $(XP)(\Omega) = 1$.

__Exercise__. _Show $Y = E[X|\AA]$ if and only if $Y(P|_\AA) = (XP)|_\AA$_.

_Hint_: If $P$ is a measure on $\Omega$ then $P|_\AA$ is the restriction
of the measure to $\AA$.

__Exercise__. _Show if $A$ is an atom of $\AA$ then $E[X\mid\AA](A) = \int_A X\,dP/P(A)$_.

Conditional expectation is the average over each atom.

</details>

Let $T$ be the set of trading times, $I$ the set of all market
instruments, $\Omega$ the sample space of possible outcomes, and
$(\AA_t)_{t\in T}$ be algebras of sets on $\Omega$ indicating the
information available at each trading time.

Recall $\RR^I = \{f:I\to\RR\}$ is the vector space of all functions from $I$ to $\RR$.

If $\AA_t$ is a finite algebra of sets define $[\omega] = \cap\{A\in\AA\mid \omega\in A\}$
to be the _atom_ containing $\omega$.
The set of atoms of $\AA$ is $[\AA] = \{[\omega]\mid \omega\in\Omega\}$.
Recall $f\colon\AA\to\RR$ is measurable if and only if it is constant on atoms.
In this case $f\colon[\AA]\to\RR$ _is_ a function and we
say $f$ is _known_ given $\AA$.

### Market

_Price_ -- $X_t\colon[\AA_t]\to\RR^I$
market prices assuming perfect liquidity.

_Cash flow_ -- $C_t\colon[\AA_t]\to\RR^I$
dividends, coupons, margin adjustments for futures.

### Trading

_Trading Strategy_ -- $\tau_0 < \cdots < \tau_n$ stopping times
and trades $\Gamma_j\colon[\AA_{\tau_j}]\to\RR^I$

_Position_ -- $\Delta_t = \sum_{\tau_j < t}\Gamma_j = \sum_{s < t} \Gamma_s$
accumulate trades _not_ including last.

### Accounting

_Value_ -- $V_t = (\Delta_t + \Gamma_t)\cdot X_t$
mark-to-market existing positions and current trades at current prices.

_Account_ -- $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$
receive cash flows proportional to existing positions and pay for trades just executed.

### Arbitrage

_Arbitrage_ exists if there is a trading strategy
with $A_{\tau_0} > 0$, $A_t \ge 0$, $t > \tau_0$, and $\sum_j \Gamma_j = 0$.
The first trade makes money and subsequent trades never lose money.
Eventually the position must be closed out.

The Fundamental Theorem of Asset Pricing states there is no arbitrage if and only
if there exist _deflators_, positive measures $D_t$ on $\AA_t$, ${t\in T}$, with
$$
\tag{1} X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}
$$
A _martingale measure_ satisfies $M_t = M_u|\AA_t$ for $t \le u$.
Note if cash flows are zero then deflated prices are a martingale measure.
If there are a finite number of cash flows then prices are
determined by deflated future cash flows.

__Lemma__. If $X_t D_t = M_t - \sum_{s\le t} C_s D_s$ where $M_t$ is a martingale measure
then there is no arbitrage.

_Proof_: Replace $X_u D_u$ by $M_u - \sum_{s\le u} C_s D_s$ in equation (1).

__Lemma__. For any arbitrage free model and any trading strategy
$$
\tag{2}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}
$$

_Proof_. Use $\Delta_t + \Gamma_t = \Delta_{t + \epsilon}$ if $\epsilon > 0$
is sufficiently small.

Note how the value $V_t$ corresponds to price $X_t$ and account $A_t$
corresponds to $C_t$ in equations (2) and (1) respectively.
Trading strategies create synthetic market instruments.

_Equations (1) and (2) are the skeleton keys to pricing derivative securities_.

## Application

Suppose a derivative security specifies amounts $\overline{A}_j$ be paid at times $\overline{\tau}_j$.
If there is a trading strategy $(\tau_j, \Gamma_j)$
with $A_{\overline{\tau}_j} = \overline{A}_j$ for all $j$ and $A_t = 0$ otherwise (aka self-financing) then
a "perfect hedge" exists[^2].

[^2]: Perfect hedges never exist.

Note $V_t D_t = (\sum_{\tau_j > t} \overline{A}_j D_{\overline{\tau}_j})|_{\AA_t}$
can be computed from the derivative contract specification and the deflators $D_t$.
Since we also have $V_t = (\Delta_t + \Gamma_t)\cdot X_t$,
the Frechet derivative $D_{X_t}V_t$
of option value with respect to $X_t$
is $\Delta_t + \Gamma_t$ so $\Gamma_t = D_{X_t}V_t - \Delta_t$.
Since $\Delta_t$ is known at time $t$, this gives a recipe for
computing a trading strategy.
In general this hedge will not exactly replicate the derivative contract obligation.

The Unified Model does not prescribe _when_ the hedge should be executed.
This is an important unsolved fundamental problem in the theory of Mathematical Finance.
The Black-Scholes/Merton solution is to hedge "continuously".
The notion of continuous time hedging is a mathematical myth.
Every trading strategy executed in the real world involves
only a finite number of trades.

Note delta hedging drops out naturally from the Unified Model, however it
does not require Ito's formula, much less a proof
involving partial differential equations and changing a measure that
is immediately discarded. One
simply writes down a martingale and deflator then uses equation (2)
to value, hedge, and manage the risk of realistic trading strategies.

### Black-Scholes/Merton

The Black-Scholes/Merton model uses ${M_t = (r, s\exp(\sigma B_t - \sigma^2t/2))P}$,
where $B_t$ is Brownian motion, $P$ is Wiener measure, and the deflator
is $D_t = \exp(-\rho t)P$.

More generally, if $X_t$ is a Levy process where $X_1$ has mean zero and variance one
then ${M_t = (r, s\exp(\sigma X_t - \kappa_t(\sigma)))P}$ is an arbitrage-free model,
where $\kappa_t(\sigma) = \log E[\exp(\sigma X_t)]$ is the cumulant.

Every positive random variable with finite mean and log variance can be
written ${F = f\exp(sX - \kappa(s))}$ where ${f = E[F]}$, ${s^2 = \Var(\log F)}$,
$X$ has mean zero and variance 1, and ${\kappa(s) = \log E[\exp(sX)]}$.

We have 
$$
\begin{aligned}
E[\max\{k - F, 0\}] &= E[(k - F)1(F \le k)] \\
	&= kP(F\le k) - E[F 1(F\le k)] \\
	&= kP(F\le k) - E[F] E[F/E[F] 1(F\le k)] \\
	&= kP(F\le k) - fP^*(F\le k) \\
\end{aligned}
$$
where $dP^*/dP = F/E[F]$.

__Exercise__. _If $X$ is standard normal show ${E[\max\{k - F, 0\}] = kN(m) - fN(m - s)}$
where $N$ is the standard normal cumulative distribution and $m = (\log(k/f) + s^2/2)/s$_.

_Hint_: Use $E[\exp(N)] = \exp(E[N] + \Var(N)/2)$ if $N$ is normal and
$E[\exp(N) g(M)] = E[\exp(N)] E[g(M + \Cov(M,N))]$ if $N$ and $M$
are jointly normal.

__Exercise__. _Show in general $E[{\max\{k - F, 0\}] = kP(X\le m) - fP^*(X\le m)}$
for any positive $F$ where ${m = (\log(k/f) + \kappa(s))/s}$
and $dP^*/dP = \exp(sX - \kappa(s))$_.

_Delta_ is derivative of value $v = E[\max\{k - F, 0\}]$ with respect to initial price.
$$
\begin{aligned}
	\partial v/\partial f &= E[-1(F \le k)\partial F/\partial f] \\
	\partial v/\partial f &= -E[1(F \le k)\exp(sX - \kappa(s))] \\
		&= -P^*(F \le k) \\
\end{aligned}
$$

__Exercise__. _If $X$ is standard normal show $P^*(F \le k) = N(-d_2)$ where ${d_2 = (\log f/k - s^2/2)/s}$_.

### Repurchase Agreements

A _repurchase agreement_ $R(f,t,\Delta t)$ has price $X_t^{R(f,t,\Delta t)} = 1$
at time $t$ and a single cash flow $C_{t+\Delta t} = \exp(f\Delta t)$ at
time $t + \Delta t$. The rate $f$ is a function known at time $t$.

### Deflator

If repurchase agreements are available then a _canonical deflator_ exists.
A repurchase agreement over the interval $[t_j, t_{j+1}]$ is specified
by a rate $f_j$ known at time $t_j$. The price at $t_j$ is $1$ and it
has a cash flow of ${\exp(f_j(t_{j+1} - t_j))}$ at time $t_{j+1}$.
By equation (1) we have ${D_j = \exp(f_j\Delta t_j)D_{j+1}|_{\AA_j}}$.
If $D_{j+1}$ is known at time $t_j$ then ${D_{j+1} = \exp(-f_j\Delta t_j)D_j}$ and
${D_n = \exp(-\sum_{j < n} f_j\Delta t_j) D_{t_0}}$ is the canonical deflator
at time $t_n$.

The continuous time analog is $D_t = \exp(-\int_0^t f(s)\,ds)D_0$ where
$f$ is the continuously compounded instantaneous forward rate.

### Zero Coupon Bond

A _zero coupon bond_ maturing at time $u$ has a unit cash flow at $u$,
$C_u^{D(u)} = 1$ and $C_t^{D(u)} = 0$ for $t\not=u$..
In an arbitrage free model its price at time $t\le u$, $X_t^{D(u)} = D_t(u)$
satisfies $D_t(u) D_t = D_u|_{\AA_t}$ so
$D_t(u)$ is the Radon-Nikodym derivative of $D_u|_{\AA_t}$ with respect to $D_t$.
Zero coupon bond prices are determined by the deflators.

A _fixed income_ instrument is a portfolio of zero coupon bonds.
If a bond pays $c_j$ at time $t_j$ its present value at time $t$ is
$$
	P_t = \sum_{t_j > t} c_j D_t(u_j).
$$

### Forward Rate Agreement

A _forward rate agreement_ with coupon $f$ over the interval $[u,v]$
having day count convention $\delta$[^4] has two cash flows: $-1$ at time $t$
and ${1 + f\delta(u,v)}$ at time $u$. The _par forward coupon_ at time
$t$, ${F_t^\delta(u,v)}$, is the coupon for which the price is 0 at time $t$.
By equation (1) we have
${0 = (-D_u + (1 + F_t^\delta(u,v))D_v|_{\AA_t}}$ so
$$
	F_t^\delta(u,v) = \frac{1}{\delta(u,v)}\left(\frac{D_t(u)}{D_t(v)} - 1\right).
$$

A _swap_ is a collection of back-to-back forward rate agreements involving times $(t_j)$.
The _swap par coupon_ making the price 0 at time $t$ is
$$
	F_t^\delta(t_0,\dots,t_n) = \frac{D_t(t_0) - D_t(t_n)}{\sum_{j=1}^n\delta(t_{j-1},t_j)D_t(t_j)}.
$$

__Exercise__. _Show if $n = 2$ the swap par coupon is the same as the par forward coupon_.

[^4]: The _day count fraction_ $\delta(u, v)$ is approximately $v - u$ in years.

### Risky Bonds

Companies can default and may pay only a fraction of the notional owed on bonds they issued.
A simple model[^3] for this is to assume the time of default $T$ and recovery $R$ are random variables.
The sample space for the default time is $[0,\infty)$ indicating the time of default.
The information available at time $t$ is the partition consisting of singletons
$\{s\}$, $s < t$ and the set $[t, \infty)$. If default occurs prior to $t$ then
we know exactly when it happened. If default has not occurred by time $t$ then
we only know it can occur any time after that.

[^3]: This is a very simplified model.

The cash flows for a risky bond $D^{T,R}(u)$ are 1 at time $u$ if $T > t$
and $RD_T$ at time $T$ if $T \le t$. For the model to be arbitrage-free we must have
$$
	D_t^{R,T}(u) D_t = \bigl(1(T > u)D_u + 1(T\le u)R D_T\bigr)|_{\AA_t}.
$$
Note if $T = \infty$ or $R = 1$ then ${D_t^{R,T}(u) = D_t(u)}$.

If the deflators are independent of the stopping time and recovery is $RD_T(u)$ at $T\le u$
for some constant $R$ then
using $D_T(u)D_T = D_u|_{\AA_T}$ for $T \le u$ we have
$$
	D_t^{T,R}(u) D_t P(T > t) = \bigl(P(T > u) + R P(t < T \le u)\bigr)D_u|_{\AA_t}
$$
The _credit spread_ $\lambda_t^{T,R}(u)$ is defined by
${D_t^{T,R}(u) = D_t(u)\exp(-\lambda_t^{T,R}(u) (u - t))}$.
In the above case
$$
	\lambda_t^{T,R}(u) = -\frac{\log(P(T > u) + R P(t < T \le u))}{u - t}.
$$



<!--
### Binomial Model

Let $W_n$ be (symmetric) random walk. The model for bond and stock is

$V_0 = E[\nu(S_n)]$

$\Gamma = (M, N)$.
-->


## Reference
