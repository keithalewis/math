---
title: Category Theory
---

Category theory unifies diverse areas of mathematics.
It is impossible to appreciate unless you are already familiar with those.

The usual definition of a category is in terms of objects and arrows that can sometimes
be composed and satisfy certain properties.
A category can also be defined as a _partial monoid_, not to be confused with a monad.

A _monoid_ is a semigroup with identity. A _semigroup_ is a set with an
associative binary operation.

Monoids show up everywhere. 

You know what multiplication and addition are. Here is the category perspective.

$A\times B = \{(a,b)\mid a\in A, b\in B\}$.

$\pi_A\colon A\times B\to A$, $\pi_B\colon A\times B\to B$.

__Exercise__. If $\alpha\colon C\to A$ and $\beta\colon C\to B$ then
there exists $\gamma\colon C\to A\times B$ with
$\alpha = \pi_A\gamma$ and $\beta = \pi_B\gamma$._

