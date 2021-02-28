---
title: One Period Model
author: Keith A. Lewis
institution: KALX, LLC
email: kal@kalx.net
classoption: fleqn
abstract: Buy now, sell later
...

\newcommand\RR{\bm{R}}

If $A$ and $B$ are sets then $A^B = \{f\colon B\to A\}$ is the set of functions from $B$ to $A$.

__Exercise__. _The set $A^B$ has cardinality $a^b$ if $A$ has cardinality $a$ and $B$ has cardinality $b$_.

## One Period Model

Let $I$ be the set of _instruments_ available for trading.

The _prices_ at the beginning of the period are $x\in\RR^I$, $x(i)\in\RR$ is the initial
price of instrument $i\in I$.

Let $\Omega$ be what can happen over the period.

The prices at the end of the period are $X\colon\Omega\to \RR^I$, $X(\omega)\in\RR^I$
are the prices if $\omega\in\Omega$ occured.

## Derivative

A _derivative instrument_ is a function $A\colon\Omega\to\RR$ that pays some _amount_
depending on what happened. If there is a $\gamma\in\RR^I$ with
$\gamma\cdot X = A$ then there is a _perfect hedge_. The _cost_ of
the hedge is $\gamma\cdot x$.

If the cardinality of what can happen is greater than the number of
instruments then it is not the case perfect hedges always exist.
Risk Management is the study of how well a derivative can be hedged.

## Arbitrage

A one period model has _arbitrage_ if you can take a position $\gamma\in \RR^I$ with
$\gamma\cdot x < 0$ and $\gamma\cdot X(\omega)\ge0$, $\omega\in\Omega$. The
cost of acquiring $\gamma$ shares of each instument at the beginning of
the period is $\gamma\cdot x$. If that is negative then you make money.
At the end of the period you close the position by selling all of your shares.
This results in a cash flow of $\gamma\cdot X$ to your account.
If that is non-negative then you don't lose money.

## FTAP

The one-period Fundamental Theorem of Asset Pricing is that there is no
arbitrage if and only if there exists a measure $\Pi$ on $\Omega$
such that $\int_\Omega X\,d\Pi = x$. If such a measure exists and
$\gamma\cdot X\ge 0$ then $\gamma\cdot x \ge 0$ so there is no arbitrage.

**Lemma.** _If $x\in\bm{R}^n$ and $C$ is a closed cone in
$\bm{R}^n$ with $x\not\in C$ then there exists $\xi\in\bm{R}^n$
with $\xi\cdot x < 0$ and $\xi\cdot y \ge0$ for $y\in C$._

We assume $X$ is bounded so $\Pi$ is finitely additive.

Recall that a _cone_ is a subset of a vector space closed under addition
and multiplication by a positive scalar, that is, $C + C\subseteq C$
and $tC\subseteq C$ for $t > 0$.

__Exercise__. _The set of arbitrages is a cone_.

_Proof._ Since $C$ is closed and convex there exists $x^*\in C$ with
$0 < ||x^* - x|| \le ||y - x||$ for all $y\in C$.  Let $\xi = x^* - x$.
For any $y\in C$ and $t > 0$ we have $ty + x^*\in C$ so $||\xi|| \le ||ty + \xi||$. 
Simplifying gives $t^2||y||^2 + 2t\xi\cdot y\ge 0$. 
Dividing by $t > 0$ and letting $t$ decrease to 0 shows $\xi\cdot y\ge 0$. 
Take $y = x^*$ then $tx^* + x^*\in C$ for $t \ge -1$. By similar reasoning,
letting $t$ increase to 0 shows $\xi\cdot x^*\le 0$ so $\xi\cdot x^* = 0$. 
Since $0 < ||\xi||^2 = \xi\cdot (x^* - x) = -\xi\cdot x$ we have $\xi\cdot x < 0$.
$\blacksquare$

The set of non-negative finitely additive measures is a closed
cone and $X\mapsto \int_\Omega X\,d\Pi$ is positive, linear, and continuous
so $C = \{\int_\Omega X\,d\Pi : \Pi\ge 0\}$ is also a closed cone.
The contrapositive of the FTAP follows from the lemma.

The proof also shows how to find an arbitrage when one exists.

