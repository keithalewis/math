---
title: Bayes
--

The conditional expectation of event $A$ given event $B$
is $P(A|B) = P(A\cap B)/P(B)$.

__Exercise__. _Show $P(A|B) = P(A)P(B|A)/P(B)$_.

_Hint_. Use $P(B|A) = P(B\cap A)/P(A)$.

The exercise is the simplest form of Bayes Theorem. It shows how to update the
probability of $A$ given the information $B$.

Suppose $X$ and $Y$ are discrete random variables on $\{x_j\}\times\{y_k\}$
with $P(X = x_j, Y = y_k) = p_{jk}$.

__Exercise__. _Show $P(X = x_j) = \sum_k p_{jk}$ and $P(Y = y_k) = \sum_j p_{jk}$_.

_Hint_: The set $\{X = x_j\} = \cup_k \{(x_j, y_k)\}$ is a disjoint union.

__Exercise__. _Show $P(X = x_j|Y = y_k) = p_{jk}/\sum_j p_{jk}$_.

_Hint_: $P(X = x_j|Y = y_k) = P(X = x_j, Y = y_k)/P(Y = y_k)$.

Our next step is to compute $P(X = x_j|E[Y] = y)$.
