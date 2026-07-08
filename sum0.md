---
title: Simple Unified Model
author: Keith A. Lewis
---

Stephen Ross generalized the Black-Scholes/Merton theory from a bond, stock, and option
to any collection of instruments. He showed valuation had nothing to do with
probability. Positive measures having mass 1 show up, but
they are not the "probability" of anything.
Instead of the sophisticated machinery of Ito processes and
partial differential equations he used the Hahn-Banach theorem:
a point not in a convex set can be separated by a hyperplane.

This short note provides a simple and rigorous mathematical model for valuing, hedging,
and managing the risk of all derivative instruments. It is based on [@Ros1978]
"A Simple Approach to the Valuation of Risky Streams" where he showed

> If there are no arbitrage opportunities in a market, then there must exist a (not generally unique)
positive linear operator that can be used to value all marketed assets.

Ross's "not generally unique positive linear operator" is a measure used
to convert prices and cash flows to values that generalize [@GraDod1934] and [@Sam1965].
If repurchase agreements are available in the market it
corresponds to the usual stochastic discount.

Ross identified a jump in stock price as a
cash flow.  He was focused on the equity world where dividend payments
cause stock prices to jump down by that amount after their ex-dividend
date. Of course they also jump from close to open and there is no
cash flow associated with that.
In the fixed income world bonds are defined by their cash flows. The
price of a futures contract is always zero and pays periodic cash flows
based on the change in market quotes.
Adding an explicit knob for cash flows to Ross's theory results in a more realistic model.

Market instruments have both prices and cash flows. Trading strategies
create synthetic market instruments where the mark-to-market
corresponds to price and the amount involved in active trading
corresponds to cash flows.
