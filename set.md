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

Everything in (standard) mathematics is a [set](https://plato.stanford.edu/entries/set-theory/).
Sets are defined by their _members_.
We write $x\in S$ to indicate $x$ is a member, or _element_, of the set $S$. 
A finite set can be explicitly described by specifying its members $S = \{x, y, z\}$.
The theory of sets proposed by Frege posited sets are defined by a rule,
$x\in S$ if and only if $P(x)$, where $P(x)$ is a proposition that is true
or false depending on $x$.

Logicians like to say "The language of set theory is epsilon."
They already have first order logic in their back pocket and mean
set theory can be defined by membership using the symbol $\in$.
They do not have much to say about how one establishes whether
or not $x\in S$.

Bertrand Russell showed Frege's theory involved a contradiction. 
Consider the set $S$ defined by the proposition $P(x) = x\notin x$. Is $S\in S$?
If it is, it isn't. If it isn't, it is.

One way to fix this up is to define sets by a rule restricted to previously existing
sets: $x\in S$ if and only if $P(x)$, where $P(x)$ **and** $x\in T$, is a proposition that is true
or false depending on $x\in T$. This theory might also involve a contradiction, but nobody
has found one so far.

<!--A modern day Russell might also find a contradiction,
but so far that has not happened.
-->

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

One solution, due to von Neumann, is the define $n + 1 = n\cup\{n\}$.

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
