---
title: The Dual of Probability Theory
author: Keith A. Lewis
---

> "Probability is to subsets as information is to partitions."

Given a sample space (set) $S$, a probability measure $P$ takes
subsets of $S$ to a number between 0 and 1.
It must satisfy $P(A\cup B) = P(A) + P(B) - P(A\cap B)$ for $A,B\subseteq S$
and $P(\emptyset) = 0$.
Measures do not count things twice and the measure of nothing is zero.

(Partial) _information_ is represented by a _partition_ $S = \{A_i\}_{i\in I}$ where
$\cup_{i\in I} A_i = S$ and $A_i\cap A_j = \emptyset$ when $i\not=j$, $i,j\in I$.
Full information is know exactly which $s\in S$ occurred. Partial information
is knowing which $i\in I$ satisfies $s\in A_i$.
The finest partition of singletons $\{\{s\}\mid s\in S\}$ represents
complete information. The coarsest singleton partition $\{S\}$ represents
no information.

The sample space for a 6-sided die is $S = \{1,2,3,4,5,6\}$.
The partition $\{\{1,3,5\},\{2,4,6\}\}$ represents knowing if
a roll was an odd or an even number.

__Exercise__. _Let $S = [0, 1)$ and $\mathcal{A}$ be the partition $\{[0,1/2), [1/2, 1)\}$.
Show $\mathcal{A}$ represents knowing the first base 2 digit of $s\in [0,1)$_.
