 _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator, $L$_.---
title: A Basic Unified Model for Derivative Instruments
author: Keith A. Lewis
institute: KALX, LLC
fleqn: true
classoption: fleqn
abstract: Value, hedge, and manage the risk of any instruments
...

\newcommand{\RR}{\boldsymbol{R}}
\renewcommand{\AA}{{\mathcal{A}}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\Var}{\operatorname{Var}}
\newcommand{\Cov}{\operatorname{Cov}}

The Black-Scholes/Merton theory of option valuation has a serious flaw:
it assumes continous time trading is possible.
Only a finite number of trades can be executed based on
information available at the time of the trade.

[@Ros1978] extended the B-S/M theory to value any collection of instruments
and identified the condition for models to be arbitrage-free.

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator, $L$_.

Ross used the Hahn-Banach theorem to show arbitrage is a geometric notion
that has nothing to do with probability.
The proposed model puts Ross' theory on a firm mathematical basis by
identifying his valuation operator as a _deflator_: a set of
measures indexed by trading times. Not only are these not unique,
as Ross pointed out, the restriction to a finite number of trades
underscores the main unsolved problem of Mathematical Finance:
when and how much should you trade given available information?
This short note does not propose a solution to this, only a framework for further research.

## Physics

When observation does not agree with theory in physics, it is time
to come up with a new theory. Lord Kelvin claimed toward the end of the 19th century

> _There is nothing new to be discovered in physics now. All that remains is more and more precise measurement_.

The Rayleigh-Jeans law for black-body electromagnetic radiation fit experimental observation
for low temperatures, but was drastically wrong as the temperature increased.
Experiment did not agree with observation.

> _Für die Richtung des dabeieinzuschlagenden Gedankenganges giebt der
  Hinblick auf dieUnhaltbarkeit der früher gemachten Voraussetzung einen
  Finger-zeig_. -- Max Planck

> _The untenability of the assumption made earlier provides an indication
  of the direction of the line of thought to be taken_.

Max Planck showed it was possible to fit the observed data by assuming photons
could only be emitted in integer multiples of a minimal value. 
Planck's main contribution to science
was not his eponymous constant that fit the data, it was getting his contemporaries
to focus on understanding why that worked. The result was
the development of quantum mechanics.

Stock prices also trade in integer multiples of a minimal value.
This does not necessarialy imply results from quantum mechanics
can be applied to mathematical finance.

## Mathematical Finance

There is something drastically wrong with the Black-Scholes/Merton
theory due to their assumption of continuous time trading.
Merton provided a closed form formula for the
value of barrier options in [@Mer1973] using the reflection principal
for Brownian motion.
A preposterous mathematical artifact of using Ito's theory is that it implies
the value of a barrier option does not change if it
knocks in (or out) the second, third, or even the millionth time it is hit.

This untenable conclusion can be avoided by accepting the fact that
every hedging strategy involves only a finite number of trades.
There are no perfect hedges, something every derivative trader knows after
the first week on the job. They just want to know what initial hedge
to put on, and when and how much to adjust the initial hedge over time to
replicate the derivative contract obligations.
Half a century on from B-S/M, the mathematical finance community has not been
able to come up with a mutually agreeable answer to this fundamental problem. 

Another pernicious influence of the B-S/M model that [@Ros1978] 
pointed out was arbitrage-free models have nothing to do with probability,
they only involved geometry. We eliminate the use of the Hahn-Banach
theorem and show his linear valuation operator corresponds to a collection
of positive measures indexed by trading time.

Market instruments are not perfectly liquid; there is a bid-ask spread
involved in transactions that tends to widen as the amount traded
increases.  Stock prices are discrete; they trade in integer multiples of
their smallest trading unit. The price of an instrument can also depend
on the credit worthiness of the counterparties involved in a trade.
The Basic Unified Model does not address these salient market realities.

The Basic Unified Model does provide a simple and mathematically rigorous
model that can be applied to _all_ instruments.  Instruments have prices
and cash flows associated with holding them.  A trading strategy involves
only a finite number of trades based on available information. Trades
result in amounts being debited or credited to a trading account
and accumulate to a position in each instrument. Nominal prices for
instruments can be used to approximate the value (mark-to-market) of
the position.

An elementary mathematical consequence of defining price, cash flow, value, and account is
that trading strategies create synthetic instruments. The value of the strategy
corresponds to the price of an instrument and the amounts in the
trading account correspond to cash flows.
This is the skeleton key to valuing, hedging, and managing the risk of derivatives.
A derivative is a contract. The buyer pays the seller to provide cash
flows at times specified in the contract. The Basic Unified Model does not
solve the difficult problems involved with valuing, hedging, and
managing the risk faced by seller. It only provides a mathematically
rigorous notation for investigating this problem.

## Preliminaries

