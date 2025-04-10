---
title: Bayes
abstract: How to apply it
---
\newcommand\RR{\bs{{R}}}

A _measure_ on a set $S$ is a _set function_ $\mu$
from subsets of $S$ to the real numbers that satisfies
$\mu(\emptyset) = 0$, and
$\mu(E\cup F) = \mu(E) + \mu(F) - \mu(E\cap F)$ for $E,F\subseteq S$.
The measure of nothing is 0 and measures do not count things twice.

A _probability measure_ $P$ on a set $S$ is a positive measure, $P(E)\ge0$
for $E\subseteq S$, with $P(S) = 1$. Subsets of $S$ are _events_.

The conditional expectation of an event $A$ given event $B$
is $P(A|B) = P(A\cap B)/P(B)$. This makes $A\mapsto P(A|B)$
a probability measure on $B$.

__Exercise__. Show if $E,F\subseteq B$ then $P(\emptyset|B) = 0$, $P(E \cup F|B) = P(E|B) + P(F|B) - P(E\cap F|B)$
and $P(B|B) = 1)$.

_Hint_: Use $P(E\cup F) = P(E) + P(F) - P(E\cap F)$.

__Exercise__. _Show $P(A|B) = P(A)P(B|A)/P(B)$_.

_Hint_. Use $P(B|A) = P(B\cap A)/P(A)$.

This exercise establishes the simplest form of Bayes Theorem. It shows how to update the
probability of $A$ given the information $B$.

Suppose $X$ and $Y$ are discrete random variables on $\{x_j\}\times\{y_k\}$
with $P(X = x_j, Y = y_k) = p_{jk}$.

__Exercise__. _Show $P(X = x_j) = \sum_k p_{jk}$ and $P(Y = y_k) = \sum_j p_{jk}$_.

_Hint_: The set $\{X = x_j\} = \cup_k \{(x_j, y_k)\}$ is a disjoint union.

__Exercise__. _Show $P(X = x_j|Y = y_k) = p_{jk}/\sum_j p_{jk}$_.

_Hint_: $P(X = x_j|Y = y_k) = P(X = x_j, Y = y_k)/P(Y = y_k)$.

How do we use Bayes to calculate $P(X = x_j|E[Y] = y)$?
Since $E[Y] = \sum_j y_j P(Y = y_j) = \sum_j y_j \sum_i p_{ij}$
its value is determined by the prior joint distribution of $X$ and $Y$.
This seems like a defect in the Bayesian approach.

The fundamental problem in using data to estimate the distribution
of a random variable $X$ is to turns observations $x_1, x_2, \ldots$
into a cumulative distribution function $F(x) = P(X\le x)$.
Let $X_1, X_2, \ldots$ be independent random variables having the
same law as $X$.
