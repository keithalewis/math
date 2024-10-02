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

A derivative security is a contract. A buyer pays a seller to make
payments on specified future dates. The seller quotes a price to
the buyer and is obligated make future payments if the contract is executed.

The Nobel Prize winning theory of Fischer Black, Myron Scholes, and
Robert Merton III demonstrated how to dynamically replicate payoffs that
were a function of some underlying instrument price. The value of the
option is the cost of setting up the initial replicating hedge. They
showed the value of the initial hedge can be computed by taking the
risk-neutral expectation of discounted future payoffs and that the initial
hedge in the underlying is the derivative of the value with respect to
the underlying price, delta.

Suppose you are a trader and your boss asks for
a quote on a European call option.
The B-S/M option value is
$$
	v = s N(d_1) - ke^{-\rho t}N(d_2),
$$
where $s$ is the current stock price, $k$ is the call option strike,
$\rho$ is the risk-free rate, $t$ is the time in years to expiration$, $N$
is the standard normal cumulative distribution function,
${d_1 = (\log s/k + \rho t + \sigma^2t/2)/\sigma\sqrt{t}}$, and ${d_2 = d_1 - \sigma\sqrt{t}}$,
where $\sigma$ is the volatility.
To turn this equation into a number that you can show to your boss you need to know
the current "price", the strike, the "risk-free" rate, the "time in years" to expiration,
and the "volatility."

The quoted words are not well defined. The strike and expiration
are defined in the call contract, but if the time to expiration is 3
months how do you convert that into a time in years?
What is the price of a stock that rarely trades?
What is the risk-free rate if you are a day trader using your credit card 
for financing? Finally, if the underlying has no listed options
how do you devine the volatility?
We know from market data that a single volatility cannot be used to
price options at all strikes.

Suppose your boss agrees with the quote you provided and the buyer executes the trade.
Now you have to satisfy the contract obligation by coming up with $\max\{S_t - k, 0\}$
at expiration $t$. The B-S/M theory suggests you put on an initial delta hedge
by purchasing
$$
	\partial v/\partial s = N(d_1)
$$
shares of the stock. Note $d_1$ and $d_2$ depend on $s$ so this is non-trivial to prove.

Time moves on and the stock price changes. When do you change your hedge, and by how much?
The B-S/M theory answer is that you hedge continuously, but that is untenable.
It is a mathematical artifact of using Ito processes to model prices and hedges.
Every hedge involves only a finite number of trades.

It long past time to stop whistling past the graveyard and confront the realities
of trading head on.
The Unified Model puts your nose directly into the most important ongoing problem
of mathematical finance: how do you value, hedge, and manage the risk of derivatives
using only a finite number of trades?
It does not provide a solution to this, only a simple and
mathematically rigorous framework for studying the problem based on
Stephen Ross'[@Ros1978] "A Simple Approach to the Valuation of Risky
Streams". According to Ross

> _If there are no arbitrage opportunities in the capital markets, then
there exists a (not generally unique) valuation operator, $L$_.

He used the Hahn-Banach theorem to show the existence of $L$ and
observed it is not unique if the market is not complete.  We extend
the theory to any portfolio of instruments and define $L$ in terms
of _deflators_: positive measures indexed by time that depend only on
available information.  His crucial insight was to show the absence of
arbitrage was purely geometric.  Positive measures having mass one make a
showing, but their "risk-neutral probability" does not shed any light on
real-world probability.

The Unified Model does not require the Hahn-Banach theorem, much less
Ito processes or partial differential equations.  Instruments have prices
and cash flows associated with holding them.  Every arbitrage-free model
is determined by a martingale measure and a deflator.
Multiple market instruments can be used for hedging, not just one underlying.
The Unified Model generalizes the B-S/M delta hedge as a Frechet derivative
of the hedge value with respect to the vector of instruments used in the hedge.
The model allows for futures, options, and limit orders to be used
as hedging instruments.

Matt Levin likes to say "Everything is securities fraud."
My mantra is "Everything is a derivative."
Just like a derivative, managing a portfolio consists of a finite sequence of trades.
The various XVA calculations can be understood as a type of hedge.
We are both wrong, but hopefully in a useful way that piques your interest to read furthur.

## Motivation

How do you give a quote on a European call option if you will get put on
the hook to satisfy the contract payout?  Derivative contracts probably
existed before recorded history. Caveman Buyk may have agreed to give
caveman Selv 10 arrowheads today to get 1 bear skin by the next full moon.

We still face the same problems as Buyk and Selv. Buyk wants a bear skin
and Selv has to figure out how to supply that. Is he a good enough shot
to need only 9 arrowheads, or will his arch nemisis Ubs undercut him
with an offer of 8 arrowheads? Buyk also has to consider who to trust
on delivering the bear skin at the next full moon.

Consider a derivative contract that pays the value of a stock at a given expiration time.
Obviously, the value of that contract is the current stock price. Buy
one share today and sell it at expiration to satisfy the obligation.



## References
