---
title:  Stephen Ross
author: Keith A. Lewis
abstract: Risky Streams of Cash Flows
---
\newcommand\RR{\bs{R}}

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
