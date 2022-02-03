---
title: Logic
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Logic &ndash; the foundations of mathematics.
...

It may come as a surprise that there are many different
logical systems for mathematics that are contradictory.
The most famous examples are in non-Euclidean geometry where
it is possible to have no, or infinitely many, "parallel" lines
through a point not on a line.
However one thing logical systems all have in common that
they use _propositions_: statements that are either _true_ or _false_, and
_rules of inference_: ways of combining true propositions into other
true propositions.

Mathematicians prove _theorems_. Typically they have the form 'if
$P$ is true then $Q$ is true' where $P$ and $Q$ are propositions.
This is equivalent to 'if $P$ then $Q$' and '$P$ implies $Q$'.
Every logical system has _axioms_: propositions that are assumed to be
true. The fundamental rule of inference is _modus ponens_: if a proof
has the statement '$P$' and the statement '$P$ implies $Q$' then the
statement '$Q$' can be included in the proof.
A proof of '$A$ implies $Z$' consists of a sequence of
statements starting with $A$. The following statements
are either axioms or a statement using rules of inference applied to
previous statements. If the last statement is $Z$ then the theorem is
proved, QED: "quod erat demonstrandum", meaning "what was to be shown".
The difficulty with proofs is figuring out which axioms to use and
when to apply the rules of inference.

## Propositional Calculus

The _propositional calculus_ is based on the common English usage of
the words, 'not', 'and', 'or', and 'implies'.  These are represented
by _logical connectives_ $\neg$, $\wedge$, $\vee$, and $\supset$.

_Not_
  ~ If $P$ is a proposition then $\neg P$ is the proposition that is true
  	if $P$ is false and false if $P$ is true.

_And_
  ~ If $P$ and $Q$ are propositons then $P\wedge Q$ is true when both $P$ and
  $Q$ are true, and false otherwise.

_Or_
  ~ If $P$ and $Q$ are propositons then $P\vee Q$ is true when either $P$ or
  $Q$ are true, and false otherwise.

_Implies_
  ~ If $P$ and $Q$ are propositons then $P\supset Q$ is false only when
  $P$ is true and $Q$ is false.

Note that if $P$ is false then $P\supset Q$ is true no matter if $Q$
is true or false. If you think it is peculiar that 'false implies true'
is a true statement then you and I agree on that.

__Exercise__. _Show $\neg(\neg P)$ always has the same truth value as $P$_.
<details>
<summary>Solution</summary>

> If $P$ is true then $\neg P$ is false so $\neg(\neg P)$ is true.
If $P$ is false then $\neg P$ is true so $\neg(\neg P)$ is false.

</details>

__Exercise__. _Show $P\vee\neg P$ is always true_.
<details>
<summary>Solution</summary>

> If $P$ is true then $P\vee\neg P$ is true. 
If $P$ is false then $P\vee\neg P$ is true. 

</details>

A _tautology_ is a proposition that is true for all
truth values of the propositions it contain. This leads to another
connective.

_Equivalent_
  ~ If $P$ and $Q$ are propositions then $P\equiv Q$ is true when $P$ and $Q$
  have the same truth value and false if they have different truth values.

The exercises show $\neg(\neg P)\equiv P$ and $P\vee\neg P$ is a tautology.

__Exercise__. _Show $P\equiv Q$ is equivalent to $(P\wedge Q)\vee(\neg P\wedge\neg Q)$_.

__Exercise__. _Show $P\supset Q$ and $\neg P\vee Q$ are equivalent_.

<details>
<summary>Solution</summary>

> If $P$ is false then $P\supset Q$ is true, as we've just seen.
Since $\neg P$ is true in this case $\neg P\vee Q$ is true.
If $P$ is true and $Q$ is false then
$P\supset Q$ is false and so is $\neg P\vee Q$ since both $\neg P$
and $Q$ are false. If $P$ is true and $Q$ is true then
$P\supset Q$ is true and so is $\neg P\vee Q$ since $Q$ is true.

</details>

We can reduce the amount of prose by using _truth tables_.
The first columns of the table contain all possible truth values
for the variables occuring in the statements to be evaluated
in the remaining columns. Here is the truth table for
'and', 'or', and 'implies'

<div class="truth" class="striped">

+-----+-----+-------------+-----------+------------------+
| $P$ | $Q$ | $P\wedge Q$ | $P\vee Q$ | $P\supset Q$     |
+:===:+:===:+:===========:+:=========:+:================:+
| $F$ | $F$ | $F$         | $F$       | $T$              |
+-----+-----+-------------+-----------+------------------+
| $F$ | $T$ | $F$         | $T$       | $T$              |
+-----+-----+-------------+-----------+------------------+
| $T$ | $F$ | $F$         | $T$       | $F$              |
+-----+-----+-------------+-----------+------------------+
| $T$ | $T$ | $T$         | $T$       | $T$              |
+-----+-----+-------------+-----------+------------------+

</div>

