---
title: Bayes Theorem
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Everything is conditional
...

\newcommand{\given}{\mid}

A _probability space_ is a set $Ω$ of possible outcomes and a _probability measure_ $P$ that
takes subsets of $Ω$ to a number between 0 and 1.
Measures satisfy $P(E\cup F) = P(E) + P(F) - P(E\cap F)$ and $P(\emptyset) = 0$, $E,F\subseteq Ω$.
Measures don't count things twice and the measure of nothing is zero.
Subsets of a sample space are _events_.

_Frequentists_ interpret probability as the number of times an outcome
belongs to an event divided by the number of times it is sampled. This
assumes it is possible to repeatedly sample identical situations. The
_law of large numbers_ says the frequency converges to the probablity of
the event.  This is fine when applied to rolling dice, dealing cards,
and running other physical experiments where conditions don't change,
but it limits the use of probability.

_Bayesians_ interpret probability as a subjective _degree of belief_
based on available information.  As more information becomes available
it can be used to update individual degrees of belief. They are delayed
satisfaction frequentists who believe individual degrees of belief will
converge given sufficient common information over repeated trials.

## Conditional Probability

The _conditional probability_ of $A$ _given_ $B$ is defined by $P(A\given B) = P(A\cap B)/P(B)$.
It satifies $P(B\given B) = 1$ and $A\mapsto P(A\mid B)$ is a _probability measure_.
Since $P(A\given B) = P(A\cap B)/P(B)$ and $P(B\given A) = P(B\cap A)/P(A)$,
$P(A\given B) = P(A\cap B)/P(B) = P(B\cap A)/P(B) = P(B\given A)P(A)/P(B)$.
This is the simplest form of Bayes theorem.

### Example

Suppose we are shown a sequence of coin flips where we know the coin might
have heads on both sides. If we ever see a tail we know the coin is two sided,
but suppose the first flip is heads. A naive application of Bayes theorem
is $P(fair|H_1) = P(H_1|fair)P(fair)/P(H_1)$ where $h_1$ is the event of
heads occuring on the first flip. It is clear $P(H_1|fair) = 1/2$ but the
other probabilities require assumptions.

Cox

maxplus algebras
