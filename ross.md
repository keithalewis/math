---
title:  Stephen Ross
author: Keith A. Lewis
abstract: Risky Streams of Cash Flows
classoption: fleqn
fleqn: true
---
\newcommand\RR{\bs{R}}
\renewcommand\AA{\mathcal{A}}

[@Ros1978] showed how to value uncertain future cash flows.
His two main results are:

1. There is no need for probability, only geometry.

2. The theory applies to any portfolio of instruments.

Perhaps this was too astonishing for people to appreciate.
There is no need for Brownian motion or Ito processes,
much less partial differential equations.
It applies to _any_ portfolio of instruments, not just
the bond, stock, and option [@BlaSch1973] and [@Mer1973] considered.

Ross's definition of a cash flow was a jump in stock price.
Stock prices jump between close and open but there is no dividend payment involved.
Fixed Income bonds are defined by their cash flows. Futures always have
price zero with cash flows the difference of their daily quotes.
Adding a knob for cash flows to Ross's theory leads to
a model that maps more closely to practical implementation. 

## Market

Every _instrument_ has bounded _price_ $X_t$ and cash flow $C_t$ at trading time $t$.
The cash flow is zero except for a finite number of times.
If $I$ is the collection of all instruments then we can model them
simultaneously if we let $X_t$ and $C_t$ be vectors indexed by $I$.

## Arbitrage

Ross showed if the there is no trading strategy that makes money on the
first trade and never loses money until the trading strategy is closed out
if and only if there exist positive measures $D_t$ with
$$
\tag{1}	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}
$$
where $\AA_t$ is the partition of information available at time $t$.

Ross used the Hahn-Banach theorem to prove their existence but there
is no need for that. Every arbitrage-free model has a simple parameterization.

## Parameterization

Every arbitrage-free model is parameterized by a vector-valued
measure $M_t$ satisfying ${M_t = M_u|_{\AA_t}, t \le u}$ (a _martingale measure_) where
$$
\tag{2}	X_t D_t = X_0 M_t - \sum_{s\le t} C_s D_s.
$$

__Exercise__. _Show equation $(2)$ implies equation $(1)$_.

_Hint_: Replace $t$ by $u$ in equation $(2)$ and plug that into the
right-hand side of equation $(1)$.

This is the so-called "easy direction" but why bother with the
contrapositive when we have a ready supply of arbitrage-free models?
The fun part is coming up with martingales that can fit market data.

The Black-Scholes/Merton model for the bond and stock is parameterized by
${M_t = (1, e^{\sigma B_t - \sigma^2t/2})P}$, ${D_t = e^{-\rho t}P}$
where $P$ is Weiner measure and $B_t$ is standard Brownian motion.

__Exercise__. _Show $X_t = (R_t, S_t)$ where $R_t =  r e^{\rho t}$
and $S_t = s e^{\sigma B_t + (\rho - \sigma^2/2)t}$_.

_Hint_: Use equation $(2)$ with $C_t = (0, 0)$.

## Trading

A _trading strategy_ is a finite number of increasing stopping times
$\tau_0 < \cdots < \tau_n$ and trades $\Gamma_j$ indexed by instruments
that depend only on information available at time $\tau_j$.
Trades accumulate to _positions_ 
$$
	\Delta_t = \sum_{\tau_j < t} \Gamma_j = \sum_{s < t} \Gamma_s
$$
where $\Gamma_s = \Gamma_j$ when $s = \tau_j$ and is zero otherwise.
Note the strict inequality. Trades take time to settle into
a position. A trading strategy is _closed out_ if $\sum_j \Gamma_j = 0$.

## Accounting

Trading involves accounting. The _value_ (or mark-to-market) is
$$
	V_t = (\Delta_t + \Gamma_t)\cdot X_.
$$
It is the putative value
of liquidating the existing position and trades just executed
assuming that can be done at current market prices.
The trades just executed are not yet in the position, but they soon will be,
$\Delta_t + \Gamma_t = \Delta_{t+\epsilon}$.

The _amounts_ involved in trading are
$$
	A_t = \Delta_t\cdot C_t - \Gamma_t\cdot X_t.
$$
Cash flows proportional to the existing position are credited to the trading account
and trades just executed are debited at the current market prices.

## Consequences

Equation $(1)$ and the definition of $V_t$ and $A_t$ result in
$$
\tag{3}	V_t D_t = (V_u D_u + \sum_{t < s \le u} A_s D_s)|_{\AA_t}.
$$
The proof starts with $V_t D_t = (\Delta_t + \Gamma_t)\cdot X_t D_t$ and
using equation $(1)$.

Note how value and amount in equation $(3)$ correspond to 
price and cash flow in equation $(1)$.

__Trading strategies create synthetic market instruments__.

This is the skeleton key to valuing, hedging, and managing the
risk of derivative instruments.

### Derivatives

A (cash settled) derivative is a contract where the buyer will
pay the seller to cover amounts $\hat{A}_k$ at times $\hat{\tau}_k$.
The buyer is willing to pay the seller a premium to take the risk off their hands.
This short note provides nothing to suggest what premium, vigorish, or baksheesh
should be charged for that service.

The job of a quant is to find a trading strategy $(\tau_j, \Gamma_j)$ with
$A_{\hat{\tau}_k} = \hat{A}_{k}$ and $A_t = 0$ otherwise.
Unless you belong to a Pythagorean cult that believes in the mathematical
absurdity of continuous time trading, this is generally not possible.
A start at solving this difficult and not well-understood problem is to note
$V_t = (\Delta_t + \Gamma_t)\cdot X_t$ and $V_t$ can be calculated
using the contract terms $\hat{A}_t$ by equation $(3)$.

The Fréchet derivative of $V_t$ with respect to $X_t$ is
$D_{X_t}V_t = \Delta_t + \Gamma_t$.
At time 0 the position is 0 so this gives us the initial trade $\Gamma_0$.
At any time after that we have $\Gamma_t = D_{X_t}V_t - \Delta_t$. The position
$\Delta_t$ is known at time $t$ so this can be used to come up with
candidate trading strategies. What this theory does not tell you is
when you should trade. If you let $\tau_j = j\Delta t$
for some time increment $\Delta t$ then this results in the usual
Black-Scholes/Merton delta hedge as the increment goes to zero.
A smarter idea might be to set a price increment $\Delta X$ and
determine the next trading time $\tau_{j+1}$ from the last trading time $\tau_j$
by $|X_{\tau_{j+1}} - X_{\tau_j}| > \Delta X$.

## References