Binary connectives are _functions_ from $\{F,T\}^2$ to $\{F,T\}$. The
third column above for 'and' indicates $F\wedge F = \wedge(F,F) = F$,
$\wedge(F,T) = F$, $\wedge(T,F) = F$, and $\wedge(T,T) = T$. 
More generally, any proposition corresponds to a function
$\{F,T\}^n\to\{F,T\}$ where $n$ is the number of variables in the
proposition. A proposition is a tautology if and only if the _range_
of its corresponding function is $\{T\}$.

The truth table for $P\supset(Q\supset P)$ is

<div class="truth" class="striped">

+-----+-----+--------------+------------------------+
| $P$ | $Q$ | $Q\supset P$ | $P\supset(Q\supset P)$ |
+:===:+:===:+:============:+:======================:+
| $F$ | $F$ | $T$          | $T$                    |
+-----+-----+--------------+------------------------+
| $F$ | $T$ | $F$          | $T$                    |
+-----+-----+--------------+------------------------+
| $T$ | $F$ | $T$          | $T$                    |
+-----+-----+--------------+------------------------+
| $T$ | $T$ | $T$          | $T$                    |
+-----+-----+--------------+------------------------+

</div>

where we have added a column for the subexpression $Q\supset P$
to facilitate the evaluation. This shows $P\supset(Q\supset P)$ is a tautology.

As the number of variables in a proposition increase, the number of
cases to evaluate increases exponentially. If there are $n$ variables, then there
are $2^n$ cases to consider.

## Deduction

A more compact way of determining if a proposition is a tautology is
to start from a small set of tautologies and apply _modus ponens_: if
the propositions $P\supset Q$ and $P$ are tautologies then $Q$ is a tautology.

that can be used to deduce any tautology,
assuming that is possible. A _proof_ of a tautology is a sequence of propositions
that are either axioms or a result

For example, we can use $P\supset(Q\supset P)$ to deduce $P\supset P$.

We will soon see that this is indeed possible using the _axioms_
$$
	P\supset (Q\supset P)
	(P\supset(Q\supset R))\supset
$$

Every _well-formed_ proposition can be built up from _propositional variables_,
$P$, $Q$, ..., and connectives. The _grammar_ of propositional calculus is
$$
	\mathit{Prop}\to\mathit{Var}
	\mid(\neg\mathit{Prop})
	\mid(\mathit{Prop}\wedge\mathit{Prop})
	\mid(\mathit{Prop}\vee\mathit{Prop})
	\mid(\mathit{Prop}\supset\mathit{Prop})
$$
This is a _production rule_ indicating how to generate all well-formed propostions
from atoms and other well-formed propositions. The vertical bar '$\mid$'
indicates alternative rules and is not part of the grammar. Parentheses '()' are used
to indicate the order in which rules are applied. These are part of the grammar.

The first rule is that every atomic proposition is a well-formed proposition.
If we apply the second rule twice to the atomic propostion $P$ we get $(\neg(\neg P))$.
The step-by-step production is $P\to(\neg P)\to(\neg(\neg P))$. More explicitly

<div id="proof">
| Prop | Rule |
| :--: | :--- |
| $P$ | $\mathit{Prop}\to\mathit{Var}$ |
| $(\neg P)$ | $\mathit{Prop}\to(\neg\mathit{Prop})$ |
| $(\neg(\neg P))$ | $\mathit{Prop}\to(\neg\mathit{Prop})$ |
</div>

## History

Although lost in prehistory, the imputus for logic must have been liars.
The earliest evidence we have indicates primative societies always had
a special class people who survived by making up
stories in order to deceive others into providing them with the
fruits of their labor. One way to get rid of these freeloaders
was to find plausible arguments to demonstrate their stories were a sham.

Euclid was the first person (if he existed) to document this type of
reasoning and the books he wrote are the second best sellers in history
next to the bible. Devine truth only requires belief, mathematical truth
requires considerable intellectual effort to comprehend.

While Euclid only considered geometry, Aristotle applied these methods
to speech (logos)

(323–283 BC). euc
 384–322 BC) aris

One early example of different logical systems involves Euclid's fifth
postulate: "There is at most one line that can be drawn parallel to
another given one through an external point." An astounding amount of
intellectual effort was expendend over a 2000 year period to prove this
from Euclid's first four postulates until Carl Gauss found examples in
1810 of geometries that satisfied the first four postulates but not the
fifth.  In 1829 Nicolai Lobachevsky published examples of non-Euclidian
geometries where there were no parallel lines and geometries where there
were an infinite number of "parallel" lines with no intersection.

This was also an early example of how complicated mathematics can become
if you just follow your nose while trying to think rigourously.

In 1854 George Boole published _The Laws of Thought_ where he showed how to
reduce Aristotle's logical reasoning to a calculation. He introduced
algebraic axioms that propositions and their _logicial connectives_ must satisfy.

<!--
Euclid postulate vs axiom
"If a line segment intersects two straight lines forming two interior
angles on the same side that sum to less than two right angles, then
the two lines, if extended indefinitely, meet on that side on which the
angles sum to less than two right angles."

Playfair. What a name!
-->
