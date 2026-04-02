---
title: One Period Model
author: Keith A. Lewis
classoption: fleqn
link-citations: true
header-includes:
	- \usepackage{bm}
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\renewcommand\AA{\mathcal{A}}
\newcommand\PP{\mathcal{P}}
\newcommand\RR{\bs{R}}
\newcommand{\ran}{\operatorname{ran}}
\newcommand{\ker}{\operatorname{ker}}

@[GraDod1934] value of a stock is discounted future cash flows.

@[Mar1952] efficient portfolios. Leverage off the wisdom of the masses.

## Pre Black-Scholes/Merton

Samuelson, ...

Equity bias. Bonds...

Let $T$ be the set of all possible trading times and $I$ be the set of market instruments.

Let $T(i) \subseteq T$ be the trading times for instrument $i\in I$.

See [mp-units](https://github.com/mpusz/mp-units)

The _type_ of the amount is dividend, interest, principal, fee, tax, ...  
The _kind_ of the type is the instrument.

The same instrument may trade on multiple exchanges, over the counter, through a broker/dealer,
on a dark market, etc. This is the _type_ of the instrument.

## Instruments

Stock. Has an issuer. One or more IPO's that determine the float.

An _amount_ is an integral quantity of the minimum trading size of an _instrument_ and a _kind_.  
An amount also has a _kind_, such as dividend, interest, or principal payment.

A _holding_ is an _amount_ and _owner_ that decides to buy or sell the holding.  

A _position_ is a (multi)set of holdings.

We assume holdings are _divisible_. The holding $(a, o)$ can be split
into $(a', o),

A real-valued functions takes points in a set to the real numbers.

A real-valued measure takes subsets of a set to the real numbers,
does not count things twice, and the measure of nothing is 0.

$B(S)$, $B(S)^*\cong ba(S)$.

__Exercise__. _If $\mu(A\cup B) = \mu(A) + \mu(B) - \mu(A\cap B)$
then $\nu(A) = \mu(A) - \mu(\emptyset)$ is a measure_.

Every instrument determines a type. Every type has a kind.  
E.g., a $ can be a dividend, interest, principal,...

How to connect real-world vs risk-neutral measures.

The concept of no arbitrage. Efficient markets.

Probabilities change over time.

$\Omega$ is all possible outcomes ...

Risk-neutral vs real-world measures.

Samuelson - deflated prices are martingales (under risk-neutral measure)
What about real world measures???

Futures quotes are martingales.

Ross Recovery.



Neo-economics.

Markowitz - stock prices (efficient markets)
