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
Probability measures are non-negative and $P(Ω) = 1$.
Subsets of a sample space are _events_.
If the sample
space is finite we only need to specify the probability of each outcome.
The probability of each outcome must
be between 0 and 1 and sum to 1. The probability of an event 
is $P(E) = \sum_{ω \in E} P(\{ω\})$.

_Frequentists_ interpret probability as the number of times an outcome
belongs to an event divided by the number of times it is sampled. This
assumes it is possible to repeatedly sample identical situations. The
_law of large numbers_ says the frequency converges to the probablity of
the event.  This is fine when applied to flipping coins, rolling dice,
or running other physical experiments where conditions don't change,
but it limits the use of probability.

_Bayesians_ interpret probability as a subjective _degree of belief_
based on available information.  As more information becomes available
it can be used to update individual degrees of belief. They are delayed
satisfaction frequentists who believe subjective degrees of belief will
converge for all individuals given sufficient common information over
repeated trials.

## Conditional Probability

The _conditional probability_ of $A$ _given_ $B$ is defined by $P(A\given B) = P(A\cap B)/P(B)$.
It satifies $P(B\given B) = 1$ and $A\mapsto P(A\mid B)$ is a _probability measure_.
Since $P(A\given B) = P(A\cap B)/P(B)$ and $P(B\given A) = P(B\cap A)/P(A)$ it follows
$P(A\given B) = P(A\cap B)/P(B) = P(B\cap A)/P(B) = P(B\given A)P(A)/P(B)$.
$$
	P(A\given B) = P(B\given A)P(A)/P(B)
$$
This formula is the basis of Baysian probabilty. It shows how to update
probabilities given new information.
_Bayesians_ interpret probability as a subjective _degree of belief_ instead
of a physical _frequency_ of (potential?) occurance. _Frequentists_ can flip a
coin to their heart's content but have nothing to say about the probability
you will get hit by a car while crossing a particular steet at some
specific time.

Bayesians like to belive that as more infomation becomes available
subjective probabilites will converge to the same value.  They haven't
come up with a general theory ensuring this, but that seems to frequently
occur.

### Example

A coin is _fair_ if heads and tails occur with equal probability when flipped[^1].
Suppose a coin might be fair or might have two heads, but we cannot examine the coin directly.
The only information we will be given is the outcomes of a series of flips.
If we ever see tails we know the coin is not double-headed but if every
flip we see is heads then that provides evidence the coin is double-headed.

[^1]: Persi Diaconis

Suppose the first flip of the coin is heads, $H_1$. A naive application of Bayes theorem
is $P(C|H_1) = P(H_1|C)P(C)/P(H_1)$, where $C$ indicates the coin is fair.
For a fair coin $P(H_1|C) = 1/2$ and for a double-headed coin $P(H_1|D) = 1$,
where $D$ indicates the coin is double-headed.
The other probabilities require some assumptions.

Step one in probability theory is to specify the _sample space_ of
possible outcomes and the
probability of _events_ (subsets of the sample space).
If the sample space is finite it is sufficient to specify the
probability of each outcome.

In our case
the sample space has two elements $Ω = \{C,D\}$ indicating the coin is
either fair or double-headed.
Assume the probability that the coin is fair equals $p$
so the probability of the coin being double-headed is $1 - p$ and
$P(H_1) = p/2 + (1 - p)  = (1 - p)/2$. Using Bayes formula,
$p_1 = P(F|H_1) = (1/2)p/((1 - p)/2) = p/(1 - p) < p$ if $0 < p < 1$.
Seeing a head flipped on the first try provides evidence against the coin being fair.

