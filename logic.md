---
title: Logic
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
---

It may come as a surprise to you that there are a number of different
logical systems for mathematics, however they all have in common that
they use _propositions_, statements that are either true or false, and
_rules of inference_, ways of combining true statements into another
true statement.

Mathematicians prove _theorems_, 'if $A$ is true then $B$ is true',
where $A$ and $B$ are propositions.  Every logical system has _axioms_,
statements that are assumed to be true.  A proof of '$A$ implies $B$'
in that system consists of a sequence of statements starting with
$A$. The following statements in the sequence are either axioms or a
statement using rules of inference applied to previous statements. If
the last statement is $B$ then the theorem is proved: QED, "quod erat
demonstrandum", literally meaning "what was to be shown".

Euclid was the first person (if he existed) to document this type of
reasoning and the books he wrote are the second best sellers in history
next to the bible. Devine truth only requires belief, mathematical truth
requires considerable intellectual effort to comprehend.

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

<!--
Euclid postulate vs axiom
"If a line segment intersects two straight lines forming two interior
angles on the same side that sum to less than two right angles, then
the two lines, if extended indefinitely, meet on that side on which the
angles sum to less than two right angles."

Playfair. What a name!
-->

## Propositional Calculus

In 1854 George Boole published _The Laws of Thought_ where he showed how to
reduce Aristotle's logical reasoning to a calculation. He introduced
algebraic axioms that propositions and their _logicial connectives_ must satisfy.

The _propositional calculus_ specifies _logical connectives_
$\neg$, $\wedge$, $\vee$, and $\Rightarrow$ based on the
common English usage of the words, 'not', 'and', 'or', and 'implies'.

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
  ~ If $P$ and $Q$ are propositons then $P\Rightarrow Q$ is false only when
  $P$ is true and $Q$ is false.

The definition of implies is somewhat controversial. It is true whenever $P$ is false.

Boole's logical system specifies the axioms propositions and connectives satisfy.

One way to approach this is truth tables.

Another way is axiomatic.

Models of axiomatic systems.