<details><summary>Details</summary>

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
We jettison the word 'measurable' and say $X$ is _known given_ $\AA$.

<!--
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
its _norm_ $\|f\| = \sup_{s\in S} |f(s)|$.
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
We say $f$ is _simple_ if it is a finite linear combination
of indicator functions $f = \sum_j a_j 1_{A_j}$.
Given a measure $\lambda$ define $Lf = \sum_j a_j \lambda(A_j)$.

__Exercise__. _If $\{A_j\}$ are pairwise disjoint show $Lf = 0$
implies $f = 0$_.

__Exercise__. _Show for any collection $\{B_i\}$ we have $\sum_i b_i 1_{B_i} = \sum_j a_j 1_{A_j}$
where $\{A_j\}$ are pairwise disjoint_.

_Hint_: Use $1_{E\cup F} = 1_{E\setminus F} + 1_{F\setminus E} - 1_{E\cap F}$
and induction.

This shows $L$ is _well-defined_ for simple functions.

__Exercise__. _Given any bounded function $g$ and $\epsilon > 0$ there
exists an simple function $f$ with $\|g - f\| < \epsilon$_.

_Hint_: Let $a_n = f(n\epsilon)$ and $A_n = f^{-1}([n\epsilon, (n + 1)\epsilon))$.

This shows the set of simple functions is _dense_ in $B(S)$.
We can extend the definition from simple
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
-->

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

__Exercise__. _Show if $A$ is an atom of $\AA$ and $P(A)\not=0$ then $E[X\mid\AA](A) = \int_A X\,dP/P(A)$_.

Conditional expectation is the average over each atom.

</details>


## Market Model

Every _instrument_ has a _price_ $X_t$ and a _cash flow_ $C_t$ at any
trading time $t\in T$.  Instruments are assumed to be perfectly liquid:
they can be bought or sold at the given price in any amount. Cash flows
are associated with owning an instrument and are almost always 0; stocks
have dividends, bonds have coupons, currencies have no cash flows,
commodities have storage costs.
European options have exactly one cash flow at expiration.

Let $T$ be a totally ordered set of trading times,
$I$ the set of all market instruments, $\Omega$ the sample space of possible outcomes,
and $\AA_t$ an algebra of sets modeling information available at time $t\in T$.
Prices and cash flows are bounded $\AA_t$-measurable functions
${X_t, C_t\colon\Omega\to\RR^I}$, ${t\in T}$.

We write $X\in B(\AA)$ if $X\colon\Omega\to\RR$ is a bounded $\AA$-measurable function.
Note if $\AA$ is finite then its atoms are a partition of $\Omega$ and being
$\AA$-measurable is equivalent to $X$ being constant on atoms.
In this case $X\colon\AA\to\RR$ is standard mathematical notation
for a function when $\AA$ is identifed with its atoms.

## Trade

Traders buy and sell shares based on information available at each trading time.
They trade a finite number of times and eventually close out all postions.

A _trading strategy_ is a finite collection of strictly increasing
stopping times $(τ_j)$ and trades $(\Gamma_j)$ where
$\Gamma_j:\AA_{τ_j}\to \RR^{I}$ indicating the number of shares to trade
in each instrument at time $τ_j$. If $\tau$ is a stopping time then
$\AA_\tau = \{A\in\AA_t\mid  t\in T, t\le\tau\}$. 

Trades accumulate to a _position_
$\Delta_t = \sum_{τ_j < t}\Gamma_j = \sum_{s < t}\Gamma_s$ where
$\Gamma_s(\omega) = \Gamma_j(\omega)$ when $s = τ_j(\omega)$, $\omega\in\Omega$. 
A trade at time $t$ is not included in the position at time $t$;
it takes some time for trades to settle.

## Value

XXX

The _value_, or mark-to-market is $V_t = (\Delta_t + \Gamma_t)\cdot X_t$.
It is the amount that would result from closing out the entire position
at current market prices, assuming that is possible.
The trading _account_ is $A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t$;
cash flows propostional to existing positions are credited and the
cost of the trade at time $t$ is debited.

## Arbitrage

_Arbitrage_ exists if there is a trading stragegy $(\Gamma_t)_{t\in T}$
with $A_0 < 0$, $A_t \ge 0$, $t > 0$, and $\sum_{t} \Gamma_t = 0$.

__Theorem__. (_Funamental Theorem of Asset Pricing_) There is no arbitrage if and only
if there exist positive measures $(D_t)_{t\in T}$ on $\Omega$ with
$$
	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}
$$

__Lemma__. For any arbitrage free model and any trading strategy
$$
	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}
$$

__Lemma__. If $X_t D_t = M_t - \sum_{s\le t} C_s D_s$ where $M_t = M_u|_{\AA_t}$, $t \le u$
then there is no arbitrage.

For those paying attention...
What about bid-ask spread? Use limit orders.

## References
