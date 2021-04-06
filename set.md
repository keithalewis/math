---
title: Set
author: Keith A. Lewis
institute: KALX, LLC
classoption: fleqn
fleqn: true
abstract: as a category
...

\newcommand\dom{\operatorname{dom}}
\newcommand\cod{\operatorname{cod}}
\renewcommand\ker{\operatorname{ker}}
\newcommand\ran{\operatorname{ran}}
\newcommand\cat[1]{\mathbf{#1}}
\newcommand\mb[1]{\mathbf{#1}}

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

A _product_ of indexed objects $\Pi_{i\in I} A_i$ is a collection of arrows $π_i\colon \Pi_{i\in I}A_i\to A_i$
for all $i$ in $I$

If $σ\colon J\to I$ define $\Pi_σ$ by $\Pi^σ_J = \Pi_{sigma(J)}$...
Permutation, projection, reshape...

If $τ\colon I\to J$ define $\Pi^τ$ by $\Pi^τ_J = \Pi_J \Pi_{τ(i) = j} A_i$.
Grouping.

## Notes

Although membership is problematic, for every is not.
