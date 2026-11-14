---
title: Simple Unified Model
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\RR{\bs{R}}

Every finance professional is familiar with the work of [@BlaSch1973] and [@Mer1973]
but few seem to be aware of [@Ros1978].  Ross simplified their proofs,
generalized their results, and pointed out using the no arbitrage
condition for option valuation has nothing to do with probablility --
it is purely a geometric constraint.

Black-Scholes/Merton had a 5 year head start but it is a mystery
why so few have caught on 50 years down the road.

Condition expectations are irrelevant? No need for prices to follow a
diffusion process? No need for equilibrium?  Experts in the academic
field seem to have trouble realizing they can cast off their cognitive
anchor in the unnecessary accoutrements of the classical Black-Scholes
and Merton theory.

Replace prob by measures

One-period model to illustrate the measure theoretic approach.

General model.

## One-Period Model

The _one-period model_ is specified by a sample space $\Omega$ of possible
outcomes over a single period of time, the set of instruments $I$
available for trading, $x\in\RR^I$ indicating their initial prices
and $X\colon\Omega\to\RR^I$ their final prices given the outcome.

binomial model

interval model

Arbitrage exists if there is a position $\xi\in\RR^I$
with $\xi\cdot x < 0$ and $\xi\cdot X(\omega)\ge0$ for all $\omega\in\Omega$
-- you make money setting up the initial position and never lose
money when unwound at the end of the period.
If prices are bounded then there exists a positive _valuation measure_ $D$ on $\Omega$
with ${x = \int_\Omega X\,dD = (XD)(\Omega)}$.

### Remarks

## Simple Unified Model




