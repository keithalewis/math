---
title: The Dual of Probability Theory
author: Keith A. Lewis
classoption: fleqn
fleqn: true
---
\newcommand\bs[1]{\boldsymbol{{#1}}}
\newcommand\NN{\bs{N}}
\renewcommand\implies{\Rightarrow}
\newcommand\lcm{\operatorname{lcm}}

> "Probability is to subsets as information is to partitions."

## Boolean Algebra

We assume you are familiar with [@Boo1854] who showed how to reduce logic
to algebraic calculation. He generalized Aristotle's
verbal syllogisms by introducing variables for propositions, statements that
can only be "true" or "false", and specifying the rules they satisfy.

## Predicate Calculus

Boolean algebra does not account for Aristotle's use of the words "some" or "all".
In 1879 [@Fre1967] introduced the idea of quantifying propositions over parameters.
The modern notation for the existential quantifier, $\exists$, was invented
by [@Pea1897]. [@Gen1935] invented the modern notation for the universal quantifier, $\forall$.

One of Peano's most famous inventions was _mathematical induction_:
If $P(n)$ is a proposition parameterized by the natural numbers
$n\in\NN = \{0, 1, 2, \ldots\}$, $P(0)$ is true and($\wedge$) $P(n)$ is true
implies($\implies$) $P(n + 1)$ is true
then for all($\forall$) $n$ $P(n)$ is true. In Gentzen's modern notation for the predicate calculus
$$
	(P(0) \wedge (P(n)\implies P(n + 1)))\implies \forall n\; P(n).
$$
[@Pea1888] seems to be the first serious mathematician to pay attention to
the high school teacher [@Gra1844] and his brilliant Geometric Algebra.

Two of Gentzen's most famous inventions were natural deduction and the sequent calculus.

## Natural Deduction

The method of proof used in informal mathematics is to write down _axioms_, statement
that are assumed to be true for a particular theory, then use _modus ponens_:
If the propositions $A$ and $A\implies B$ are true, then $B$ is true.
As any of us who have learned to write proofs using natural deduction, it is not always clear what sequence of
steps are the shortest. When Gentzen ran into this issue he invented a new notation
for proofs called the sequent calculus and show how to remove such detours.

## Probability

Boole - probability

[@Kol1931]

Given a sample space (set) $S$, a probability measure $P$ takes
subsets of $S$ to a number between 0 and 1.
It must satisfy $P(S) = 1$, $P(A\cup B) = P(A) + P(B) - P(A\cap B)$ for $A,B\subseteq S$
and $P(\emptyset) = 0$ where $\emptyset = \{\}$ is the _empty set_ with no elements.
Measures do not count things twice and the measure of nothing is zero.

__Exercise__: _Show $P(A\cup B) = P(A) + P(B)$ if $A\cap B = \emptyset$_.

_Hint_: Use $P(A\cup B) = P(A) + P(B) - P(A\cap B)$ and $P(\emptyset) = 0$.

Define _set complement_, $A'$, of $A$ in $S$ to be all elements of $S$ that are not in $A$.
This is a special case of _set difference_, $A\setminus B$, of all elements of $A$ that are not in $B$.

<!--
Algebra of indicator functions???
-->

__Exercise__: _Show if $S$ is finite then $P(A) = \#A/\#S$ is a probability measure where
$\#A$ is the number of elements of $A\subseteq S$_.

We let $U_n$ denote this uniform measure on the set $\{1,\ldots,n\}$.

### Algebra of Sets

An _algebra of sets_ is a collection of subsets closed under union and complement.
By DeMorgan's Laws it is also closed under intersection.

A _partition_, $\Pi$, of a set is a collection of pairwise disjoint subsets whose
union is equal to the set -- ${\Pi = \{A_i\}_{i\in I}}$ where
${A_i\cap A_j = \emptyset}$ when ${i\not=j}$, $i,j\in I$, and ${\cup_{i\in I} A_i = S}$

(Partial) information is represented by a _partition_
Full information is knowing exactly which $s\in S$ occurred.
The finest partition of singletons $\{\{s\}\mid s\in S\}$ represents
complete information. The coarsest singleton partition $\{S\}$ represents
no information.
Knowing which $i\in I$ satisfies $s\in A_i$ is _partial information_.

The sample space for a 6-sided die is $S = \{1,2,3,4,5,6\}$.
The partition $\{\{1,3,5\},\{2,4,6\}\}$ represents knowing if
a roll was an odd or an even number.

__Exercise__. _Let $S = [0, 1)$ and $\mathcal{A}$ be the partition $\{[0,1/2), [1/2, 1)\}$.
Show $\mathcal{A}$ represents knowing the first base 2 digit of $s\in [0,1)$_.

_Hint_: The first binary digit of $s\in[0,1)$ is the integer part of $2s$.

Uniform measure restricted to a partition.

Discrete measure $S = \{s_i\}$, $P(\{s_i\}) = p_i$, $p_i > 0$, $\sum_i p_i = 1$.

$p_i = q_i/r_i$ where $q_i, r_i\in\NN$.

Let $n = \lcm\{r_i\}$

Partition $n$ into sets $A_i$ of size $q_i r_i/n$.

Discrete (finite, rational) measure is $U_n\mid\{A_i\}$.

## Logical Entropy

A _distinction_ is a pair $i,j$ with $A_i\not=A_j$.

The probability $A_i$ is distinct from $A_j$ is $P(A_i\cap A_j) = 0$.

$P(A_i\cap A_j) = P(A_i) P(A_j\mid A_i) = p_i\delta_{ij}$.

$P(A_i'\cup A_j') = 1 - P((A_i'\cup A_j')')
= 1 - P(A_i\cap A_j) = 1 - p_i\delta_{ij}$.

$L(P) = \sum_i p_i(1 - p_i)$.

$H(P) = -\sum_i p_i \log p_i$.

$p(1 - p)$ vs $-p \log p$?

both 0 at $p = 0$ and $p = 1$.

derivative at $p = 1$ is $-1$.

derivative at $p = 0$ is 1 and $\infty$.

## Unorganized

Boole showed $\max\{0, P(A) + P(B) - 1\} \le P(A\cap B) \le \min\{P(A), P(B)\}$.

$P(A\cap B) = P(A) P(B\mid A) \le P(A)$.

$P(A\cap B) = P((A'\cup B')') = 1 - P(A'\cup B') = 1 - (P(A') + P(B') - P(A'\cap B')$.

Fréchet-Hoeffding $\max\{u + v - 1, 0\} \le C(u,v) \le \min\{u, v\}$.

$1_{A\cap B} = 1_A 1_B$

$1_{A\cup B} = 1_A + 1_B - 1_{A\cap B}$

$1_{A') = 1 - 1_A$

Inclusion exclusion
$1_{A_1\cup\cdots A_n} = \sum_i 1_{A_i} - \sum_{i < j} 1_{A_i\cap A_j} + \sum_{i < j < k} 1_{A_i\cap A_j\cap A_k}...$

$1_A_1\cup A_2} = 1_{A_1} + 1_{A_2} - 1_{A_1\cap A_2}

$1_{A_1\cup A_2\cup A_3} = 1_{A_1\cup A_2} + 1_{A_3} - 1_{(A_1\cup A_2)\cap A_3}$.
