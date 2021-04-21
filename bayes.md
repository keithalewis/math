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
This formula is the basis of Baysian probabilty. It shows how to update
probabilities given new information.

### Example

A _fair_ coin has one side heads and the other side tails and each occur
with equal probability when flipped.
Suppose a coin may be fair or may have two heads but we cannot examine the coin directly.
The only information we will be given is the outcomes of a series of flips.
If we ever see a tail we know the coin is not two-headed but if every
flip we see is heads then that provides evidence the coin is two-headed.

Suppose the first flip is heads, denoted by $H_1$. A naive application of Bayes theorem
is $P(fair|H_1) = P(H_1|fair)P(fair)/P(H_1)$.
For a fair coin $P(H_1|fair) = 1/2$ but
other probabilities require assumptions.
Step one in probability theory is to specify the _sample space_ and the
probability of _events_ (subsets of the sample space). In our case
the sample space has two elements $Ω = \{fair,twoheads\}$. We don't
know what the probabilies are but we have to start somewhere. Let's
[assume](https://en.wikipedia.org/wiki/Principle_of_indifference) the
two cases are equally likely. The probability of heads given a fair coin
is $1/2$, the probability of the coin being fair is $1/2$ by assumption,
and the probability of flipping heads is 1 for a two-headed coin so
$P(H_1) = 1/2 \times 1/2 + 1 \times 1/2 = 3/4$. Using Bayes formula
$P(fair|H_1) = (1/2 \times 1/2)/(3/4) = 1/3$. Seeing a head flipped
on the first try provides evidence against the coin being fair.

Cox

maxplus algebras
