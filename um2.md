---
title: Unified Model for Derivative Instruments
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

We all know the classical Black-Scholes/Merton theory for option
pricing is imperfect. Market instruments are not perfectly liquid;
there is a bid-ask spread involved in transactions that tends to widen
as the amount traded increases.  Stock prices are discrete; they trade
in integer multiples of their smallest trading unit.  The most glaring
defect is the assumption continuous time trading is possible; every
hedge executed in the real world involves a finite number of trades.

One example showing the B-S/M model is untenable is a barrier option
that knocks in (or out) the second time it hits the barrier.  It has
exactly the same value in their model as a barrier option that knocks in
the first time.  It also has exactly the same value as a barrier option
that knocks in the millionth time.  This is a mathematical artifact of
the infinite oscillatory behavior of Brownian motion that has no basis
in financial reality.

The Unified Model provides a simple and mathematically rigorous model
that can be applied to _all_ instruments.  Instruments have prices and
cash flows associated with holding them.  A trading strategy involves
only a finite number of trades. Trades result in amounts being debited
or credited to a trading account and accumulate to a position in each
instrument. Nominal prices for instruments can be used to approximate
the value (mark-to-market) of the position.

A simple mathematical consequence of defining price, cash flow, value, and account is
that trading strategies create synthetic instruments. The value of the strategy
corresponds to the price of an instrument and the amounts in the
trading account correspond to cash flows.

This is the skeleton key to valuing, hedging, and managing the risk of derivatives.
A derivative is a contract. The buyer pays the seller to provide cash
flows at times specified in the contract. The Unified Model does not
solve the difficult problems involved with valuing, hedging, and
managing the risk faced by seller. It only provides a mathematically
rigorous notation for investigating this problem.

<!--

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

We write $X\in B(\AA)$ if $X\colon\AA\to\RR$ is a bounded $\AA$-measurable function.
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
-->
