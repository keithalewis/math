---
title:  Stephen Ross
author: Keith A. Lewis
abstract: Risky Streams of Cash Flows
---
\newcommand\RR{\bs{R}}
\newcommand\AA{\mathcal{A}}

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

Every _instrument_ has _price_ $X_t$ and cash flow $C_t$ at trading time $t$.
The cash flow is zero except for a finite number of times.
If $I$ is the collection of all instruments then we can model all of them
simultaneously if we let $X_t$ and $C_t$ be vectors indexed by $I$.

Ross showed if the there is no trading strategy that makes money on the
first trade and never loses money until the trading strategy is closed out
then there exist positive measures $D_t$ with
$$
	X_t D_t = (X_u D_u + \sum_{t < s \le u} C_s D_s)|_{\AA_t}
$$
where $\AA_t$ is the algebra of information available at time $t$.

Every arbitrage-free model is parameterized by a vector-valued
measure $M_t$ satisfying $M_t = M_u|_{\AA_t}$, $t \le u$ (a _martingale measure_) where
$$
	X_t D_t = X_0 M_t - \sum{s\le t} C_s D_s.
$$

The Black-Scholes/Merton model for the bond and stock is parameterized by
$M_t = (1, e^{\sigma B_t - \sigma^2t/2})P$
where $P$ is Weiner measure and $B_t$ is standard Brownian motiont.

Adding a knob for cash flows to Ross's theory leads to
a model that maps more closely to practical implementation. 

Every arbitrage-free model of prices $X_t$ and cash flows $C_t$ is
parameterized by a martingale measure $M_t$ indexed by instruments
and a stochastic discount $D_t > 0$ where
$$
	X_t D_t = X_0 M_0 - \sum_{s\le t} C_s D_s.
$$

For example, the Black-Scholes/Merton model is parameterized by 
$M_t = (1, e^{\sigma B_t} - \sigma^2t/2})P$ where $P$
is Weiner measure and $B_t$ is Brownian motion,
and $D_t = e^{-\rho t}P$.

Every arbitrage-free model is parameterized by a vector-


Everything is a risky stream of cash flows.

## References
