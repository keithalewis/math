---
title: Set
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: Sets are defined by membership
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}
\newcommand{\NN}{\bm{N}}
\newcommand\o[1]{\overline{#1}}

Everything in (standard) mathematics is a [set](https://plato.stanford.edu/entries/set-theory/).
Logicians are wont to say "The language of set theory is epsilon."
If you have expert knowledge of
[first order logic](https://plato.stanford.edu/entries/logic-firstorder-emergence/)
then this might make sense to you.

> “Mathematicians are like Frenchmen: whenever you speak
to them, they translate it into their own language, and forthwith it is
something completely different” &mdash; Johann Wolfgang von Goethe, Maxims
and Reflections

Following [Peano](https://en.wikipedia.org/wiki/Giuseppe_Peano),
modern set theory uses lunate epsilon $\in$, instead of $\epsilon$,
to indicate set _membership_. A set is defined by its members.
[Frege's](https://en.wikipedia.org/wiki/Gottlob_Frege) theory
of sets was a set is defined by a rule: a set $S$ is an element the set
if and only if it satisfies a proposition $P(S)$.

We write $s\in S$ to indicate $s$ is a _member_, or _element_, of the set $S$. 
The empty set $\emptyset = \{\}$ is the set with no members.
It is defined by $S\notin\emptyset$ for every set $S$.
A _singleton_ is a set with one member $S = \{s\}$, for example $\emptyset\in\{\emptyset\}$.
In general, $S\in\{S\}$ for any set $S$.

__Exercise__ _Show the number of sets is not finite_.

Frege's theory of sets posited they can be defined by a rule.
A _proposition_ is a rule that is either true or false.

A _contradiction_ proposition the implies true
Bertrand Russell showed Frege's theory involved a contradiction. 
Consider the set $S$ defined by the rule $x\in S$ if and only if $x\not\in x$.
If $S\in S$ then $S\not\in S$. If $S\not\in S$ then $S\in S$.
The set of all sets cannot be a set.

Frege's rule is the proposition $P(x) = x\not\in x$.
If we define $S = \{x\mid P(x)\}$ there is a contradiction.
One way to fix set theory up is _comprehension_.
If $T$ is a set we can define $U = \{t\in T\mid P(t)\}$
and settle the question whether or not $U$ is a member of $U$.
If $U\in U$ then $U\in T$ and $U\not\in U$ 

Define sets by a rule
restricting members to previously defined sets.
Godel proved a modern day Russell might also find a contradiction,
but so far that has not happened.

## Set Algebra

The _intersection_ $A\cap B$ of $A$ and $B$ is the set
of elements that belong to both $A$ and $B$.
The _union_ $A\cup B$ of sets $A$ and $B$ is the set of elements in either
$A$ or $B$.
The _set difference_ ${A\setminus B}$ of $A$ and $B$ is the 
set of elements of $A$ that do not belong to $B$.

As George Boole pointed out, this can be used to reduce logic to algebra,
thereby providing the foundation of computer science.
Given a set $\Omega$ containing all sets under consideration
we can think of a set $A$ as a function
$1_A\colon\Omega\to\{0,1\}$
where $1_A(\omega) = 1$ is $\omega\in A$ and
$1_A(\omega) = 0$ if $\omega\not\in A$.
When $\Omega$ is understood, we write $\o{A}$ for $\Omega\setminus A$.

__Exercise__. _Show $1_{A\cap B} = 1_A 1_B$, $1_{A\cup B} = 1_A + 1_B - 1_A 1_B$,
and $1_{\o{A}} = 1 - 1_A$_.

This makes it trivial to prove De Morgan's laws.

__Exercise__. _Show $\o{A\cap B} = \o{A}\cup\o{B}$ and $\o{A\cup B} = \o{A}\cap\o{B}$_.

_Hint_: We have
$$
\begin{aligned}
1_{\o{A}\cup\o{B}} &= 1_{\o{A}} + 1_{\o{B}} - 1_{\o{A}} 1_{\o{B}} \\
	&= (1 - 1_A) + (1 - 1_B) - (1 - 1_A) (1 - 1_B) \\
	&= 2 - 1_A - 1_B - 1 + 1_B + 1_A - 1_A  1_B \\
	&= 1 - 1_A 1_B \\
	&= 1 - 1_{A\cap B} \\
	&= 1_{\o{A\cap B}} \\
\end{aligned}
$$

The _set exponential_ $B^A$ is the set of all functions from $A$ to $B$.

We can use first order logic to define some binary operations on sets.
Two sets are equal if they have the same members: $A = B$ if and only if
$\forall x (x\in A \Leftrightarrow x\in B)$.
The _union_ of sets $A$ and $B$ is $A\cup B = \{x\mid x\in A \vee x\in B\}$.
The _intersecton_ of sets $A$ and $B$ is $A\cap B = \{x\mid x\in A\wedge x\in B\}$.
The _set difference_ of sets $A$ and $B$ is $A\setminus B = \{x\mid x\in A\wedge x\notin B\}$.

Mathematicians had to go back to square one, or maybe square zero, to define sets.
How do we represent the _natural numbers_ 0, 1, 2, ... as sets?
The _empty set_ $\emptyset = \{\}$ is the set having no elements.
We can let $\emptyset$ represent 0. 
If we can represent $n$, what should $n + 1$ be?

One solution, due to von Neumann, is to define $n + 1 = n\cup\{n\}$.

__Exercise__. _Show $n + 1 \not= n$_.

The _cartesian product_ of sets $A$ and $B$ is $A\times B = \{(a, b)\mid a\in A, b\in B\}$,
where $(a, b)$ is the _ordered pair_ of $a$ and $b$. This can be defined using sets by
$(a,b) = \{\{a\}, \{a,b\}\}$.

__Exercise__. _Show $x 


The category $\cat{Set}$ with objects sets and arrows functions from a set to a set
is a canonnical example of a category.
Properties of $\cat{Set}$ are often used implicitly, for example if $m\colon M\to M$
is binary operation on the set $M$ then the associative law $m(a,m(b,c)) = m(m(a,b),c)$
can be expressed by identifiying the two arrows $M\times (M\times M)\to M$,
$(a, (b,c)) \mapsto $m(a,m(b,c))$ and $(M\times M)\times M\to M$, $((a,b),c)
\to m(m(a,b),c)$. This assumes sets have products and it defines things elementwise.
This note teases out the implicit assumptions often used with $\cat{Set}$ and
shows how to express them in a purely categorical ways using only objects and arrows.

It has turned out that it is not so easy to give a purely categorical definition of
$\cat{Set}$. One line of thinking lead to topos theory, but it does not recover
the standard mathematical notion of a set. As logicians are wont to say,
"The lanaguage of set theory is epsilon." This means first order logic and the
symbol $ε$ can be used to express the axioms.

Lawvere gave an elementary category theory approach by defining membership using
arrows $1\to A$ to represent set elements. In the category $\cat{Set}$ every
singleton is an initial object,
for every set $A$ there exists an arrow $1\to A$.
As in most categories, initial objects are not unique but any two are isomorphic.
This runs into problems right off the bat since $x ε y ε z$ in set theory
can only hold in trivial cases using Lawvere's definition of membership.

## Product

The _product_ of objects $A$ and $B$ is an object $A\times B$ and two arrows
$l\colon A\times B\to A$ and $r\colon A\times B\to B$ with the property...

Given $f\colon A\to B$ and $g\colon C\to D$ define $f\times g\colon A\times C\to B\times D$...

A _product_ of indexed objects $\Pi_{i\in I} A_i$ is a collection of arrows $π_i\colon \Pi_{i\in I}A_i\to A_i$
for all $i$ in $I$

If $σ\colon J\to I$ define $\Pi_σ$ by $\Pi^σ_J = \Pi_{sigma(J)}$...
Permutation, projection, reshape...

If $τ\colon I\to J$ define $\Pi^τ$ by $\Pi^τ_J = \Pi_J \Pi_{τ(i) = j} A_i$.
Grouping.

## Notes

Although membership is problematic, for every is not.
