# Logic

Logic involve _propositions_, statements that are either true or false.
A _logical system_ specifies _axioms_, statements that are assumed
to be true, and _rules of inference_ for combinining true statements into
another true statement.

A _proof_ is a sequence of propositions where each proposition
follows from previous propostions using axioms and rules of inference.

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