If you had trouble believing $P(H_1) = p/2 + (1 - p)$ then you have good intuition.
We were sloppy about specifying the sample space. (This happens quite often
in the literature, for example, the 
[Monte Hall problem](https://en.wikipedia.org/wiki/Monty_Hall_problem).)
The sample space should also include the outcome of the first toss
$Ω = \{(C,H), (C,T), (D,H), (D,T)\} = \{C,D\}\times \{H,T\}$; the coin
can be fair or double-headed and the first toss can be either heads
or tails. The probability of each outcome is
$P(\{(C,H)\} = p/2$,
$P(\{(C,T)\} = p/2$,
$P(\{(D,H)\} = 1 - p$,
$P(\{(D,T)\} = 0$, where $0 < p < 1$.
Flipping heads on the first toss is the subset $H_1 = \{(C,H),(D,H)\}$ 
so $P(H_1) = P(\{(C,H),(D,H)\}) = P(\{(C,H)\}) + P(\{(D,H)\}) = p/2 + (1 - p)$.

If we want to model flipping the coin $n$ times the sample space becomes
$Ω = \{C,D\}\times\{H,T\}^n$ and the probabilites are
$P(\{C,ω)\} = p/2^n$ for $ω\in\{H,T\}^n$, and $P(\{D\}, ω) = 0$ unless
$ω$ is all heads, denoted $H_n$.
Since $P(H_n) = p/2^n + (1 - p)$
Bayes Theorem gives
$p_n = P(C\given H_n) = p/2^n/(p/2^n + (1 - p)) = p/(p + 2^n(1 - p))$.
As the number of consecutive heads goes to infinity the probability of
the coin being fair approaches zero no matter the initial guess $p > 0$
of the coin being fair.

This is an example of Bayesian reasoning showing subjective probabilities
converge given sufficient information. It is important to note that
this depends on the model. A different model could allow for the possibility
the coin might also be two-tailed. Every model makes assumptions about
what information is available so, in some sense, all probabilities
are conditional.

## Says Who?

If you had trouble believing $P(A\given B) = P(A\cap B)/P(B)$ then you
have good intuition.  Mathematics hijacks standard vocabulary to define
mathematical statements.  Descartes and Spinoza seem to be the first
scholars to attempt rigourous definitions of words beyond the limited
vocabulary of _and_, _or_, _not_, and _implies_ used in Aristotelian
logic.  Prior to his invention of a logic involving only _true_ or
_false_ statements (_propositions_) the main effort was directed at determining _valid_
methods of reasoning to arrive at _plausible_ statements.
This most likely originated early in our prehistory when shamans
could fool people into giving them bear skins and arrow heads
in exchange for empty promises.

Probability theory is an extension of logic. Instead of statements
that are either false or true it assigns a probability between 0 and
1 to events. From its sordid beginnings in of games of chance it
achieved mathematical respectability when Kolmogorov axiomatized it
in 1933. (cite?)  Reputable mathematicians could now slot Probability
Theory into the existing Measure Theory they were comfortable with as
positive measures having mass 1.

Mathematics is following your nose and thinking rigourously, which
immediately leads to difficulties most people, rightfully so, think are
Much Ado About Nothing.  For example, probability 1 does not correspond
to true and must be replaced with the more subtle notion of _almost surely_.

Richard Threlkeld Cox put conditional probabilty on firmer philosophical
foundations by axiomatizing the notion of _likelihood_.
Staying true to the earliest foundations, he considered _statements_ instead
of propositions. He denoted the likelihood of statement $A$ given statement $B$ by $A\given B$.
Standard logical connectives can be used to make new statements and
rules for likelihood must respect their meaning.

If the shaman tells you he can make it rain tomorrow
if you give him a basket of grain and you come back from
a long day in the field to find him scurrying out of your hut and
your wife with her hair mussed and won't look you in the eye, how
likely is it that he will deliver on his promise given this information?
If history is any guide, he will likely tell you he now needs two baskets of
grain because you didn't give him enough.

Cox assumed likelihood is a real number.
Real numbers are totally ordered so this is a big assumption.
He was also vague on exactly
what statements constitute information. His notation for the plausibility of
statement $S$ given statement/information $T$ is $S\given T$.
He assumes the plausibility of statements $S$ and $T$, denoted $ST$, given information $U$ is
$ST\given U = p(S\given U, T\given SU)$ for some function $p$.
If $p(s,t) = st$ and $U$ is true this becomes $ST\given true = (S\given true)(T\given S)$.
Cox wanted to show $P(ST) = P(S)P(T\given S)$ is a consequence of of more general assumptions.
His original derivation was not mathematically correct, but it inspired others to
improve his assumptions that utimately led to a precise formulation.

This was really an aside to his life's work. He was an experimental physicist who,
among other results, demontrated a parity violation for double scattering of β rays from radium
that could not be explained by existing theory. Eventually theory caught up and
proved him correct.

<!-- how do you combine statements and information? -->

maxplus algebras
